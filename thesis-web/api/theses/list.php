<?php
declare(strict_types=1);
require_once __DIR__ . '/../bootstrap.php';

$u = require_role('student');  
$person_id = null;
try {
  $st = $pdo->prepare("SELECT id FROM people WHERE user_id = :uid LIMIT 1");
  $st->execute([':uid' => $u['id']]);
  $person_id = $st->fetchColumn() ?: null;
} catch (Throwable $e) {
}
if (!$person_id) {
  try {
    $st = $pdo->prepare("SELECT id FROM persons WHERE user_id = :uid LIMIT 1");
    $st->execute([':uid' => $u['id']]);
    $person_id = $st->fetchColumn() ?: null;
  } catch (Throwable $e) {

  }
}

$where = [];
$params = [];
if ($person_id) { $where[] = "t.student_id = :pid"; $params[':pid'] = $person_id; }
$where[] = "t.student_id = :uid"; $params[':uid'] = $u['id'];

$sql = "
  SELECT
    t.id, t.topic_id, t.status,
    t.created_at, t.assigned_at
  FROM theses t
  WHERE " . implode(' OR ', $where) . "
  ORDER BY IFNULL(t.updated_at, IFNULL(t.assigned_at, t.created_at)) DESC
";
$st = $pdo->prepare($sql);
$st->execute($params);

ok(['items' => $st->fetchAll(PDO::FETCH_ASSOC)]);
