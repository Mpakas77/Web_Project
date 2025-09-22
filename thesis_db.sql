-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1:3307
-- Χρόνος δημιουργίας: 20 Σεπ 2025 στις 22:50:30
-- Έκδοση διακομιστή: 10.4.32-MariaDB
-- Έκδοση PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `thesis_db`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `committee_invitations`
--

CREATE TABLE `committee_invitations` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `thesis_id` char(36) NOT NULL,
  `person_id` char(36) NOT NULL,
  `invited_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(16) NOT NULL DEFAULT 'pending',
  `accepted_at` datetime DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `responded_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `committee_invitations`
--

INSERT INTO `committee_invitations` (`id`, `thesis_id`, `person_id`, `invited_at`, `status`, `accepted_at`, `rejected_at`, `responded_at`) VALUES
('0e17e083-9629-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', '2025-09-20 13:52:31', 'accepted', NULL, NULL, '2025-09-20 13:52:52'),
('24e7fcf1-965b-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'f12884f1-8e6d-11f0-8503-d8bbc1070448', '2025-09-20 19:51:04', 'canceled', NULL, NULL, '2025-09-20 19:56:13'),
('537b11e4-9250-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'f11fb1bf-8e6d-11f0-8503-d8bbc1070448', '2025-09-15 16:23:19', 'canceled', NULL, NULL, '2025-09-15 16:23:55'),
('54303e62-9250-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'f12884f1-8e6d-11f0-8503-d8bbc1070448', '2025-09-15 16:23:20', 'accepted', NULL, NULL, '2025-09-15 16:23:44'),
('563eef08-9250-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'f1274106-8e6d-11f0-8503-d8bbc1070448', '2025-09-15 16:23:23', 'accepted', NULL, NULL, '2025-09-15 16:23:55'),
('601cc92e-9629-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'f129bf7c-8e6d-11f0-8503-d8bbc1070448', '2025-09-20 13:54:48', 'accepted', NULL, NULL, '2025-09-20 13:55:09'),
('6347ceed-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', '2025-09-17 16:14:20', 'accepted', NULL, NULL, '2025-09-17 16:14:47'),
('643e6a8d-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'f1274106-8e6d-11f0-8503-d8bbc1070448', '2025-09-17 16:14:21', 'accepted', NULL, NULL, '2025-09-17 16:15:10'),
('658db7d7-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'f12884f1-8e6d-11f0-8503-d8bbc1070448', '2025-09-17 16:14:24', 'canceled', NULL, NULL, '2025-09-17 16:15:10'),
('9b3a8716-919c-11f0-9e34-04bf1b4ee6d7', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'f11fb1bf-8e6d-11f0-8503-d8bbc1070448', '2025-09-14 18:56:57', 'accepted', '2025-09-14 22:03:10', NULL, '2025-09-14 19:03:10'),
('b370aa79-965a-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', '2025-09-20 19:47:53', 'accepted', NULL, NULL, '2025-09-20 19:54:29'),
('ede70d00-965a-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'f11fb1bf-8e6d-11f0-8503-d8bbc1070448', '2025-09-20 19:49:32', 'accepted', NULL, NULL, '2025-09-20 19:56:13'),
('ef7ac600-9185-11f0-9e34-04bf1b4ee6d7', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'f1274106-8e6d-11f0-8503-d8bbc1070448', '2025-09-14 16:14:40', 'accepted', '2025-09-14 23:02:55', NULL, '2025-09-14 20:02:55'),
('f12c944d-8e6d-11f0-8503-d8bbc1070448', 'f11f5ce6-8e6d-11f0-8503-d8bbc1070448', 'f11fb1bf-8e6d-11f0-8503-d8bbc1070448', '2025-09-10 17:45:29', 'accepted', NULL, NULL, NULL),
('f12c98cf-8e6d-11f0-8503-d8bbc1070448', 'f12739f3-8e6d-11f0-8503-d8bbc1070448', 'f1274106-8e6d-11f0-8503-d8bbc1070448', '2025-09-10 17:45:29', 'accepted', NULL, NULL, NULL),
('f12c9c26-8e6d-11f0-8503-d8bbc1070448', 'f12836e5-8e6d-11f0-8503-d8bbc1070448', 'f12884f1-8e6d-11f0-8503-d8bbc1070448', '2025-09-10 17:45:29', 'accepted', NULL, NULL, NULL);

--
-- Δείκτες `committee_invitations`
--
DELIMITER $$
CREATE TRIGGER `trg_comm_inv_accepted_timeline` AFTER UPDATE ON `committee_invitations` FOR EACH ROW BEGIN
  IF OLD.status <> 'accepted' AND NEW.status = 'accepted' THEN
    INSERT INTO thesis_timeline(id, thesis_id, event_type, details)
    VALUES (
      UUID(),
      NEW.thesis_id,
      'committee_invitation_accepted',
      JSON_OBJECT('person_id', NEW.person_id)
    );
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `committee_members`
--

CREATE TABLE `committee_members` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `thesis_id` char(36) NOT NULL,
  `person_id` char(36) NOT NULL,
  `role_in_committee` enum('supervisor','member') NOT NULL DEFAULT 'member',
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `committee_members`
--

INSERT INTO `committee_members` (`id`, `thesis_id`, `person_id`, `role_in_committee`, `added_at`) VALUES
('1ac705d5-9629-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', 'member', '2025-09-20 13:52:52'),
('45b42727-9250-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', 'supervisor', '2025-09-15 16:22:56'),
('62590c29-9250-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'f12884f1-8e6d-11f0-8503-d8bbc1070448', 'member', '2025-09-15 16:23:44'),
('693fef9d-9250-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'f1274106-8e6d-11f0-8503-d8bbc1070448', 'member', '2025-09-15 16:23:55'),
('6c36ddfe-9629-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'f129bf7c-8e6d-11f0-8503-d8bbc1070448', 'member', '2025-09-20 13:55:09'),
('73a90894-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', 'member', '2025-09-17 16:14:47'),
('77f14738-9009-11f0-8503-d8bbc1070448', '77eedcc1-9009-11f0-8503-d8bbc1070448', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', 'supervisor', '2025-09-12 18:51:16'),
('79a575d2-919d-11f0-9e34-04bf1b4ee6d7', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'f11fb1bf-8e6d-11f0-8503-d8bbc1070448', 'member', '2025-09-14 19:03:10'),
('815e3c16-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'f1274106-8e6d-11f0-8503-d8bbc1070448', 'member', '2025-09-17 16:15:10'),
('97d40994-8f7f-11f0-8503-d8bbc1070448', '97d2d4d1-8f7f-11f0-8503-d8bbc1070448', 'f12884f1-8e6d-11f0-8503-d8bbc1070448', 'supervisor', '2025-09-12 02:24:20'),
('9f78e1e7-965b-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', 'member', '2025-09-20 19:54:29'),
('d2979129-91a5-11f0-9e34-04bf1b4ee6d7', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'f1274106-8e6d-11f0-8503-d8bbc1070448', 'member', '2025-09-14 20:02:55'),
('dd14d120-965b-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'f11fb1bf-8e6d-11f0-8503-d8bbc1070448', 'member', '2025-09-20 19:56:13'),
('dd71f179-9009-11f0-8503-d8bbc1070448', 'dd6fe3fc-9009-11f0-8503-d8bbc1070448', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', 'member', '2025-09-12 18:54:06'),
('eafe7b86-9628-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'f1274106-8e6d-11f0-8503-d8bbc1070448', 'supervisor', '2025-09-20 13:51:32'),
('f11d8dd4-8e6d-11f0-8503-d8bbc1070448', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', 'supervisor', '2025-09-10 17:45:29'),
('f11fb79f-8e6d-11f0-8503-d8bbc1070448', 'f11f5ce6-8e6d-11f0-8503-d8bbc1070448', 'f11fb1bf-8e6d-11f0-8503-d8bbc1070448', 'supervisor', '2025-09-10 17:45:29'),
('f12743e8-8e6d-11f0-8503-d8bbc1070448', 'f12739f3-8e6d-11f0-8503-d8bbc1070448', 'f1274106-8e6d-11f0-8503-d8bbc1070448', 'supervisor', '2025-09-10 17:45:29'),
('f1288a15-8e6d-11f0-8503-d8bbc1070448', 'f12836e5-8e6d-11f0-8503-d8bbc1070448', 'f12884f1-8e6d-11f0-8503-d8bbc1070448', 'supervisor', '2025-09-10 17:45:29'),
('f129c429-8e6d-11f0-8503-d8bbc1070448', 'f129b627-8e6d-11f0-8503-d8bbc1070448', 'f129bf7c-8e6d-11f0-8503-d8bbc1070448', 'supervisor', '2025-09-10 17:45:29'),
('fa9c955a-9659-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'f129bf7c-8e6d-11f0-8503-d8bbc1070448', 'supervisor', '2025-09-20 19:42:43');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `events_log`
--

CREATE TABLE `events_log` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `thesis_id` char(36) NOT NULL,
  `actor_id` char(36) DEFAULT NULL,
  `event_type` varchar(50) NOT NULL,
  `from_status` enum('under_assignment','active','under_review','completed','canceled') DEFAULT NULL,
  `to_status` enum('under_assignment','active','under_review','completed','canceled') DEFAULT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`details`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `events_log`
--

INSERT INTO `events_log` (`id`, `thesis_id`, `actor_id`, `event_type`, `from_status`, `to_status`, `details`, `created_at`) VALUES
('01c0d9da-93dc-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', NULL, 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 15:35:49'),
('099191d9-93dc-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', NULL, 'status_change', 'canceled', 'under_assignment', NULL, '2025-09-17 15:36:02'),
('115de714-93dc-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', NULL, 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 15:36:15'),
('165ff29e-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', NULL, 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 16:12:11'),
('296d580b-95b8-11f0-b556-04bf1b4ee6d7', 'ba203980-9247-11f0-9e34-04bf1b4ee6d7', NULL, 'status_change', 'canceled', 'under_assignment', NULL, '2025-09-20 00:24:16'),
('2d914008-93dc-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', NULL, 'status_change', 'canceled', 'under_assignment', NULL, '2025-09-17 15:37:02'),
('3dc07923-93d3-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', NULL, 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 14:33:04'),
('4a74ca0a-93dc-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', NULL, 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 15:37:51'),
('4ca81e72-93cd-11f0-8503-d8bbc1070448', 'cae11492-93c5-11f0-8503-d8bbc1070448', NULL, 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 13:50:32'),
('526a9cf5-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', NULL, 'status_change', 'canceled', 'under_assignment', NULL, '2025-09-17 16:13:51'),
('63eeb50c-95b8-11f0-b556-04bf1b4ee6d7', 'ba203980-9247-11f0-9e34-04bf1b4ee6d7', NULL, 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-20 00:25:54'),
('6941718c-9250-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', NULL, 'status_change', 'under_assignment', 'active', NULL, '2025-09-15 16:23:55'),
('6c375a65-9629-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', NULL, 'status_change', 'under_assignment', 'active', NULL, '2025-09-20 13:55:09'),
('6e23ccd0-95c0-11f0-b556-04bf1b4ee6d7', '698e090b-95b8-11f0-b556-04bf1b4ee6d7', NULL, 'status_change', 'active', 'canceled', NULL, '2025-09-20 01:23:27'),
('7f563cb9-924d-11f0-9e34-04bf1b4ee6d7', 'ba203980-9247-11f0-9e34-04bf1b4ee6d7', NULL, 'status_change', 'under_assignment', 'active', NULL, '2025-09-15 16:03:04'),
('7f6b9d84-95b8-11f0-b556-04bf1b4ee6d7', '698e090b-95b8-11f0-b556-04bf1b4ee6d7', NULL, 'status_change', 'under_assignment', 'active', NULL, '2025-09-20 00:26:40'),
('80b4f965-926f-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', NULL, 'status_change', 'active', 'under_review', NULL, '2025-09-15 20:06:29'),
('815eb709-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', NULL, 'status_change', 'under_assignment', 'active', NULL, '2025-09-17 16:15:10'),
('c4a344ed-963b-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', NULL, 'status_change', 'under_review', 'completed', NULL, '2025-09-20 16:06:28'),
('c9d3407c-93fd-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', NULL, 'status_change', 'active', 'under_review', NULL, '2025-09-17 19:37:38'),
('cf8b848b-93d1-11f0-8503-d8bbc1070448', 'b2d0e2f7-93d1-11f0-8503-d8bbc1070448', NULL, 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 14:22:50'),
('d2982b64-91a5-11f0-9e34-04bf1b4ee6d7', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', NULL, 'status_change', 'under_assignment', 'active', NULL, '2025-09-14 20:02:55'),
('d42fb679-9629-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', NULL, 'status_change', 'active', 'under_review', NULL, '2025-09-20 13:58:03'),
('dd150720-965b-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', NULL, 'status_change', 'under_assignment', 'active', NULL, '2025-09-20 19:56:13'),
('dd9fd5b4-93bd-11f0-8503-d8bbc1070448', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', NULL, 'status_change', 'active', 'under_review', NULL, '2025-09-17 12:00:04'),
('e0a63535-965c-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', NULL, 'status_change', 'active', 'under_review', NULL, '2025-09-20 20:03:28'),
('e1510686-95b7-11f0-b556-04bf1b4ee6d7', 'ba203980-9247-11f0-9e34-04bf1b4ee6d7', NULL, 'status_change', 'active', 'canceled', NULL, '2025-09-20 00:22:15'),
('ed6b6e2a-93e0-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', NULL, 'status_change', 'canceled', 'under_assignment', NULL, '2025-09-17 16:11:02'),
('f7b11eb0-93da-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', NULL, 'status_change', 'canceled', 'under_assignment', NULL, '2025-09-17 15:28:22');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `exam_minutes`
--

CREATE TABLE `exam_minutes` (
  `thesis_id` char(36) NOT NULL,
  `ga_session_no` varchar(50) DEFAULT NULL,
  `ga_session_date` date DEFAULT NULL,
  `location` varchar(120) DEFAULT NULL,
  `exam_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `decision_text` text DEFAULT NULL,
  `final_grade` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `grades`
--

CREATE TABLE `grades` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `thesis_id` char(36) NOT NULL,
  `person_id` char(36) NOT NULL,
  `rubric_id` char(36) NOT NULL,
  `criteria_scores_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`criteria_scores_json`)),
  `total` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `grades`
--

INSERT INTO `grades` (`id`, `thesis_id`, `person_id`, `rubric_id`, `criteria_scores_json`, `total`, `created_at`, `updated_at`) VALUES
('1e65afb0-9639-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'f129bf7c-8e6d-11f0-8503-d8bbc1070448', 'f11816d7-8e6d-11f0-8503-d8bbc1070448', '{\"goals\":5,\"duration\":6,\"text\":6,\"presentation\":8}', 5.60, '2025-09-20 15:47:30', NULL),
('2d922e94-965f-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'f129bf7c-8e6d-11f0-8503-d8bbc1070448', 'f11816d7-8e6d-11f0-8503-d8bbc1070448', '{\"goals\":7,\"duration\":7,\"text\":8,\"presentation\":9}', 7.35, '2025-09-20 20:19:56', NULL),
('4d13c327-9638-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'f1274106-8e6d-11f0-8503-d8bbc1070448', 'f11816d7-8e6d-11f0-8503-d8bbc1070448', '{\"goals\":7,\"duration\":7,\"text\":7,\"presentation\":7}', 7.00, '2025-09-20 15:41:39', NULL),
('59bb7bc7-965f-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', 'f11816d7-8e6d-11f0-8503-d8bbc1070448', '{\"goals\":5,\"duration\":5,\"text\":6,\"presentation\":6}', 5.25, '2025-09-20 20:21:10', NULL),
('6697a529-965f-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'f11fb1bf-8e6d-11f0-8503-d8bbc1070448', 'f11816d7-8e6d-11f0-8503-d8bbc1070448', '{\"goals\":3,\"duration\":3,\"text\":4,\"presentation\":4}', 3.25, '2025-09-20 20:21:32', NULL),
('8632f4e6-9638-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', 'f11816d7-8e6d-11f0-8503-d8bbc1070448', '{\"goals\":5,\"duration\":6,\"text\":3,\"presentation\":6}', 4.95, '2025-09-20 15:43:15', NULL),
('9c651ad0-9598-11f0-b1b0-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'f11fb1bf-8e6d-11f0-8503-d8bbc1070448', 'f11816d7-8e6d-11f0-8503-d8bbc1070448', '{\"goals\":7,\"duration\":7,\"text\":7,\"presentation\":7}', 7.00, '2025-09-19 20:38:33', NULL),
('c1895296-9598-11f0-b1b0-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'f11d75b7-8e6d-11f0-8503-d8bbc1070448', 'f11816d7-8e6d-11f0-8503-d8bbc1070448', '{\"goals\":7,\"duration\":7,\"text\":7,\"presentation\":7}', 7.00, '2025-09-19 20:39:35', NULL),
('d2ae54c7-9598-11f0-b1b0-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'f1274106-8e6d-11f0-8503-d8bbc1070448', 'f11816d7-8e6d-11f0-8503-d8bbc1070448', '{\"goals\":7,\"duration\":7,\"text\":7,\"presentation\":7}', 7.00, '2025-09-19 20:40:04', NULL),
('f13ce664-8e6d-11f0-8503-d8bbc1070448', 'f12836e5-8e6d-11f0-8503-d8bbc1070448', 'f12884f1-8e6d-11f0-8503-d8bbc1070448', 'f11816d7-8e6d-11f0-8503-d8bbc1070448', '{\"goals\": 9, \"duration\": 8.5, \"text\": 9, \"presentation\": 9.2}', 8.95, '2025-09-10 17:45:29', NULL);

--
-- Δείκτες `grades`
--
DELIMITER $$
CREATE TRIGGER `trg_grades_set_updated_at` BEFORE UPDATE ON `grades` FOR EACH ROW SET NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_grades_total_bi` BEFORE INSERT ON `grades` FOR EACH ROW BEGIN
  DECLARE w_goals, w_duration, w_text, w_presentation DECIMAL(6,4);
  DECLARE s_goals, s_duration, s_text, s_presentation DECIMAL(5,2);

  SELECT JSON_EXTRACT(weights_json, '$.goals'),
         JSON_EXTRACT(weights_json, '$.duration'),
         JSON_EXTRACT(weights_json, '$.text'),
         JSON_EXTRACT(weights_json, '$.presentation')
    INTO w_goals, w_duration, w_text, w_presentation
  FROM grading_rubrics WHERE id = NEW.rubric_id;

  SET s_goals        = JSON_EXTRACT(NEW.criteria_scores_json, '$.goals');
  SET s_duration     = JSON_EXTRACT(NEW.criteria_scores_json, '$.duration');
  SET s_text         = JSON_EXTRACT(NEW.criteria_scores_json, '$.text');
  SET s_presentation = JSON_EXTRACT(NEW.criteria_scores_json, '$.presentation');

  SET NEW.total = ROUND(
      COALESCE(s_goals,0)        * COALESCE(w_goals,0)
    + COALESCE(s_duration,0)     * COALESCE(w_duration,0)
    + COALESCE(s_text,0)         * COALESCE(w_text,0)
    + COALESCE(s_presentation,0) * COALESCE(w_presentation,0), 2);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_grades_total_bu` BEFORE UPDATE ON `grades` FOR EACH ROW BEGIN
  DECLARE w_goals, w_duration, w_text, w_presentation DECIMAL(6,4);
  DECLARE s_goals, s_duration, s_text, s_presentation DECIMAL(5,2);

  SELECT JSON_EXTRACT(weights_json, '$.goals'),
         JSON_EXTRACT(weights_json, '$.duration'),
         JSON_EXTRACT(weights_json, '$.text'),
         JSON_EXTRACT(weights_json, '$.presentation')
    INTO w_goals, w_duration, w_text, w_presentation
  FROM grading_rubrics WHERE id = NEW.rubric_id;

  SET s_goals        = JSON_EXTRACT(NEW.criteria_scores_json, '$.goals');
  SET s_duration     = JSON_EXTRACT(NEW.criteria_scores_json, '$.duration');
  SET s_text         = JSON_EXTRACT(NEW.criteria_scores_json, '$.text');
  SET s_presentation = JSON_EXTRACT(NEW.criteria_scores_json, '$.presentation');

  SET NEW.total = ROUND(
      COALESCE(s_goals,0)        * COALESCE(w_goals,0)
    + COALESCE(s_duration,0)     * COALESCE(w_duration,0)
    + COALESCE(s_text,0)         * COALESCE(w_text,0)
    + COALESCE(s_presentation,0) * COALESCE(w_presentation,0), 2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `grades_windows`
--

CREATE TABLE `grades_windows` (
  `thesis_id` char(36) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `enabled_by` int(11) DEFAULT NULL,
  `enabled_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `grading_rubrics`
--

CREATE TABLE `grading_rubrics` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `code` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `weights_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`weights_json`)),
  `effective_from` date NOT NULL,
  `effective_to` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `grading_rubrics`
--

INSERT INTO `grading_rubrics` (`id`, `code`, `title`, `weights_json`, `effective_from`, `effective_to`) VALUES
('f11816d7-8e6d-11f0-8503-d8bbc1070448', 'TMIYP-4CRIT-2024', 'Standard 4-criteria rubric', '{\"goals\": 0.60, \"duration\": 0.15, \"text\": 0.15, \"presentation\": 0.10}', '2025-09-10', NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `notes`
--

CREATE TABLE `notes` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `thesis_id` char(36) NOT NULL,
  `author_id` char(36) NOT NULL,
  `text` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `persons`
--

CREATE TABLE `persons` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `is_internal` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` char(36) DEFAULT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `affiliation` varchar(255) DEFAULT NULL,
  `role_category` enum('DEP','EEP','EDIP','ETEP','RESEARCH_A','RESEARCH_B','RESEARCH_C') NOT NULL,
  `has_phd` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `persons`
--

INSERT INTO `persons` (`id`, `is_internal`, `user_id`, `first_name`, `last_name`, `email`, `affiliation`, `role_category`, `has_phd`, `created_at`) VALUES
('f11d75b7-8e6d-11f0-8503-d8bbc1070448', 1, 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', 'Μαριος', 'Ρικος', 'a.alpha@uni.gr', 'Department', 'DEP', 1, '2025-09-10 17:45:29'),
('f11fb1bf-8e6d-11f0-8503-d8bbc1070448', 1, 'f11a1be2-8e6d-11f0-8503-d8bbc1070448', 'Καθηγήτρια', '', 'b.beta@uni.gr', 'Department', 'DEP', 1, '2025-09-10 17:45:29'),
('f1274106-8e6d-11f0-8503-d8bbc1070448', 1, 'f11a1c50-8e6d-11f0-8503-d8bbc1070448', 'Καθηγητής', '', 'g.gamma@uni.gr', 'Department', 'DEP', 1, '2025-09-10 17:45:29'),
('f12884f1-8e6d-11f0-8503-d8bbc1070448', 1, 'f11a1ca7-8e6d-11f0-8503-d8bbc1070448', 'Καθηγητής', '', 'd.delta@uni.gr', 'Department', 'DEP', 1, '2025-09-10 17:45:29'),
('f129bf7c-8e6d-11f0-8503-d8bbc1070448', 1, 'f11a1cfa-8e6d-11f0-8503-d8bbc1070448', 'Καθηγήτρια', '', 'e.epsilon@uni.gr', 'Department', 'DEP', 1, '2025-09-10 17:45:29');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `policies`
--

CREATE TABLE `policies` (
  `key_name` varchar(64) NOT NULL,
  `value_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`value_json`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `policies`
--

INSERT INTO `policies` (`key_name`, `value_json`) VALUES
('announcement_min_notice_days', '{\"min\": 7}'),
('exam_gap_days', '{\"min\": 21, \"max\": 60}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `presentation`
--

CREATE TABLE `presentation` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `thesis_id` char(36) NOT NULL,
  `when_dt` datetime NOT NULL,
  `mode` enum('in_person','online') NOT NULL,
  `room_or_link` varchar(255) NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `announcement_html` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Δείκτες `presentation`
--
DELIMITER $$
CREATE TRIGGER `trg_presentation_validate_bi` BEFORE INSERT ON `presentation` FOR EACH ROW BEGIN
  DECLARE min_gap INT DEFAULT 21;
  DECLARE max_gap INT DEFAULT 60;
  DECLARE min_notice INT DEFAULT 7;
  DECLARE gap INT;
  DECLARE notice INT;
  DECLARE t_committee_sub TIMESTAMP;

  SELECT
    CAST(JSON_UNQUOTE(JSON_EXTRACT(value_json,'$.min')) AS UNSIGNED),
    CAST(JSON_UNQUOTE(JSON_EXTRACT(value_json,'$.max')) AS UNSIGNED)
  INTO min_gap, max_gap
  FROM policies
  WHERE key_name='exam_gap_days'
  LIMIT 1;

  SELECT CAST(JSON_UNQUOTE(JSON_EXTRACT(value_json,'$.min')) AS UNSIGNED)
  INTO min_notice
  FROM policies
  WHERE key_name='announcement_min_notice_days'
  LIMIT 1;

  IF NEW.published_at IS NOT NULL THEN
    SET notice = TIMESTAMPDIFF(DAY, NEW.published_at, NEW.when_dt);
    IF notice < min_notice THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Announcement must be published sufficiently before the exam date.';
    END IF;
  END IF;

  SELECT committee_submission_at
  INTO t_committee_sub
  FROM theses
  WHERE id = NEW.thesis_id
  LIMIT 1;

  IF t_committee_sub IS NOT NULL THEN
    SET gap = TIMESTAMPDIFF(DAY, t_committee_sub, NEW.when_dt);
    IF gap < min_gap OR gap > max_gap THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exam date must be 21-60 days after committee submission.';
    END IF;
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_presentation_validate_bu` BEFORE UPDATE ON `presentation` FOR EACH ROW BEGIN
  DECLARE min_gap INT DEFAULT 21;
  DECLARE max_gap INT DEFAULT 60;
  DECLARE min_notice INT DEFAULT 7;
  DECLARE gap INT;
  DECLARE notice INT;
  DECLARE t_committee_sub TIMESTAMP;

  SELECT
    CAST(JSON_UNQUOTE(JSON_EXTRACT(value_json,'$.min')) AS UNSIGNED),
    CAST(JSON_UNQUOTE(JSON_EXTRACT(value_json,'$.max')) AS UNSIGNED)
  INTO min_gap, max_gap
  FROM policies
  WHERE key_name='exam_gap_days'
  LIMIT 1;

  SELECT CAST(JSON_UNQUOTE(JSON_EXTRACT(value_json,'$.min')) AS UNSIGNED)
  INTO min_notice
  FROM policies
  WHERE key_name='announcement_min_notice_days'
  LIMIT 1;

  IF NEW.published_at IS NOT NULL THEN
    SET notice = TIMESTAMPDIFF(DAY, NEW.published_at, NEW.when_dt);
    IF notice < min_notice THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Announcement must be published sufficiently before the exam date.';
    END IF;
  END IF;

  SELECT committee_submission_at
  INTO t_committee_sub
  FROM theses
  WHERE id = NEW.thesis_id
  LIMIT 1;

  IF t_committee_sub IS NOT NULL THEN
    SET gap = TIMESTAMPDIFF(DAY, t_committee_sub, NEW.when_dt);
    IF gap < min_gap OR gap > max_gap THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exam date must be 21-60 days after committee submission.';
    END IF;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `presentations`
--

CREATE TABLE `presentations` (
  `thesis_id` char(36) NOT NULL,
  `when_dt` datetime NOT NULL,
  `mode` enum('in_person','online') NOT NULL DEFAULT 'in_person',
  `room_or_link` varchar(512) NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `presentations`
--

INSERT INTO `presentations` (`thesis_id`, `when_dt`, `mode`, `room_or_link`, `published_at`, `created_at`, `updated_at`) VALUES
('1fd5421d-93d3-11f0-8503-d8bbc1070448', '2025-09-28 05:00:00', 'in_person', 'amf 3', NULL, '2025-09-19 02:57:44', NULL),
('45b3366e-9250-11f0-9e34-04bf1b4ee6d7', '2025-09-29 20:57:00', 'in_person', 'fsdr', NULL, '2025-09-19 17:57:47', NULL),
('eafe729c-9628-11f0-b1b0-f832e48c4bb6', '2025-09-28 17:01:00', 'in_person', 'amf 3', NULL, '2025-09-20 14:01:12', NULL),
('fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', '2025-09-28 11:09:00', 'in_person', 'Αμφιθέατρο Γ', NULL, '2025-09-20 20:10:43', NULL);

--
-- Δείκτες `presentations`
--
DELIMITER $$
CREATE TRIGGER `trg_presentations_timeline` AFTER INSERT ON `presentations` FOR EACH ROW BEGIN
  INSERT INTO thesis_timeline(id, thesis_id, event_type, details)
  VALUES (
    UUID(),
    NEW.thesis_id,
    'presentation_scheduled',
    JSON_OBJECT('when_dt', NEW.when_dt, 'mode', NEW.mode, 'room_or_link', NEW.room_or_link)
  );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `resources`
--

CREATE TABLE `resources` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `thesis_id` char(36) NOT NULL,
  `kind` enum('draft','link','code','video','image','other') NOT NULL,
  `url_or_path` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `resources`
--

INSERT INTO `resources` (`id`, `thesis_id`, `kind`, `url_or_path`, `created_at`) VALUES
('07817bc9-91b4-11f0-9e34-04bf1b4ee6d7', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/f11d422b-8e6d-11f0-8503-d8bbc1070448/draft_20250914_234437.pdf', '2025-09-14 21:44:37'),
('09dcd907-949e-11f0-bdf4-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/1fd5421d-93d3-11f0-8503-d8bbc1070448/draft_20250918_164453.pdf', '2025-09-18 14:44:53'),
('169cd2d8-919d-11f0-9e34-04bf1b4ee6d7', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/f11d422b-8e6d-11f0-8503-d8bbc1070448/draft_20250914_210024.pdf', '2025-09-14 19:00:24'),
('2bbc1ba8-94a5-11f0-bdf4-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'draft', '/uploads/resources/68cc26dd4216c0.29886926_Ergastiriaki_Askisi_24-25-1.0.pdf', '2025-09-18 15:35:57'),
('46c001cd-94a5-11f0-bdf4-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'draft', '/uploads/resources/68cc270a91db55.26223905_Ergastiriaki_Askisi_24-25-1.0.pdf', '2025-09-18 15:36:42'),
('46fea976-9406-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/1fd5421d-93d3-11f0-8503-d8bbc1070448/draft_20250917_223823.pdf', '2025-09-17 20:38:23'),
('545fc9de-94a5-11f0-bdf4-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'draft', '/uploads/resources/68cc27216ef8f6.54132700_diplomatiki_ergasia_tmiyp_0.pdf', '2025-09-18 15:37:05'),
('571bad36-91c0-11f0-9e34-04bf1b4ee6d7', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'link', 'https://drive.google.com/file/d/1AbCdEFgH12345/view?usp=share_link', '2025-09-14 23:12:44'),
('74205e32-9400-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/1fd5421d-93d3-11f0-8503-d8bbc1070448/draft_20250917_215642.pdf', '2025-09-17 19:56:42'),
('93e719c7-9266-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'draft', '/uploads/theses/45b3366e-9250-11f0-9e34-04bf1b4ee6d7/draft_20250915_210236.pdf', '2025-09-15 19:02:36'),
('9edc391b-91b4-11f0-9e34-04bf1b4ee6d7', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'link', 'https://drive.google.com/file/d/1AbCdEfGh12345/view?usp=share_link', '2025-09-14 21:48:51'),
('a0a5665e-91c0-11f0-9e34-04bf1b4ee6d7', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/f11d422b-8e6d-11f0-8503-d8bbc1070448/draft_20250915_011448.pdf', '2025-09-14 23:14:48'),
('a90058e8-9404-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/1fd5421d-93d3-11f0-8503-d8bbc1070448/draft_20250917_222649.pdf', '2025-09-17 20:26:49'),
('b00f291c-93be-11f0-8503-d8bbc1070448', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/f11d422b-8e6d-11f0-8503-d8bbc1070448/draft_20250917_140557.pdf', '2025-09-17 12:05:57'),
('b4b6c831-9404-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/1fd5421d-93d3-11f0-8503-d8bbc1070448/draft_20250917_222709.pdf', '2025-09-17 20:27:09'),
('bbae9088-9404-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/1fd5421d-93d3-11f0-8503-d8bbc1070448/draft_20250917_222720.pdf', '2025-09-17 20:27:20'),
('e156323c-9300-11f0-8503-d8bbc1070448', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/f11d422b-8e6d-11f0-8503-d8bbc1070448/draft_20250916_152716.pdf', '2025-09-16 13:27:16'),
('e99d9078-919e-11f0-9e34-04bf1b4ee6d7', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/f11d422b-8e6d-11f0-8503-d8bbc1070448/draft_20250914_211327.pdf', '2025-09-14 19:13:27'),
('fee36486-9403-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'draft', '/uploads/theses/1fd5421d-93d3-11f0-8503-d8bbc1070448/draft_20250917_222204.pdf', '2025-09-17 20:22:04');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `student_eligibility_snapshot`
--

CREATE TABLE `student_eligibility_snapshot` (
  `thesis_id` char(36) NOT NULL,
  `student_id` char(36) NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `owed_ects` smallint(6) DEFAULT NULL,
  `owed_courses` smallint(6) DEFAULT NULL,
  `is_5th_year` tinyint(1) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `theses`
--

CREATE TABLE `theses` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `student_id` char(36) NOT NULL,
  `topic_id` char(36) NOT NULL,
  `supervisor_id` char(36) NOT NULL,
  `status` enum('under_assignment','active','under_review','completed','canceled') NOT NULL DEFAULT 'under_assignment',
  `official_assign_date` datetime DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `committee_submission_at` timestamp NULL DEFAULT NULL,
  `approval_gs_number` varchar(50) DEFAULT NULL,
  `approval_gs_year` int(11) DEFAULT NULL,
  `canceled_reason` text DEFAULT NULL,
  `canceled_gs_number` varchar(50) DEFAULT NULL,
  `canceled_gs_year` int(11) DEFAULT NULL,
  `nimeritis_url` text DEFAULT NULL,
  `nimeritis_deposit_date` date DEFAULT NULL,
  `nimeritis_receipt_path` varchar(255) DEFAULT NULL,
  `central_grade_submitted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `grading_enabled_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `theses`
--

INSERT INTO `theses` (`id`, `student_id`, `topic_id`, `supervisor_id`, `status`, `official_assign_date`, `assigned_at`, `committee_submission_at`, `approval_gs_number`, `approval_gs_year`, `canceled_reason`, `canceled_gs_number`, `canceled_gs_year`, `nimeritis_url`, `nimeritis_deposit_date`, `nimeritis_receipt_path`, `central_grade_submitted_at`, `created_at`, `updated_at`, `grading_enabled_at`) VALUES
('1fd5421d-93d3-11f0-8503-d8bbc1070448', 'f118d656-8e6d-11f0-8503-d8bbc1070448', '199d5a0a-93d3-11f0-8503-d8bbc1070448', 'f11a1be2-8e6d-11f0-8503-d8bbc1070448', 'under_review', NULL, '2025-09-17 16:15:10', NULL, NULL, NULL, NULL, NULL, NULL, 'https://nemertes.library.upatras.gr/jspui/handle/10889/12345', '2025-09-28', NULL, NULL, '2025-09-17 14:32:14', '2025-09-20 00:54:55', '2025-09-19 16:59:34'),
('45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'f118d73b-8e6d-11f0-8503-d8bbc1070448', 'f096323e-9007-11f0-8503-d8bbc1070448', 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', 'under_review', NULL, '2025-09-15 16:23:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-15 16:22:56', '2025-09-19 14:57:51', '2025-09-19 17:57:51'),
('698e090b-95b8-11f0-b556-04bf1b4ee6d7', 'f118d778-8e6d-11f0-8503-d8bbc1070448', 'f11bdc3f-8e6d-11f0-8503-d8bbc1070448', 'f11a1ca7-8e6d-11f0-8503-d8bbc1070448', 'canceled', NULL, '2025-09-20 00:26:40', NULL, '12', 2025, 'teacher', '15', 2028, NULL, NULL, NULL, NULL, '2025-09-20 00:26:04', '2025-09-20 01:23:27', NULL),
('77eedcc1-9009-11f0-8503-d8bbc1070448', 'f118d69d-8e6d-11f0-8503-d8bbc1070448', '77ea79a8-9009-11f0-8503-d8bbc1070448', 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', 'under_assignment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-12 18:51:16', '2025-09-12 18:51:16', NULL),
('97d2d4d1-8f7f-11f0-8503-d8bbc1070448', 'f118d6ee-8e6d-11f0-8503-d8bbc1070448', 'dd2d41eb-8f2a-11f0-8503-d8bbc1070448', 'f11a1ca7-8e6d-11f0-8503-d8bbc1070448', 'active', NULL, NULL, NULL, '2', 2025, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-12 02:24:20', '2025-09-20 20:37:42', NULL),
('b2d0e2f7-93d1-11f0-8503-d8bbc1070448', 'f118d656-8e6d-11f0-8503-d8bbc1070448', 'f11aeee6-8e6d-11f0-8503-d8bbc1070448', 'f11a1be2-8e6d-11f0-8503-d8bbc1070448', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-17 14:22:01', '2025-09-17 14:22:50', NULL),
('ba203980-9247-11f0-9e34-04bf1b4ee6d7', 'f118d778-8e6d-11f0-8503-d8bbc1070448', 'f11aefdb-8e6d-11f0-8503-d8bbc1070448', 'f11a1ca7-8e6d-11f0-8503-d8bbc1070448', 'canceled', NULL, '2025-09-15 16:03:04', NULL, '12', 2025, 'αιτηση', '17', 2030, NULL, NULL, NULL, NULL, '2025-09-15 15:21:47', '2025-09-20 00:25:54', NULL),
('cae11492-93c5-11f0-8503-d8bbc1070448', 'f118d656-8e6d-11f0-8503-d8bbc1070448', 'f11bdb90-8e6d-11f0-8503-d8bbc1070448', 'f11a1be2-8e6d-11f0-8503-d8bbc1070448', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-17 12:56:48', '2025-09-17 13:50:32', NULL),
('dd6fe3fc-9009-11f0-8503-d8bbc1070448', 'f118d69d-8e6d-11f0-8503-d8bbc1070448', 'dd6b6d2d-9009-11f0-8503-d8bbc1070448', 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', 'under_assignment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-12 18:54:06', '2025-09-12 18:54:06', NULL),
('eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'f118d60e-8e6d-11f0-8503-d8bbc1070448', 'f11bdbe7-8e6d-11f0-8503-d8bbc1070448', 'f11a1c50-8e6d-11f0-8503-d8bbc1070448', 'completed', NULL, '2025-09-20 13:55:09', NULL, '2', 2025, NULL, NULL, NULL, 'https://nemertes.library.upatras.gr/jspui/handle/10889/12345', '2025-10-10', NULL, NULL, '2025-09-20 13:51:32', '2025-09-20 16:06:28', '2025-09-20 18:30:14'),
('f11d422b-8e6d-11f0-8503-d8bbc1070448', 'f118d118-8e6d-11f0-8503-d8bbc1070448', 'f11aed2f-8e6d-11f0-8503-d8bbc1070448', 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', 'under_review', NULL, '2025-09-14 20:02:55', NULL, NULL, NULL, NULL, NULL, NULL, 'https://nemertes.library.upatras.gr/jspui/handle/10889/12345', '2025-02-05', NULL, NULL, '2025-09-10 17:45:29', '2025-09-17 12:00:04', NULL),
('f11f5ce6-8e6d-11f0-8503-d8bbc1070448', 'f118d4a7-8e6d-11f0-8503-d8bbc1070448', 'f11aeee6-8e6d-11f0-8503-d8bbc1070448', 'f11a1be2-8e6d-11f0-8503-d8bbc1070448', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-10 17:45:29', NULL),
('f12739f3-8e6d-11f0-8503-d8bbc1070448', 'f118d56b-8e6d-11f0-8503-d8bbc1070448', 'f11aef86-8e6d-11f0-8503-d8bbc1070448', 'f11a1c50-8e6d-11f0-8503-d8bbc1070448', 'under_review', NULL, NULL, '2025-08-11 17:45:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-10 17:45:29', NULL),
('f12836e5-8e6d-11f0-8503-d8bbc1070448', 'f118d5c4-8e6d-11f0-8503-d8bbc1070448', 'f11aefdb-8e6d-11f0-8503-d8bbc1070448', 'f11a1ca7-8e6d-11f0-8503-d8bbc1070448', 'completed', NULL, '2025-09-10 17:45:29', '2025-08-01 17:45:29', 'GS-2025-01', 2025, NULL, NULL, NULL, 'http://nimeritis.uni.gr/thesis123', '2025-09-10', NULL, NULL, '2025-09-10 17:45:29', '2025-09-10 17:45:29', NULL),
('f129b627-8e6d-11f0-8503-d8bbc1070448', 'f118d60e-8e6d-11f0-8503-d8bbc1070448', 'f11af034-8e6d-11f0-8503-d8bbc1070448', 'f11a1cfa-8e6d-11f0-8503-d8bbc1070448', 'canceled', NULL, NULL, NULL, NULL, NULL, 'Ακύρωση λόγω προσωπικών λόγων', NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-10 17:45:29', NULL),
('fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'f118d778-8e6d-11f0-8503-d8bbc1070448', '5ca7f32d-9659-11f0-b1b0-f832e48c4bb6', 'f11a1cfa-8e6d-11f0-8503-d8bbc1070448', 'under_review', NULL, '2025-09-20 19:56:13', NULL, NULL, NULL, NULL, NULL, NULL, 'https://nemertes.library.upatras.gr/jspui/handle/10889/12345', '2025-09-30', NULL, NULL, '2025-09-20 19:42:43', '2025-09-20 20:43:47', '2025-09-20 23:16:42');

--
-- Δείκτες `theses`
--
DELIMITER $$
CREATE TRIGGER `trg_complete_requirements` BEFORE UPDATE ON `theses` FOR EACH ROW BEGIN
  DECLARE member_cnt INT DEFAULT 0;
  DECLARE supervisor_cnt INT DEFAULT 0;
  DECLARE grades_cnt INT DEFAULT 0;

  IF NEW.status = 'completed' THEN
    SELECT COUNT(*) INTO supervisor_cnt
      FROM committee_members
     WHERE thesis_id = NEW.id AND role_in_committee = 'supervisor';

    SELECT COUNT(*) INTO member_cnt
      FROM committee_members
     WHERE thesis_id = NEW.id AND role_in_committee = 'member';

    SELECT COUNT(*) INTO grades_cnt
      FROM grades
     WHERE thesis_id = NEW.id;

    IF supervisor_cnt <> 1 OR member_cnt < 2 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Completion requires 1 supervisor + 2 committee members.';
    END IF;
    IF grades_cnt < 3 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Completion requires 3 grades.';
    END IF;
    IF NEW.nimeritis_url IS NULL OR NEW.nimeritis_url = '' OR NEW.nimeritis_deposit_date IS NULL THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Completion requires Nimeritis URL & deposit date.';
    END IF;
    IF NEW.approval_gs_number IS NULL OR NEW.approval_gs_year IS NULL THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Completion requires GS approval number & year.';
    END IF;
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_enforce_status_flow` BEFORE UPDATE ON `theses` FOR EACH ROW BEGIN
  -- ΤΡΕΧΕΙ ΜΟΝΟ ΑΝ ΑΛΛΑΖΕΙ ΤΟ STATUS
  IF NEW.status <> OLD.status THEN

    -- Επιτρέπεται UNDER_REVIEW μόνο από ACTIVE
    IF NEW.status = 'under_review' AND OLD.status <> 'active' THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid transition: must be ACTIVE before UNDER_REVIEW';
    END IF;

    -- (βάλε εδώ και τους υπόλοιπους κανόνες μεταβάσεων σου, αν έχεις)
    -- π.χ. IF NEW.status = 'completed' AND OLD.status <> 'under_review' THEN ...

  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_theses_before_insert` BEFORE INSERT ON `theses` FOR EACH ROW BEGIN
  DECLARE v_role VARCHAR(32);
  DECLARE v_courses INT;
  DECLARE v_ects INT;

  SELECT role, IFNULL(owed_courses,0), IFNULL(owed_ects,0)
    INTO v_role, v_courses, v_ects
  FROM users
  WHERE id = NEW.student_id                      -- <<<< προσαρμοσμένο πεδίο

  LIMIT 1;

  IF v_role <> 'student' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Ανάθεση μόνο σε φοιτητή.';
  END IF;

  IF v_courses > 20 OR v_ects > 80 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Δεν επιτρέπεται ανάθεση: >20 μαθήματα ή >80 ECTS.';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_theses_status_timeline` AFTER UPDATE ON `theses` FOR EACH ROW BEGIN
  IF NEW.status <> OLD.status THEN
    INSERT INTO thesis_timeline(id, thesis_id, event_type, from_status, to_status)
    VALUES (UUID(), NEW.id, 'status_change', OLD.status, NEW.status);
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_thesis_add_supervisor` AFTER INSERT ON `theses` FOR EACH ROW BEGIN
  INSERT INTO persons(id, is_internal, user_id, first_name, last_name, email, affiliation, role_category, has_phd)
  SELECT UUID(), TRUE, u.id,
         SUBSTRING_INDEX(u.name, ' ', 1),
         TRIM(SUBSTRING(u.name, LENGTH(SUBSTRING_INDEX(u.name, ' ', 1)) + 1)),
         u.email, 'Department', 'DEP', TRUE
  FROM users u
  WHERE u.id = NEW.supervisor_id
    AND NOT EXISTS (SELECT 1 FROM persons p WHERE p.user_id = u.id)
  LIMIT 1;

  INSERT IGNORE INTO committee_members (id, thesis_id, person_id, role_in_committee, added_at)
  SELECT UUID(), NEW.id, p.id, 'supervisor', NOW()
  FROM persons p
  WHERE p.user_id = NEW.supervisor_id
  LIMIT 1;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_thesis_status_log` AFTER UPDATE ON `theses` FOR EACH ROW BEGIN
  IF NEW.status <> OLD.status THEN
    INSERT INTO events_log(thesis_id, actor_id, event_type, from_status, to_status, details)
    VALUES (NEW.id, NULL, 'status_change', OLD.status, NEW.status, NULL);
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `thesis_notes`
--

CREATE TABLE `thesis_notes` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `thesis_id` char(36) NOT NULL,
  `author_id` char(36) NOT NULL,
  `text` varchar(300) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `thesis_notes`
--

INSERT INTO `thesis_notes` (`id`, `thesis_id`, `author_id`, `text`, `created_at`) VALUES
('01e8a2c8-965e-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'f11a1cfa-8e6d-11f0-8503-d8bbc1070448', 'παραδειγμα', '2025-09-20 23:11:34'),
('68689410-927e-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', '123', '2025-09-16 00:53:11'),
('941ff1b4-9629-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'f11a1c50-8e6d-11f0-8503-d8bbc1070448', 'gre', '2025-09-20 16:56:16'),
('fdd6f66a-93bd-11f0-8503-d8bbc1070448', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', 'ηφηφ', '2025-09-17 15:00:58');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `thesis_resources`
--

CREATE TABLE `thesis_resources` (
  `id` char(36) NOT NULL,
  `thesis_id` char(36) NOT NULL,
  `type` enum('draft','link') NOT NULL,
  `path` text NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `mimetype` varchar(150) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `uploaded_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `thesis_resources`
--

INSERT INTO `thesis_resources` (`id`, `thesis_id`, `type`, `path`, `filename`, `mimetype`, `file_size`, `uploaded_at`) VALUES
('0315f704-963f-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'link', 'https://www.youtube.com/watch?v=5N7V2fkpJqk', NULL, NULL, NULL, '2025-09-20 19:29:41'),
('19cc0db2-94eb-11f0-a3c7-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'link', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', NULL, NULL, NULL, '2025-09-19 02:56:31'),
('2e0f820a-962a-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'draft', '/uploads/specs/thesiseafe729c-9628-11f0-b1b0-f832e48c4bb6_draft_20250920_160034.pdf', 'Σημειώσεις Αρχιτεκτονικής_new.pdf', 'application/pdf', 7737903, '2025-09-20 17:00:34'),
('3d49c63b-962a-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'link', 'https://www.youtube.com/watch?v=XUqRem0W8L8', NULL, NULL, NULL, '2025-09-20 17:00:59'),
('42603d6a-963e-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'link', 'https://www.youtube.com/watch?v=Gj21jwSEhEE&list=RDGj21jwSEhEE&start_radio=1', NULL, NULL, NULL, '2025-09-20 19:24:18'),
('6ed87bc5-965d-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'link', 'https://www.youtube.com/watch?v=IOR31yN43Kg', NULL, NULL, NULL, '2025-09-20 23:07:27'),
('6f5926af-963d-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'link', 'https://www.youtube.com/watch?v=gG_dA32oH44', NULL, NULL, NULL, '2025-09-20 19:18:24'),
('71ed7c9c-965d-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'draft', '/uploads/specs/thesisfa9c7c00-9659-11f0-b1b0-f832e48c4bb6_draft_20250920_220732.pdf', 'numerical.pdf', 'application/pdf', 329550, '2025-09-20 23:07:32'),
('7f1300ff-9641-11f0-b1b0-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'link', 'https://www.youtube.com/watch?v=5N7V2fkpJqk', NULL, NULL, NULL, '2025-09-20 19:47:28'),
('8c9508ee-94e7-11f0-a3c7-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'draft', '/uploads/specs/thesis1fd5421d-93d3-11f0-8503-d8bbc1070448_draft_20250919_013106.pdf', 'Σημειώσεις Αρχιτεκτονικής Ι_2 (1).pdf', 'application/pdf', 7737903, '2025-09-19 02:31:06'),
('96d5f888-963d-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'link', 'https://www.youtube.com/watch?v=Gj21jwSEhEE&list=RDGj21jwSEhEE&start_radio=1', NULL, NULL, NULL, '2025-09-20 19:19:30'),
('9d722da4-94e7-11f0-a3c7-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'draft', '/uploads/specs/thesis1fd5421d-93d3-11f0-8503-d8bbc1070448_draft_20250919_013134.pdf', 'Σημειώσεις Αρχιτεκτονικής Ι_2 (1).pdf', 'application/pdf', 7737903, '2025-09-19 02:31:34'),
('c19429f4-94e8-11f0-a3c7-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'link', 'https://www.youtube.com/watch?v=DafGwPhU2TA', NULL, NULL, NULL, '2025-09-19 02:39:44');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `thesis_timeline`
--

CREATE TABLE `thesis_timeline` (
  `id` char(36) NOT NULL,
  `thesis_id` char(36) NOT NULL,
  `event_type` varchar(64) NOT NULL,
  `from_status` enum('under_assignment','active','under_review','completed','canceled') DEFAULT NULL,
  `to_status` enum('under_assignment','active','under_review','completed','canceled') DEFAULT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`details`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `thesis_timeline`
--

INSERT INTO `thesis_timeline` (`id`, `thesis_id`, `event_type`, `from_status`, `to_status`, `details`, `created_at`) VALUES
('01c0c4dc-93dc-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 15:35:49'),
('09918e5d-93dc-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'status_change', 'canceled', 'under_assignment', NULL, '2025-09-17 15:36:02'),
('115de355-93dc-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 15:36:15'),
('165fe95d-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 16:12:11'),
('1ac6ed97-9629-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'committee_invitation_accepted', NULL, NULL, '{\"person_id\": \"f11d75b7-8e6d-11f0-8503-d8bbc1070448\"}', '2025-09-20 13:52:52'),
('26f6ecb0-9582-11f0-a3c7-f832e48c4bb6', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'presentation_scheduled', NULL, NULL, '{\"when_dt\": \"2025-09-29 20:57:00\", \"mode\": \"in_person\", \"room_or_link\": \"fsdr\"}', '2025-09-19 17:57:47'),
('296d5399-95b8-11f0-b556-04bf1b4ee6d7', 'ba203980-9247-11f0-9e34-04bf1b4ee6d7', 'status_change', 'canceled', 'under_assignment', NULL, '2025-09-20 00:24:16'),
('2d910f4d-93dc-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'status_change', 'canceled', 'under_assignment', NULL, '2025-09-17 15:37:02'),
('3dc03f4d-93d3-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 14:33:04'),
('44de1b41-962a-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'presentation_scheduled', NULL, NULL, '{\"when_dt\": \"2025-09-28 17:01:00\", \"mode\": \"in_person\", \"room_or_link\": \"amf 3\"}', '2025-09-20 14:01:12'),
('4a74c628-93dc-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 15:37:51'),
('4ca7fdd1-93cd-11f0-8503-d8bbc1070448', 'cae11492-93c5-11f0-8503-d8bbc1070448', 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 13:50:32'),
('526a9786-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'status_change', 'canceled', 'under_assignment', NULL, '2025-09-17 16:13:51'),
('5a240186-9501-11f0-a3c7-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'presentation_scheduled', NULL, NULL, '{\"when_dt\": \"2025-09-28 21:35:00\", \"mode\": \"\", \"room_or_link\": \"tsimpopukia mpakas\"}', '2025-09-19 02:35:48'),
('6258c870-9250-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'committee_invitation_accepted', NULL, NULL, '{\"person_id\": \"f12884f1-8e6d-11f0-8503-d8bbc1070448\"}', '2025-09-15 16:23:44'),
('63eeb28a-95b8-11f0-b556-04bf1b4ee6d7', 'ba203980-9247-11f0-9e34-04bf1b4ee6d7', 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-20 00:25:54'),
('693fdb1c-9250-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'committee_invitation_accepted', NULL, NULL, '{\"person_id\": \"f1274106-8e6d-11f0-8503-d8bbc1070448\"}', '2025-09-15 16:23:55'),
('69422bca-9250-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'status_change', 'under_assignment', 'active', NULL, '2025-09-15 16:23:55'),
('6a3f1a44-9504-11f0-a3c7-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'presentation_scheduled', NULL, NULL, '{\"when_dt\": \"2025-09-28 05:00:00\", \"mode\": \"in_person\", \"room_or_link\": \"amf 3\"}', '2025-09-19 02:57:44'),
('6c36d114-9629-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'committee_invitation_accepted', NULL, NULL, '{\"person_id\": \"f129bf7c-8e6d-11f0-8503-d8bbc1070448\"}', '2025-09-20 13:55:09'),
('6c375906-9629-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'status_change', 'under_assignment', 'active', NULL, '2025-09-20 13:55:09'),
('6e21ec47-95c0-11f0-b556-04bf1b4ee6d7', '698e090b-95b8-11f0-b556-04bf1b4ee6d7', 'status_change', 'active', 'canceled', NULL, '2025-09-20 01:23:27'),
('73a8c280-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'committee_invitation_accepted', NULL, NULL, '{\"person_id\": \"f11d75b7-8e6d-11f0-8503-d8bbc1070448\"}', '2025-09-17 16:14:47'),
('75b900fc-924d-11f0-9e34-04bf1b4ee6d7', 'ba203980-9247-11f0-9e34-04bf1b4ee6d7', 'committee_invitation_accepted', NULL, NULL, '{\"person_id\": \"f11fb1bf-8e6d-11f0-8503-d8bbc1070448\"}', '2025-09-15 16:02:49'),
('7ad065e3-95b8-11f0-b556-04bf1b4ee6d7', '698e090b-95b8-11f0-b556-04bf1b4ee6d7', 'committee_invitation_accepted', NULL, NULL, '{\"person_id\": \"f11d75b7-8e6d-11f0-8503-d8bbc1070448\"}', '2025-09-20 00:26:33'),
('7f52305d-924d-11f0-9e34-04bf1b4ee6d7', 'ba203980-9247-11f0-9e34-04bf1b4ee6d7', 'committee_invitation_accepted', NULL, NULL, '{\"person_id\": \"f1274106-8e6d-11f0-8503-d8bbc1070448\"}', '2025-09-15 16:03:04'),
('7f5679ac-924d-11f0-9e34-04bf1b4ee6d7', 'ba203980-9247-11f0-9e34-04bf1b4ee6d7', 'status_change', 'under_assignment', 'active', NULL, '2025-09-15 16:03:04'),
('7f679ea3-95b8-11f0-b556-04bf1b4ee6d7', '698e090b-95b8-11f0-b556-04bf1b4ee6d7', 'committee_invitation_accepted', NULL, NULL, '{\"person_id\": \"f1274106-8e6d-11f0-8503-d8bbc1070448\"}', '2025-09-20 00:26:40'),
('7f6b9b99-95b8-11f0-b556-04bf1b4ee6d7', '698e090b-95b8-11f0-b556-04bf1b4ee6d7', 'status_change', 'under_assignment', 'active', NULL, '2025-09-20 00:26:40'),
('80b524d9-926f-11f0-9e34-04bf1b4ee6d7', '45b3366e-9250-11f0-9e34-04bf1b4ee6d7', 'status_change', 'active', 'under_review', NULL, '2025-09-15 20:06:29'),
('815e28b2-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'committee_invitation_accepted', NULL, NULL, '{\"person_id\": \"f1274106-8e6d-11f0-8503-d8bbc1070448\"}', '2025-09-17 16:15:10'),
('815eb40e-93e1-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'status_change', 'under_assignment', 'active', NULL, '2025-09-17 16:15:10'),
('82606160-94fe-11f0-a3c7-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'presentation_scheduled', NULL, NULL, '{\"when_dt\": \"2025-09-28 17:15:00\", \"mode\": \"\", \"room_or_link\": \"Amf G\"}', '2025-09-19 02:15:27'),
('94e279ec-94f2-11f0-a3c7-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'presentation_scheduled', NULL, NULL, '{\"when_dt\": \"2025-10-10 19:53:00\", \"mode\": \"\", \"room_or_link\": \"Αμφιθεατρο Γ\"}', '2025-09-19 00:50:04'),
('9f78c463-965b-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'committee_invitation_accepted', NULL, NULL, '{\"person_id\": \"f11d75b7-8e6d-11f0-8503-d8bbc1070448\"}', '2025-09-20 19:54:29'),
('c4a34197-963b-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'status_change', 'under_review', 'completed', NULL, '2025-09-20 16:06:28'),
('c6be5b67-94fc-11f0-a3c7-f832e48c4bb6', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'presentation_scheduled', NULL, NULL, '{\"when_dt\": \"2025-09-28 17:02:00\", \"mode\": \"\", \"room_or_link\": \"Αμφιθεατρο Γ\"}', '2025-09-19 02:03:03'),
('c9d2de90-93fd-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'status_change', 'active', 'under_review', NULL, '2025-09-17 19:37:38'),
('cf8b56f0-93d1-11f0-8503-d8bbc1070448', 'b2d0e2f7-93d1-11f0-8503-d8bbc1070448', 'status_change', 'under_assignment', 'canceled', NULL, '2025-09-17 14:22:50'),
('d42fb4e2-9629-11f0-b1b0-f832e48c4bb6', 'eafe729c-9628-11f0-b1b0-f832e48c4bb6', 'status_change', 'active', 'under_review', NULL, '2025-09-20 13:58:03'),
('dd145861-965b-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'committee_invitation_accepted', NULL, NULL, '{\"person_id\": \"f11fb1bf-8e6d-11f0-8503-d8bbc1070448\"}', '2025-09-20 19:56:13'),
('dd1502e7-965b-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'status_change', 'under_assignment', 'active', NULL, '2025-09-20 19:56:13'),
('dd9f3354-93bd-11f0-8503-d8bbc1070448', 'f11d422b-8e6d-11f0-8503-d8bbc1070448', 'status_change', 'active', 'under_review', NULL, '2025-09-17 12:00:04'),
('e0a5a42c-965c-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'status_change', 'active', 'under_review', NULL, '2025-09-20 20:03:28'),
('e14eb850-95b7-11f0-b556-04bf1b4ee6d7', 'ba203980-9247-11f0-9e34-04bf1b4ee6d7', 'status_change', 'active', 'canceled', NULL, '2025-09-20 00:22:15'),
('e3f2377b-965d-11f0-b1b0-f832e48c4bb6', 'fa9c7c00-9659-11f0-b1b0-f832e48c4bb6', 'presentation_scheduled', NULL, NULL, '{\"when_dt\": \"2025-09-28 11:09:00\", \"mode\": \"in_person\", \"room_or_link\": \"Αμφιθέατρο Γ\"}', '2025-09-20 20:10:43'),
('ed6b528b-93e0-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'status_change', 'canceled', 'under_assignment', NULL, '2025-09-17 16:11:02'),
('f7b0e1a4-93da-11f0-8503-d8bbc1070448', '1fd5421d-93d3-11f0-8503-d8bbc1070448', 'status_change', 'canceled', 'under_assignment', NULL, '2025-09-17 15:28:22');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `topics`
--

CREATE TABLE `topics` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `professor_id` char(36) DEFAULT NULL,
  `supervisor_id` char(36) NOT NULL,
  `assigned_student_id` char(36) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text DEFAULT NULL,
  `spec_pdf_path` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `provisional_student_id` char(36) DEFAULT NULL,
  `provisional_since` datetime DEFAULT NULL,
  `provisional_assigned_at` datetime DEFAULT NULL,
  `pdf_path` text DEFAULT NULL,
  `academic_year` varchar(9) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `topics`
--

INSERT INTO `topics` (`id`, `professor_id`, `supervisor_id`, `assigned_student_id`, `title`, `summary`, `spec_pdf_path`, `is_available`, `provisional_student_id`, `provisional_since`, `provisional_assigned_at`, `pdf_path`, `academic_year`, `created_at`, `updated_at`) VALUES
('199d5a0a-93d3-11f0-8503-d8bbc1070448', NULL, 'f11a1be2-8e6d-11f0-8503-d8bbc1070448', NULL, 'test1', 'test thema', '/uploads/specs/spec_68cc9285d2fb80.63986490.pdf', 0, 'f118d656-8e6d-11f0-8503-d8bbc1070448', '2025-09-17 19:13:51', NULL, NULL, NULL, '2025-09-17 14:32:03', '2025-09-18 23:15:17'),
('5ca7f32d-9659-11f0-b1b0-f832e48c4bb6', NULL, 'f11a1cfa-8e6d-11f0-8503-d8bbc1070448', NULL, 'Θέμα επίδειξης', 'δοκιμή ανάρτησης θέματος', '/uploads/specs/spec_68cf02aacb1d00.46875249.pdf', 0, 'f118d778-8e6d-11f0-8503-d8bbc1070448', '2025-09-20 22:42:43', NULL, NULL, NULL, '2025-09-20 19:38:18', '2025-09-20 19:44:58'),
('77ea79a8-9009-11f0-8503-d8bbc1070448', NULL, 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', NULL, 'Demo Θέμα για έλεγχο UI', 'Δοκιμαστικό θέμα για τη λίστα διπλωματικών.', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2025-09-12 18:51:16', '2025-09-13 17:47:00'),
('dd2d41eb-8f2a-11f0-8503-d8bbc1070448', NULL, 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', NULL, 'Δοκιμαστικό Θέμα για τον Καθηγητή Α', 'Αυτό είναι ένα test θέμα που ανήκει στον Καθηγητή Α. Άλφα.', NULL, 1, 'f118d6ee-8e6d-11f0-8503-d8bbc1070448', '2025-09-17 15:50:32', NULL, NULL, NULL, '2025-09-11 16:17:49', '2025-09-17 12:50:32'),
('dd6b6d2d-9009-11f0-8503-d8bbc1070448', NULL, 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', NULL, 'Demo Θέμα για έλεγχο UI', 'Δοκιμαστικό θέμα για τη λίστα διπλωματικών.', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2025-09-12 18:54:06', '2025-09-13 17:47:03'),
('f096323e-9007-11f0-8503-d8bbc1070448', NULL, 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', NULL, 'Παράδειγμα Θέμα', 'Αυτό είναι δοκιμαστικό θέμα.', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2025-09-12 18:40:19', '2025-09-17 12:55:47'),
('f11aed2f-8e6d-11f0-8503-d8bbc1070448', NULL, 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', NULL, 'Θέμα Α από Καθηγητής Α. Αλφα', 'Περιγραφή θέματος Α', NULL, 1, NULL, NULL, NULL, NULL, '2024-2025', '2025-09-10 17:45:29', '2025-09-10 17:45:29'),
('f11aeee6-8e6d-11f0-8503-d8bbc1070448', NULL, 'f11a1be2-8e6d-11f0-8503-d8bbc1070448', NULL, 'Θέμα Α από Καθηγήτρια Β. Βήτα', 'Περιγραφή θέματος Α', NULL, 1, NULL, NULL, NULL, NULL, '2024-2025', '2025-09-10 17:45:29', '2025-09-17 14:31:53'),
('f11aef86-8e6d-11f0-8503-d8bbc1070448', NULL, 'f11a1c50-8e6d-11f0-8503-d8bbc1070448', NULL, 'Θέμα Α από Καθηγητής Γ. Γάμμα', 'Περιγραφή θέματος Α', NULL, 1, NULL, NULL, NULL, NULL, '2024-2025', '2025-09-10 17:45:29', '2025-09-10 17:45:29'),
('f11aefdb-8e6d-11f0-8503-d8bbc1070448', NULL, 'f11a1ca7-8e6d-11f0-8503-d8bbc1070448', NULL, 'Θέμα Α από Καθηγητής Δ. Δέλτα', 'Περιγραφή θέματος Α', NULL, 1, NULL, NULL, NULL, NULL, '2024-2025', '2025-09-10 17:45:29', '2025-09-20 00:25:54'),
('f11af034-8e6d-11f0-8503-d8bbc1070448', NULL, 'f11a1cfa-8e6d-11f0-8503-d8bbc1070448', NULL, 'Θέμα Α από Καθηγήτρια Ε. Έψιλον', 'Περιγραφή θέματος Α', NULL, 1, NULL, NULL, NULL, NULL, '2024-2025', '2025-09-10 17:45:29', '2025-09-20 18:35:53'),
('f11bd9a4-8e6d-11f0-8503-d8bbc1070448', NULL, 'f11a1a41-8e6d-11f0-8503-d8bbc1070448', NULL, 'Θέμα Β από Καθηγητής Α. Αλφα', 'Περιγραφή θέματος Β', NULL, 1, NULL, NULL, NULL, NULL, '2024-2025', '2025-09-10 17:45:29', '2025-09-10 17:45:29'),
('f11bdb90-8e6d-11f0-8503-d8bbc1070448', NULL, 'f11a1be2-8e6d-11f0-8503-d8bbc1070448', NULL, 'Θέμα Β από Καθηγήτρια Β. Βήτα', 'Περιγραφή θέματος Β', NULL, 1, NULL, NULL, NULL, NULL, '2024-2025', '2025-09-10 17:45:29', '2025-09-17 14:21:21'),
('f11bdbe7-8e6d-11f0-8503-d8bbc1070448', NULL, 'f11a1c50-8e6d-11f0-8503-d8bbc1070448', NULL, 'Θέμα Β από Καθηγητής Γ. Γάμμα', 'Περιγραφή θέματος Β', '/uploads/specs/spec_68cecd1b662c99.26019932.pdf', 1, 'f118d60e-8e6d-11f0-8503-d8bbc1070448', '2025-09-20 16:51:32', NULL, NULL, '2024-2025', '2025-09-10 17:45:29', '2025-09-20 15:49:47'),
('f11bdc3f-8e6d-11f0-8503-d8bbc1070448', NULL, 'f11a1ca7-8e6d-11f0-8503-d8bbc1070448', NULL, 'Θέμα Β από Καθηγητής Δ. Δέλτα', 'Περιγραφή θέματος Β', NULL, 1, 'f118d778-8e6d-11f0-8503-d8bbc1070448', '2025-09-20 03:26:04', NULL, NULL, '2024-2025', '2025-09-10 17:45:29', '2025-09-20 01:23:27'),
('f11bdc8d-8e6d-11f0-8503-d8bbc1070448', NULL, 'f11a1cfa-8e6d-11f0-8503-d8bbc1070448', NULL, 'Θέμα Β από Καθηγήτρια Ε. Έψιλον', 'Περιγραφή θέματος Β', NULL, 1, NULL, NULL, NULL, NULL, '2024-2025', '2025-09-10 17:45:29', '2025-09-10 17:45:29');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `role` enum('student','teacher','secretariat') NOT NULL,
  `student_number` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_landline` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `owed_ects` int(11) DEFAULT NULL,
  `owed_courses` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `users`
--

INSERT INTO `users` (`id`, `role`, `student_number`, `name`, `email`, `password_hash`, `address`, `phone_mobile`, `phone_landline`, `created_at`, `updated_at`, `owed_ects`, `owed_courses`) VALUES
('576871f7-9661-11f0-b1b0-f832e48c4bb6', 'student', 's2001', 'Νέος Φοιτητής', 's2001@uni.gr', '$2y$10$xsBuTvNJSUdqiN7ttgtLVe/Auw/n6AO6F.K.RiOJOdKcontTxneuW', NULL, '6990000001', NULL, '2025-09-20 20:35:26', '2025-09-20 20:35:26', NULL, NULL),
('577319a1-9661-11f0-b1b0-f832e48c4bb6', 'teacher', NULL, 'Νέος Διδάσκων', 'prof.new@uni.gr', '$2y$10$/qIexldrpWanB8cXfsUXFu/axKTgvHrYzMRib7dMT6py77nZY3VEm', NULL, NULL, NULL, '2025-09-20 20:35:26', '2025-09-20 20:35:26', NULL, NULL),
('893e10d7-94dd-11f0-a3c7-f832e48c4bb6', 'secretariat', NULL, 'Γραμματεία', 'sec@uni.gr', '$2y$10$Z65ndHP2oX0Y3Wj4Wu9tduHcuu/qSogfWlgmffIIACaKTVF99Ta/m', NULL, NULL, NULL, '2025-09-18 22:19:25', '2025-09-18 22:23:24', NULL, NULL),
('f118d118-8e6d-11f0-8503-d8bbc1070448', 'student', 's1001', 'Γιάννης Παπαδόπουλος', 's1001@uni.gr', '$2y$10$l8Kj1gbjkm6z0G3TGyq9FeynwHU5ymH7aGi6rqHXA9Z81USxUuGbO', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-13 16:13:05', NULL, NULL),
('f118d4a7-8e6d-11f0-8503-d8bbc1070448', 'student', 's1002', 'Μαρία Κωνσταντίνου', 's1002@uni.gr', '$2y$10$mXWzrUD1mSK9ytKykcuf7Od3SDHUHmjW5CZMfMmQ1lt1uF4jiVzNO', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-15 13:21:21', NULL, NULL),
('f118d56b-8e6d-11f0-8503-d8bbc1070448', 'student', 's1003', 'Αντώνης Σπυρόπουλος', 's1003@uni.gr', '$2y$10$8QxAP0E28/uQqiAppCbT6uV/ehQ9Dybj44yvXPCJ1o3nwzOPSqmgG', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-15 13:22:44', NULL, NULL),
('f118d5c4-8e6d-11f0-8503-d8bbc1070448', 'student', 's1004', 'Ελένη Γεωργίου', 's1004@uni.gr', '$2y$10$kQgHNfd1LsYwwDTomccOaeKx2iXTCdjPs8MFcy2c5v05l.b7rNYia', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-20 18:22:35', NULL, NULL),
('f118d60e-8e6d-11f0-8503-d8bbc1070448', 'student', 's1005', 'Κώστας Δημητρίου', 's1005@uni.gr', '$2y$10$tETRb3RgUo6IeXCa4sJ4ieM4oNN.HAec3VqTt4Db6Jb8kKW9u2IOO', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-17 12:51:50', NULL, NULL),
('f118d656-8e6d-11f0-8503-d8bbc1070448', 'student', 's1006', 'Νίκη Σταθοπούλου', 's1006@uni.gr', '$2y$10$fCd8B4DTlAgPWKVhlk3w9O9TYUpm82ShKePnXBLmLp/DcUrtp6UZO', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-17 12:53:49', NULL, NULL),
('f118d69d-8e6d-11f0-8503-d8bbc1070448', 'student', 's1007', 'Χρήστος Αντωνίου', 's1007@uni.gr', '$2y$10$ooRnG5l/t7n3iOM70NeOSO/rlxo29e6OdJBm9YI06aTByqbUGvmyu', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-15 16:21:40', NULL, NULL),
('f118d6ee-8e6d-11f0-8503-d8bbc1070448', 'student', 's1008', 'Δήμητρα Λάμπρου', 's1008@uni.gr', '$2y$10$nPnzTCxMnF/ndGW0KsecnuFeNYPsa2QXBH5WeLXs3Xjb8IufMp.Bi', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-17 12:50:48', NULL, NULL),
('f118d73b-8e6d-11f0-8503-d8bbc1070448', 'student', 's1009', 'Πέτρος Καραγιάννης', 's1009@uni.gr', '$2y$10$RFGRqKdqjNZAdT4f64p5Y.qGC0VG6heud3t8rxSXoUqVss3n3IL5m', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-20 20:46:54', 81, 21),
('f118d778-8e6d-11f0-8503-d8bbc1070448', 'student', 's1010', 'Άννα Σακελλαρίου', 's1010@uni.gr', '$2y$10$TwCbIozfp7YcoluV2buZ2eYUJm6AxgcFh8Wr85yUsUSP2BeB6p4zu', '', '6972522479', '', '2025-09-10 17:45:29', '2025-09-20 18:35:31', 5, 2),
('f11a1a41-8e6d-11f0-8503-d8bbc1070448', 'teacher', NULL, 'Καθηγητής Α. Αλφα', 'a.alpha@uni.gr', '$2y$10$af2sOWn8UO/74dYCEFaPt.ajTzJHzqwOL4yD2GsksXoECk4iH5VLe', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-10 18:34:00', NULL, NULL),
('f11a1be2-8e6d-11f0-8503-d8bbc1070448', 'teacher', NULL, 'Καθηγήτρια Β. Βήτα', 'b.beta@uni.gr', '$2y$10$f1YJ7co39kfD0gsaF7A97ezelw6goGo1MiWU0g3rM8FU6WsFGVwvC', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-14 18:57:02', NULL, NULL),
('f11a1c50-8e6d-11f0-8503-d8bbc1070448', 'teacher', NULL, 'Καθηγητής Γ. Γάμμα', 'g.gamma@uni.gr', '$2y$10$HxmdIRxYGPj4lqvOzCwhCerfmJVAiUyewxa5i.J2UbFUlbx1eYvCe', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-14 19:44:47', NULL, NULL),
('f11a1ca7-8e6d-11f0-8503-d8bbc1070448', 'teacher', NULL, 'Καθηγητής Δ. Δέλτα', 'd.delta@uni.gr', '$2y$10$.clNCfwbe15mTxvdu6BdLOg/W0VY3h6QzBHUz0ZCpGHAdN8sIUzIa', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-14 20:04:24', NULL, NULL),
('f11a1cfa-8e6d-11f0-8503-d8bbc1070448', 'teacher', NULL, 'Καθηγήτρια Ε. Έψιλον', 'e.epsilon@uni.gr', '$2y$10$F08oA9Bk3xwmhtpKULyVHOy5sEufmEI9fyRY08oVr1cV0PYr5kqbe', NULL, NULL, NULL, '2025-09-10 17:45:29', '2025-09-17 12:52:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Στημένη δομή για προβολή `vw_public_presentations`
-- (Δείτε παρακάτω για την πραγματική προβολή)
--
CREATE TABLE `vw_public_presentations` (
`when_dt` datetime
,`mode` enum('in_person','online')
,`room_or_link` varchar(255)
,`published_at` timestamp
,`thesis_id` char(36)
,`topic_title` varchar(255)
,`student_name` varchar(255)
,`supervisor_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Στημένη δομή για προβολή `vw_teacher_stats`
-- (Δείτε παρακάτω για την πραγματική προβολή)
--
CREATE TABLE `vw_teacher_stats` (
`teacher_id` char(36)
,`teacher_name` varchar(255)
,`count_supervised` decimal(23,0)
,`count_as_member` decimal(23,0)
,`avg_grade_related` decimal(13,10)
);

-- --------------------------------------------------------

--
-- Δομή για προβολή `vw_public_presentations`
--
DROP TABLE IF EXISTS `vw_public_presentations`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_public_presentations`  AS SELECT `p`.`when_dt` AS `when_dt`, `p`.`mode` AS `mode`, `p`.`room_or_link` AS `room_or_link`, `p`.`published_at` AS `published_at`, `t`.`id` AS `thesis_id`, `tp`.`title` AS `topic_title`, `stu`.`name` AS `student_name`, `sup`.`name` AS `supervisor_name` FROM ((((`presentation` `p` join `theses` `t` on(`t`.`id` = `p`.`thesis_id`)) join `topics` `tp` on(`tp`.`id` = `t`.`topic_id`)) join `users` `stu` on(`stu`.`id` = `t`.`student_id`)) join `users` `sup` on(`sup`.`id` = `t`.`supervisor_id`)) ;

-- --------------------------------------------------------

--
-- Δομή για προβολή `vw_teacher_stats`
--
DROP TABLE IF EXISTS `vw_teacher_stats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_teacher_stats`  AS WITH involvement AS (SELECT `t`.`supervisor_id` AS `teacher_id`, `t`.`id` AS `thesis_id`, 'supervisor' AS `role` FROM `theses` AS `t` WHERE `t`.`status` = 'completed' UNION ALL SELECT `pr`.`user_id` AS `teacher_id`, `cm`.`thesis_id` AS `thesis_id`, 'member' AS `role` FROM ((`committee_members` `cm` join `persons` `pr` on(`pr`.`id` = `cm`.`person_id`)) join `theses` `t` on(`t`.`id` = `cm`.`thesis_id`)) WHERE `t`.`status` = 'completed' AND `cm`.`role_in_committee` = 'member'), involvement_distinct AS (SELECT DISTINCT `involvement`.`teacher_id` AS `teacher_id`, `involvement`.`thesis_id` AS `thesis_id` FROM `involvement`), thesis_avg AS (SELECT `t`.`id` AS `thesis_id`, avg(`g`.`total`) AS `thesis_avg` FROM (`theses` `t` join `grades` `g` on(`g`.`thesis_id` = `t`.`id`)) WHERE `t`.`status` = 'completed' GROUP BY `t`.`id`), counts AS (SELECT `i`.`teacher_id` AS `teacher_id`, sum(`i`.`role` = 'supervisor') AS `count_supervised`, sum(`i`.`role` = 'member') AS `count_as_member` FROM `involvement` AS `i` GROUP BY `i`.`teacher_id`), avg_by_teacher AS (SELECT `id`.`teacher_id` AS `teacher_id`, avg(`ta`.`thesis_avg`) AS `avg_grade_related` FROM (`involvement_distinct` `id` join `thesis_avg` `ta` on(`ta`.`thesis_id` = `id`.`thesis_id`)) GROUP BY `id`.`teacher_id`) SELECT `te`.`id` AS `teacher_id`, `te`.`name` AS `teacher_name`, coalesce(`c`.`count_supervised`,0) AS `count_supervised`, coalesce(`c`.`count_as_member`,0) AS `count_as_member`, `abt`.`avg_grade_related` AS `avg_grade_related` FROM ((`users` `te` left join `counts` `c` on(`c`.`teacher_id` = `te`.`id`)) left join `avg_by_teacher` `abt` on(`abt`.`teacher_id` = `te`.`id`)) WHERE `te`.`role` = 'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher''teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher\'teacher'  ;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `committee_invitations`
--
ALTER TABLE `committee_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_invitation` (`thesis_id`,`person_id`),
  ADD KEY `fk_inv_person` (`person_id`),
  ADD KEY `idx_invitations_thesis_status` (`thesis_id`,`status`);

--
-- Ευρετήρια για πίνακα `committee_members`
--
ALTER TABLE `committee_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_member` (`thesis_id`,`person_id`),
  ADD KEY `idx_members_thesis_role` (`thesis_id`,`role_in_committee`),
  ADD KEY `idx_cm_person` (`person_id`,`thesis_id`);

--
-- Ευρετήρια για πίνακα `events_log`
--
ALTER TABLE `events_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ev_actor` (`actor_id`),
  ADD KEY `idx_events_thesis_created` (`thesis_id`,`created_at`);

--
-- Ευρετήρια για πίνακα `exam_minutes`
--
ALTER TABLE `exam_minutes`
  ADD PRIMARY KEY (`thesis_id`);

--
-- Ευρετήρια για πίνακα `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_grade` (`thesis_id`,`person_id`),
  ADD UNIQUE KEY `uq_thesis_person` (`thesis_id`,`person_id`),
  ADD UNIQUE KEY `uniq_thesis_person` (`thesis_id`,`person_id`),
  ADD UNIQUE KEY `uq_grades_thesis_person` (`thesis_id`,`person_id`),
  ADD KEY `fk_grades_person` (`person_id`),
  ADD KEY `fk_grades_rubric` (`rubric_id`),
  ADD KEY `idx_grades_thesis` (`thesis_id`);

--
-- Ευρετήρια για πίνακα `grades_windows`
--
ALTER TABLE `grades_windows`
  ADD PRIMARY KEY (`thesis_id`);

--
-- Ευρετήρια για πίνακα `grading_rubrics`
--
ALTER TABLE `grading_rubrics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Ευρετήρια για πίνακα `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notes_thesis` (`thesis_id`),
  ADD KEY `fk_notes_author` (`author_id`);

--
-- Ευρετήρια για πίνακα `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_person_email` (`email`),
  ADD UNIQUE KEY `uq_person_user` (`user_id`);

--
-- Ευρετήρια για πίνακα `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`key_name`);

--
-- Ευρετήρια για πίνακα `presentation`
--
ALTER TABLE `presentation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `thesis_id` (`thesis_id`),
  ADD KEY `idx_presentation_when` (`when_dt`);

--
-- Ευρετήρια για πίνακα `presentations`
--
ALTER TABLE `presentations`
  ADD PRIMARY KEY (`thesis_id`),
  ADD UNIQUE KEY `uniq_thesis` (`thesis_id`);

--
-- Ευρετήρια για πίνακα `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_resources_thesis` (`thesis_id`);

--
-- Ευρετήρια για πίνακα `student_eligibility_snapshot`
--
ALTER TABLE `student_eligibility_snapshot`
  ADD PRIMARY KEY (`thesis_id`),
  ADD KEY `fk_elig_student` (`student_id`);

--
-- Ευρετήρια για πίνακα `theses`
--
ALTER TABLE `theses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student_topic` (`student_id`,`topic_id`),
  ADD KEY `fk_theses_topic` (`topic_id`),
  ADD KEY `fk_theses_supervisor` (`supervisor_id`),
  ADD KEY `idx_theses_status_supervisor` (`status`,`supervisor_id`),
  ADD KEY `idx_theses_grading_enabled_at` (`grading_enabled_at`);

--
-- Ευρετήρια για πίνακα `thesis_notes`
--
ALTER TABLE `thesis_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notes_thesis` (`thesis_id`,`author_id`,`created_at`);

--
-- Ευρετήρια για πίνακα `thesis_resources`
--
ALTER TABLE `thesis_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_res_thesis_type` (`thesis_id`,`type`,`uploaded_at`);

--
-- Ευρετήρια για πίνακα `thesis_timeline`
--
ALTER TABLE `thesis_timeline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_timeline_thesis_created` (`thesis_id`,`created_at`);

--
-- Ευρετήρια για πίνακα `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_topics_supervisor` (`supervisor_id`),
  ADD KEY `idx_topics_prof_avail` (`professor_id`,`is_available`),
  ADD KEY `idx_topics_prov_student` (`provisional_student_id`),
  ADD KEY `fk_topics_student` (`assigned_student_id`);

--
-- Ευρετήρια για πίνακα `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `uq_student_number_role` (`student_number`,`role`);

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `committee_invitations`
--
ALTER TABLE `committee_invitations`
  ADD CONSTRAINT `fk_inv_person` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  ADD CONSTRAINT `fk_inv_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `committee_members`
--
ALTER TABLE `committee_members`
  ADD CONSTRAINT `fk_mem_person` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  ADD CONSTRAINT `fk_mem_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `events_log`
--
ALTER TABLE `events_log`
  ADD CONSTRAINT `fk_ev_actor` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_ev_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `exam_minutes`
--
ALTER TABLE `exam_minutes`
  ADD CONSTRAINT `fk_minutes_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `fk_grades_person` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  ADD CONSTRAINT `fk_grades_rubric` FOREIGN KEY (`rubric_id`) REFERENCES `grading_rubrics` (`id`),
  ADD CONSTRAINT `fk_grades_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `fk_notes_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_notes_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `fk_person_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Περιορισμοί για πίνακα `presentation`
--
ALTER TABLE `presentation`
  ADD CONSTRAINT `fk_presentation_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `presentations`
--
ALTER TABLE `presentations`
  ADD CONSTRAINT `fk_pres_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `fk_resources_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `student_eligibility_snapshot`
--
ALTER TABLE `student_eligibility_snapshot`
  ADD CONSTRAINT `fk_elig_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_elig_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`);

--
-- Περιορισμοί για πίνακα `theses`
--
ALTER TABLE `theses`
  ADD CONSTRAINT `fk_theses_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_theses_supervisor` FOREIGN KEY (`supervisor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_theses_topic` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`);

--
-- Περιορισμοί για πίνακα `thesis_timeline`
--
ALTER TABLE `thesis_timeline`
  ADD CONSTRAINT `fk_timeline_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `theses` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `fk_topics_provisional_student` FOREIGN KEY (`provisional_student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_topics_student` FOREIGN KEY (`assigned_student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_topics_supervisor` FOREIGN KEY (`supervisor_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
