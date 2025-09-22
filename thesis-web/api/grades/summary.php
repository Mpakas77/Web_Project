<?php
declare(strict_types=1);
header('Content-Type: application/json; charset=utf-8');

try {
  $DB_HOST='127.0.0.1'; $DB_PORT='3307'; $DB_NAME='thesis_db'; $DB_USER='root'; $DB_PASS='';
  $pdo = new PDO("mysql:host=$DB_HOST;port=$DB_PORT;dbname=$DB_NAME;charset=utf8mb4",$DB_USER,$DB_PASS,[
    PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC
  ]);

  $thesis_id = $_GET['thesis_id'] ?? '';
  if (!$thesis_id) { http_response_code(400); echo json_encode(['ok'=>false,'error'=>'Λείπει thesis_id']); exit; }

  $st = $pdo->prepare('SELECT id, status, grading_enabled_at FROM theses WHERE id = :id');
  $st->execute([':id'=>$thesis_id]);
  $thesis = $st->fetch();
  if (!$thesis) { http_response_code(404); echo json_encode(['ok'=>false,'error'=>'Δεν βρέθηκε διπλωματική.']); exit; }

  if (empty($thesis['grading_enabled_at'])) {
    echo json_encode([
      'ok' => true,
      'summary' => (object)[],
      'message' => 'Δεν έχει ενεργοποιηθεί η βαθμολόγηση.'
    ]);
    exit;
  }

  $g = $pdo->prepare('
    SELECT COUNT(*) AS cnt, AVG(total) AS avg_total
    FROM grades
    WHERE thesis_id = :id
  ');
  $g->execute([':id'=>$thesis_id]);
  $sum = $g->fetch() ?: ['cnt'=>0,'avg_total'=>null];

  $cnt = (int)($sum['cnt'] ?? 0);
  $avg = $sum['avg_total'] !== null ? round((float)$sum['avg_total'], 2) : null;

  echo json_encode([
    'ok' => true,
    'summary' => [
      'cnt'       => $cnt,
      'avg_total' => $avg,
    ],
  ]);

} catch (Throwable $e) {
  http_response_code(500);
  echo json_encode(['ok'=>false,'error'=>'Σφάλμα: '.$e->getMessage()]);
}
