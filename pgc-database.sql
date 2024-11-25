-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2024 at 04:20 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pgc`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `emp_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`emp_id`, `first_name`, `last_name`, `age`, `address`, `email`, `username`, `password`, `profile`, `created_at`, `updated_at`) VALUES
(1, 'Bins', 'Dayapan', 21, 'Upper Cantil-e Negros Oriental', 'bins@gmail.com', 'bins23', '1234', 'WIN_20230523_11_22_08_Pro.jpg', '2023-12-12 22:32:58', '2023-12-12 22:36:37'),
(2, 'nhoriel', 'balenzua', 21, 'San Roque San Jose Negros Oriental', 'nh', 'nh21', '1234', 'default.jpg', '2023-12-12 23:56:50', '2023-12-12 23:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `first_name`, `last_name`, `age`, `address`, `username`, `password`, `profile`, `created_at`, `updated_at`) VALUES
(1, 'symone', 'cariaso', 23, 'Dumaguete City Negros Oriental', 'sy23', '123', 'WIN_20230523_11_22_08_Pro.jpg', '2023-12-12 22:26:12', '2023-12-13 01:17:18');

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
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `name`, `description`, `price`, `quantity`, `categorie`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Stray', 'Cat adventure game', 2500.00, 23, 'games', '6b2666486783c116875c4ace6e839c3b.jpg', '2023-12-12 22:26:52', '2023-12-12 22:26:52'),
(2, 'Need 4 Speed', 'Car Racing Game', 1500.00, 2, 'games', '2d4d613b5657bb9875054d3583843e3e.jpg', '2023-12-12 22:27:35', '2023-12-13 04:34:45'),
(3, 'Horizon', 'Adventure Game', 5000.00, 2, 'games', '468cc067b4294807eb09fe3b74d235d3.jpg', '2023-12-12 22:28:03', '2023-12-12 22:28:03'),
(4, 'PS5', 'Digital Version', 10000.00, -2, 'console', 'cd43672a63f6356bd4199d4ae6d1d480.jpg', '2023-12-12 22:28:46', '2023-12-13 04:34:45'),
(5, 'PS5', 'VR version', 15000.00, 15, 'console', '51qcJKGmDXL-removebg-preview.png', '2023-12-12 22:29:24', '2023-12-13 04:06:43'),
(6, 'PS4', 'Digital Version', 5000.00, 30, 'console', '7c1376abff084025a582cf853c44621a.jpg', '2023-12-12 22:29:53', '2023-12-12 22:29:53'),
(7, 'Bag', 'Bag Bag', 250.00, 25, 'accessories', '059adfdd1316ee6e062045b8043bd6a5.jpg', '2023-12-12 22:30:25', '2023-12-12 22:30:25'),
(8, 'Headphone Stand', 'Headphone Stand', 560.00, 0, 'accessories', '448ddb048f44dc6418dd1fbffed1cb9e.jpg', '2023-12-12 22:30:57', '2023-12-13 02:38:41'),
(9, 'Headphone', 'Headphones asfaf dsadfgsdgfagdg dfgafdgdf gdfgdsfhgdf hfhfdhs fgdfshsdfh dfhdfhsdfhsdfhdf fhfdhdafhf', 790.00, 51, 'accessories', 'd48890f53f7fcffea94d4844c5828947.jpg', '2023-12-12 22:31:36', '2023-12-13 04:34:45');

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
(10, '2014_10_12_000000_create_users_table', 1),
(11, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(12, '2019_08_19_000000_create_failed_jobs_table', 1),
(13, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(14, '2023_12_08_050727_create_employees_table', 1),
(15, '2023_12_11_032217_create_inventories_table', 1),
(16, '2023_12_12_025845_create_customers_table', 1),
(17, '2023_12_12_103627_create_carts_table', 1),
(18, '2023_12_12_103641_create_orders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Order Placed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `customer_name`, `customer_address`, `item_name`, `quantity`, `total`, `image`, `category`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bins Dayapan', 'Upper Cantil-e Negros Oriental', 'PS5', 1, 15000.00, '51qcJKGmDXL-removebg-preview.png', 'console', 'Delivered', '2023-12-12 22:37:06', '2023-12-12 23:51:55'),
(2, 1, 'Bins Dayapan', 'Upper Cantil-e Negros Oriental', 'Horizon', 1, 5000.00, '468cc067b4294807eb09fe3b74d235d3.jpg', 'games', 'Delivered', '2023-12-12 22:37:06', '2023-12-12 23:57:24'),
(3, 1, 'Bins Dayapan', 'Upper Cantil-e Negros Oriental', 'Stray', 1, 2500.00, '6b2666486783c116875c4ace6e839c3b.jpg', 'games', 'Delivered', '2023-12-12 22:37:07', '2023-12-12 23:58:06'),
(4, 2, 'nhoriel balenzua', 'San Roque San Jose Negros Oriental', 'PS5', 1, 15000.00, '51qcJKGmDXL-removebg-preview.png', 'console', 'Delivered', '2023-12-12 23:57:04', '2023-12-12 23:58:04'),
(5, 2, 'nhoriel balenzua', 'San Roque San Jose Negros Oriental', 'Headphone Stand', 13, 7280.00, '448ddb048f44dc6418dd1fbffed1cb9e.jpg', 'accessories', 'Delivered', '2023-12-13 02:38:46', '2023-12-15 16:39:58'),
(6, 2, 'nhoriel balenzua', 'San Roque San Jose Negros Oriental', 'PS5', 2, 20000.00, 'cd43672a63f6356bd4199d4ae6d1d480.jpg', 'console', 'Delivered', '2023-12-13 03:45:23', '2023-12-15 16:49:02'),
(7, 2, 'nhoriel balenzua', 'San Roque San Jose Negros Oriental', 'PS5', 1, 15000.00, '51qcJKGmDXL-removebg-preview.png', 'console', 'Order Placed', '2023-12-13 03:45:23', '2023-12-13 03:45:23'),
(8, 2, 'nhoriel balenzua', 'San Roque San Jose Negros Oriental', 'PS5', 2, 20000.00, 'cd43672a63f6356bd4199d4ae6d1d480.jpg', 'console', 'Order Placed', '2023-12-13 03:45:23', '2023-12-13 03:45:23'),
(9, 2, 'nhoriel balenzua', 'San Roque San Jose Negros Oriental', 'PS5', 1, 10000.00, 'cd43672a63f6356bd4199d4ae6d1d480.jpg', 'console', 'Order Placed', '2023-12-13 03:45:24', '2023-12-13 03:45:24'),
(10, 2, 'nhoriel balenzua', 'San Roque San Jose Negros Oriental', 'PS5', 2, 30000.00, '51qcJKGmDXL-removebg-preview.png', 'console', 'Order Placed', '2023-12-13 04:42:35', '2023-12-13 04:42:35'),
(11, 2, 'nhoriel balenzua', 'San Roque San Jose Negros Oriental', 'Need 4 Speed', 1, 1500.00, '2d4d613b5657bb9875054d3583843e3e.jpg', 'games', 'Order Placed', '2023-12-13 04:42:35', '2023-12-13 04:42:35'),
(12, 2, 'nhoriel balenzua', 'San Roque San Jose Negros Oriental', 'Headphone', 4, 3160.00, 'd48890f53f7fcffea94d4844c5828947.jpg', 'accessories', 'Order Placed', '2023-12-13 04:42:35', '2023-12-13 04:42:35');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `emp_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
