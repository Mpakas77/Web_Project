<?php
require_once __DIR__ . '/../bootstrap.php';
header('Content-Type: application/json; charset=utf-8');

$me  = require_role('student');
$pdo = db();

$in = $_POST ?: (json_decode(file_get_contents('php://input'), true) ?: []);
$thesis_id = trim($in['thesis_id'] ?? '');
$user_id   = trim($in['user_id']   ?? '');
$person_id = trim($in['person_id'] ?? '');

if ($thesis_id === '') {
  $st = $pdo->prepare("
    SELECT id FROM theses
    WHERE student_id=? AND status='under_assignment'
    ORDER BY created_at DESC LIMIT 1
  ");
  $st->execute([$me['id']]);
  $thesis_id = (string)$st->fetchColumn();
  if ($thesis_id === '') bad('No thesis under_assignment found for student', 422);
}

$own = $pdo->prepare("SELECT 1 FROM theses WHERE id=? AND student_id=? AND status='under_assignment' LIMIT 1");
$own->execute([$thesis_id, $me['id']]);
if (!$own->fetchColumn()) bad('Not allowed', 403);

if ($person_id === '') {
  if ($user_id === '') bad('person_id or user_id required', 422);

  $st = $pdo->prepare("SELECT id FROM persons WHERE user_id=? LIMIT 1");
  $st->execute([$user_id]);
  $person_id = (string)$st->fetchColumn();

  if ($person_id === '') {
    $pdo->prepare("
      INSERT INTO persons(id,is_internal,user_id,first_name,last_name,email,affiliation,role_category,has_phd)
      SELECT UUID(),1,u.id,
             SUBSTRING_INDEX(u.name,' ',1),
             TRIM(SUBSTRING(u.name,LENGTH(SUBSTRING_INDEX(u.name,' ',1))+1)),
             u.email,'Department','DEP',1
      FROM users u WHERE u.id=? LIMIT 1
    ")->execute([$user_id]);

    $st->execute([$user_id]);
    $person_id = (string)$st->fetchColumn();
    if ($person_id === '') bad('Could not resolve person for user_id', 500);
  }
}

$st = $pdo->prepare("SELECT id, status, invited_at, responded_at
                     FROM committee_invitations
                     WHERE thesis_id=? AND person_id=? LIMIT 1");
$st->execute([$thesis_id, $person_id]);
$ex = $st->fetch(PDO::FETCH_ASSOC);
if ($ex) {
  ok(['already' => true, 'invitation' => $ex]);
}

$pdo->prepare("INSERT INTO committee_invitations(thesis_id, person_id) VALUES(?,?)")
    ->execute([$thesis_id, $person_id]);

$id = $pdo->lastInsertId();
ok(['already' => false, 'invitation' => ['id' => $id]]);
