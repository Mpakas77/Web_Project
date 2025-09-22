<?php
require_once __DIR__ . '/../bootstrap.php';

$u = require_role('student'); 

$stm = $pdo->prepare("
  SELECT id, role, student_number, name, email, address, phone_mobile, phone_landline
  FROM users
  WHERE id = ?
  LIMIT 1
");
$stm->execute([$u['id']]);
$me = $stm->fetch();

if (!$me) bad('User not found', 404);
ok(['user' => $me]);
