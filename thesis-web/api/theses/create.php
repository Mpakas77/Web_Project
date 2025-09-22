<?php
header('Content-Type: application/json; charset=utf-8');
@require_once __DIR__ . '/../utils/bootstrap.php';
@require_once __DIR__ . '/../utils/auth_guard.php';

try {
  ensure_logged_in();

  function json_fail($msg, $code = 400) {
    http_response_code($code);
    echo json_encode(['ok'=>false,'error'=>$msg], JSON_UNESCAPED_UNICODE);
    exit;
  }

  $uid = $_SESSION['user_id'] ?? null;
  if (!$uid) json_fail('not authenticated', 401);

  $isMultipart = !empty($_FILES);
  if ($isMultipart) {
    $thesis_id = $_POST['thesis_id'] ?? null;
    $kind      = $_POST['kind']      ?? 'other';
  } else {
    $payload = json_decode(file_get_contents('php://input'), true) ?: [];
    $thesis_id   = $payload['thesis_id']   ?? null;
    $kind        = $payload['kind']        ?? 'other';
    $url_or_path = $payload['url_or_path'] ?? null;
  }

  if (!$thesis_id) json_fail('thesis_id required');

  $sql = "
    SELECT t.id,
           t.student_id,
           t.supervisor_id
    FROM theses t
    WHERE t.id = ?
    LIMIT 1
  ";
  $st = $pdo->prepare($sql);
  $st->execute([$thesis_id]);
  $th = $st->fetch(PDO::FETCH_ASSOC);
  if (!$th) json_fail('thesis not found', 404);

  $is_owner_student = (int)$th['student_id'] === (int)$uid;
  $is_supervisor    = (int)$th['supervisor_id'] === (int)$uid;

  $is_committee = false;
  if (!$is_owner_student && !$is_supervisor) {
    $st2 = $pdo->prepare("SELECT 1 FROM committee_members WHERE thesis_id=? AND user_id=? LIMIT 1");
    $st2->execute([$thesis_id, $uid]);
    $is_committee = (bool)$st2->fetchColumn();
  }

  if (!$is_owner_student && !$is_supervisor && !$is_committee) {
    json_fail('forbidden', 403);
  }

  $supervisor_id = $th['supervisor_id'];
  if (!$supervisor_id) json_fail('thesis has no supervisor yet', 409);

  if ($isMultipart) {
    if (!isset($_FILES['file'])) json_fail('file required');

    $rootUploads = realpath(__DIR__ . '/../../uploads');
    if ($rootUploads === false) {
      $rootUploads = __DIR__ . '/../../uploads';
      if (!is_dir($rootUploads) && !mkdir($rootUploads, 0777, true)) {
        json_fail('cannot create uploads root');
      }
    }

    $dir = $rootUploads . '/teachers/' . intval($supervisor_id) . '/theses/' . intval($thesis_id);
    if (!is_dir($dir) && !mkdir($dir, 0777, true)) {
      json_fail('cannot create teacher thesis folder');
    }

    $orig   = basename($_FILES['file']['name']);
    $prefix = uniqid('res_', true);
    $dest   = $dir . '/' . $prefix . '_' . preg_replace('/[^A-Za-z0-9._-]+/u', '-', $orig);

    if (!move_uploaded_file($_FILES['file']['tmp_name'], $dest)) {
      json_fail('upload failed', 500);
    }

    $relFromUploads = 'teachers/' . intval($supervisor_id) . '/theses/' . intval($thesis_id) . '/' . basename($dest);
    $urlPath        = '/uploads/' . $relFromUploads;

    $ins = $pdo->prepare("
      INSERT INTO resources (thesis_id, kind, url_or_path, created_at)
      VALUES (?,?,?,NOW())
    ");
    $ins->execute([$thesis_id, ($kind ?: 'draft'), $urlPath]);
    $id = $pdo->lastInsertId();

    echo json_encode(['ok'=>true,'resource_id'=>$id], JSON_UNESCAPED_UNICODE);
    exit;
  }

  if (!$url_or_path) json_fail('url_or_path required');
  $ins = $pdo->prepare("
    INSERT INTO resources (thesis_id, kind, url_or_path, created_at)
    VALUES (?,?,?,NOW())
  ");
  $ins->execute([$thesis_id, ($kind ?: 'link'), $url_or_path]);
  $id = $pdo->lastInsertId();

  echo json_encode(['ok'=>true,'resource_id'=>$id], JSON_UNESCAPED_UNICODE);

} catch (Throwable $e) {
  http_response_code(500);
  echo json_encode(['ok'=>false,'error'=>'server error'], JSON_UNESCAPED_UNICODE);
}
