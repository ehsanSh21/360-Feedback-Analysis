-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2023 at 05:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `360 feedback degree`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `form_element_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `evaluated_user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `uuid`, `user_id`, `form_element_id`, `answer`, `evaluated_user_id`, `created_at`, `updated_at`) VALUES
(6, 'f22672be-4c44-418d-b529-287dfc8dd7a4', 15, 6, '2', NULL, '2023-09-28 06:32:15', '2023-09-28 06:32:15'),
(75, '587aeff1-ddef-4b7a-9dde-ddf65f2e143e', 4, 65, '5', 5, '2023-10-03 10:59:42', '2023-10-03 10:59:42'),
(66, '0b3cdc3c-651a-498d-86f4-f32d44026d10', 1, 66, '2', 2, '2023-09-28 07:47:10', '2023-10-01 12:24:42'),
(73, '9b00b7cb-c0b9-4e8b-b5fd-19b02387aa26', 3, 66, '5', 2, '2023-09-28 10:54:36', '2023-09-28 10:54:36'),
(71, '505565f0-3fb6-4e44-830e-d5318cf1f9ff', 3, 64, '3', 2, '2023-09-28 10:54:36', '2023-09-28 10:54:36'),
(65, '97bce62f-fd7f-42cd-ae17-aeae1e374f86', 3, 65, '1', 2, '2023-09-28 07:47:10', '2023-09-28 10:53:43'),
(72, '11a0319d-8c55-42f6-bf00-ce4f88c22984', 1, 65, '2', 2, '2023-09-28 10:54:36', '2023-10-01 12:23:55'),
(64, 'e8d0e50b-0784-4d47-8197-aeee6faa885f', 1, 64, '5', 2, '2023-09-28 07:47:10', '2023-10-01 12:23:55'),
(92, '7e9a8509-ccb6-4252-9453-5f208553e9b0', 1, 65, '5', 1, '2023-10-09 09:08:51', '2023-10-09 09:08:51'),
(93, '85dd8eb4-0aec-4cc7-b786-bc014bd0eea5', 1, 66, '1', 1, '2023-10-09 09:09:47', '2023-10-09 09:09:47'),
(114, '05844809-c5c8-41d7-b65f-2c981c90393d', 4, 64, '5', 5, '2023-10-16 11:51:46', '2023-10-16 11:51:46'),
(87, '1a18a14b-a7e4-4fb7-a63c-de7bf33c38b5', 1, 65, '3', 4, '2023-10-09 09:05:32', '2023-10-09 09:05:32'),
(88, 'fd4b9eaa-979a-440f-b893-4c3287959a28', 1, 66, '2', 4, '2023-10-09 09:05:58', '2023-10-09 09:05:58'),
(102, 'efcdeb9a-432f-41c7-97a6-881cac82da62', 4, 65, '2', 1, '2023-10-12 09:01:43', '2023-10-12 09:01:43'),
(103, 'ce23c4c1-5fe4-41ce-aff2-bfcdf4c9b7ec', 4, 66, '2', 1, '2023-10-12 09:01:52', '2023-10-12 09:01:52'),
(113, 'a4c02b13-645a-4ae0-8fd3-1f554492702b', 2, 64, '4', 1, '2023-10-14 11:07:21', '2023-10-14 11:07:21'),
(108, '9f2ce4a1-e3be-4772-a4e4-46ab72f933b1', 3, 64, '5', 1, '2023-10-14 10:29:28', '2023-10-14 10:29:28'),
(126, '88ac787e-595d-4f72-bea3-95ff948b95c0', 1, 290, '3', 10, '2023-10-24 11:20:29', '2023-10-24 11:54:26'),
(111, 'b7fe73e2-79b7-4a77-b156-d92a39afd652', 4, 64, '2', 1, '2023-10-14 10:33:48', '2023-10-14 10:33:48'),
(78, 'ca0b5dfc-30a3-4dbd-af85-16269a7f4188', 7, 65, '2', 5, '2023-10-03 11:00:34', '2023-10-03 11:00:34'),
(76, 'ef033abb-aab0-498d-a9fb-9e55c2db9639', 4, 66, '1', 5, '2023-10-03 10:59:57', '2023-10-03 10:59:57'),
(91, 'ed8994fa-6814-43e1-aa1d-9ae2ba07e264', 3, 66, '1', 4, '2023-10-09 09:07:24', '2023-10-09 09:07:24'),
(129, '17cf5657-a0fa-49d0-aad6-0ea201dbfac0', 1, 291, '3', 10, '2023-10-24 11:51:22', '2023-10-24 11:54:26'),
(96, '2c5fce41-8ccb-4a75-b281-20d852d24b20', 3, 65, '5', 1, '2023-10-10 08:04:34', '2023-10-10 08:04:34'),
(94, '739def07-c2bb-407f-9344-c7f2d20d7fda', 1, 64, '1', 1, '2023-10-09 09:10:51', '2023-10-09 09:10:51'),
(130, 'ec8b9cdf-fc61-4ff5-a111-fba8db77afe1', 1, 292, '3', 10, '2023-10-24 11:51:22', '2023-10-24 11:54:26'),
(97, '0cadad5d-a6d0-4038-bd00-1cbf033c88c1', 3, 66, '1', 1, '2023-10-10 08:04:43', '2023-10-10 08:04:43'),
(99, '87b70814-4c1e-48a0-bcd0-51e1b0845f1f', 2, 65, '3', 1, '2023-10-12 06:08:33', '2023-10-12 06:08:33'),
(100, '2c281a9b-d17f-41b2-8bf4-d80b0b63e0b6', 2, 66, '2', 1, '2023-10-12 06:08:48', '2023-10-12 06:08:48'),
(89, '2c2048a7-5ec7-435b-8cd3-3ab5d98656dd', 3, 64, '2', 4, '2023-10-09 09:06:42', '2023-10-09 09:06:42'),
(79, '30013482-313a-48de-b1af-74d5a6216c3b', 7, 66, '5', 5, '2023-10-03 11:00:50', '2023-10-03 11:00:50'),
(86, 'eb302e1d-9651-4a89-b71a-55864829f4c8', 1, 64, '5', 4, '2023-10-09 09:05:01', '2023-10-09 09:05:01'),
(90, '5b0234f0-ef08-4f7c-b6a2-c5842f637b6c', 3, 65, '3', 4, '2023-10-09 09:07:02', '2023-10-09 09:07:02'),
(96, '2c5fce41-8ccb-4a75-b281-20d852d24b20', 3, 65, '5', 1, '2023-10-10 08:04:34', '2023-10-10 08:04:34'),
(94, '739def07-c2bb-407f-9344-c7f2d20d7fda', 1, 64, '1', 1, '2023-10-09 09:10:51', '2023-10-09 09:10:51'),
(130, 'ec8b9cdf-fc61-4ff5-a111-fba8db77afe1', 1, 292, '3', 10, '2023-10-24 11:51:22', '2023-10-24 11:54:26'),
(97, '0cadad5d-a6d0-4038-bd00-1cbf033c88c1', 3, 66, '1', 1, '2023-10-10 08:04:43', '2023-10-10 08:04:43'),
(99, '87b70814-4c1e-48a0-bcd0-51e1b0845f1f', 2, 65, '3', 1, '2023-10-12 06:08:33', '2023-10-12 06:08:33'),
(100, '2c281a9b-d17f-41b2-8bf4-d80b0b63e0b6', 2, 66, '2', 1, '2023-10-12 06:08:48', '2023-10-12 06:08:48'),
(89, '2c2048a7-5ec7-435b-8cd3-3ab5d98656dd', 3, 64, '2', 4, '2023-10-09 09:06:42', '2023-10-09 09:06:42'),
(79, '30013482-313a-48de-b1af-74d5a6216c3b', 7, 66, '5', 5, '2023-10-03 11:00:50', '2023-10-03 11:00:50'),
(86, 'eb302e1d-9651-4a89-b71a-55864829f4c8', 1, 64, '5', 4, '2023-10-09 09:05:01', '2023-10-09 09:05:01'),
(90, '5b0234f0-ef08-4f7c-b6a2-c5842f637b6c', 3, 65, '3', 4, '2023-10-09 09:07:02', '2023-10-09 09:07:02');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` int(11) NOT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `uuid`, `type`, `course_id`, `user_id`, `created_at`, `updated_at`) VALUES
(12, '0b59cb43-2496-45cb-9b66-b5ce62be3fc1', 'assessment', NULL, 1, '2023-09-28 06:37:06', '2023-09-28 06:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `form_elements`
--

CREATE TABLE `form_elements` (
  `id` int(11) NOT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_elements`
--

INSERT INTO `form_elements` (`id`, `uuid`, `form_id`, `group_id`, `type`, `ordering`, `created_at`, `updated_at`) VALUES
(64, '46e8b340-50c9-4a6e-9832-e9081bdcd44d', 12, 23, 'radio', 3, '2023-09-28 06:37:06', '2023-09-28 06:37:06'),
(65, 'de9f7e22-6798-4755-b21c-7d81eba36664', 12, 23, 'radio', 2, '2023-09-28 06:37:06', '2023-09-28 06:37:06'),
(66, '3c27bc08-d810-406b-90f7-f5133c9425bf', 12, 24, 'radio', 3, '2023-09-28 06:37:06', '2023-09-28 06:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `form_groups`
--

CREATE TABLE `form_groups` (
  `id` int(11) NOT NULL,
  `form_id` int(11) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_groups`
--

INSERT INTO `form_groups` (`id`, `form_id`, `data`, `created_at`, `updated_at`) VALUES
(23, 12, '{\"column\":\"4\"}', '2023-09-28 06:37:06', '2023-09-28 06:37:06'),
(24, 12, '{\"column\":\"6\"}', '2023-09-28 06:37:06', '2023-09-28 06:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `memberable_type` varchar(255) DEFAULT NULL,
  `memberable_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `memberable_type`, `memberable_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'AppModelsDepartment', 2, 5, '2023-10-26 07:45:45', '2023-10-26 07:45:45', '2023-10-26 07:45:45'),
(4, 'AppModelsDepartment', 1, 1, '2023-10-26 07:45:45', '2023-10-26 07:45:45', '2023-10-26 07:45:45'),
(5, 'AppModelsDepartment', 2, 3, '2023-10-26 07:45:45', '2023-10-26 07:45:45', '2023-10-26 07:45:45'),
(6, 'AppModelsDepartment', 2, 4, '2023-10-26 07:45:45', '2023-10-26 07:45:45', '2023-10-26 07:45:45'),
(7, 'AppModelsDepartment', 1, 2, '2023-10-26 07:45:45', '2023-10-26 07:45:45', '2023-10-26 07:45:45'),
(8, 'AppModelsDepartment', 2, 10, '2023-10-26 07:45:45', '2023-10-26 07:45:45', '2023-10-26 07:45:45'),
(10, 'AppModelsDepartment', 3, 13, '2023-10-26 07:45:45', '2023-10-26 07:45:45', '2023-10-26 07:45:45'),
(12, 'AppModelsDepartment', 3, 14, '2023-10-26 07:45:45', '2023-10-26 07:45:45', '2023-10-26 07:45:45'),
(13, 'AppModelsDepartment', 1, 17, '2023-10-26 07:45:45', '2023-10-26 07:45:45', '2023-10-26 07:45:45'),
(14, 'AppModelsDepartment', 1, 18, '2023-10-26 07:45:45', '2023-10-26 07:45:45', '2023-10-26 07:45:45'),
(15, 'AppModelsDepartment', 1, 19, '2023-10-26 07:45:45', '2023-10-26 07:45:45', '2023-10-26 07:45:45');

-- --------------------------------------------------------

--
-- Table structure for table `metas`
--

CREATE TABLE `metas` (
  `id` int(11) NOT NULL,
  `relatable_type` varchar(255) DEFAULT NULL,
  `relatable_id` int(11) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `is_json` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `metas`
--

INSERT INTO `metas` (`id`, `relatable_type`, `relatable_id`, `key`, `value`, `is_json`) VALUES
(335, 'AppModelsFormElement', 64, 'ratio', '4', 'f'),
(336, 'AppModelsFormElement', 65, 'ratio', '2', 'f'),
(337, 'AppModelsFormElement', 66, 'ratio', '2', 'f'),
(625, 'AppModelsFormGroup', 23, 'ratio', '6', 'f'),
(626, 'AppModelsFormGroup', 24, 'ratio', '2', 'f'),
(748, 'AppModelsFormElement', 64, 'reverse_grading', 'true', 'f');

-- --------------------------------------------------------

--
-- Table structure for table `relationships`
--

CREATE TABLE `relationships` (
  `id` int(11) NOT NULL,
  `from_type` varchar(255) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_type` varchar(255) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `relationships`
--

INSERT INTO `relationships` (`id`, `from_type`, `from_id`, `to_type`, `to_id`) VALUES
(5, 'AppModelsForm', 12, 'AppModelsDepartment', 1),
(6, 'AppModelsForm', 12, 'AppModelsDepartment', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_prefix` varchar(10) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `mobile_verified_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `block` char(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile_prefix`, `mobile`, `email_verified_at`, `mobile_verified_at`, `remember_token`, `uuid`, `created_at`, `updated_at`, `deleted_at`, `block`, `type`) VALUES
(1, 'John Doe', 'johndoe@example.com', '+1', '5551234567', '2023-10-25 08:00:00', '2023-10-25 08:00:00', 'AbCdEfG123', 'abcdefg-1234-5678-90ab-cdef12345678', '2023-10-25 08:00:00', '2023-10-25 08:00:00', NULL, 'f', 'natural'),
(2, 'Jane Smith', 'janesmith@example.com', '+1', '5559876543', '2023-10-25 09:00:00', '2023-10-25 09:00:00', 'HgIjKlM456', 'hijklm-4567-8901-23cd-efgh45678901', '2023-10-25 09:00:00', '2023-10-25 09:00:00', NULL, 'f', 'natural'),
(3, 'David Johnson', 'davidjohnson@example.com', '+1', '5554567890', '2023-10-25 10:00:00', '2023-10-25 10:00:00', 'MnOpQrS789', 'mnopqr-7890-1234-56ef-ghij78901234', '2023-10-25 10:00:00', '2023-10-25 10:00:00', NULL, 'f', 'natural'),
(4, 'Emily Davis', 'emilydavis@example.com', '+1', '5552345678', '2023-10-25 11:00:00', '2023-10-25 11:00:00', 'TuVwXyZ012', 'tuvwxy-0123-4567-89ab-cdef01234567', '2023-10-25 11:00:00', '2023-10-25 11:00:00', NULL, 'f', 'natural'),
(5, 'Michael Wilson', 'michaelwilson@example.com', '+1', '5558765432', '2023-10-25 12:00:00', '2023-10-25 12:00:00', 'AbCdEfG123', 'abcdefg-1234-5678-90ab-cdef12345678', '2023-10-25 12:00:00', '2023-10-25 12:00:00', NULL, 'f', 'natural'),
(6, 'Olivia Martinez', 'oliviamartinez@example.com', '+1', '5556789012', '2023-10-25 13:00:00', '2023-10-25 13:00:00', 'HgIjKlM456', 'hijklm-4567-8901-23cd-efgh45678901', '2023-10-25 13:00:00', '2023-10-25 13:00:00', NULL, 'f', 'natural'),
(7, 'Christopher Anderson', 'christopheranderson@example.com', '+1', '5553456789', '2023-10-25 14:00:00', '2023-10-25 14:00:00', 'MnOpQrS789', 'mnopqr-7890-1234-56ef-ghij78901234', '2023-10-25 14:00:00', '2023-10-25 14:00:00', NULL, 'f', 'natural');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `form_elements`
--
ALTER TABLE `form_elements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `form_groups`
--
ALTER TABLE `form_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`memberable_type`,`memberable_id`,`user_id`,`deleted_at`,`created_at`,`updated_at`),
  ADD KEY `id_2` (`id`,`memberable_type`,`memberable_id`,`user_id`,`deleted_at`,`created_at`,`updated_at`);

--
-- Indexes for table `metas`
--
ALTER TABLE `metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relationships`
--
ALTER TABLE `relationships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
