<?php
declare(strict_types=1);

require_once __DIR__ . '/../bootstrap.php'; 
header('Content-Type: application/json; charset=utf-8');
ini_set('display_errors', '0');

try {
  $me = require_role('teacher');
  if (($_SERVER['REQUEST_METHOD'] ?? 'GET') !== 'POST') {
    bad('Method not allowed', 405);
  }

  $pdo = db();

  $topicId = trim((string)($_POST['topic_id'] ?? $_POST['id'] ?? ''));
  $studentIdIn = trim((string)($_POST['student_user_id'] ?? $_POST['student_id'] ?? ''));

  if ($topicId === '') bad('Bad request: topic_id required', 400);

  $q = $pdo->prepare("SELECT * FROM topics WHERE id = :id LIMIT 1");
  $q->execute([':id' => $topicId]);
  $topic = $q->fetch(PDO::FETCH_ASSOC);
  if (!$topic) {
    bad('Topic not found', 404);
  }
  if ((string)$topic['supervisor_id'] !== (string)$me['id']) {
    bad('Forbidden (not your topic)', 403);
  }

  $studentId = $studentIdIn !== ''
    ? $studentIdIn
    : (string)($topic['provisional_student_user_id'] ?? $topic['provisional_student_id'] ?? '');

  if ($studentId === '') {
    bad('No student to assign (missing provisional student)', 422);
  }

  $chk = $pdo->prepare("SELECT role, IFNULL(owed_courses,0) AS oc, IFNULL(owed_ects,0) AS oe
                        FROM users WHERE id = ? LIMIT 1");
  $chk->execute([$studentId]);
  $stu = $chk->fetch(PDO::FETCH_ASSOC);
  if (!$stu || ($stu['role'] ?? '') !== 'student') {
    bad('Student not found', 404);
  }

  if ((int)$stu['oc'] > 20 || (int)$stu['oe'] > 80) {
    bad('Δεν επιτρέπεται ανάθεση: ο φοιτητής χρωστά >20 μαθήματα ή >80 ECTS.', 422);
  }

  $pdo->beginTransaction();

  $sel = $pdo->prepare("
    SELECT id, status
      FROM theses
     WHERE topic_id = :tid AND student_id = :sid
     LIMIT 1
  ");
  $sel->execute([':tid' => $topicId, ':sid' => $studentId]);
  $th = $sel->fetch(PDO::FETCH_ASSOC);

  if ($th) {
    $pdo->commit();
    ok(['already' => true, 'thesis_id' => $th['id'], 'status' => $th['status']]);
  }

  try {
    $ins = $pdo->prepare("
      INSERT INTO theses (id, topic_id, student_id, supervisor_id, status, created_at, updated_at)
      VALUES (UUID(), :tid, :sid, :sup, 'under_assignment', NOW(), NOW())
    ");
    $ins->execute([
      ':tid' => $topicId,
      ':sid' => $studentId,
      ':sup' => $me['id'],
    ]);
  } catch (PDOException $e) {
    $code = (int)($e->errorInfo[1] ?? 0);
    if ($code === 1644 || stripos($e->getMessage(), 'Δεν επιτρέπεται ανάθεση') !== false) {
      $pdo->rollBack();
      bad($e->getMessage(), 422);
    }
    throw $e; 
  }

  $setParts = ['is_available = 0', 'updated_at = NOW()'];
  if (array_key_exists('provisional_student_id', $topic)) {
    $setParts[] = 'provisional_student_id = NULL';
  }
  if (array_key_exists('provisional_student_user_id', $topic)) {
    $setParts[] = 'provisional_student_user_id = NULL';
  }
  if (array_key_exists('provisional_since', $topic)) {
    $setParts[] = 'provisional_since = NULL';
  }
  $up = $pdo->prepare("UPDATE topics SET " . implode(', ', $setParts) . " WHERE id = :tid");
  $up->execute([':tid' => $topicId]);

  $pdo->commit();
  ok(['created' => true]);

} catch (Throwable $e) {
  if (isset($pdo) && $pdo->inTransaction()) $pdo->rollBack();
  bad('SQL error: ' . $e->getMessage(), 500);
}
