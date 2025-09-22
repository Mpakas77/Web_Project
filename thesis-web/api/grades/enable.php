<?php
declare(strict_types=1);
header('Content-Type: application/json; charset=utf-8');

require_once __DIR__ . '/../bootstrap.php';

$pdo = db();
$u   = require_login();

if (!function_exists('ok')) {
  function ok($data = []) { /* ... */ }
}
if (!function_exists('bad')) {
  function bad($msg, $code = 400) { /* ... */ }
}

$thesis_id = $_POST['thesis_id'] ?? '';
if (!$thesis_id) bad('Λείπει thesis_id.');

$user_id = $u['id'] ?? null;
if (!$user_id) bad('Δεν υπάρχει user_id στη συνεδρία.', 401);

$stmt = $pdo->prepare("
  SELECT p.id AS person_id
  FROM users u
  LEFT JOIN persons p ON p.user_id = u.id
  WHERE u.id = :uid
  LIMIT 1
");
$stmt->execute([':uid' => $user_id]);
$me = $stmt->fetch(PDO::FETCH_ASSOC) ?: [];
$person_id = $me['person_id'] ?? null;

$tx = $pdo->prepare("
  SELECT id, status, grading_enabled_at,
         supervisor_id
  FROM theses
  WHERE id = :id
  LIMIT 1
");
$tx->execute([':id' => $thesis_id]);
$th = $tx->fetch(PDO::FETCH_ASSOC);
if (!$th) bad('Δεν βρέθηκε διπλωματική.', 404);

if ($th['status'] !== 'under_review') {
  bad('Επιτρέπεται μόνο σε «Υπό εξέταση».', 409);
}

$authorized = false;

if (!$authorized && !empty($th['supervisor_id']) && $person_id) {
  $authorized = (string)$th['supervisor_id'] === (string)$person_id;
}

if (!$authorized && $person_id) {
  $q = $pdo->prepare("
    SELECT 1
    FROM committee_members
    WHERE thesis_id = :tid
      AND person_id = :pid
      AND LOWER(role_in_committee) LIKE '%supervisor%'
    LIMIT 1
  ");
  $q->execute([':tid' => $thesis_id, ':pid' => $person_id]);
  $authorized = (bool)$q->fetchColumn();
}

if (!$authorized) {
  bad('Μόνο ο επιβλέπων μπορεί να ενεργοποιήσει τη βαθμολόγηση.', 403);
}

if (!empty($th['grading_enabled_at'])) {
  ok(['already' => true, 'grading_enabled_at' => $th['grading_enabled_at']]);
}

$u2 = $pdo->prepare("
  UPDATE theses
  SET grading_enabled_at = NOW()
  WHERE id = :id
    AND status = 'under_review'
    AND grading_enabled_at IS NULL
");
$u2->execute([':id' => $thesis_id]);

ok(['message' => 'Η βαθμολόγηση ενεργοποιήθηκε.']);
