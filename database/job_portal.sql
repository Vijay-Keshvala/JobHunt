-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 11, 2026 at 02:56 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4
SET SESSION sql_require_primary_key = 0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Accountant', 1, '2024-05-24 00:00:55', '2024-05-24 00:00:55'),
(2, 'construction & Engineering', 1, '2024-05-24 00:00:55', '2024-05-24 00:00:55'),
(3, 'IT Computers', 1, '2024-05-24 00:00:55', '2024-05-24 00:00:55'),
(4, 'Social Media', 1, '2024-05-24 00:00:55', '2024-05-24 00:00:55'),
(5, 'Telicommunucation', 1, '2024-05-24 00:00:55', '2024-05-24 00:00:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `job_type_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `vacancy` int(11) NOT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `benefits` text DEFAULT NULL,
  `responsibility` text DEFAULT NULL,
  `qualification` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `experience` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_location` varchar(255) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `isFeatured` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `category_id`, `job_type_id`, `user_id`, `vacancy`, `salary`, `location`, `description`, `benefits`, `responsibility`, `qualification`, `keywords`, `experience`, `company_name`, `company_location`, `company_website`, `status`, `isFeatured`, `created_at`, `updated_at`) VALUES
(8, 'dfbeuf e fe f', 3, 4, 1, 11, '80908008', 'djbudvbe', 'bidbidbvidb', 'bibfidbvdivbidbvivi', 'ibdvbdivbidbvi', NULL, 'djbvjdvbivb', '6', 'jdfbfbefhi', 'bbfubbv', 'bfjdbeb', 1, 1, '2024-05-25 06:16:44', '2024-05-25 06:16:44'),
(9, 'vndvbivbvubv', 5, 1, 1, 111, '808297286', 'ffiefefuvev', 'bebbbvebfebfebf', 'ubeuifbeifbebfehb', 'bibfieubfebfeubf', NULL, 'fbdfbbibiebvb', '1', 'ibidbfejbfehfe', 'bubfefbeubueb', 'bebfuiebfeubf', 1, 0, '2024-05-25 06:17:13', '2024-05-25 06:17:13'),
(10, 'dfbdubfevb`', 1, 3, 1, 111, '9090909', 'niiuvgvyvyt', 'ccvgycyc', 'yvctcycgycgc', 'gycgcgvuvuh', NULL, 'hvhvhbhubyub', '1', 'hbhbhv', 'hgydfuvuf', 'uvuyvybinb', 1, 1, '2024-05-25 06:17:46', '2024-05-25 06:17:46'),
(11, 'jbd div hd ivb', 4, 1, 1, 23, '7767564', 'kbbibhh hv', 'huvtydgycytdiuhig', 'ufcufuhvuycvucuv', 'jvhuuuvbg', NULL, 'jbiyy huvuyfyuv', '1', 'hkbhvhv huvyibu', 'ibihvivydrsh', 'vhvhiviihiuguyb', 1, 1, '2024-05-25 06:18:24', '2024-05-25 06:18:24'),
(13, 'bubefbef', 4, 4, 1, 11, 'fnefeifeub', 'biefbebfef', 'ibbvvbjbuvvhv', 'riburiburfbue', 'buefbeufbeufb', NULL, 'beibfuefbe', '10_plus', 'eifbeibfefevf', 'ebfiebfef', 'efbefbefvef', 1, 0, '2024-05-25 06:19:23', '2024-05-25 06:19:23'),
(14, 'feofiebfiebf', 3, 3, 1, 1, 'bfibfeifv1eb', 'bdbvdvv', 'bdbdbbvyv', 'uuefbubeuuv', 'dvbdibvb', NULL, 'ibbrfbbrfb', '7', 'buebvebeub', 'beuibeube', 'iefbebfeufe', 1, 0, '2024-05-25 06:19:58', '2024-05-25 06:19:58'),
(15, 'vdvbvubv', 3, 3, 1, 112, 'fbhbhc bci', 'ibfdbbhebf', 'ifbefbefbefevf', 'ifbefbebfefb', 'iefbeifbeufbeu', NULL, 'djbefbefbefbbe', '10', 'eifbebfebfeb', 'ifbebfefbeb', 'eifbebfeibfef', 1, 1, '2024-05-25 06:20:30', '2024-05-25 06:20:30'),
(17, 'jbfejfbueffv', 4, 2, 1, 9797, 'adadadadad', 'bharuch', 'ebefbeu8bfe8bfe8vf', 'uefeu8beube8v', 'kbcubebvbv', 'cbehicbeicbiebc', 'dcbhdcucvv', '1', 'cbeufbeieef', 'cbe8ded', 'cjciebcec', 1, 0, '2024-05-25 07:09:05', '2024-05-25 07:09:05'),
(18, 'Senior Developer', 3, 1, 1, 12, '10 lakhs', 'Mumbai', 'Full stack senior developer in MERN stack', 'High paying work life balance.', 'Team lead of Full stack development team', NULL, 'High Paying Money Work Life Balance', '10_plus', 'Thor solution', 'Mumbai', 'https://www.apple.com/in/', 1, 0, '2024-05-25 11:09:01', '2024-06-03 01:20:11'),
(19, 'IOS developer', 3, 4, 1, 21, '10,000', 'Ahmedabad', 'IOS developer required for building ios applications', 'high salary remote work wFm', 'Team lead', 'Mtech from any collage', 'ios, apple, development', '6', 'ios developers', 'Ahmedabad', 'https://www.apple.com/in/', 1, 0, '2024-05-27 01:26:42', '2024-05-27 01:26:42'),
(21, 'Chartered Accountant', 1, 5, 1, 1, '20,000', 'Bharuch', 'Argent required an CA for construction company for handling and managing all the paper work, managing bank transaction, filing TDR, generating bills and all the work related to Accountant.', 'High paying, Office work, 5 days working.', 'Should be able to manage all the bank accounts of costumer as well as partners of the company, able to file ITR, make all bills related to work, prepare document for land ownership (Stamp Paper) for transferring ownership to individual who purchases the property.', NULL, 'CA, Accountant, Office work, High paying', '5', 'Mahirth Devlopers', 'Chavaj Bharuch', 'www.mahirthdevelopers.com', 1, 0, '2024-05-28 09:19:19', '2024-05-30 23:56:08'),
(23, 'laravel developer', 3, 3, 2, 12, '50,000', 'Bharuch', '<p>laravel developer needed urgently for backend purpose</p>', '<p>high paying salary</p>', '<p>manage entire backend team</p>', '<p>btech from any collage</p>', 'laravel, backend, high salary', '5', 'bsolution', 'bharuch', 'www.apple.com', 1, 0, '2024-05-31 01:38:29', '2024-05-31 01:38:29'),
(24, 'we developeer', 3, 1, 1, 12, '9000', 'bharuch', '<p>web developer</p>', '<p>bhjjbbbbbb</p>', '<p>dddddddd</p>', '<p>dddddddddd</p>', 'high paying remote', '8', 'adadbaudvad', NULL, NULL, 1, 0, '2024-06-03 01:43:27', '2024-06-03 01:43:27'),
(25, 'MERN Stack developer', 3, 2, 2, 20, '30', 'Ahmedabad', '<p>Need mern stack developer for developing website for construction company using MERN stack</p>', '<p>High paying job&nbsp;</p>', '<p>Develop full website using MERN stack and manage entire website after hosting</p>', NULL, 'Node js, backend, database, server MERN', '2', 'WEB developer', 'Ahmedabad', 'www.apple.com', 1, 0, '2024-08-09 23:06:51', '2024-11-16 04:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `employer_id` bigint(20) UNSIGNED NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `job_id`, `user_id`, `employer_id`, `applied_at`, `created_at`, `updated_at`) VALUES
(13, 24, 2, 1, '2024-06-03 01:44:55', '2024-06-03 01:44:55', '2024-06-03 01:44:55'),
(14, 15, 2, 1, '2024-06-03 01:51:17', '2024-06-03 01:51:17', '2024-06-03 01:51:17'),
(15, 21, 2, 1, '2024-06-14 05:39:38', '2024-06-14 05:39:38', '2024-06-14 05:39:38'),
(17, 23, 1, 2, '2024-07-05 02:08:01', '2024-07-05 02:08:01', '2024-07-05 02:08:01'),
(18, 25, 1, 2, '2024-08-10 00:42:50', '2024-08-10 00:42:50', '2024-08-10 00:42:50');

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_types`
--

CREATE TABLE `job_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_types`
--

INSERT INTO `job_types` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Full Time', 1, '2024-05-24 00:00:55', '2024-05-24 00:00:55'),
(2, 'Part Time', 1, '2024-05-24 00:00:55', '2024-05-24 00:00:55'),
(3, 'Freelance', 1, '2024-05-24 00:00:55', '2024-05-24 00:00:55'),
(4, 'Remote', 1, '2024-05-24 00:00:55', '2024-05-24 00:00:55'),
(5, 'Contract', 1, '2024-05-24 00:00:55', '2024-05-24 00:00:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_24_050049_create_categories_table', 2),
(5, '2024_05_24_050103_create_job_types_table', 2),
(6, '2024_05_24_052139_create_job_table', 3),
(7, '2024_05_24_065947_alter_job_table', 4),
(8, '2024_05_25_110755_alter_jobs_table', 5),
(9, '2024_05_28_072224_create_job_applications_table', 6),
(10, '2024_05_28_133853_create_job_applications_table', 7),
(11, '2024_05_29_051030_create_saved_jobs_table', 8),
(12, '2024_05_30_052222_alter_users_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('v@gmail.com', 'WlZZKAlIKuiiqvKZv0SMYxRFOvEjme1E73NkZp3ULLbk7hDUnFoq1ic5QzoY', '2024-10-16 02:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `saved_jobs`
--

CREATE TABLE `saved_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saved_jobs`
--

INSERT INTO `saved_jobs` (`id`, `job_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 24, 2, '2024-06-03 01:45:58', '2024-06-03 01:45:58'),
(6, 18, 1, '2024-06-14 05:10:46', '2024-06-14 05:10:46'),
(8, 21, 1, '2024-10-16 02:13:35', '2024-10-16 02:13:35');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('pZour5TGo6lvFtgiqWOq2GegZBjNFTuxPNA5fyuD', 2, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaHdDRWZIZDZtZ0F1eEYxWkxXOXpuV0dqVk5lZ2JDNFBhWEVnbXlWNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hY2NvdW50L2NyZWF0ZS1qb2IiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1731751170),
('SwtwlQ54NjTmb5vvoHE32XN4bKy2PXQrE07AEcvd', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoic1BRdU9paFl6UVpFTVlPT0UybkFUdkJTZ2RyWkV0TklzZGRTaFkyViI7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1778500624);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `designation`, `mobile`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'THOR 1118', 'v@gmail.com', NULL, '$2y$12$KltIJ8O3K86gRcNUEv.hz.fj8y.J4i8bR0Nsez9dj7oEBEgH/p7se', '1-1716537371.jpeg', 'Full Stack Web Developer', '1234546767', 'admin', NULL, '2024-05-21 00:00:15', '2024-08-09 23:03:52'),
(2, 'Kashyap keshvala', 'kashyap@gmail.com', NULL, '$2y$12$C7aj4.DuYiFlO3E33co6d.psB2Wxjx0CeMMR8/XPX6t93bCuKwbbe', '2-1718363357.jpeg', 'CEO', '9876545678', 'user', NULL, '2024-05-28 08:49:44', '2024-06-14 05:39:17'),
(4, 'ajay', 'ajay@gmail.com', NULL, '$2y$12$T8i6EI8UoWmP0xeC1eO0cuKgdAGB8FA5UKRcqPwYTePB84Gfca/IO', NULL, NULL, NULL, 'user', NULL, '2024-10-16 23:11:54', '2024-10-16 23:11:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_category_id_foreign` (`category_id`),
  ADD KEY `job_job_type_id_foreign` (`job_type_id`),
  ADD KEY `jobs_user_id_foreign` (`user_id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_applications_job_id_foreign` (`job_id`),
  ADD KEY `job_applications_user_id_foreign` (`user_id`),
  ADD KEY `job_applications_employer_id_foreign` (`employer_id`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_types`
--
ALTER TABLE `job_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saved_jobs_job_id_foreign` (`job_id`),
  ADD KEY `saved_jobs_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `job_types`
--
ALTER TABLE `job_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `job_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_job_type_id_foreign` FOREIGN KEY (`job_type_id`) REFERENCES `job_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `job_applications_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_applications_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  ADD CONSTRAINT `saved_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_jobs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
