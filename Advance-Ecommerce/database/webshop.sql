-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 19, 2022 lúc 03:48 AM
-- Phiên bản máy phục vụ: 10.1.37-MariaDB
-- Phiên bản PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'FastFood', 'lorem-ipsum-is', 'http://localhost/storage/photos/1/Banner/banner_02.png', '<h2><span style=\"font-weight: bolder; color: rgb(156, 0, 255); font-size: 16px;\">Giảm giá lên tới 20%</span><br></h2>', 'active', '2020-08-14 01:47:38', '2022-03-25 00:50:07'),
(2, 'Pimen Farm', 'lorem-ipsum', 'http://localhost/storage/photos/1/Banner/banner_01.png', '<p><span style=\"font-weight: bolder; color: rgb(156, 0, 255);\">Giảm giá lên tới 90%</span><br></p>', 'active', '2020-08-14 01:50:23', '2022-03-23 08:29:03'),
(4, 'PiMen Farm', 'banner', 'http://localhost/storage/photos/1/Banner/banner_03.png', '<font color=\"#9c00ff\"><b>Giảm giá lên tới 40%</b></font>', 'active', '2020-08-17 20:46:59', '2022-03-23 08:37:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'KFC', 'KFC', 'active', '2020-08-14 04:23:00', '2022-06-19 01:32:56'),
(2, 'Lotteria', 'Lotteria', 'active', '2020-08-14 04:23:08', '2022-03-23 09:08:29'),
(3, 'McDonald\'s', 'McDonald\'s', 'inactive', '2020-08-14 04:23:48', '2022-06-18 15:31:24'),
(4, 'BBQ Chicken', 'BBQ Chicken', 'active', '2020-08-14 04:24:08', '2022-03-23 09:08:52'),
(6, 'Burger King', 'Burger King', 'active', '2020-08-17 20:50:31', '2022-03-23 09:09:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(32, 37, 18, 1, 61200.00, 'new', 2, 144000.00, '2022-03-24 02:27:45', '2022-03-24 02:28:55'),
(33, 37, 19, 1, 61200.00, 'new', 1, 72000.00, '2022-06-14 14:11:39', '2022-06-14 14:12:15'),
(34, 38, 20, 1, 68000.00, 'new', 2, 136000.00, '2022-06-14 15:57:03', '2022-06-14 17:14:42'),
(35, 37, 20, 1, 61200.00, 'new', 2, 144000.00, '2022-06-14 16:09:14', '2022-06-14 17:14:42'),
(36, 44, 25, 1, 272000.00, 'new', 1, 272000.00, '2022-06-14 17:15:38', '2022-06-19 01:36:56'),
(37, 37, 22, 1, 61200.00, 'new', 2, 144000.00, '2022-06-16 03:05:21', '2022-06-16 03:05:53'),
(38, 37, 23, 2, 61200.00, 'new', 1, 72000.00, '2022-06-16 03:07:11', '2022-06-16 03:07:31'),
(39, 54, NULL, 2, 42000.00, 'new', 1, 42000.00, '2022-06-16 03:10:05', '2022-06-16 03:10:05'),
(41, 38, 24, 1, 68000.00, 'new', 1, 68000.00, '2022-06-17 15:49:30', '2022-06-17 16:12:56'),
(42, 37, 25, 1, 61200.00, 'new', 5, 360000.00, '2022-06-19 01:35:23', '2022-06-19 01:36:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Combo 1 người', 'Fast Food', '<p><br></p>', 'http://localhost/storage/photos/1/combo_1_nguoi.png', 1, NULL, NULL, 'active', '2020-08-14 04:26:15', '2022-03-23 08:48:21'),
(2, 'Combo Nhóm', 'Fast Food - 1', '<p><br></p>', 'http://localhost/storage/photos/1/combo_nhom.png', 1, NULL, NULL, 'active', '2020-08-14 04:26:40', '2022-03-23 08:48:18'),
(3, 'Ưu đãi - Món mới', 'Fast Food - 2', '<p><br></p>', 'http://localhost/storage/photos/1/mon-moi.png', 1, NULL, NULL, 'active', '2020-08-14 04:27:10', '2022-03-23 08:48:13'),
(15, 'Món lẻ', 'Fast Food - 3', NULL, 'http://localhost/storage/photos/1/mon_le.png', 1, NULL, NULL, 'active', '2022-03-23 08:47:33', '2022-03-23 08:47:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(7, 'MAHANG', 'fixed', '50000.00', 'active', '2022-03-16 03:41:07', '2022-03-17 07:35:25'),
(8, 'MAGIAMGIA20K', 'fixed', '20000.00', 'active', '2022-06-18 15:33:24', '2022-06-18 15:33:24'),
(9, 'Fast30', 'fixed', '30000.00', 'active', '2022-06-18 15:35:15', '2022-06-18 15:35:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(4, 'Minh', 'Chào', 'ngonguyenkminh.dsn@gmail.com', NULL, '0983103154', 'Chào Admin, Mình test hệ thống', '2022-03-09 08:52:51', '2022-03-09 08:52:40', '2022-03-09 08:52:51'),
(5, 'Dương', 'San phẩm tốt', 'duognngoquy@gmail.com', NULL, '012345678', 'Gaio hàng nhanhẻwfdsfsdfsdfsdfsd', '2022-03-10 04:30:47', '2022-03-10 04:30:37', '2022-03-10 04:30:47'),
(6, 'QUY', 'Lỗi nhiều', 'a@gmail.com', NULL, '0123456789', 'adsdasdsadadadasdadas', '2022-03-16 03:50:48', '2022-03-16 03:50:32', '2022-03-16 03:50:48'),
(7, 'abc', 'fđ43543534', 'yen@gmail.com', NULL, '55555534343', 'abcxyzsadasdsadhhhhhhhh', '2022-03-24 02:29:26', '2022-03-24 02:27:14', '2022-03-24 02:29:26'),
(8, 'Dev Nguyễn', 'Xin chào', 'minhanh.nvd@gmail.com', NULL, '0123456788', 'Xin chào shop, chúc shop ngày càng phát triển', '2022-06-17 14:38:07', '2022-06-17 14:37:59', '2022-06-17 14:38:07'),
(9, 'Hải Yến', 'Hello', 'lthaiyen2510@gmail.com', NULL, '0982303960', 'Shop phục vụ tốt , đồ ăn chất lượng', NULL, '2022-06-18 01:47:23', '2022-06-18 01:47:23'),
(10, 'Hải Yến', 'Hello', 'lthaiyen2510@gmail.com', NULL, '0982303960', 'Shop phục vụ tốt , đồ ăn chất lượng', NULL, '2022-06-18 01:47:30', '2022-06-18 01:47:30'),
(11, 'Yến Hải', 'Hello', 'lthaiyen2510@gmail.com', NULL, '0982303940', 'Shop phục vụ tốt , đồ ăn ngon chất lượng , giá cả phải chăng', '2022-06-18 02:28:18', '2022-06-18 01:48:28', '2022-06-18 02:28:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1487b8e1-b040-4d53-893e-bce342de5758', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/14\",\"fas\":\"fa-file-alt\"}', NULL, '2022-03-16 03:45:02', '2022-03-16 03:45:02'),
('1aa75d42-a788-4b2f-baad-7dac5b08e6f3', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', '2022-03-11 01:25:19', '2022-03-10 01:25:24', '2022-03-11 01:25:19'),
('1d2c1250-3fbd-48e9-aa56-3f17b804cc8d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"S\\u1ea3n ph\\u1ea9m m\\u1edbi \\u0111\\u01b0\\u1ee3c \\u0111\\u00e1nh gi\\u00e1!\",\"actionURL\":\"http:\\/\\/localhost\\/product-detail\\/cam-vinh\",\"fas\":\"fa-star\"}', NULL, '2022-06-18 06:57:07', '2022-06-18 06:57:07'),
('1f63f595-dd7b-44c9-ada8-0196be8b9583', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost\\/product-detail\\/buoi-huong-thai-lan\",\"fas\":\"fa-star\"}', '2022-03-10 04:29:01', '2022-03-10 04:28:43', '2022-03-10 04:29:01'),
('284267cc-168e-47e6-bc3b-77e54714c7c1', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/19\",\"fas\":\"fa-file-alt\"}', NULL, '2022-06-14 14:12:15', '2022-06-14 14:12:15'),
('2ea47032-8f70-4246-ae63-a110c925274e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost\\/blog-detail\\/loi-ich-mang-lai-cua-nong-nghiep-tien-tien\",\"fas\":\"fas fa-comment\"}', NULL, '2022-03-13 03:48:33', '2022-03-13 03:48:33'),
('2f847744-72b6-4ab2-8e9b-7b7846131004', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/18\",\"fas\":\"fa-file-alt\"}', '2022-03-24 02:29:33', '2022-03-24 02:28:55', '2022-03-24 02:29:33'),
('32c98b94-f429-4c04-b437-96dd2eb3d857', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}', '2022-03-11 08:39:22', '2022-03-11 03:03:00', '2022-03-11 08:39:22'),
('3d1bba2d-8424-4ff0-acd1-60708f36c3e8', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost\\/blog-detail\\/mot-so-loai-hoacay-canh-tet-duoc-nhieu-nguoi-ua-chuong\",\"fas\":\"fas fa-comment\"}', '2022-03-24 02:29:15', '2022-03-18 07:20:53', '2022-03-24 02:29:15'),
('54b406f0-4764-40f2-be95-f572bde2f426', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost\\/product-detail\\/cay-cam-sanh\",\"fas\":\"fa-star\"}', '2022-03-13 12:16:11', '2022-03-13 03:49:58', '2022-03-13 12:16:11'),
('61ed8118-09c3-47b0-bea3-1b07e2f03550', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"S\\u1ea3n ph\\u1ea9m m\\u1edbi \\u0111\\u01b0\\u1ee3c \\u0111\\u00e1nh gi\\u00e1!\",\"actionURL\":\"http:\\/\\/localhost\\/product-detail\\/cam-vinh\",\"fas\":\"fa-star\"}', NULL, '2022-06-18 06:44:28', '2022-06-18 06:44:28'),
('7aa1b642-8ae9-4a62-8009-9289a40237ec', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/23\",\"fas\":\"fa-file-alt\"}', '2022-06-16 14:26:46', '2022-06-16 03:07:31', '2022-06-16 14:26:46'),
('7e9a4dee-a93a-4d88-a301-c04fd09286e9', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/22\",\"fas\":\"fa-file-alt\"}', NULL, '2022-06-16 03:05:53', '2022-06-16 03:05:53'),
('9677a0cc-c56d-44a2-9da8-8b4908b8be48', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/15\",\"fas\":\"fa-file-alt\"}', NULL, '2022-03-16 03:52:58', '2022-03-16 03:52:58'),
('a7c29474-cc1c-4306-a16b-fa265f1806d6', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost\\/product-detail\\/cay-mam-xoi\",\"fas\":\"fa-star\"}', '2022-03-10 01:18:38', '2022-03-10 00:47:32', '2022-03-10 01:18:38'),
('ab97892f-8f3b-4d95-a68f-0bbedf61d55b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/21\",\"fas\":\"fa-file-alt\"}', '2022-06-14 17:16:11', '2022-06-14 17:15:59', '2022-06-14 17:16:11'),
('abdfb395-8ff1-48a1-aedf-40431b6affee', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/17\",\"fas\":\"fa-file-alt\"}', NULL, '2022-03-17 07:36:37', '2022-03-17 07:36:37'),
('b88d5c4f-d16c-4457-b4ca-6271487a19df', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', '2022-03-09 08:53:35', '2022-03-09 08:48:21', '2022-03-09 08:53:35'),
('c1d7ffc3-8cf9-425c-8589-f8c4ef59861b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/24\",\"fas\":\"fa-file-alt\"}', NULL, '2022-06-17 16:12:56', '2022-06-17 16:12:56'),
('c89044bf-7fea-48de-8f51-e14d35c2dc2e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/16\",\"fas\":\"fa-file-alt\"}', NULL, '2022-03-17 07:21:45', '2022-03-17 07:21:45'),
('ce539b9c-dfc1-4704-bbc8-40a5f62f43a1', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/13\",\"fas\":\"fa-file-alt\"}', NULL, '2022-03-16 03:37:21', '2022-03-16 03:37:21'),
('d9ba0e64-335a-4d13-b62d-e539905f449b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/20\",\"fas\":\"fa-file-alt\"}', '2022-06-14 17:16:17', '2022-06-14 17:14:42', '2022-06-14 17:16:17'),
('db797644-98e8-40a6-9087-1680687243ed', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/25\",\"fas\":\"fa-file-alt\"}', NULL, '2022-06-19 01:36:56', '2022-06-19 01:36:56'),
('de548cd1-7e46-403e-842e-6b09991df70c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost\\/product-detail\\/cam-cara\",\"fas\":\"fa-star\"}', NULL, '2022-03-16 03:20:47', '2022-03-16 03:20:47'),
('e6e5c9eb-3b21-4062-a799-e0c5d1d9168c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/12\",\"fas\":\"fa-file-alt\"}', NULL, '2022-03-16 03:25:47', '2022-03-16 03:25:47'),
('fa1b7529-9e7e-46de-aa2a-b9df5d869138', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}', '2022-03-11 08:39:16', '2022-03-11 08:18:57', '2022-03-11 08:39:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(18, 'ORD-D1QC3C5ZMV', 1, 144000.00, 4, NULL, 168000.00, 2, 'cod', 'unpaid', 'new', 'haiyen', 'yen', 'yen@gmail.com', '55555555555555', 'VN', 'ehfns', 'gfđrrrr', 'hanoi', '2022-03-24 02:28:55', '2022-03-24 02:28:55'),
(19, 'ORD-MX7JH0RBAG', 1, 72000.00, 4, NULL, 96000.00, 1, 'cod', 'unpaid', 'delivered', 'Yến', 'Hải', 'lthaiyen2510@gmail.com', '0982303945', 'VN', NULL, '25 Hội An', NULL, '2022-06-14 14:12:14', '2022-06-18 09:04:48'),
(20, 'ORD-VABKOHTZFA', 1, 280000.00, 4, NULL, 304000.00, 4, 'cod', 'unpaid', 'delivered', 'Yến', 'Hải', 'lthaiyen2510@gmail.com', '0982303945', 'VN', NULL, '25 Hội An', NULL, '2022-06-14 17:14:41', '2022-06-19 01:34:08'),
(22, 'ORD-T6QLCJUW96', 1, 144000.00, 4, NULL, 168000.00, 2, 'cod', 'unpaid', 'new', 'Yến', 'Hải', 'lthaiyen2510@gmail.com', '0982303945', 'VN', NULL, '25 Hội An', NULL, '2022-06-16 03:05:52', '2022-06-16 03:05:52'),
(23, 'ORD-EYH92LLH67', 2, 72000.00, 2, NULL, 92000.00, 1, 'cod', 'unpaid', 'delivered', 'Yến', 'Hải', 'lthaiyen2510@gmail.com', '0982303945', 'VN', NULL, '25 Hội An', NULL, '2022-06-16 03:07:31', '2022-06-17 13:40:04'),
(24, 'ORD-X5KDB7EMCA', 1, 68000.00, 4, 50000.00, 42000.00, 1, 'cod', 'unpaid', 'new', 'Linh', 'Nguyễn', 'linhnguyen0903@gmail.com', '0982652301', 'VN', '10000', 'Bà Triệu', 'Thái Phiên', '2022-06-17 16:12:56', '2022-06-17 16:12:56'),
(25, 'ORD-WEKSARU2QW', 1, 632000.00, 2, NULL, 652000.00, 6, 'cod', 'unpaid', 'delivered', 'Nguyễn', 'Nguyễn', 'nguyenphuong123@gmail.com', '0982652301', 'VN', '10000', 'Bà Triệu', 'Thái Phiên', '2022-06-19 01:36:55', '2022-06-19 01:38:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@gmail.com', '$2y$10$gBR8ToPJvvSOUoe2oyMvzunlyRJcZ2VijxUzKYRFm64cXMuxgOrMa', '2022-03-11 00:39:22'),
('admin@gmail.com', '$2y$10$YJWSCOKQ1ilAO8jmImy0Lec79DthEK75LFHSpjCFFU8MhT2pMf3Pu', '2022-03-11 00:39:22'),
('minhanh.nvd@gmail.com', '$2y$10$CkhWGnFTphr1ZRuXgTAXoOQGV5djGJVho7iCJkpm0w8v1QrM5gakq', '2022-03-11 00:39:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(7, 'McDonald\'s năm thứ 3 vào top 100 thương hiệu tin & dùng', '10-loai-cay-an-qua-giup-nong-dan-thu-tien-ty', '<p class=\"body-text\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(31, 31, 31); font-family: Graphik-Regular; font-size: 14px;\"><br></p>', '<p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Trong khuôn khổ Diễn đàn Tiêu dùng Việt Nam diễn ra lễ công bố, vinh danh \"Top 100 sản phẩm - dịch vụ tin &amp; dùng 2020\". McDonald’s nằm trong top đề cử và nhận giải thưởng. Đây là năm thứ 3 liên tiếp thương hiệu này được vinh danh.</p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Đại diện thương hiệu cho biết, giải thưởng chính sự nghi nhận của thực khách dành cho McDonald’s. Đây cũng là câu trả lời cho quá trình kiên định xây dựng niềm tin với khách hàng từ thực đơn, chất lượng sản phẩm cho đến trải nghiệm tại cửa hàng bằng những dịch vụ công nghệ 4.0 hiện đại và đội ngũ nhân viên được đào tạo bài bản.</p><figure data-size=\"true\" itemprop=\"associatedMedia image\" itemscope=\"\" itemtype=\"http://schema.org/ImageObject\" class=\"tplCaption action_thumb_added\" style=\"margin-right: auto; margin-bottom: 15px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; text-align: center; width: 670px; float: left; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><div class=\"fig-picture\" style=\"margin: 0px; padding: 0px 0px 366px; text-rendering: optimizelegibility; width: 670px; float: left; display: table; justify-content: center; background: rgb(240, 238, 234); position: relative;\"><picture style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><source data-srcset=\"https://i1-kinhdoanh.vnecdn.net/2020/12/14/449-1607909858-2969-1607921956.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=tVxjlOUncqYr2nqk4hSpZQ 1x, https://i1-kinhdoanh.vnecdn.net/2020/12/14/449-1607909858-2969-1607921956.png?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=IG4Eyiu69WsHhCI1n5sUuQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2020/12/14/449-1607909858-2969-1607921956.png?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=ILBUaqpAARI1scgarD0LQQ 2x\" srcset=\"https://i1-kinhdoanh.vnecdn.net/2020/12/14/449-1607909858-2969-1607921956.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=tVxjlOUncqYr2nqk4hSpZQ 1x, https://i1-kinhdoanh.vnecdn.net/2020/12/14/449-1607909858-2969-1607921956.png?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=IG4Eyiu69WsHhCI1n5sUuQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2020/12/14/449-1607909858-2969-1607921956.png?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=ILBUaqpAARI1scgarD0LQQ 2x\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><img itemprop=\"contentUrl\" loading=\"lazy\" intrinsicsize=\"680x0\" alt=\"polyad\" class=\"lazy lazied\" src=\"https://i1-kinhdoanh.vnecdn.net/2020/12/14/449-1607909858-2969-1607921956.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=tVxjlOUncqYr2nqk4hSpZQ\" data-src=\"https://i1-kinhdoanh.vnecdn.net/2020/12/14/449-1607909858-2969-1607921956.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=tVxjlOUncqYr2nqk4hSpZQ\" data-ll-status=\"loaded\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; top: 0px; left: 21px; max-height: 700px; width: 628px;\"></picture></div><figcaption itemprop=\"description\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; text-align: left;\"><p class=\"Image\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px;\">Ông Nguyễn Huy Thịnh - Giám đốc điều hành McDonald’s Việt Nam (giữa, hàng đầu) tại lễ vinh danh Top 100 sản phẩm, dịch vụ tin và dùng năm 2020.</p></figcaption></figure><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Món Gà rán giòn da thấm thịt của McDonald’s là một trong những món ăn chủ đạo trong thực đơn bản địa hóa được McDonald’s nghiên cứu để phù hợp với phong vị của người Việt.</p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Vào tháng 7/2020, McDonald’s đã giới thiệu sản phẩm gà rán giòn da thấm thịt phiên bản vị cay có công thức độc quyền từ Mỹ, quy trình chế biến khép kín từ nông trại chăn nuôi, nhà máy giết mổ đạt tiêu chuẩn vệ sinh, đảm bảo an toàn chất lượng của McDonald’s toàn cầu như HACCP, GMP, SQMS.</p><figure data-size=\"true\" itemprop=\"associatedMedia image\" itemscope=\"\" itemtype=\"http://schema.org/ImageObject\" class=\"tplCaption action_thumb_added\" style=\"margin-right: auto; margin-bottom: 15px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; text-align: center; width: 670px; float: left; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><div class=\"fig-picture\" style=\"margin: 0px; padding: 0px 0px 628px; text-rendering: optimizelegibility; width: 670px; float: left; display: table; justify-content: center; background: rgb(240, 238, 234); position: relative;\"><picture style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><source data-srcset=\"https://i1-kinhdoanh.vnecdn.net/2020/12/14/504-1607909869-1149-1607921957.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Zx3JgUURi4xXtU7MS8YaYA 1x, https://i1-kinhdoanh.vnecdn.net/2020/12/14/504-1607909869-1149-1607921957.png?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=9MfQcjd3lyOr0R7cfaHChA 1.5x, https://i1-kinhdoanh.vnecdn.net/2020/12/14/504-1607909869-1149-1607921957.png?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=Vm574JhYw9CbZa92Y9QHJw 2x\" srcset=\"https://i1-kinhdoanh.vnecdn.net/2020/12/14/504-1607909869-1149-1607921957.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Zx3JgUURi4xXtU7MS8YaYA 1x, https://i1-kinhdoanh.vnecdn.net/2020/12/14/504-1607909869-1149-1607921957.png?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=9MfQcjd3lyOr0R7cfaHChA 1.5x, https://i1-kinhdoanh.vnecdn.net/2020/12/14/504-1607909869-1149-1607921957.png?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=Vm574JhYw9CbZa92Y9QHJw 2x\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><img itemprop=\"contentUrl\" loading=\"lazy\" intrinsicsize=\"680x0\" alt=\"polyad\" class=\"lazy lazied\" src=\"https://i1-kinhdoanh.vnecdn.net/2020/12/14/504-1607909869-1149-1607921957.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Zx3JgUURi4xXtU7MS8YaYA\" data-src=\"https://i1-kinhdoanh.vnecdn.net/2020/12/14/504-1607909869-1149-1607921957.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Zx3JgUURi4xXtU7MS8YaYA\" data-ll-status=\"loaded\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; top: 0px; left: 21px; max-height: 700px; width: 628px;\"></picture></div><figcaption itemprop=\"description\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; text-align: left;\"><p class=\"Image\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px;\">Món gà rán giòn da thấm thịt phiên bản vị cay.</p></figcaption></figure><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Năm 2020, trước nhiều biến động trong nước và thế giới do ảnh hưởng của Covid-19, McDonald’s vẫn thể hiện bản lĩnh của thương hiệu toàn cầu khi liên tiếp ra mắt các sản phẩm mới, có thể kể đến như Burger vị Phở ra mắt dịp Quốc khánh 2/9 vừa qua, hay Soup nui thịt heo thuần vị Việt trên nền chất lượng chuẩn quốc tế.</p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Trong năm nay, McDonald’s có cửa hàng đầu tiên tại Aeon Mall Bình Dương Canary, nâng số lượng cửa hàng lên 23 cửa hàng tại TP HCM, Hà Nội và Bình Dương.</p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Để chào đón lễ Giáng sinh sắp tới, McDonald’s triển triển khai nhiều chương trình combo món gà rán giòn da thấm thịt và burger với nhiều lựa chọn. Đặc biệt, với hóa đơn từ 199.000 đồng thực khách sẽ được tặng ngay một tấm thiệp chúc mừng trị giá 50.000 đồng hoặc 100.000 đồng.</p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Giải thưởng sản phẩm - dịch vụ tin &amp; dùng được tổ chức thường niên quy mô toàn quốc, nhằm bình chọn sản phẩm hàng hóa - dịch vụ trên thị trường Việt Nam được người tiêu dùng ưa chuộng và lựa chọn. Năm nay với chủ đề \"Lửa thử vàng - Thách thức tạo sức bật\", chương trình thu hút hàng nghìn thương hiệu tham gia.</p><div class=\"WordSection1\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; text-align: right;\">(Nguồn:<em style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\">&nbsp;McDonald’s</em>)</p></div>', '<p><span style=\"color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Sản phẩm gà rán giòn da thấm thịt của McDonald’s được vinh danh giải thường tin &amp; dùng 2020, hôm 12/12, tại Hà Nội.</span><br></p>', 'http://localhost/storage/photos/1/blog1.png', 'Tin tức', 4, NULL, 1, 'active', '2022-03-11 01:09:11', '2022-03-23 09:54:16'),
(8, 'KFC ngừng dùng slogan vì Covid-19', 'loi-ich-mang-lai-cua-nong-nghiep-tien-tien', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(31, 31, 31); font-family: Graphik-Regular; font-size: 14px;\"><br><br></p>', '<br><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Hãng đồ ăn nhanh KFC hôm qua (24/8) thông báo ngừng sử dụng slogan It\'s Finger Lickin\' Good trong các quảng cáo. Nguyên nhân là nhiều tháng nay, quan chức y tế thế giới đã khuyến cáo người dân ngừng đưa tay lên mặt để tránh lây nhiễm Covid-19.</p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">\"Chúng tôi đang ở trong tình huống khá đặc biệt. Slogan biểu tượng này không còn thích hợp với tình hình hiện tại nữa\", Giám đốc Marketing toàn cầu của KFC Catherine Tan-Gillespie cho biết. KFC khẳng định thực đơn sẽ không thay đổi và slogan này sẽ quay lại \"vào thời điểm thích hợp\".</p><figure data-size=\"true\" itemprop=\"associatedMedia image\" itemscope=\"\" itemtype=\"http://schema.org/ImageObject\" class=\"tplCaption action_thumb_added\" style=\"margin-right: auto; margin-bottom: 15px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; text-align: center; width: 670px; float: left; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><div class=\"fig-picture\" style=\"margin: 0px; padding: 0px 0px 401.875px; text-rendering: optimizelegibility; width: 670px; float: left; display: table; justify-content: center; background: rgb(240, 238, 234); position: relative;\"><picture data-inimage=\"done\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><source data-srcset=\"https://i1-kinhdoanh.vnecdn.net/2020/08/25/kfc-1598344209-3088-1598344268.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=A8cqSRBl34L3ddJGPZijtQ 1x, https://i1-kinhdoanh.vnecdn.net/2020/08/25/kfc-1598344209-3088-1598344268.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=FBc5p4vLTMT9ZO11VJDF1g 1.5x, https://i1-kinhdoanh.vnecdn.net/2020/08/25/kfc-1598344209-3088-1598344268.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=zgC1072BGzf7-O7-9DQpnQ 2x\" srcset=\"https://i1-kinhdoanh.vnecdn.net/2020/08/25/kfc-1598344209-3088-1598344268.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=A8cqSRBl34L3ddJGPZijtQ 1x, https://i1-kinhdoanh.vnecdn.net/2020/08/25/kfc-1598344209-3088-1598344268.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=FBc5p4vLTMT9ZO11VJDF1g 1.5x, https://i1-kinhdoanh.vnecdn.net/2020/08/25/kfc-1598344209-3088-1598344268.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=zgC1072BGzf7-O7-9DQpnQ 2x\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><img itemprop=\"contentUrl\" loading=\"lazy\" intrinsicsize=\"680x0\" alt=\"KFC sẽ làm nhòe một phần slogan này trên các biển quảng cáo. Ảnh: KFC/PA\" class=\"lazy lazied\" src=\"https://i1-kinhdoanh.vnecdn.net/2020/08/25/kfc-1598344209-3088-1598344268.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=A8cqSRBl34L3ddJGPZijtQ\" data-src=\"https://i1-kinhdoanh.vnecdn.net/2020/08/25/kfc-1598344209-3088-1598344268.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=A8cqSRBl34L3ddJGPZijtQ\" data-ll-status=\"loaded\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; top: 0px; left: 0px; max-height: 700px; width: 670px;\"><div class=\"embed-container-ads\" style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-left: 0px; text-rendering: optimizelegibility; width: 670px; background: transparent; height: 100px; position: absolute; bottom: -1px; margin-bottom: 0px !important; padding-bottom: 0px !important;\"></div></picture></div><figcaption itemprop=\"description\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; text-align: left;\"><p class=\"Image\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px;\">KFC sẽ làm nhòe một phần slogan này trên các biển quảng cáo. Ảnh:&nbsp;<em style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\">KFC/PA</em></p></figcaption></figure><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">KFC đã làm nhòe slogan này trên các biển quảng cáo cũ và đăng một video mới về việc này trên trang YouTube. CNN thì cho rằng thông báo này của hãng thực ra cũng là một chiến dịch marketing.</p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Cũng như phần lớn các hãng đồ ăn nhanh khác, KFC đang phải tìm nhiều cách thu hút khách hàng. Đồ ăn nhanh là ngành kinh doanh tăng trưởng chậm, biên lợi nhuận mỏng và có mức độ trung thành của khách hàng thấp.</p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Vì đại dịch, KFC đã phải đóng nhiều cửa hàng trong tháng 3 và khuyến khích khách hàng mua mang về hoặc đặt giao về nhà. Họ cũng lắp đặt các tấm nhựa mica ở quầy thu ngân, yêu cầu nhân viên đeo khẩu trang và kiểm tra sức khỏe trước mỗi ca làm việc.</p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Sau nhiều tháng lao đao vì Covid-19, doanh thu tại các cửa hàng của KFC gần đây hồi phục mạnh khi các nước dần nới lỏng phong tỏa. Công ty mẹ của KFC Yum! Brands ghi nhận doanh thu ròng 1,2 tỷ USD quý II, giảm 8,5% so với cùng kỳ năm ngoái nhưng đang dần ổn định lại.</p><ul class=\"list-news gaBoxLinkDisplay\" data-campaign=\"Box-Related\" data-event-category=\"Article Link Display\" data-event-action=\"Box-Related\" data-event-label=\"Item-0\" data-gtm-vis-recent-on-screen-2359946_230=\"297550\" data-gtm-vis-first-on-screen-2359946_230=\"297550\" data-gtm-vis-total-visible-time-2359946_230=\"100\" data-gtm-vis-has-fired-2359946_230=\"1\" style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 10px 0px 0px 30px; text-rendering: optimizelegibility; list-style-type: none; width: 670px; float: left; line-height: 18px; border-left: 1px solid rgb(189, 189, 189); clear: both; color: rgb(34, 34, 34); font-family: arial; background-color: rgb(252, 250, 246);\"><li data-id=\"4051436\" style=\"margin: 0px 0px 10px; padding: 0px; text-rendering: optimizelegibility; list-style-type: none; position: relative; line-height: 25.6px; text-align: left;\"><a data-medium=\"Item-1\" href=\"https://vnexpress.net/cong-ty-me-kfc-lo-lo-ca-nam-vi-dich-cum-4051436.html\" title=\"Công ty mẹ KFC lo lỗ cả năm vì dịch cúm\" data-event-category=\"Article Link Click\" data-event-action=\"Box-Related\" data-event-label=\"1\" data-itm-source=\"#vn_source=Detail&amp;vn_campaign=Box-Related&amp;vn_medium=Item-1&amp;vn_term=Desktop\" data-itm-added=\"1\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); text-decoration-line: underline; position: relative; text-underline-position: under;\">Công ty mẹ KFC lo lỗ cả năm vì dịch cúm</a><span class=\"meta-news\" style=\"margin: 0px 0px 0px 5px; padding: 0px; text-rendering: optimizelegibility; color: rgb(117, 117, 117); font-size: 12px; line-height: 14px; display: inline-block; vertical-align: middle;\"></span></li><li data-id=\"4017046\" style=\"margin: 0px 0px 10px; padding: 0px; text-rendering: optimizelegibility; list-style-type: none; position: relative; line-height: 25.6px; text-align: left;\"><a data-medium=\"Item-2\" href=\"https://vnexpress.net/popeyes-muon-pha-the-doc-ton-cua-kfc-o-trung-quoc-4017046.html\" title=\"Popeyes muốn phá thế \'độc tôn\' của KFC ở Trung Quốc\" data-event-category=\"Article Link Click\" data-event-action=\"Box-Related\" data-event-label=\"2\" data-itm-source=\"#vn_source=Detail&amp;vn_campaign=Box-Related&amp;vn_medium=Item-2&amp;vn_term=Desktop\" data-itm-added=\"1\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); text-decoration-line: underline; position: relative; text-underline-position: under;\">Popeyes muốn phá thế \'độc tôn\' của KFC ở Trung Quốc</a><span class=\"meta-news\" style=\"margin: 0px 0px 0px 5px; padding: 0px; text-rendering: optimizelegibility; color: rgb(117, 117, 117); font-size: 12px; line-height: 14px; display: inline-block; vertical-align: middle;\"></span></li></ul><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246); text-align: right;\"><strong style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\">Hà Thu</strong>&nbsp;<em style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\">(theo CNN)</em></p><table width=\"450\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\" style=\"border-spacing: 0px; color: rgb(31, 31, 31); font-family: Graphik-Regular; font-size: 14px;\"><tbody><tr><td valign=\"top\" style=\"padding: 0px;\"><br></td></tr></tbody></table>', '<h6 style=\"font-family: Graphik-Regular; line-height: 1.1; color: rgb(31, 31, 31); margin-bottom: 10px; font-size: 24px;\"><span style=\"color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Slogan \"Vị ngon trên từng ngón tay\" (It\'s Finger Lickin\' Good) của hãng được đánh giá không thích hợp trong thời kỳ đại dịch.</span><br style=\"font-size: 14px;\"></h6>', 'http://localhost/storage/photos/1/blog2.png', 'Tin tức,Tag', 5, NULL, 1, 'active', '2022-03-11 01:10:38', '2022-03-23 09:57:07');
INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(10, 'McDonald’s khai trương nhà hàng tại Vincom Trần Duy Hưng', 'mot-so-loai-hoacay-canh-tet-duoc-nhieu-nguoi-ua-chuong', 'Tin tức mới nhất trong ngày', '<h5 class=\"line\" data-line=\"6\" style=\"font-family: Graphik-Regular; line-height: 1.1; color: rgb(31, 31, 31); margin-bottom: 10px; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Sáng 14/6, McDonald’s Việt Nam khai trương nhà hàng thứ ba ở Hà Nội, tại Vincom Trần Duy Hưng (119 Trần Duy Hưng, quận Cầu Giấy). Tính đến thời điểm này, hãng đã có 21 nhà hàng hoạt động tại Việt Nam.</p><figure data-size=\"true\" itemprop=\"associatedMedia image\" itemscope=\"\" itemtype=\"http://schema.org/ImageObject\" class=\"tplCaption action_thumb_added\" style=\"margin-right: auto; margin-bottom: 15px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; text-align: center; width: 670px; float: left; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><div class=\"fig-picture\" style=\"margin: 0px; padding: 0px 0px 299px; text-rendering: optimizelegibility; width: 670px; float: left; display: table; justify-content: center; background: rgb(240, 238, 234); position: relative;\"><picture style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><source data-srcset=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=QJ5v2HACb6aKiV3JK30HEw 1x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=7NGD18Z_oyGBEILkwmlLCQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=nktoc_vfvnpjR7IVqJC1Gw 2x\" srcset=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=QJ5v2HACb6aKiV3JK30HEw 1x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=7NGD18Z_oyGBEILkwmlLCQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=nktoc_vfvnpjR7IVqJC1Gw 2x\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"></picture><picture style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><source data-srcset=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=QJ5v2HACb6aKiV3JK30HEw 1x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=7NGD18Z_oyGBEILkwmlLCQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=nktoc_vfvnpjR7IVqJC1Gw 2x\" srcset=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=QJ5v2HACb6aKiV3JK30HEw 1x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=7NGD18Z_oyGBEILkwmlLCQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=nktoc_vfvnpjR7IVqJC1Gw 2x\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><img itemprop=\"contentUrl\" loading=\"lazy\" intrinsicsize=\"680x0\" alt=\"Đại diện McDonald’s Việt Nam và khách mời tham dự khai trương nhà hàng McDonald’s Vincom Trần Duy Hưng, Hà Nội.\" class=\"lazy lazied\" src=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=QJ5v2HACb6aKiV3JK30HEw\" data-src=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image001-2327-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=QJ5v2HACb6aKiV3JK30HEw\" data-ll-status=\"loaded\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; top: 0px; left: 85px; max-height: 700px; width: 500px;\"></picture></div><figcaption itemprop=\"description\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; text-align: left;\"><p class=\"Image\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px;\">Đại diện McDonald’s Việt Nam và khách mời tham dự khai trương nhà hàng McDonald’s Vincom Trần Duy Hưng, Hà Nội.</p></figcaption></figure><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Lý giải việc chọn khu vực Cầu Giấy, Thanh Xuân để mở cửa hàng thứ 3 tại Thủ đô, ông Nguyễn Huy Thịnh - Giám đốc điều hành cho biết, tiếp nối sự thành công ngoài mong đợi của McDonald’s Hoàng Đạo Thúy (khai trương vào tháng 4), hãng quyết định đẩy nhanh tiến độ mở nhà hàng và kỳ vọng sẽ trở thành thương hiệu được ưa chuộng tại khu vực Hà Nội.<br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">\"Vincom Trần Duy Hưng là trung tâm thương mại mới khai trương, nằm ở một trong những vị trí đắc địa tại Hà Nội với những cụm văn phòng và chung cư đông đúc, hội tụ đầy đủ tiêu chí mở nhà hàng tiếp theo. Đồng thời, đây cũng là những bước đầu trong kế hoạch mở rộng địa bàn của McDonald’s tại Hà Nội\", ông Thịnh nói.</p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Nằm tại tầng 5 - khu vực dịch vụ ăn uống - giải trí của trung tâm thương mại Vincom, nhà hàng McDonald’s phục vụ hơn 130 chỗ ngồi với đầy đủ các dịch vụ chức năng như gọi món ăn và thức uống tại quầy, mua hàng mang đi, đặt hàng tự động (self-order kiosk). Những món ăn đặc trưng của thương hiệu như Burger Big Mac với công thức vẹn nguyên hơn 50 năm tuổi, khoai tây chiên lừng danh thế giới, gà rán giòn da thấm thịt, gà miếng không xương McNugget hay phần ăn Happy Meal dành riêng cho trẻ em... sẽ mang lại cho thực khách Hà thành những trải nghiệm hoàn toàn khác biệt và mới mẻ.</p><figure data-size=\"true\" itemprop=\"associatedMedia image\" itemscope=\"\" itemtype=\"http://schema.org/ImageObject\" class=\"tplCaption action_thumb_added\" style=\"margin-right: auto; margin-bottom: 15px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; text-align: center; width: 670px; float: left; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><div class=\"fig-picture\" style=\"margin: 0px; padding: 0px 0px 333px; text-rendering: optimizelegibility; width: 670px; float: left; display: table; justify-content: center; background: rgb(240, 238, 234); position: relative;\"><picture style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><source data-srcset=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image003-1304-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=qVXcKjI19gDSPcyjaIVrbA 1x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image003-1304-1560743978.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=SFIsV6GiSovM-htm4Sfo3g 1.5x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image003-1304-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=J_TLKSmcUUSedTBgtirddg 2x\" srcset=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image003-1304-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=qVXcKjI19gDSPcyjaIVrbA 1x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image003-1304-1560743978.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=SFIsV6GiSovM-htm4Sfo3g 1.5x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image003-1304-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=J_TLKSmcUUSedTBgtirddg 2x\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><img itemprop=\"contentUrl\" loading=\"lazy\" intrinsicsize=\"680x0\" alt=\"Những khách hàng đầu tiên của McDonalds Vincom Trần Duy Hưng\" class=\"lazy lazied\" src=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image003-1304-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=qVXcKjI19gDSPcyjaIVrbA\" data-src=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image003-1304-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=qVXcKjI19gDSPcyjaIVrbA\" data-ll-status=\"loaded\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; top: 0px; left: 85px; max-height: 700px; width: 500px;\"></picture></div><figcaption itemprop=\"description\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; text-align: left;\"><p class=\"Image\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px;\">Những khách hàng đầu tiên của McDonald\'s Vincom Trần Duy Hưng.</p></figcaption></figure><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Trong năm 2018, McDonald’s Việt Nam ghi nhận mức tăng trưởng doanh thu hơn 30% với mô hình phát triển bền vững nhờ chiến lược bản địa hóa thực đơn để các món ăn phù hợp với khẩu vị của người Việt nhưng vẫn giữ vững bản sắc và chất lượng của thương hiệu McDonald’s toàn cầu. Sự kiện đem lại nhiều tiếng vang cho thương hiệu trong năm 2018 là ra mắt sản phẩm gà rán giòn da thấm thịt phù hợp với nhu cầu ẩm thực địa phương với tham vọng định nghĩa lại tiêu chuẩn chất lượng cho món gà rán tại thị trường Việt Nam.</p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Bên cạnh đó, McDonald’s là một trong những thương hiệu tiên phong trong ngành F&amp;B áp dụng công nghệ và đưa vào hệ thống hỗ trợ đặt hàng tự động (self-order kiosk), ứng dụng mobile tiện ích McDonald’s App hay dịch vụ giao hàng McDelivery.</p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Những sự kiện trên đã phần nào tạo ra cú hích cho thị trường thức ăn nhanh vốn sôi động của Việt Nam, từ đó, các thương hiệu phải liên tục đổi mới và cải thiện sản phẩm, dịch vụ để chiếm được niềm tin cũng như ủng hộ của khách hàng.</p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Trong năm nay, McDonald’s Việt Nam sẽ tiếp tục kế hoạch mở rộng thị trường và gia tăng thị phần. Bên cạnh hai thị trường lớn là TP HCM và Hà Nội, hãng cũng đang khảo sát thị trường, hành vi tiêu dùng của từng khu vực, kết nối hệ thống cung ứng, cũng như đào tạo nhân viên để có thể mở rộng mạng lưới ra các tỉnh, thành phố khác.</p><figure data-size=\"true\" itemprop=\"associatedMedia image\" itemscope=\"\" itemtype=\"http://schema.org/ImageObject\" class=\"tplCaption action_thumb_added\" style=\"margin-right: auto; margin-bottom: 15px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; text-align: center; width: 670px; float: left; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><div class=\"fig-picture\" style=\"margin: 0px; padding: 0px 0px 255.988px; text-rendering: optimizelegibility; width: 670px; float: left; display: table; justify-content: center; background: rgb(240, 238, 234); position: relative;\"><picture style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><source data-srcset=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image005-9022-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=sm2aSQA9QRqf8IczKZ5VNg 1x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image005-9022-1560743978.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=0iW7oDrtnq5EaIPkklxAWQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image005-9022-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=pqOv7MKT7Lbn-z61o3xKvQ 2x\" srcset=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image005-9022-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=sm2aSQA9QRqf8IczKZ5VNg 1x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image005-9022-1560743978.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=0iW7oDrtnq5EaIPkklxAWQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2019/06/17/image005-9022-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=pqOv7MKT7Lbn-z61o3xKvQ 2x\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><img itemprop=\"contentUrl\" loading=\"lazy\" intrinsicsize=\"680x0\" alt=\"Đội ngũ nhân viên nhà hàng McDonalds Vincom Trần Duy Hưng cùng các đại diện quản lý McDonalds Việt Nam.\" class=\"lazy lazied\" src=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image005-9022-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=sm2aSQA9QRqf8IczKZ5VNg\" data-src=\"https://i1-kinhdoanh.vnecdn.net/2019/06/17/image005-9022-1560743978.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=sm2aSQA9QRqf8IczKZ5VNg\" data-ll-status=\"loaded\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; top: 0px; left: 85px; max-height: 700px; width: 500px;\"></picture></div><figcaption itemprop=\"description\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; text-align: left;\"><p class=\"Image\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px;\">Đội ngũ nhân viên nhà hàng McDonald\'s Vincom Trần Duy Hưng cùng các đại diện quản lý McDonald\'s Việt Nam.</p></figcaption></figure><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><br></p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Trong 3 năm tới, doanh nghiệp sẽ tiếp tục tập trung phát triển bền vững, cho ra mắt thêm nhiều món mới để mở rộng tập khách hàng, nâng cao độ phủ và đưa McDonald’s trở thành thương hiệu được số đông khách hàng yêu thích, chọn lựa và tin dùng.</p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">McDonald’s là một trong những chuỗi nhà hàng đồ ăn nhanh quy mô lớn nhất thế giới, có mặt tại hơn 120 quốc gia với số lượng hơn 37.000 tại khắp các châu lục, mỗi ngày phục vụ hơn 70 triệu khách hàng. Khoảng 85% số nhà hàng trên thế giới được sở hữu và vận hành bởi các doanh nhân địa phương.</p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Thương hiệu này bắt đầu hoạt động tại Việt Nam từ đầu tháng 2/2014 với cửa hàng đầu tiên tại TP HCM. Việt Nam là một trong hơn 65 thị trường trên thế giới mà hãng áp dụng phương thức cấp phép phát triển. Phương thức này là một hình thức nhượng quyền đã được McDonald’s sử dụng hơn 30 năm qua trên toàn thế giới nhằm xây dựng và phát triển thương hiệu.</p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Với 21 nhà hàng tại Việt Nam, McDonald’s mang đến những trải nghiệm độc đáo cho người tiêu dùng Việt như dịch vụ mua hàng không cần đỗ xe Drive-thru, nhà hàng phục vụ suốt 24 giờ, dịch vụ giao hàng McDelivery và thương hiệu cà phê chuyên nghiệp McCafé nằm ngay bên trong nhà hàng.</p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Mừng khai trương nhà hàng, McDonald’s đang&nbsp;áp dụng chương trình khuyến mãi mua \"một tặng một\" Big Mac với khách hàng mua trực tiếp tại nhà hàng từ ngày 17/6 đến 23/6.</p><p style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246); text-align: right;\">(Nguồn:<em style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\">&nbsp;McDonald’s</em>)</p></h5>', '<p><span style=\"color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Nhà hàng phục vụ hơn 130 chỗ ngồi với đầy đủ dịch vụ như gọi món ăn và thức uống tại quầy, mua hàng mang đi, đặt hàng tự động...</span><br></p>', 'http://localhost/storage/photos/1/blog-3.png', ',Tin tức,Tag', 4, NULL, 1, 'active', '2022-03-11 01:14:45', '2022-06-14 17:37:07'),
(12, 'Đam mê đồ ăn nhanh khiến Trump mở tiệc burger tại Nhà Trắng', 'dam-me-do-an-nhanh-khien-trump-mo-tiec-burger-tai-nha-trang', '<p>Tin tức nổi bật</p>', '<div class=\"article__sapo cms-desc\" style=\"width: 640px; margin: 15px auto 0px; font-size: 1.8rem; line-height: 2.6rem; font-weight: 600; text-align: justify; color: rgb(51, 51, 51); font-family: roboto, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; background-color: rgb(254, 249, 245);\">Tổng thống Mỹ Donald Trump ngày 4/3 đã mở tiệc đồ ăn nhanh tại Nhà Trắng để mời đội bóng bầu dục Bison của đại học North Dakota. Đây là lần thứ hai ông chủ Nhà Trắng mở tiệc kiểu này.</div><div class=\"article__body cms-body\" style=\"margin-top: 20px; overflow-wrap: break-word; font-size: 1.6rem; line-height: 2.4rem; width: 640px; margin-left: 90px; color: rgb(51, 51, 51); font-family: roboto, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; background-color: rgb(254, 249, 245);\"><p style=\"margin-bottom: 20px; text-align: justify;\">\"Chúng tôi có đầu bếp, nhưng chúng tôi vẫn chọn đồ ăn nhanh bởi tôi biết sở thích của mọi người\", hãng tin ABC News dẫn lời Tổng thống Donald Trump với các vận động viên và huấn luyện viên của đội bóng Bison. Bữa tiệc mà Tổng thống Trump dành để mời đội bóng là tràn ngập những chiếc bánh hamburger Big Mac, các suất gà của Chick-fil-A và khoai tây chiên.</p><p style=\"margin-bottom: 20px; text-align: justify;\">Đây là lần thứ hai ông Trump mở tiệc đồ ăn nhanh tại Nhà Trắng để mời khách. Ngày 14/1, để tổ chức tiệc mừng đội bóng bầu dục Clemson Tigers giành chức vô địch giải sinh viên Mỹ, ông Trump đã tự bỏ ra gần 3.000 USD để mua đồ ăn nhanh đãi đội bóng.</p><p style=\"margin-bottom: 20px; text-align: justify;\">Trong bài phát biểu tại buổi tiệc, ông Trump cho biết ông đã mua khoảng 300 chiếc bánh mì kẹp burger, nhưng trên Twitter sau đó, ông lại hé lộ rằng số burger mà ông mua là trên 1.000 chiếc. Bữa tiệc đồ ăn nhanh lần đầu diễn ra trong bối cảnh chính phủ Mỹ đóng cửa một phần, nhiều nhân viên Nhà Trắng trong đó có các đầu bếp phải nghỉ không lương.</p><p style=\"margin-bottom: 20px; text-align: justify;\">Nói về quyết định lựa chọn tiệc ăn nhanh lần này, ông Trump cho biết ông muốn ủng hộ các doanh nghiệp Mỹ. “Chúng ta yêu thích các doanh nghiệp Mỹ chứ”, ông phát biểu trước các vận động viên đội bóng.</p></div>', '<p><span style=\"color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Trump thích đồ ăn nhanh như burger vì cho rằng chúng có chất lượng đồng đều và đảm bảo vệ sinh an toàn thực phẩm.</span><br></p>', 'http://localhost/storage/photos/1/blog-4.png', 'Tin tức', 4, NULL, 1, 'active', '2022-03-23 10:02:32', '2022-03-23 10:02:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(4, 'enjoy', 'enjoy', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10'),
(5, 'Post Category', 'post-category', 'active', '2020-08-15 06:59:04', '2020-08-15 06:59:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Testing comment edited', 'active', NULL, NULL, '2020-08-14 07:08:42', '2020-08-15 06:59:58'),
(2, NULL, NULL, 'testing 2', 'active', NULL, 1, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
(3, NULL, NULL, 'That\'s cool', 'active', NULL, 2, '2020-08-14 07:12:27', '2020-08-14 07:12:27'),
(4, 1, NULL, 'nice', 'active', NULL, NULL, '2020-08-15 07:31:19', '2020-08-15 07:31:19'),
(5, NULL, NULL, 'nice blog', 'active', NULL, NULL, '2020-08-15 07:51:01', '2020-08-15 07:51:01'),
(6, NULL, NULL, 'nice', 'active', NULL, NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29'),
(7, NULL, NULL, 'really', 'active', NULL, 6, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
(8, 1, NULL, 'very good', 'active', NULL, NULL, '2022-03-09 08:48:19', '2022-03-09 08:48:19'),
(9, 1, 8, 'hay', 'active', NULL, NULL, '2022-03-13 03:48:32', '2022-03-13 03:48:32'),
(10, 1, 10, 'as', 'active', NULL, NULL, '2022-03-18 07:20:53', '2022-03-18 07:20:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Đồ ăn', 'Đồ ăn', 'active', '2020-08-14 01:53:52', '2022-03-23 10:14:47'),
(3, 'Tin tức', 'Tin-tuc', 'active', '2020-08-14 01:54:33', '2022-03-10 14:39:44'),
(4, 'Tag', 'tag', 'active', '2020-08-15 06:59:31', '2020-08-15 06:59:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '1',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(37, 'Combo Burger', 'cam-vinh', '<p>Combo Burger<br></p>', '<ul style=\"margin-bottom: 0px; padding-left: 18px; color: rgb(112, 112, 112); font-family: Asap;\"><li>1 Burger Zinger / 1 Burger Tôm / 1 Burger Gà Quay Flava</li><li>1 Miếng Gà Giòn Cay / 1 Miếng Gà Giòn Không Cay / 1 Miếng Gà Truyền Thống</li><li>1 Pepsi Lon</li></ul>', 'http://localhost/storage/photos/1/Products/combo_1.4.png', 8991, 'S,M,XL', 'new', 'active', 72000.00, 15.00, 1, 1, NULL, 2, '2022-03-11 01:44:31', '2022-06-19 01:38:19'),
(38, 'Combo Mì Ý', 'cay-cam-mau', '<p>Combo Mì Ý<br></p>', '<ul style=\"margin-bottom: 0px; padding-left: 18px; color: rgb(112, 112, 112); font-family: Asap;\"><li>1 Mì Ý Xốt Cà Gà Viên</li><li>1 Miếng Gà Giòn Cay / 1 Miếng Gà Giòn Không Cay / 1 Miếng Gà Truyền Thống / 2 Xiên Gà Tenderods</li><li>1 Pepsi Lon</li></ul>', 'http://localhost/storage/photos/1/Products/combo_1.3.png', 5998, 'S,M,L', 'hot', 'active', 68000.00, 0.00, 1, 1, NULL, 4, '2022-03-11 01:45:05', '2022-06-19 01:34:08'),
(39, 'Combo Gà Quay', 'cay-cam-sanh', '<p>Combo Gà Quay<br></p>', '<ul style=\"margin-bottom: 0px; padding-left: 18px; color: rgb(112, 112, 112); font-family: Asap;\"><li>1 Miếng Đùi Gà Quay Giấy Bạc / 1 Miếng Đùi Gà Quay Tiêu</li><li>1 Cơm Trắng</li><li>1 Pepsi Lon</li></ul>', 'http://localhost/storage/photos/1/Products/combo_1.2.png', 7998, 'S,M,L', 'new', 'active', 75000.00, 10.00, 1, 1, NULL, 4, '2022-03-11 01:45:39', '2022-03-23 09:07:58'),
(40, 'Combo Gà Rán', 'chanh-ngon-tay-uc', '<p>Combo Gà Rán<br></p>', '<ul style=\"margin-bottom: 0px; padding-left: 18px; color: rgb(112, 112, 112); font-family: Asap;\"><li>2 Miếng Gà Giòn Cay / 2 Miếng Gà Giòn Không Cay / 2 Miếng Gà Truyền thống</li><li>1 Pepsi Lon</li></ul>', 'http://localhost/storage/photos/1/Products/combo_1.1.png', 9000, 'S,M,L', 'new', 'active', 63000.00, 20.00, 1, 1, NULL, 1, '2022-03-11 07:06:57', '2022-03-23 09:05:09'),
(41, 'Combo Nhóm 1', 'combo-nhom-1', '<p>Combo Nhóm 1<br></p>', '<ul style=\"margin-bottom: 0px; padding-left: 18px; color: rgb(112, 112, 112); font-family: Asap;\"><li>3 Miếng Gà Giòn Cay / 3 Miếng Gà Giòn Không Cay / 3 Miếng Gà Truyền Thống</li><li>1 Burger Zinger / 1 Burger Tôm / 1 Burger Gà Quay Flava</li><li>2 Pepsi Lon</li></ul>', 'http://localhost/storage/photos/1/Products/combo_nhom_1.png', 6000, 'S,M,L', 'hot', 'active', 132000.00, 12.00, 1, 2, NULL, 1, '2022-03-23 09:16:55', '2022-03-23 09:16:55'),
(42, 'Combo Nhóm 2', 'combo-nhom-2', '<p>Combo Nhóm 2<br></p>', '<ul style=\"margin-bottom: 0px; padding-left: 18px; color: rgb(112, 112, 112); font-family: Asap;\"><li>4 Miếng Gà Giòn Cay / 4 Miếng Gà Giòn Không Cay / 4 Miếng Gà Truyền thống</li><li>2 Thanh Bí Phô-mai</li><li>2 Pepsi Lon</li></ul>', 'http://localhost/storage/photos/1/Products/combo_nhom_2.png', 9800, 'M,L', 'new', 'active', 146000.00, 0.00, 1, 2, NULL, 4, '2022-03-23 09:18:20', '2022-03-23 09:18:20'),
(43, 'Combo Nhóm 3', 'combo-nhom-3', '<p>Combo Nhóm 3<br></p>', '<ul style=\"margin-bottom: 0px; padding-left: 18px; color: rgb(112, 112, 112); font-family: Asap;\"><li>5 Miếng Gà Giòn Cay / 5 Miếng Gà Giòn Không Cay / 5 Miếng Gà Truyền Thống</li><li>1 Popcorn (Vừa) / 2 Xiên Gà Tenderods</li><li>3 Pepsi Lon</li></ul>', 'http://localhost/storage/photos/1/Products/combo_nhom_3.png', 5400, 'S,M,L,XL', 'new', 'active', 175000.00, 0.00, 1, 2, NULL, 2, '2022-03-23 09:20:17', '2022-03-23 09:20:17'),
(44, 'Combo Gia Đình', 'combo-gia-dinh', '<p>Combo Gia Đình<br></p>', '<ul style=\"margin-bottom: 0px; padding-left: 18px; color: rgb(112, 112, 112); font-family: Asap;\"><li>5 Miếng Gà Giòn Cay / 5 Miếng Gà Giòn Không Cay / 5 Miếng Gà Truyền Thống</li><li>2 Burger Zinger / 2 Burger Tôm</li><li>1 Mì Ý Xốt Cà Gà Viên</li><li>3 Thanh Bí Phô-mai</li><li>4 Pepsi Lon</li></ul>', 'http://localhost/storage/photos/1/Products/combo_gia_dinh.png', 6499, 'S,M,L', 'new', 'active', 272000.00, 0.00, 1, 2, NULL, 4, '2022-03-23 09:21:26', '2022-06-19 01:38:19'),
(45, 'BÁNH TRỨNG SÔ-CÔ-LA HẠNH NHÂN (1 CÁI)', 'banh-trung-so-co-la-hanh-nhan-1-cai', '<p>BÁNH TRỨNG SÔ-CÔ-LA HẠNH NHÂN (1 CÁI)<br></p>', '<p>1 Bánh Trứng Sô-Cô-La Hạnh Nhân<br></p>', 'http://localhost/storage/photos/1/Products/uu_dai_1.png', 8550, 'S,M,L', 'hot', 'active', 19000.00, 0.00, 1, 3, NULL, 3, '2022-03-23 09:23:38', '2022-03-23 09:23:38'),
(46, 'BÁNH TRỨNG SÔ-CÔ-LA HẠNH NHÂN (4 CÁI)', 'banh-trung-so-co-la-hanh-nhan-4-cai', '<p>BÁNH TRỨNG SÔ-CÔ-LA HẠNH NHÂN (4 CÁI)<br></p>', '<p>4 Bánh Trứng Sô-Cô-La Hạnh Nhân<br></p>', 'http://localhost/storage/photos/1/Products/uu_dai_2.png', 5400, 'M,L', 'new', 'active', 61000.00, 3.00, 1, 3, NULL, 2, '2022-03-23 09:24:51', '2022-03-23 09:24:51'),
(47, 'Gà Rán (1 Miếng)', 'ga-ran-1-mieng', '<p>Gà Rán (1 Miếng)<br></p>', '<p>1 Miếng Gà Giòn Cay / 1 Miếng Gà Giòn Không Cay / 1 Miếng Gà Truyền Thống<br></p>', 'http://localhost/storage/photos/1/Products/ga_1_mieng.png', 10000, 'S,M,L,XL', 'new', 'active', 35000.00, 0.00, 1, 15, NULL, 3, '2022-03-23 09:27:16', '2022-06-14 17:20:26'),
(48, 'Gà Rán (3 Miếng)', 'ga-ran-3-mieng', '<p>Gà Rán (3 Miếng)<br></p>', '<p>3 Miếng Gà Giòn Cay / 3 Miếng Gà Truyền Thống / 3 Miếng Gà Giòn Không Cay<br></p>', 'http://localhost/storage/photos/1/Products/ga_3_mieng.png', 5000, 'S,M', 'hot', 'active', 101000.00, 0.00, 1, 15, NULL, 4, '2022-03-23 09:28:36', '2022-03-23 09:28:36'),
(49, 'Đùi Gà Quay (1 Miếng)', 'dui-ga-quay-1-mieng', '<p>Đùi Gà Quay (1 Miếng)<br></p>', '<p>1 Miếng Đùi Gà Quay Giấy Bạc / 1 Miếng Đùi Gà Quay Tiêu<br></p>', 'http://localhost/storage/photos/1/Products/ga_pl_1.png', 4000, '', 'new', 'active', 67000.00, 0.00, 1, 15, NULL, 2, '2022-03-23 09:30:04', '2022-06-14 16:02:28'),
(50, 'Phi-lê Gà Quay (1 Miếng)', 'phi-le-ga-quay-1-mieng', '<p>Phi-lê Gà Quay (1 Miếng)<br></p>', '<p>1 Miếng Phi-lê Gà Quay Flava / 1 Miếng Phi-lê Gà Quay Tiêu<br></p>', 'http://localhost/storage/photos/1/Products/ga_pl_2.png', 6000, 'S,M,L', 'new', 'active', 35000.00, 0.00, 1, 15, NULL, 2, '2022-03-23 09:31:20', '2022-03-23 09:31:20'),
(51, 'Cơm Gà Rán (1 Phần)', 'com-ga-ran-1-phan', '<p>Cơm Gà Rán (1 Phần)<br></p>', '<p>Cơm Gà Giòn Cay (1 Phần) / Cơm Gà Giòn Không Cay (1 Phần)<br></p>', 'http://localhost/storage/photos/1/Products/com_1_phan.png', 5000, 'S,M,L', 'new', 'active', 42000.00, 0.00, 1, 15, NULL, 4, '2022-03-23 09:33:32', '2022-03-23 09:33:32'),
(52, 'Cơm Gà Bít-tết (1 Phần)', 'com-ga-bit-tet-1-phan', '<p>Cơm Gà Bít-tết (1 Phần)<br></p>', '<p>Cơm Gà Bít-tết (1 Phần)<br></p>', 'http://localhost/storage/photos/1/Products/ga_bt.png', 4000, 'S,M,L', 'new', 'active', 42000.00, 0.00, 1, 15, NULL, 1, '2022-03-23 09:37:29', '2022-03-23 09:37:29'),
(53, 'Gà Bít-tết với Khoai tây chiên (1 Phần)', 'ga-bit-tet-voi-khoai-tay-chien-1-phan', '<p>Gà Bít-tết với Khoai tây chiên (1 Phần)<br></p>', '<p>Gà Bít-tết với Khoai tây chiên (1 Phần)<br></p>', 'http://localhost/storage/photos/1/Products/ga_bt_khoai.png', 6500, 'S,M,L', 'new', 'active', 42000.00, 0.00, 1, 15, NULL, 2, '2022-03-23 09:39:40', '2022-03-23 09:39:40'),
(54, 'Cơm Phi Lê Gà Giòn (1 Phần)', 'com-phi-le-ga-gion-1-phan', '<p>Cơm Phi Lê Gà Giòn (1 Phần)<br></p>', '<p>Cơm Phi Lê Gà Giòn (1 Phần)<br></p>', 'http://localhost/storage/photos/1/Products/com_pl_gr.png', 4600, 'S,M,L', 'new', 'active', 42000.00, 0.00, 1, 15, NULL, 3, '2022-03-23 09:41:31', '2022-03-23 09:41:31'),
(55, 'Burger Gà Quay Flava (1 Phần)', 'burger-ga-quay-flava-1-phan', '<p>Burger Gà Quay Flava (1 Phần)<br></p>', '<p>Burger Gà Quay Flava (1 Phần)<br></p>', 'http://localhost/storage/photos/1/Products/ga_quay_fl.png', 42000, 'S,M,L', 'new', 'active', 47000.00, 0.00, 1, 15, NULL, 4, '2022-03-23 09:43:20', '2022-03-23 09:43:20'),
(56, 'Mì Ý Xốt Cà Gà Viên (1 Phần)', 'mi-y-xot-ca-ga-vien-1-phan', '<p>Mì Ý Xốt Cà Gà Viên (1 Phần)<br></p>', '<p>Mì Ý Xốt Cà Gà Viên (1 Phần)<br></p>', 'http://localhost/storage/photos/1/Products/my_sot.png', 9000, 'S,M,L', 'new', 'active', 37000.00, 0.00, 1, 15, NULL, 4, '2022-03-23 09:46:11', '2022-03-23 09:46:11'),
(57, 'Hot Wings (3 Miếng)', 'hot-wings-3-mieng', '<p>Hot Wings (3 Miếng)<br></p>', '<p>Hot Wings (3 Miếng)<br></p>', 'http://localhost/storage/photos/1/Products/hot_sw.png', 80000, '', 'hot', 'active', 40000.00, 0.00, 1, 15, NULL, 3, '2022-03-23 09:47:50', '2022-06-14 15:59:08'),
(58, 'Phô mai viên (6 viên)', 'pho-mai-vien-6-vien', '<p>Phô mai viên (6 viên)<br></p>', '<p>Phô mai viên (6 viên)<br></p>', 'http://localhost/storage/photos/1/Products/pho_mai.png', 20, 'S,M,L', 'new', 'active', 60000.00, 20.00, 1, 15, NULL, 3, '2022-03-23 09:49:01', '2022-06-14 16:10:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 5, 'nice product', 'active', '2020-08-15 07:44:05', '2020-08-15 07:44:05'),
(2, NULL, NULL, 5, 'nice', 'active', '2020-08-17 21:08:14', '2020-08-17 21:18:31'),
(3, 1, NULL, 5, 'Sản phẩm này khá sạch và đảm bảo', 'active', '2022-03-10 00:47:31', '2022-03-10 00:47:31'),
(4, 1, NULL, 3, 'Nhaanj xét sản phẩm', 'active', '2022-03-10 04:28:43', '2022-03-10 04:28:43'),
(5, 1, 39, 3, 'hàng ngon', 'active', '2022-03-13 03:49:58', '2022-03-13 03:49:58'),
(6, 1, NULL, 4, 'ngọt', 'active', '2022-03-16 03:20:46', '2022-03-16 03:20:46'),
(7, 4, 37, 5, 'đồ ăn ngon', 'active', '2022-06-18 06:44:28', '2022-06-18 06:44:28'),
(8, 4, 37, 5, 'Ship nhanh , sẽ ủng hộ quán', 'active', '2022-06-18 06:57:07', '2022-06-18 06:57:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.', 'http://localhost/storage/photos/1/logo_shop.png', 'http://localhost/storage/photos/1/blog3.png', 'Quận Hai Bà Trưng, Hà Nội.', '(0123) 456 789', 'fastfood@gmail.com', NULL, '2022-03-23 10:14:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(2, 'LoShip', '20000.00', 'active', '2020-08-14 04:22:41', '2022-03-09 01:21:35'),
(4, 'NowShip', '24000.00', 'active', '2020-08-17 20:50:48', '2022-03-09 01:22:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'FastFood', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/users/user1.jpg', 'admin', NULL, NULL, 'active', '4YRARtT5gEJwf0DH51B8yivnJ9wV3VzcgrT28qaExv3XUV3we2q73SjrFNgH', NULL, '2022-03-23 13:12:13'),
(2, 'yến', 'lthaiyen1111@gmail.com', NULL, '$2y$10$2N2C15Zqm.xRUWX9hVAcN.m44sETOGt7pQK08ZA/DzLRKytvpg1u.', NULL, 'user', NULL, NULL, 'active', NULL, '2022-06-16 03:06:44', '2022-06-16 03:06:44'),
(3, 'Shipper', 'shipper@gmail.com', NULL, '$2y$10$BFD3pCf9zW9kzCzSOTNBnOfYIxxs/yo4eQGkn7dDOxThYoSOzbNta', NULL, 'user', NULL, NULL, 'active', NULL, '2022-06-16 11:59:23', '2022-06-16 11:59:23'),
(4, 'Hải Yến', 'thuha123@gmail.com', NULL, '$2y$10$051Sb1nHJweMHJuAr4rkU.Bak4GKwv0Pq0ZHiATT3YcMkHLdRSUiu', NULL, 'user', NULL, NULL, 'active', NULL, '2022-06-18 03:49:07', '2022-06-18 03:49:07'),
(5, 'Tuấn Nguyễn', 'TuanNg2000@gmail.com', NULL, '$2y$10$EX7.EQhLvrGq64DiMftCgODD/mLCKuowCVCyyaI9OdwRVfEOB/Cge', NULL, 'user', NULL, NULL, 'active', NULL, '2022-06-18 06:18:30', '2022-06-18 06:18:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 37, NULL, 1, 61200.00, 1, 61200.00, '2022-06-16 15:03:13', '2022-06-16 15:03:13');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Chỉ mục cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
