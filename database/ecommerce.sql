-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql210.epizy.com
-- Generation Time: Apr 09, 2022 at 07:20 PM
-- Server version: 10.3.27-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epiz_31223234_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `abilities`
--

CREATE TABLE `abilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abilities`
--

INSERT INTO `abilities` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
(1, 'read', NULL, NULL, NULL),
(2, 'update', NULL, NULL, NULL),
(3, 'create', NULL, NULL, NULL),
(4, 'delete', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ability_role`
--

CREATE TABLE `ability_role` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `ability_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ability_role`
--

INSERT INTO `ability_role` (`role_id`, `ability_id`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, NULL),
(1, 4, NULL, NULL),
(1, 2, NULL, NULL),
(2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`session_id`, `product_name`, `quantity`, `price`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
('OcqFMesGtK8IQfDWC1vkib973OvhZbf0FIxj6PUG', 'MSI 4k 45inch', 1, '3200.00', 16, 6, '2022-03-10 05:00:52', '2022-03-10 05:00:52'),
('OcqFMesGtK8IQfDWC1vkib973OvhZbf0FIxj6PUG', 'Apple Iphone 11pro max 4gram', 1, '16500.00', 16, 5, '2022-03-10 05:00:55', '2022-03-10 05:00:55'),
('2GmJAHiYfb636pcBDhURSzHxIhr61oTi9s5mcvdc', 'Samsung Galaxy S10 ultra 12GBram', 1, '18000.00', NULL, 4, '2022-03-11 04:49:46', '2022-03-11 04:49:46'),
('Q7p0KueBQOOChhgqVBtNPi4VL7ARtG0XHlVX5Qeg', 'lenovo ideapad 330', 1, '6000.00', NULL, 1, '2022-03-13 00:16:32', '2022-03-13 00:16:32'),
('Q7p0KueBQOOChhgqVBtNPi4VL7ARtG0XHlVX5Qeg', 'Dell optiplex 440', 1, '13600.00', NULL, 2, '2022-03-13 00:16:35', '2022-03-13 00:16:35');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Computer', 'All Computer Accessories and requirements', '2021-10-13 15:23:37', '2022-04-10 00:43:39'),
(2, 'Laptop', 'laptop', '2021-10-13 15:23:59', '2021-10-13 15:23:59'),
(7, 'Mobiles', 'mobiles', '2021-10-13 15:25:17', '2021-10-13 15:25:17'),
(8, 'Case', 'case', '2021-10-13 15:30:47', '2021-10-13 15:30:47'),
(22, 'Processor', 'processor', '2021-10-13 15:32:37', '2021-10-13 15:32:37'),
(26, 'Screen', 'screen', '2021-10-13 15:36:16', '2021-10-13 15:36:16'),
(48, 'Camer', NULL, '2021-10-13 16:31:50', '2021-10-13 16:31:50'),
(49, 'Mouse', NULL, '2021-10-13 16:32:04', '2021-10-13 16:32:04'),
(50, 'accessories', 'accessories', '2022-04-09 19:16:47', '2022-04-09 19:16:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_03_000001_create_customer_columns', 1),
(4, '2019_05_03_000002_create_subscriptions_table', 1),
(5, '2019_05_03_000003_create_subscription_items_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2021_04_23_084909_create_categories_table', 1),
(8, '2021_04_24_084710_create_products_table', 1),
(9, '2021_04_24_091632_create_product_images_table', 1),
(10, '2021_10_03_064419_create_orders_table', 1),
(11, '2021_10_03_075940_create_session_table', 1),
(12, '2021_10_13_055438_create_roles_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` double(12,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `total_price`, `user_id`, `created_at`, `updated_at`) VALUES
(117, 'shipping', 58900.00, 14, '2021-12-24 17:06:38', '2021-12-24 17:06:38'),
(118, 'shipping', 150800.00, 14, '2021-12-24 17:07:10', '2021-12-24 17:07:10'),
(119, 'shipping', 60000.00, 14, '2021-12-24 17:11:40', '2021-12-24 17:11:40'),
(120, 'shipping', 31600.00, 14, '2021-12-24 17:14:25', '2021-12-24 17:14:25'),
(121, 'shipping', 37700.00, 15, '2021-12-24 17:16:03', '2021-12-24 17:16:03'),
(133, 'shipping', 19700.00, 17, '2022-03-11 02:44:25', '2022-03-11 02:44:25'),
(135, 'shipping', 19700.00, 17, '2022-03-11 03:04:29', '2022-03-11 03:04:29'),
(136, 'shipping', 41300.00, 19, '2022-04-10 00:01:23', '2022-04-10 00:01:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(86, 117, 6, 2),
(87, 117, 5, 1),
(88, 117, 4, 2),
(89, 118, 4, 4),
(90, 118, 5, 4),
(91, 118, 6, 4),
(92, 119, 3, 5),
(93, 120, 2, 1),
(94, 120, 1, 1),
(95, 120, 3, 1),
(96, 121, 6, 1),
(97, 121, 5, 1),
(98, 121, 4, 1),
(121, 133, 6, 1),
(122, 133, 5, 1),
(125, 135, 6, 1),
(126, 135, 5, 1),
(127, 136, 6, 2),
(128, 136, 5, 1),
(129, 136, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `quantity`, `price`, `category_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'lenovo ideapad 330', 'laptop', 5, '6000.00', 2, 4, '2021-10-17 15:51:30', '2021-10-17 15:51:30'),
(2, 'Dell optiplex 440', 'Dell PC', 3, '13600.00', 1, 5, '2021-10-17 15:57:07', '2021-10-17 15:57:07'),
(3, 'LG smart 4k 58 inch', 'Screen', 4, '12000.00', 26, 3, '2021-10-17 15:58:15', '2021-10-17 15:58:15'),
(4, 'Samsung Galaxy S10 ultra 12GBram', 'Samsung Galaxy', 2, '18000.00', 7, 1, '2021-10-17 16:05:41', '2021-10-17 16:05:41'),
(5, 'Apple Iphone 11pro max 4gram', 'iphone', 3, '16500.00', 7, 2, '2021-10-17 16:08:01', '2021-10-17 16:08:01'),
(6, 'MSI 4k 58 inch', 'smart msi screen', 3, '11000.00', 26, 3, '2021-10-17 16:24:05', '2022-04-10 00:31:50');

-- --------------------------------------------------------

--
-- Table structure for table `product_brand`
--

CREATE TABLE `product_brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_brand`
--

INSERT INTO `product_brand` (`id`, `name`) VALUES
(1, 'Samsung'),
(2, 'Apple'),
(3, 'LG'),
(4, 'Lenovo'),
(5, 'Dell');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'covers/1634457090_.jpg', 1, '2021-10-17 15:51:30', '2021-10-17 15:51:30'),
(2, 'covers/1634457427_.jpg', 2, '2021-10-17 15:57:07', '2021-10-17 15:57:07'),
(3, 'covers/1634457495_.jpg', 3, '2021-10-17 15:58:15', '2021-10-17 15:58:15'),
(4, 'covers/1634457941_.jpg', 4, '2021-10-17 16:05:42', '2021-10-17 16:05:42'),
(5, 'covers/1634458081_.jpg', 5, '2021-10-17 16:08:01', '2021-10-17 16:08:01'),
(6, 'covers/1634459045_.jpg', 6, '2021-10-17 16:24:05', '2021-10-17 16:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL, NULL),
(2, 'customer', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(10, 2, 12, '2021-10-20 15:01:00', '2021-10-20 15:01:00'),
(11, 2, 13, '2021-10-22 07:59:19', '2021-10-22 07:59:19'),
(12, 2, 14, '2021-12-20 13:30:04', '2021-12-20 13:30:04'),
(13, 2, 15, '2021-12-24 17:15:59', '2021-12-24 17:15:59'),
(14, 2, 16, '2022-03-10 05:01:32', '2022-03-10 05:01:32'),
(15, 2, 17, '2022-03-11 01:53:19', '2022-03-11 01:53:19'),
(17, 2, 19, '2022-04-09 23:44:51', '2022-04-09 23:44:51');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `created_at`, `updated_at`) VALUES
('12cK2oO7gx48ClwwBquwH4NdEFmafdGyH56I1uWg', '2022-04-07 02:08:44', '2022-04-07 02:08:44'),
('2GmJAHiYfb636pcBDhURSzHxIhr61oTi9s5mcvdc', '2022-03-11 04:49:35', '2022-03-11 04:49:35'),
('4CHJxH7fZIBO40r2wg4k8mqBR0pAkr7bZR1XNkjC', '2022-04-09 18:42:41', '2022-04-09 18:42:41'),
('4nYXZryYkbGAalwOHzlBE9kqrdiwmlRorDN4Im0B', '2022-03-11 03:03:16', '2022-03-11 03:03:16'),
('4Xe116WZ8AXznMKiw1OhvK5NfjrskwD3xL425W9K', '2021-12-24 17:14:59', '2021-12-24 17:14:59'),
('6xmEyd2Iudmf9RSXq9cMHP8InjotnpClZLlHikMy', '2022-04-09 23:57:05', '2022-04-09 23:57:05'),
('9xKQp7qc2VPROIZHdJcMOlKEl9GoAiLmgSPHakyM', '2022-04-09 15:04:00', '2022-04-09 15:04:00'),
('AmKEyPbjVPuYvoTI0fl0k7g4lcDQAbW3SCcWi0g5', '2021-12-24 17:12:21', '2021-12-24 17:12:21'),
('AqupUH85kWV9p29tlGzcuFRn6Hx6vxmz9hzGMMiI', '2021-12-25 14:12:10', '2021-12-25 14:12:10'),
('bsyUucf3OqfL37FpsCZrp9ewxK9Fr08S9xZMw8BS', '2021-12-20 13:25:02', '2021-12-20 13:25:02'),
('bycvWKIevg7BA63N1M8EsMzYsZ1N7gV17ok5skm7', '2022-03-15 11:22:27', '2022-03-15 11:22:27'),
('c4SKfA2YqOImJPRTLmUPmwGzIUWxvBKICPbgcvyv', '2022-04-10 00:48:01', '2022-04-10 00:48:01'),
('CMcOm8FOzu0pbJCY3fu6ac30UnqBp5hvMNasPSOv', '2021-12-21 06:27:45', '2021-12-21 06:27:45'),
('cS6KNXlQU8xSyM6bK4sMkUBiBbGaQxrFQCOGFUpW', '2021-12-20 13:33:18', '2021-12-20 13:33:18'),
('Da7U5uCdkVNUqTFx0pc3kz6ogXRWGzVKOe6Hy7r0', '2021-12-24 15:45:03', '2021-12-24 15:45:03'),
('dFbmHvkvmx3dTbg9kKVx1gUaecynqsCZ8N3YgHfY', '2022-03-13 20:05:51', '2022-03-13 20:05:51'),
('dl74JrgkCQ186E8fFmejGjqAl5OB2I58e1b6j3T7', '2022-04-09 18:21:58', '2022-04-09 18:21:58'),
('dobnOMklHhT1W11SJMAHkZUppuG8IqAzRn35Uoip', '2022-03-07 00:42:30', '2022-03-07 00:42:30'),
('ECgorp3eNywMDTd6ITsOD8oDX38cvhnlhBqmErou', '2022-04-09 23:55:30', '2022-04-09 23:55:30'),
('eUw4gb8RALsu7UT60TsiCblYAzO0RRX6PnrfTHUj', '2022-03-11 03:11:48', '2022-03-11 03:11:48'),
('FcZ5PVf2nPdX2k5iqwEssRbiTEQ4z1VS1HSR21h0', '2021-12-25 14:04:14', '2021-12-25 14:04:14'),
('FQY3bBo4fZAqA8dbTaG8Yit9nLD8W1de3TKsZpdY', '2022-04-09 16:31:37', '2022-04-09 16:31:37'),
('FXAvGhDUvJ4PA3oStOg0t5r0F499XlhTa9w3Bk6a', '2021-12-24 17:16:15', '2021-12-24 17:16:15'),
('G4ZmCM8y7dHD3daiH0TrXz3tOd9I5OJOBP8SUkGB', '2022-04-07 03:09:59', '2022-04-07 03:09:59'),
('Gt34ok3GN3VVmCuJW6uHsuZz8wsunEFjYoQK2yAr', '2022-03-13 17:22:19', '2022-03-13 17:22:19'),
('H7xHdGeulM1OQlfth1UjY6TbmL8GxW23BVRUnEAh', '2022-03-11 01:43:57', '2022-03-11 01:43:57'),
('HfyG3JjldOM2D2JgC0m03rh6hXhD6tgVq4uuRiBt', '2022-04-10 00:43:57', '2022-04-10 00:43:57'),
('jyT585MP3W0Vdptrcnf4hpatgMpOlmGUdImTTfz2', '2022-04-06 00:55:04', '2022-04-06 00:55:04'),
('kk505YuzoTjKhlFNd8B8aeFm0lVMD0L77KTTXrDB', '2022-04-09 23:58:31', '2022-04-09 23:58:31'),
('kytcMF517YRhpYWrtnlNEfZsLAHwcJKIhNPfL866', '2022-03-07 03:24:48', '2022-03-07 03:24:48'),
('LTBe1sTpspFgfyrjpsFeuXqZ9clLLsbE7YyKf8OO', '2022-04-09 23:37:36', '2022-04-09 23:37:36'),
('lZAu1z7x6pH7STx4t9zti4DeIo0M24K6uo1pnpi9', '2022-03-13 23:40:54', '2022-03-13 23:40:54'),
('M0YOCOM7x3QKjxK71rkIxlOMcXB4LIrbEnXS2nk3', '2022-04-09 19:25:33', '2022-04-09 19:25:33'),
('nFbK20Q2NKNtqKBp9OqVR4FK95AJNKXqOKflcoBX', '2021-12-21 14:20:48', '2021-12-21 14:20:48'),
('NiBqZRhn1mnwGFB9WKfAH2exD2rXHovzBAIbCDWy', '2022-03-06 20:11:48', '2022-03-06 20:11:48'),
('OcqFMesGtK8IQfDWC1vkib973OvhZbf0FIxj6PUG', '2022-03-10 05:00:45', '2022-03-10 05:00:45'),
('OyoVlgAh0busl8LD3bg3ljoI9dtatx0aJ2Nq5PwU', '2022-04-09 14:51:07', '2022-04-09 14:51:07'),
('OYWpuvr5q5Ie229R8bMJQiHVL3QD4dQubGe6mM1C', '2022-04-07 02:50:15', '2022-04-07 02:50:15'),
('PGmDrhJ9cqraOhQaw6tYTYKOXtdZrHa5C4W6AH19', '2021-12-24 15:45:56', '2021-12-24 15:45:56'),
('pIlvWFBm7mUcWglSbI2ICI3e0fOimbAnx1INaehE', '2022-04-07 02:50:20', '2022-04-07 02:50:20'),
('Q7p0KueBQOOChhgqVBtNPi4VL7ARtG0XHlVX5Qeg', '2022-03-12 23:57:19', '2022-03-12 23:57:19'),
('RQnBcYfBawwgl9iiI3mpnwCzGBqI0PucwoAPItop', '2021-12-21 13:40:20', '2021-12-21 13:40:20'),
('tolOWylS3xcVCnde5rJ8Xp8Gc7z2kMDWly8AHPHk', '2021-12-21 15:19:29', '2021-12-21 15:19:29'),
('vy4kxWAnxZD5wWxpE8AmibY1QzSUk7jS1IwIBOGX', '2022-03-13 20:05:51', '2022-03-13 20:05:51'),
('wmFXUKcw6tC5V59D7CJW4M2JcjQzhlXbyA9dDOju', '2022-04-10 00:03:56', '2022-04-10 00:03:56'),
('WRz0oSl84nCcdUOxTjhga3lrDLnbptQaRRwigPtG', '2022-04-07 03:12:50', '2022-04-07 03:12:50'),
('XGOybdbwiBR9xHA5kI4ETR3j6soQ3PyrOY2Rv8MW', '2022-04-07 03:46:54', '2022-04-07 03:46:54'),
('XHcReZJh6llnce8WPDZ1jna0lVbxQ5CuG3Jlwzjt', '2021-12-14 13:47:38', '2021-12-14 13:47:38'),
('Y6g1L1xrOkwUEdxzLjG6KMZCiqgHOj9f0ls0hfT2', '2021-12-24 17:14:01', '2021-12-24 17:14:01'),
('yc2o7B5vpIM5oTwc5ZXsAAXO28q71AzVRMHmqjFn', '2022-04-09 16:57:06', '2022-04-09 16:57:06'),
('zFvjiGYj1hU7etBPXHKYBvaFWI213PXDPILHp1Gg', '2022-04-07 03:56:15', '2022-04-07 03:56:15'),
('ZHLutBy8CtV1mr4ObsFRuf2cNmK2QN1gOB3SLJHz', '2022-04-09 23:51:29', '2022-04-09 23:51:29'),
('zUoA5IDCZu9DZKRYhGiq8jZv7EIhtcMjf5OqRSi6', '2022-04-09 17:00:36', '2022-04-09 17:00:36');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `address`, `phone`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'mohamed', 'mafifi350@gmail.com', NULL, '$2y$10$UJ15/8ZFwfjIGUAT7DYOYeflaLLY4i7P3NQITsfDp7zb6bT.4uF4C', NULL, NULL, NULL, 'K1MvMTU2LfHDEA1SKf0idR8PRa3ubk4K01cHdHxtWRsVnv1gpmumTWTgM0mt', '2021-10-13 15:20:03', '2021-12-24 17:18:54', NULL, NULL, NULL, NULL),
(12, 'Ahmed', 'a.a@a.a', NULL, '$2y$10$BC0iPz54j9EzT6mJ.eXkCuKSLKwZLDRS1ehSYAIgaoPAqh3i2VOU.', NULL, NULL, NULL, NULL, '2021-10-20 15:01:00', '2021-10-20 15:01:00', NULL, NULL, NULL, NULL),
(13, 'Ali', 'ali@a.a', NULL, '$2y$10$jte9AubQfBv6/fRqEZYA5uwj.HdaZKAKvimnq.dyeomS.iEx7T16.', NULL, NULL, NULL, NULL, '2021-10-22 07:59:19', '2021-10-22 07:59:19', NULL, NULL, NULL, NULL),
(14, 'ahmed ali', 'ahmed@a.a', NULL, '$2y$10$WWqf6Qz6/eQkAEC3.XFK/Oel8l7n.BpldOiWeKmQdrtPestKlX5fW', NULL, NULL, NULL, NULL, '2021-12-20 13:30:04', '2021-12-21 05:38:03', NULL, NULL, NULL, NULL),
(15, 'ali mohamed', 'aa@a.a', NULL, '$2y$10$9I2qOJ/h1kPSAN5UjtSaCOpeW5CaamVcXXbOX42hxt/xBMfRLe5/K', NULL, NULL, NULL, NULL, '2021-12-24 17:15:59', '2021-12-24 17:15:59', NULL, NULL, NULL, NULL),
(16, 'Mohamed Afifi', 'ma@ma.com', NULL, '$2y$10$zTD9ArfKDyogUfb8pMR5UOX4oJ4bs3pqyPCL99SCkKE.RYfr1rzDi', NULL, NULL, NULL, NULL, '2022-03-10 05:01:32', '2022-03-10 05:01:32', NULL, NULL, NULL, NULL),
(17, 'Mohamed Afifi', 'dd@dd.com', NULL, '$2y$10$SvD8/9aaOp/Solt7P38ree8N1.qQprbFBFBLAx6JkwMWNdA2P4xKu', NULL, NULL, NULL, NULL, '2022-03-11 01:53:19', '2022-03-11 01:53:19', NULL, NULL, NULL, NULL),
(19, 'Mohamed Afifi', 'prince.kassad1996@gmail.com', '2022-04-09 23:54:47', '$2y$10$HXE8o2F/19Fqa9gmsI2wxeijyXb2Mt.JSu8Q6hJrLeFLL4mYhycOm', NULL, NULL, NULL, 'dA7sGMBm5XVRwArvs4CRAt9kcryd28ZZM8IWVBr2n2zCHQONaFiQq6wAg0kj', '2022-04-09 23:44:51', '2022-04-09 23:59:13', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abilities`
--
ALTER TABLE `abilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ability_role`
--
ALTER TABLE `ability_role`
  ADD KEY `ability_role_role_id_foreign` (`role_id`),
  ADD KEY `ability_role_ability_id_foreign` (`ability_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_session_id_foreign` (`session_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `fk_brand_id` (`brand_id`);

--
-- Indexes for table `product_brand`
--
ALTER TABLE `product_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abilities`
--
ALTER TABLE `abilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_brand`
--
ALTER TABLE `product_brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ability_role`
--
ALTER TABLE `ability_role`
  ADD CONSTRAINT `ability_role_ability_id_foreign` FOREIGN KEY (`ability_id`) REFERENCES `abilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ability_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`session_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `product_brand` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
