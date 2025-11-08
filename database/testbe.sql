-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2025 at 02:48 PM
-- Server version: 8.0.30
-- PHP Version: 8.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testbe`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hpps`
--

CREATE TABLE `hpps` (
  `id` bigint UNSIGNED NOT NULL,
  `description` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `qty` double NOT NULL,
  `cost` double NOT NULL,
  `price` double NOT NULL,
  `total_cost` double NOT NULL,
  `qty_balance` double NOT NULL,
  `value_balance` double NOT NULL,
  `hpp` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hpps`
--

INSERT INTO `hpps` (`id`, `description`, `date`, `qty`, `cost`, `price`, `total_cost`, `qty_balance`, `value_balance`, `hpp`, `created_at`, `updated_at`) VALUES
(1, 'Pembelian', '2021-01-01', 40, 100, 100, 4000, 40, 4000, 100, '2020-12-31 17:00:00', NULL),
(2, 'Penjualan', '2021-01-01', -20, 100, 200, -2000, 20, 2000, 100, '2020-12-31 17:00:00', NULL),
(3, 'Penjualan', '2021-01-02', -10, 100, 200, -1000, 10, 1000, 100, '2021-01-01 17:00:00', NULL),
(4, 'Pembelian', '2021-01-03', 20, 120, 120, 2400, 30, 3400, 113.3333, '2021-01-02 17:00:00', NULL),
(5, 'Pembelian', '2021-01-03', 10, 110, 110, 1100, 40, 4500, 112.5, '2021-01-03 17:00:00', NULL),
(6, 'Penjualan', '2021-01-04', -5, 112.5, 200, -562.5, 35, 3937.5, 112.5, '2021-01-03 17:00:00', NULL),
(7, 'Penjualan', '2021-01-05', -8, 112.5, 200, -900, 27, 3037.5, 112.5, '2021-01-04 17:00:00', NULL),
(8, 'Pembelian', '2021-01-06', 15, 115, 115, 1725, 42, 4762.5, 113.3929, '2021-01-05 17:00:00', NULL),
(9, 'Penjualan', '2021-01-07', -20, 113.3929, 200, -2267.86, 22, 2494.643, 113.3929, '2021-01-06 17:00:00', NULL),
(10, 'Penjualan', '2021-01-07', -15, 113.3929, 200, -1700.89, 7, 793.75, 113.3929, '2021-01-06 17:00:00', NULL),
(11, 'Pembelian', '2021-01-08', 10, 110, 110, 1100, 17, 1893.75, 111.3971, '2021-01-07 17:00:00', NULL),
(12, 'Penjualan', '2021-01-09', -5, 111.3971, 210, -556.985, 12, 1336.765, 111.3971, '2021-01-08 17:00:00', NULL),
(13, 'Penjualan', '2021-01-10', -6, 111.3971, 210, -668.382, 6, 668.3824, 111.3971, '2021-01-09 17:00:00', NULL),
(14, 'Pembelian', '2021-01-11', 4, 125, 125, 500, 10, 1168.382, 116.8382, '2021-01-10 17:00:00', NULL),
(15, 'Penjualan', '2021-01-12', -5, 116.8382, 210, -584.191, 5, 584.1912, 116.8382, '2021-01-11 17:00:00', NULL),
(46, 'Penjualan', '2025-11-01', -3, 116.8382, 100, -350.5146, 2, 233.6764, 116.8382, '2025-11-08 07:34:45', '2025-11-08 07:34:45'),
(47, 'Penjualan', '2025-11-01', -1, 116.8382, 100, -116.8382, 1, 116.8382, 116.8382, '2025-11-08 07:35:19', '2025-11-08 07:35:19'),
(50, 'Pembelian', '2025-11-08', 10, 100, 100, 1000, 11, 1116.8382, 101.53074545455, '2025-11-08 07:40:09', '2025-11-08 07:43:21'),
(51, 'Penjualan', '2025-11-08', -10, 101.53074545455, 120, -1015.3074545455, 1, 101.53074545455, 101.53074545455, '2025-11-08 07:40:26', '2025-11-08 07:43:53'),
(52, 'Pembelian', '2025-11-01', 30, 100, 100, 3000, 31, 3101.5307454546, 100.04937888563, '2025-11-08 07:40:38', '2025-11-08 07:43:53'),
(53, 'Pembelian', '2025-11-01', 30, 100, 100, 3000, 61, 6101.5307454546, 100.02509418778, '2025-11-08 07:41:02', '2025-11-08 07:43:53'),
(54, 'Penjualan', '2025-11-01', -60, 100.02509418778, 150, -6001.5056512668, 1, 100.02509418778, 100.02509418778, '2025-11-08 07:41:33', '2025-11-08 07:43:53'),
(55, 'Pembelian', '2025-11-01', 20, 100, 100, 2000, 21, 2100.0250941878, 100.00119496132, '2025-11-08 07:41:54', '2025-11-08 07:43:53');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '0001_01_01_000000_create_users_table', 1),
(6, '0001_01_01_000001_create_cache_table', 1),
(7, '0001_01_01_000002_create_jobs_table', 1),
(8, '2025_11_08_102229_create_hpps_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hpps`
--
ALTER TABLE `hpps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hpps`
--
ALTER TABLE `hpps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
