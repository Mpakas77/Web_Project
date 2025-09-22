<?php
declare(strict_types=1);

function j_ok($data = [], int $code = 200){
  http_response_code($code);
  header('Content-Type: application/json; charset=utf-8');
  echo json_encode(['ok'=>true,'data'=>$data], JSON_UNESCAPED_UNICODE);
  exit;
}
function j_err($msg, int $code = 400, $extra = []){
  http_response_code($code);
  header('Content-Type: application/json; charset=utf-8');
  echo json_encode(['ok'=>false,'error'=>$msg,'extra'=>$extra], JSON_UNESCAPED_UNICODE);
  exit;
}

require_once __DIR__ . '/../db.php';
require_once __DIR__ . '/../bootstrap.php';

$me  = require_role('teacher');  
$pdo = db();

$thesis_id = $_POST['thesis_id'] ?? $_GET['thesis_id'] ?? '';
if (!$thesis_id) j_err('Λείπει thesis_id', 422);

$person_id = $me['id'];
try {
  $qp = $pdo->prepare("SELECT id FROM persons WHERE user_id = :uid LIMIT 1");
  $qp->execute([':uid'=>$me['id']]);
  $pid = $qp->fetchColumn();
  if ($pid) $person_id = (string)$pid;
} catch (Throwable $e) {
}

$st = $pdo->prepare("
  SELECT t.id, t.status,
         CASE
           WHEN cm.role_in_committee = 'supervisor' THEN 'supervisor'
           WHEN ".(
             "EXISTS(SELECT 1 FROM information_schema.COLUMNS
                      WHERE TABLE_SCHEMA = DATABASE()
                        AND TABLE_NAME='theses' AND COLUMN_NAME='supervisor_id')"
            ? "t.supervisor_id = :uid_check" : "0"
           )." THEN 'supervisor'
           ELSE cm.role_in_committee
         END AS role_in_committee
  FROM theses t
  LEFT JOIN committee_members cm
         ON cm.thesis_id = t.id AND cm.person_id = :pid
  WHERE t.id = :tid
  LIMIT 1
");
$params = [
  ':pid'       => $person_id,
  ':tid'       => $thesis_id,
  ':uid_check' => $me['id'],   
];
$st->execute($params);
$row = $st->fetch(PDO::FETCH_ASSOC);

if (!$row) j_err('Δεν έχεις δικαίωμα στη διπλωματική.', 403);
if (($row['role_in_committee'] ?? '') !== 'supervisor') {
  j_err('Μόνο ο επιβλέπων μπορεί να αλλάξει σε «Υπό εξέταση».', 403);
}

if (($row['status'] ?? '') === 'under_review') {
  j_ok(['thesis_id'=>$thesis_id, 'status'=>'under_review']);
}

$allowed_from = ['active','under_assignment'];
if ($row['status'] !== null && !in_array($row['status'], $allowed_from, true)) {
  j_err('Μη έγκυρη μετάβαση από «'.$row['status'].'» σε «under_review».', 409);
}

$pdo->beginTransaction();
try {
  $u = $pdo->prepare("UPDATE theses SET status='under_review', updated_at=NOW() WHERE id=:tid LIMIT 1");
  $u->execute([':tid'=>$thesis_id]);

  try {
    $log = $pdo->prepare("
      INSERT INTO thesis_events (thesis_id, event_type, from_status, to_status, created_by)
      VALUES (:tid, 'status_change', :from, 'under_review', :uid)
    ");
    $log->execute([':tid'=>$thesis_id, ':from'=>$row['status'] ?? null, ':uid'=>$me['id']]);
  } catch (Throwable $e) {}

  $pdo->commit();
  j_ok(['thesis_id'=>$thesis_id, 'status'=>'under_review']);
} catch (Throwable $e) {
  $pdo->rollBack();
  j_err('Αποτυχία ενημέρωσης', 500, ['ex'=>$e->getMessage()]);
}
