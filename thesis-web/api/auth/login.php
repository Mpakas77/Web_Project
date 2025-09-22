<?php
require_once __DIR__ . '/../bootstrap.php';

$ctype = $_SERVER['CONTENT_TYPE'] ?? '';
$raw = file_get_contents('php://input') ?: '';
$in  = stripos($ctype,'application/json')!==false ? (json_decode($raw,true)?:[]) : ($_POST ?: (json_decode($raw,true)?:[]));

$email = trim($in['email'] ?? '');
$pass  = (string)($in['password'] ?? '');
if ($email==='' || $pass==='') bad('Συμπλήρωσε email και κωδικό', 422);

$stm = $pdo->prepare("SELECT id, role, name, email, password_hash FROM users WHERE email=? LIMIT 1");
$stm->execute([$email]);
$u = $stm->fetch();
if (!$u) bad('Λάθος email ή κωδικός', 401);

$stored   = (string)($u['password_hash'] ?? '');
$isHashed = preg_match('/^\$(2y|argon2id|argon2i)\$/', $stored) === 1;

$valid = $isHashed ? password_verify($pass, $stored) : hash_equals(trim($stored), $pass);
if (!$valid) bad('Λάθος email ή κωδικός', 401);

if (!$isHashed || password_needs_rehash($stored, PASSWORD_DEFAULT)) {
  $pdo->prepare("UPDATE users SET password_hash=? WHERE id=?")
      ->execute([password_hash($pass, PASSWORD_DEFAULT), $u['id']]);
}
 
$_SESSION['uid']  = $u['id'];
$_SESSION['role'] = $u['role'];

ok(['user'=>['id'=>$u['id'],'role'=>$u['role'],'name'=>$u['name']]]);
