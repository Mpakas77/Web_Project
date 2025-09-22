<?php
declare(strict_types=1);

require_once __DIR__ . '/../bootstrap.php'; 
header('Content-Type: application/json; charset=utf-8');

$user = require_role('teacher');              
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  bad('Method not allowed', 405);
}

$pdo    = db();
$invId  = trim((string)($_POST['invitation_id'] ?? ''));
$action = trim((string)($_POST['action'] ?? ''));

if ($invId === '' || !in_array($action, ['accept','decline'], true)) {
  bad('Bad request', 400);
}

try {
  $pdo->beginTransaction();

  $q = $pdo->prepare('SELECT id FROM persons WHERE user_id = ? LIMIT 1 FOR UPDATE');
  $q->execute([$user['id']]);
  $personId = $q->fetchColumn();
  if (!$personId) {
    $pdo->rollBack();
    bad('Teacher has no person mapping', 403);
  }

  $q = $pdo->prepare("
    SELECT id,
           thesis_id,
           person_id,
           COALESCE(status,'pending') AS status
      FROM committee_invitations
     WHERE id = ? AND person_id = ? FOR UPDATE
  ");
  $q->execute([$invId, $personId]);
  $inv = $q->fetch(PDO::FETCH_ASSOC);
  if (!$inv) {
    $pdo->rollBack();
    bad('Invitation not found', 404);
  }

  if ($inv['status'] !== 'pending') {
    $pdo->commit();
    ok(['already' => true, 'status' => $inv['status']]);
  }

  $newStatus = ($action === 'accept') ? 'accepted' : 'declined';
  $q = $pdo->prepare("
    UPDATE committee_invitations
       SET status = ?, responded_at = NOW()
     WHERE id = ? AND (status = 'pending' OR status IS NULL)
  ");
  $q->execute([$newStatus, $invId]);

  if ($newStatus === 'declined') {
    $pdo->commit();
    ok(['status' => 'declined']);
  }

  $thesisId = $inv['thesis_id'];

  $q = $pdo->prepare("
    INSERT IGNORE INTO committee_members (id, thesis_id, person_id, role_in_committee, added_at)
    VALUES (UUID(), ?, ?, 'member', NOW())
  ");
  $q->execute([$thesisId, $personId]);

  $q = $pdo->prepare("SELECT 1 FROM theses WHERE id = ? AND supervisor_id IS NOT NULL LIMIT 1");
  $q->execute([$thesisId]);
  $hasSupervisor = (bool)$q->fetchColumn();

  $q = $pdo->prepare("
    SELECT COUNT(*)
      FROM committee_invitations
     WHERE thesis_id = ? AND status = 'accepted'
  ");
  $q->execute([$thesisId]);
  $acceptedMembers = (int)$q->fetchColumn();

  $promoted = false;
  $canceled = 0;

  if ($hasSupervisor && $acceptedMembers >= 2) {
    $q = $pdo->prepare("
      UPDATE theses
         SET status = 'active',
             assigned_at = COALESCE(assigned_at, NOW())
       WHERE id = ? AND status = 'under_assignment'
    ");
    $q->execute([$thesisId]);
    $promoted = $q->rowCount() > 0;

    $q = $pdo->prepare("
      UPDATE committee_invitations
         SET status = 'canceled',
             responded_at = COALESCE(responded_at, NOW())
       WHERE thesis_id = ?
         AND (status = 'pending' OR status IS NULL)
    ");
    $q->execute([$thesisId]);
    $canceled = $q->rowCount();
  }

  $pdo->commit();
  ok([
    'status'             => 'accepted',
    'promoted_to_active' => $promoted,
    'canceled_pending'   => $canceled
  ]);

} catch (Throwable $e) {
  if ($pdo?->inTransaction()) {
    $pdo->rollBack();
  }
  bad('SQL error: ' . $e->getMessage(), 500);
}
