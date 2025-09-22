<?php
if (session_status() !== PHP_SESSION_ACTIVE) {
  session_start();
}

function ensure_logged_in(): void {
  if (empty($_SESSION['uid']) || empty($_SESSION['role'])) {
    http_response_code(401);
    echo json_encode(['ok' => false, 'error' => 'not_authenticated'], JSON_UNESCAPED_UNICODE);
    exit;
  }
}

function ensure_role(string ...$roles): void {
  ensure_logged_in();
  if (!in_array($_SESSION['role'], $roles, true)) {
    http_response_code(403);
    echo json_encode(['ok'=>false,'error'=>'forbidden'], JSON_UNESCAPED_UNICODE);
    exit;
  }
}
