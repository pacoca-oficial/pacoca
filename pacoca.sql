-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 09/10/2023 às 19:15
-- Versão do servidor: 10.6.15-MariaDB-cll-lve
-- Versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ydxqbuql_pacoca2`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `comments`
--

INSERT INTO `comments` (`id`, `id_post`, `id_user`, `text`, `created_at`, `updated_at`) VALUES
(3, 29, 1, 'Gostei muito', '2023-08-08 18:32:31', '2023-08-08 18:32:31'),
(4, 29, 1, 'Legal mesmo', '2023-08-18 04:42:47', '2023-08-18 04:42:47'),
(5, 31, 3, 'Legal', '2023-08-18 18:16:06', '2023-08-18 18:16:06'),
(6, 33, 1, 'Congratulations :) Thanks and very wall', '2023-09-16 23:34:50', '2023-09-16 23:34:50');

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
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
-- Estrutura para tabela `followers`
--

CREATE TABLE `followers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_following` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `followers`
--

INSERT INTO `followers` (`id`, `id_user`, `id_following`, `created_at`, `updated_at`) VALUES
(61, 1, 2, '2023-08-08 18:32:51', '2023-08-08 18:32:51'),
(62, 3, 2, '2023-08-08 18:33:13', '2023-08-08 18:33:13'),
(63, 3, 1, '2023-08-08 18:34:40', '2023-08-08 18:34:40'),
(64, 1, 4, '2023-09-16 23:27:51', '2023-09-16 23:27:51'),
(65, 4, 1, '2023-09-16 23:30:33', '2023-09-16 23:30:33'),
(66, 2, 4, '2023-09-16 23:37:35', '2023-09-16 23:37:35'),
(67, 4, 2, '2023-09-16 23:39:07', '2023-09-16 23:39:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `images_post`
--

CREATE TABLE `images_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `images_post`
--

INSERT INTO `images_post` (`id`, `id_post`, `path`, `type`, `created_at`, `updated_at`) VALUES
(21, 27, '../img/img_post/27.png', 0, '2023-08-07 17:09:51', '2023-08-07 17:09:51'),
(23, 29, 'public/img/img_post/29.png', 0, '2023-08-07 17:14:34', '2023-08-07 17:14:34'),
(24, 31, 'public/img/img_post/31.png', 0, '2023-08-18 17:14:04', '2023-08-18 17:14:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(89, '2014_10_12_000000_create_users_table', 1),
(90, '2014_10_12_100000_create_password_resets_table', 1),
(91, '2019_08_19_000000_create_failed_jobs_table', 1),
(92, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(93, '2023_07_11_214633_create_posts_table', 1),
(94, '2023_07_11_215109_create_post_tags_table', 1),
(95, '2023_07_11_215253_create_stories_table', 1),
(96, '2023_07_12_174101_create_posts_likes_table', 1),
(97, '2023_07_13_155807_create_comments_table', 1),
(98, '2023_07_13_192514_create_followers_table', 1),
(99, '2023_07_16_234240_create_notifications_table', 1),
(100, '2023_07_18_211051_create_images_post_table', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `img_notification` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `link1` varchar(255) NOT NULL,
  `link2` varchar(255) NOT NULL,
  `read` int(11) NOT NULL,
  `opened` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `notifications`
--

INSERT INTO `notifications` (`id`, `id_user`, `img_notification`, `text`, `link1`, `link2`, `read`, `opened`, `created_at`, `updated_at`) VALUES
(1, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 1, '2023-07-19 00:14:21', '2023-09-07 18:02:44'),
(2, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 00:14:24', '2023-07-19 00:14:28'),
(3, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 01:05:21', '2023-07-19 01:29:52'),
(4, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 01:05:27', '2023-07-19 01:29:52'),
(5, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 01:05:30', '2023-07-19 01:29:52'),
(6, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:05:42', '2023-08-07 17:14:44'),
(7, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:06:29', '2023-08-07 17:14:44'),
(8, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:06:31', '2023-08-07 17:14:44'),
(9, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:06:32', '2023-08-07 17:14:44'),
(10, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:07:40', '2023-08-07 17:14:44'),
(11, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:07:54', '2023-08-07 17:14:44'),
(12, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:08:13', '2023-08-07 17:14:44'),
(13, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:11:46', '2023-08-07 17:14:44'),
(14, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:11:49', '2023-08-07 17:14:44'),
(15, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:11:54', '2023-08-07 17:14:44'),
(16, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:12:14', '2023-08-07 17:14:44'),
(17, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:12:33', '2023-08-07 17:14:44'),
(18, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 01:12:58', '2023-07-19 01:29:52'),
(19, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:13:22', '2023-08-07 17:14:44'),
(20, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:16:51', '2023-08-07 17:14:44'),
(21, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:16:58', '2023-08-07 17:14:44'),
(22, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:17:00', '2023-08-07 17:14:44'),
(23, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:17:09', '2023-08-07 17:14:44'),
(24, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:18:27', '2023-08-07 17:14:44'),
(25, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:18:29', '2023-08-07 17:14:44'),
(26, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:18:31', '2023-08-07 17:14:44'),
(27, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:18:42', '2023-08-07 17:14:44'),
(28, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:18:45', '2023-08-07 17:14:44'),
(29, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:18:46', '2023-08-07 17:14:44'),
(30, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:18:47', '2023-08-07 17:14:44'),
(31, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:18:48', '2023-08-07 17:14:44'),
(32, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:18:48', '2023-08-07 17:14:44'),
(33, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:18:58', '2023-08-07 17:14:44'),
(34, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:18:59', '2023-08-07 17:14:44'),
(35, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:18:59', '2023-08-07 17:14:44'),
(36, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:19:23', '2023-08-07 17:14:44'),
(37, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:20:02', '2023-08-07 17:14:44'),
(38, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:20:06', '2023-08-07 17:14:44'),
(39, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:20:13', '2023-08-07 17:14:44'),
(40, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:21:31', '2023-08-07 17:14:44'),
(41, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:21:33', '2023-08-07 17:14:44'),
(42, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:23:29', '2023-08-07 17:14:44'),
(43, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:26:05', '2023-08-07 17:14:44'),
(44, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:26:10', '2023-08-07 17:14:44'),
(45, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:26:20', '2023-08-07 17:14:44'),
(46, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:26:21', '2023-08-07 17:14:44'),
(47, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:26:22', '2023-08-07 17:14:44'),
(48, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:26:23', '2023-08-07 17:14:44'),
(49, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:27:02', '2023-08-07 17:14:44'),
(50, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:27:03', '2023-08-07 17:14:44'),
(51, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:28:07', '2023-08-07 17:14:44'),
(52, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:28:14', '2023-08-07 17:14:44'),
(53, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:28:15', '2023-08-07 17:14:44'),
(54, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:28:20', '2023-08-07 17:14:44'),
(55, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:29:09', '2023-08-07 17:14:44'),
(56, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:29:10', '2023-08-07 17:14:44'),
(57, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:29:15', '2023-08-07 17:14:44'),
(58, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:29:39', '2023-08-07 17:14:44'),
(59, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:29:42', '2023-08-07 17:14:44'),
(60, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-19 01:29:44', '2023-08-07 17:14:44'),
(61, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 01:29:57', '2023-07-19 01:59:08'),
(62, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 01:29:59', '2023-07-19 01:59:08'),
(63, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 01:30:02', '2023-07-19 01:59:08'),
(64, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 01:30:27', '2023-07-19 01:59:08'),
(65, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 01:34:20', '2023-07-19 01:59:08'),
(66, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 01:38:20', '2023-07-19 01:59:08'),
(67, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 01:41:52', '2023-07-19 01:59:08'),
(68, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 03:24:51', '2023-07-19 03:24:52'),
(69, 1, '../img/img_account/1.png', 'João comentou sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 03:34:37', '2023-07-19 05:29:54'),
(70, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-19 03:36:00', '2023-07-19 05:29:54'),
(71, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-25 19:50:22', '2023-08-07 17:14:44'),
(72, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-07-26 19:57:17', '2023-08-07 17:14:44'),
(73, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-07-26 19:59:39', '2023-07-26 20:39:47'),
(74, 1, '../img/img_account/1.png', 'João comentou sua publicação', '/joao', '/joao', 1, 0, '2023-07-26 20:39:15', '2023-07-26 20:39:47'),
(75, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-08-07 15:56:44', '2023-08-07 17:14:44'),
(76, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-08-07 15:56:56', '2023-08-07 17:14:44'),
(77, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-08-07 15:58:06', '2023-08-07 15:58:13'),
(78, 2, '../img/pacoca-fundo.png', 'Paçoca curtiu sua publicação', '/pacoca', '/pacoca', 1, 0, '2023-08-07 17:16:16', '2023-09-16 23:38:08'),
(79, 2, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-08-08 18:32:20', '2023-09-16 23:38:08'),
(80, 2, '../img/img_account/1.png', 'João comentou sua publicação', '/joao', '/joao', 1, 0, '2023-08-08 18:32:31', '2023-09-16 23:38:08'),
(81, 2, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 0, '2023-08-08 18:32:51', '2023-09-16 23:38:08'),
(82, 2, '../img/img_account/3.png', 'elaine curtiu sua publicação', '/elaine', '/elaine', 1, 0, '2023-08-08 18:33:09', '2023-09-16 23:38:08'),
(83, 2, '../img/img_account/3.png', 'elaine começou a te seguir', '/elaine', '/elaine', 1, 0, '2023-08-08 18:33:13', '2023-09-16 23:38:08'),
(84, 1, '../img/img_account/3.png', 'elaine começou a te seguir', '/elaine', '/elaine', 1, 0, '2023-08-08 18:34:40', '2023-08-14 16:16:41'),
(85, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-08-17 16:29:35', '2023-08-18 17:11:26'),
(86, 2, '../img/img_account/1.png', 'João comentou sua publicação', '/joao', '/joao', 1, 0, '2023-08-18 04:42:47', '2023-09-16 23:38:08'),
(87, 1, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 1, '2023-08-18 17:14:26', '2023-09-07 18:02:35'),
(88, 1, '../img/img_account/3.png', 'elaine curtiu sua publicação', '/elaine', '/elaine', 1, 1, '2023-08-18 18:15:56', '2023-09-07 17:57:12'),
(89, 1, '../img/img_account/3.png', 'elaine comentou sua publicação', '/elaine', '/elaine', 1, 1, '2023-08-18 18:16:06', '2023-08-18 18:16:54'),
(90, 4, '../img/pacoca-fundo.png', 'Seja bem vindo ao Paçoca, sua nova rede social', '/pacoca', '/pacoca', 1, 1, '2023-09-16 23:26:49', '2023-09-17 03:21:40'),
(91, 4, '../img/img_account/1.png', 'João começou a te seguir', '/joao', '/joao', 1, 1, '2023-09-16 23:27:51', '2023-09-16 23:30:31'),
(92, 1, '../img/img-account.png', 'Andrei começou a te seguir', '/@andreiluiz', '/@andreiluiz', 1, 0, '2023-09-16 23:30:33', '2023-09-16 23:35:02'),
(93, 4, '../img/img_account/1.png', 'João curtiu sua publicação', '/joao', '/joao', 1, 0, '2023-09-16 23:34:27', '2023-09-16 23:34:58'),
(94, 4, '../img/img_account/1.png', 'João comentou sua publicação', '/joao', '/joao', 1, 0, '2023-09-16 23:34:50', '2023-09-16 23:34:58'),
(95, 1, '../img/img-account.png', 'Andrei curtiu sua publicação', '/andreiluiz', '/andreiluiz', 1, 0, '2023-09-16 23:37:32', '2023-09-17 07:29:57'),
(96, 2, '../img/img-account.png', 'Andrei curtiu sua publicação', '/andreiluiz', '/andreiluiz', 1, 0, '2023-09-16 23:37:33', '2023-09-16 23:38:08'),
(97, 4, '../img/pacoca-fundo.png', 'Paçoca começou a te seguir', '/pacoca', '/pacoca', 1, 1, '2023-09-16 23:37:35', '2023-09-17 00:24:47'),
(98, 1, '../img/img-account.png', 'Andrei curtiu sua publicação', '/andreiluiz', '/andreiluiz', 1, 1, '2023-09-16 23:37:45', '2023-09-30 22:01:02'),
(99, 1, '../img/img-account.png', 'Andrei curtiu sua publicação', '/andreiluiz', '/andreiluiz', 1, 1, '2023-09-16 23:37:46', '2023-09-30 18:49:34'),
(100, 2, '../img/img-account.png', 'Andrei curtiu sua publicação', '/andreiluiz', '/andreiluiz', 1, 0, '2023-09-16 23:37:50', '2023-09-16 23:38:08'),
(101, 1, '../img/img-account.png', 'Andrei curtiu sua publicação', '/andreiluiz', '/andreiluiz', 1, 1, '2023-09-16 23:37:56', '2023-09-30 18:49:31'),
(102, 2, '../img/img-account.png', 'Andrei começou a te seguir', '/andreiluiz', '/andreiluiz', 1, 0, '2023-09-16 23:39:07', '2023-09-16 23:42:15'),
(103, 4, '../img/pacoca-fundo.png', 'Paçoca curtiu sua publicação', '/pacoca', '/pacoca', 1, 0, '2023-09-17 01:21:10', '2023-09-17 03:21:05'),
(104, 5, '../img/pacoca-fundo.png', 'Seja bem vindo ao Paçoca, sua nova rede social', '/pacoca', '/pacoca', 1, 0, '2023-09-17 07:36:37', '2023-09-17 07:37:06');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
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
-- Estrutura para tabela `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `posts`
--

INSERT INTO `posts` (`id`, `id_user`, `text`, `created_at`, `updated_at`) VALUES
(27, 1, 'TCC 😎', '2023-08-07 17:09:51', '2023-08-08 18:32:12'),
(29, 2, 'Eai, gostaram do Paçoca?', '2023-08-07 17:14:34', '2023-08-07 17:14:34'),
(30, 1, 'Olá', '2023-08-18 17:13:17', '2023-08-18 17:13:17'),
(31, 1, 'Meu projeto de redes.', '2023-08-18 17:14:02', '2023-08-18 17:14:02'),
(33, 4, 'Início de uma New Agee 🔥🔥🔥', '2023-09-16 23:32:39', '2023-09-17 03:27:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `posts_likes`
--

CREATE TABLE `posts_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `posts_likes`
--

INSERT INTO `posts_likes` (`id`, `id_user`, `id_post`, `created_at`, `updated_at`) VALUES
(18, 2, 29, '2023-08-07 17:16:16', '2023-08-07 17:16:16'),
(19, 1, 29, '2023-08-08 18:32:20', '2023-08-08 18:32:20'),
(20, 3, 29, '2023-08-08 18:33:09', '2023-08-08 18:33:09'),
(21, 1, 27, '2023-08-17 16:29:35', '2023-08-17 16:29:35'),
(22, 1, 31, '2023-08-18 17:14:26', '2023-08-18 17:14:26'),
(23, 3, 31, '2023-08-18 18:15:56', '2023-08-18 18:15:56'),
(24, 1, 33, '2023-09-16 23:34:27', '2023-09-16 23:34:27'),
(27, 4, 31, '2023-09-16 23:37:45', '2023-09-16 23:37:45'),
(28, 4, 30, '2023-09-16 23:37:46', '2023-09-16 23:37:46'),
(29, 4, 29, '2023-09-16 23:37:50', '2023-09-16 23:37:50'),
(30, 4, 27, '2023-09-16 23:37:56', '2023-09-16 23:37:56'),
(31, 2, 33, '2023-09-17 01:21:10', '2023-09-17 01:21:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `pos_x` int(11) NOT NULL,
  `pos_y` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `stories`
--

CREATE TABLE `stories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `site` varchar(255) DEFAULT NULL,
  `biography` varchar(255) DEFAULT NULL,
  `sexo` varchar(255) DEFAULT NULL,
  `img_account` varchar(255) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `user_name`, `email`, `email_verified_at`, `password`, `phone`, `site`, `biography`, `sexo`, `img_account`, `birth_date`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'João', 'joao', 'joao@gmail.com', NULL, '$2y$10$LJVlkRY31qVt85MItzLq5ODDDlC4/zh2uFFYHSJlvULtU0e6t/UxW', '11 929378856', NULL, 'Estudo DS', 'Masculino', '../img/img_account/1.png', '2005-08-13', 'S92W8Q07c5hGwLNgUmRw05K5nAjW1PTIERWzSIsfuwyQ7av3sgqCKXz1z5nC', '2023-07-19 00:13:44', '2023-07-19 00:13:44'),
(2, 'Paçoca', 'pacoca', 'pacoca@gmail.com', NULL, '$2y$10$HPf65eca1Zlj./c/rM14W.E.Uf24THUNGu5voQP/llUHsraK0JgZ.', '11 929378856', NULL, 'Criador dessa rede social', '', '../img/pacoca-fundo.png', '2005-08-13', NULL, '2023-07-19 00:13:44', '2023-07-19 00:13:44'),
(3, 'elaine', 'elaine', 'elaine@gmail.com', NULL, '$2y$10$2uFpHGppOOEhIbI5b3gDK.nUbuz.6xvNnhS1uwkSpoF9HLc7Qv6Du', '11 929378856', NULL, '', '', '../img/img_account/3.png', '2005-08-13', NULL, '2023-07-19 00:13:44', '2023-07-19 00:13:44'),
(4, 'Andrei', 'andreiluiz', 'andrei.matias@etec.sp.gov.br', NULL, '$2y$10$NnOhTgkRmd0h2r0vy9qsauj8mApo.Sf2AOa973IqbXroMscQ.Eqi.', '(11) 95406-8821', NULL, 'First user hereee', 'Avatar 💙', NULL, '2006-02-25', NULL, '2023-09-16 23:26:49', '2023-09-16 23:34:47'),
(5, 'Tânia Carol', 'Tânia', 'tania.fernandez@gmail', NULL, '$2y$10$ygaWMb5H.XyuZVStypoqKOPGHEc81YDjevVGIZo4PYUEun4EZzDje', '1195 7137235', NULL, 'A vida não é um morango', 'Feminino', NULL, '2005-05-03', NULL, '2023-09-17 07:36:37', '2023-09-17 07:36:37');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_id_post_foreign` (`id_post`),
  ADD KEY `comments_id_user_foreign` (`id_user`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices de tabela `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followers_id_user_foreign` (`id_user`),
  ADD KEY `followers_id_following_foreign` (`id_following`);

--
-- Índices de tabela `images_post`
--
ALTER TABLE `images_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_post_id_post_foreign` (`id_post`);

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_id_user_foreign` (`id_user`);

--
-- Índices de tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices de tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_id_user_foreign` (`id_user`);

--
-- Índices de tabela `posts_likes`
--
ALTER TABLE `posts_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_likes_id_user_foreign` (`id_user`),
  ADD KEY `posts_likes_id_post_foreign` (`id_post`);

--
-- Índices de tabela `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tags_id_post_foreign` (`id_post`),
  ADD KEY `post_tags_id_user_foreign` (`id_user`);

--
-- Índices de tabela `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stories_id_user_foreign` (`id_user`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_name_unique` (`user_name`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de tabela `images_post`
--
ALTER TABLE `images_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de tabela `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `posts_likes`
--
ALTER TABLE `posts_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `stories`
--
ALTER TABLE `stories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_id_following_foreign` FOREIGN KEY (`id_following`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `followers_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `images_post`
--
ALTER TABLE `images_post`
  ADD CONSTRAINT `images_post_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`);

--
-- Restrições para tabelas `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `posts_likes`
--
ALTER TABLE `posts_likes`
  ADD CONSTRAINT `posts_likes_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `posts_likes_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_tags_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `stories_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
