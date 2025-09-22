<?php
require __DIR__ . '/api/db.php';
$pdo = db();

$plain = 'secret123';

$hash  = password_hash($plain, PASSWORD_DEFAULT);
$stmt  = $pdo->prepare("UPDATE users SET password_hash=? WHERE password_hash='x'");
$stmt->execute([$hash]);

echo "Έγινε update σε {$stmt->rowCount()} χρήστες. Νέος κωδικός: $plain\n";
