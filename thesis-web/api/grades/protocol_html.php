<?php
declare(strict_types=1);
define('BOOTSTRAP_AS_HTML', true);
require_once __DIR__ . '/../bootstrap.php';
header('Content-Type: text/html; charset=utf-8');

$pdo = db();

$thesis_id = $_GET['thesis_id'] ?? '';
if (!$thesis_id) { http_response_code(400); echo 'Λείπει thesis_id'; exit; }

// Thesis
$st = $pdo->prepare("SELECT id, status FROM theses WHERE id = :id LIMIT 1");
$st->execute([':id'=>$thesis_id]);
$thesis = $st->fetch(PDO::FETCH_ASSOC);
if (!$thesis) { http_response_code(404); echo 'Δεν βρέθηκε διπλωματική.'; exit; }

$rows = [];
try {
  $sql = "
    SELECT person_id, total, created_at
    FROM grades
    WHERE thesis_id = :id
      AND person_id IS NOT NULL
      AND total IS NOT NULL
    ORDER BY person_id ASC, created_at DESC
  ";
  $q = $pdo->prepare($sql);
  $q->execute([':id' => $thesis_id]);
  $all = $q->fetchAll(PDO::FETCH_ASSOC);

  $seen = [];
  foreach ($all as $g) {
    $pid = (string)$g['person_id'];
    if (!isset($seen[$pid])) {
      $rows[] = $g;      
      $seen[$pid] = true; 
    }
  }
} catch (Throwable $e) {
  $rows = [];
}

$avg = null;
if ($rows) {
  $totals = array_map(fn($r) => (float)$r['total'], $rows);
  $avg = array_sum($totals) / count($totals);
}
?>
<!doctype html>
<html lang="el">
<meta charset="utf-8">
<title>Πρακτικό Εξέτασης</title>
<style>
  body{font-family:system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,'Helvetica Neue',Arial,sans-serif;background:#0b1220;color:#e5e7eb;margin:0;padding:1.5rem}
  .card{background:#0f172a;border:1px solid #1f2937;border-radius:12px;padding:1rem;margin:.6rem 0}
  h1,h2,h3{margin:.3rem 0}
  table{width:100%;border-collapse:collapse;margin-top:.5rem}
  th,td{border-bottom:1px solid #243244;padding:.5rem .4rem;text-align:left}
</style>
<body>
  <div class="card">
    <h1>Πρακτικό Εξέτασης</h1>
    <div><strong>Thesis ID:</strong> <?=htmlspecialchars($thesis_id)?></div>
    <div><strong>Κατάσταση:</strong> <?=htmlspecialchars($thesis['status'] ?? '—')?></div>
  </div>

  <div class="card">
    <h3>Βαθμολογήσεις (τελευταία ανά μέλος)</h3>
    <table>
      <thead><tr><th>Μέλος (person_id)</th><th>Βαθμός</th><th>Ημ/νία</th></tr></thead>
      <tbody>
        <?php if (!$rows): ?>
          <tr><td colspan="3"><em>Δεν βρέθηκαν βαθμολογήσεις.</em></td></tr>
        <?php else: foreach ($rows as $r): ?>
          <tr>
            <td><?=htmlspecialchars($r['person_id'])?></td>
            <td><?=number_format((float)$r['total'], 2)?></td>
           <td><?=htmlspecialchars($r['created_at'] ?? '')?></td>
        </tr>
        <?php endforeach; endif; ?>
      </tbody>
      <tfoot>
        <tr>
          <th>Μέσος όρος</th>
          <th><?= $avg !== null ? number_format($avg, 2) : '—' ?></th>
          <th></th>
        </tr>
      </tfoot>
    </table>
  </div>
</body>
</html>
