<?php
$path = realpath(__DIR__ . '/../api/db.php');   
if (!$path) {
  echo 'Δεν βρέθηκε api/db.php. Έψαξα: ' . (__DIR__ . '/../api/db.php');
  exit;
}
require $path;

try {
  db()->query('SELECT 1');
  echo 'DB OK';
} catch (Throwable $e) {
  echo 'DB FAIL: ' . $e->getMessage();
}
