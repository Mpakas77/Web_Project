<?php
declare(strict_types=1);

require_once __DIR__ . '/../bootstrap.php';
header('Content-Type: application/json; charset=utf-8');

$me = require_login();        
$pdo = db();

$role   = trim($_GET['role'] ?? 'teacher');
$q      = trim($_GET['q']    ?? '');
$limit  = max(1, min((int)($_GET['limit'] ?? 20), 50));
$offset = max(0, (int)($_GET['offset'] ?? 0));

$sql = "SELECT id, email, name
        FROM users
        WHERE role = :role";

$useQ = ($q !== '');
if ($useQ) {
  $sql .= " AND (email LIKE :q1 OR name LIKE :q2)";
}

$sql .= " ORDER BY name LIMIT {$limit} OFFSET {$offset}";

$st = $pdo->prepare($sql);
$st->bindValue(':role', $role, PDO::PARAM_STR);

if ($useQ) {
  $like = '%'.$q.'%';
  $st->bindValue(':q1', $like, PDO::PARAM_STR);
  $st->bindValue(':q2', $like, PDO::PARAM_STR);
}

$st->execute();

echo json_encode(['ok' => true, 'items' => $st->fetchAll(PDO::FETCH_ASSOC)], JSON_UNESCAPED_UNICODE);
