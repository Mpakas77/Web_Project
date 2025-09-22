<?php
declare(strict_types=1);
require_once __DIR__ . '/../bootstrap.php';

$u = require_role('student','teacher','admin');
$pdo = db();

$thesis_id = $_GET['thesis_id'] ?? '';
if (!$thesis_id) bad('Missing thesis_id', 400);

$distinct = 0;
try {
  $q = $pdo->prepare("
    SELECT COUNT(*) AS cnt
    FROM (
      SELECT person_id
      FROM grades
      WHERE thesis_id = :id
        AND person_id IS NOT NULL
        AND total IS NOT NULL
      GROUP BY person_id
    ) t
  ");
  $q->execute([':id'=>$thesis_id]);
  $distinct = (int)$q->fetchColumn();
} catch (Throwable $e) {
  $distinct = 0;
}

$ready = ($distinct >= 3);

ok(['ready' => $ready, 'have' => $distinct, 'required' => 3]);
