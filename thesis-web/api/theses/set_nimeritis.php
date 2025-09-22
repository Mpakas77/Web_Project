<?php
declare(strict_types=1);

require_once __DIR__ . '/../bootstrap.php';
header('Content-Type: application/json; charset=utf-8');

$user = require_role('student');
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  bad('Method not allowed', 405);
}

try {
  $raw = file_get_contents('php://input');
  $in  = [];
  if (!empty($raw) && strpos($_SERVER['CONTENT_TYPE'] ?? '', 'application/json') !== false) {
    $in = json_decode($raw, true) ?: [];
  } else {
    $in = $_POST;
  }

  $thesisId   = trim((string)($in['thesis_id'] ?? ''));
  $url        = trim((string)($in['nimeritis_url'] ?? $in['url'] ?? ''));
  $depositRaw = trim((string)($in['nimeritis_deposit_date'] ?? $in['deposit_date'] ?? ''));

  if ($thesisId === '' || $url === '' || $depositRaw === '') {
    bad('Bad request: thesis_id, nimeritis_url και deposit_date είναι υποχρεωτικά.', 400);
  }

  if (!filter_var($url, FILTER_VALIDATE_URL) || !preg_match('~^https?://~i', $url)) {
    bad('Μη έγκυρος σύνδεσμος Νημερτής.', 400);
  }

  $d = DateTime::createFromFormat('Y-m-d', $depositRaw);
  $dateOk = $d && $d->format('Y-m-d') === $depositRaw;
  if (!$dateOk) {
    bad('Μη έγκυρη ημερομηνία κατάθεσης (μορφή YYYY-MM-DD).', 400);
  }
  $depositDate = $d->format('Y-m-d');

  $pdo = db();

  $st = $pdo->prepare("SELECT id FROM theses WHERE id = ? AND student_id = ? LIMIT 1");
  $st->execute([$thesisId, $user['id']]);
  if (!$st->fetchColumn()) {
    bad('Forbidden', 403);
  }

  $st = $pdo->prepare("
    UPDATE theses
       SET nimeritis_url          = :url,
           nimeritis_deposit_date = :dd
     WHERE id = :id
  ");
  $st->execute([
    ':url' => $url,
    ':dd'  => $depositDate,
    ':id'  => $thesisId,
  ]);

  ok(['saved' => true]);

} catch (Throwable $e) {
  bad('SQL error: '.$e->getMessage(), 500);
}
