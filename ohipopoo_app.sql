-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2021 at 06:48 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ohipopoo_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_super` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `full_name`, `username`, `email`, `contact`, `password`, `is_super`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Bimeri Noel', 'Bimeri', 'bimerinoel@gmail.com', '678657959', '$2y$10$f8EYzAq6K15FdOaITi4kaeAWruhWK4jf7Qawtj7M3qZDlq2ke/QXi', 1, NULL, '2020-11-15 17:39:12', '2020-11-15 17:39:12'),
(2, 'Tanyi AY', 'tanyi', 'tanyiayukegba@gmail.com', '672415123', '$2y$10$G3kaanC0KI46S2/m8BcSWOMQG/VLzEFVqDjcAqFGfr5lZ/fxRWJdi', 1, NULL, '2020-11-16 04:01:31', '2020-11-16 04:01:31');

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
-- Table structure for table `full_time_payments`
--

CREATE TABLE `full_time_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` int(10) UNSIGNED DEFAULT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `paymentMonths` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_channel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` int(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `levelName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'formThree',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `type_id`, `levelName`, `created_at`, `updated_at`) VALUES
(1, 1, 'form3', '2020-10-17 17:36:27', '2020-10-17 17:36:27'),
(2, 1, 'form4', '2020-10-17 17:36:27', '2020-10-17 17:36:27'),
(3, 1, 'form5', '2020-10-17 17:36:27', '2020-10-17 17:36:27'),
(4, 1, 'lowerSixth', '2020-10-17 17:36:28', '2020-10-17 17:36:28'),
(5, 1, 'upperSixth', '2020-10-17 17:36:28', '2020-10-17 17:36:28'),
(6, 2, 'oLevel', '2020-10-17 17:36:28', '2020-10-17 17:36:28'),
(7, 2, 'aLevelArt', '2020-10-17 17:36:28', '2020-10-17 17:36:28'),
(8, 2, 'aLevelScience', '2020-10-17 17:36:28', '2020-10-17 17:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `likedislikes`
--

CREATE TABLE `likedislikes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `topicvideo_id` int(10) UNSIGNED NOT NULL,
  `like` tinyint(1) NOT NULL DEFAULT 0,
  `dislike` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likedislikes`
--

INSERT INTO `likedislikes` (`id`, `user_id`, `topicvideo_id`, `like`, `dislike`, `created_at`, `updated_at`) VALUES
(6, 3, 16, 1, 0, '2020-11-16 09:58:23', '2020-12-21 19:00:41'),
(7, 3, 13, 1, 0, '2020-12-06 10:54:04', '2020-12-06 10:54:04');

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
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2020_10_07_122714_create_types_table', 1),
(10, '2020_10_07_123345_create_levels_table', 1),
(11, '2020_10_07_222902_create_useroptions_table', 1),
(12, '2020_10_09_010339_create_subjects_table', 1),
(13, '2020_10_10_144251_create_usersubjects_table', 1),
(14, '2020_10_18_201005_create_topics_table', 2),
(15, '2020_10_18_201936_create_topicvideos_table', 2),
(16, '2020_10_26_101048_create_subject__users_table', 3),
(17, '2020_11_01_035504_create_payments_table', 3),
(18, '2020_11_01_054520_create_full_time_payments_table', 4),
(22, '2020_11_15_171353_create_admins_table', 5),
(23, '2020_11_15_184542_create_teachers_table', 6),
(24, '2020_11_16_073738_create_likedislikes_table', 7),
(25, '2020_11_19_071658_create_views_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('546974995afab5ff5ab69da7e7d611500c41cdf355d9ba96417e74a953a59291309f2b507a5f9a0c', 16, 1, 'PERSONAL_ACCESS_TOKEN', '[]', 0, '2021-02-06 17:28:18', '2021-02-06 17:28:18', '2021-02-13 18:28:15'),
('6509dc372a0c828a93b392fff8d56fc77d09aa20e5519031710110c62a65261e09d1639f658f562c', 9, 1, 'PERSONAL_ACCESS_TOKEN', '[]', 0, '2020-11-20 20:24:35', '2020-11-20 20:24:35', '2020-11-21 21:24:31'),
('c89ac02511338948d3e9bcbd4e38a0ed5741a7630ce2ac23cd86ad9212434217eb8579605cc2c8d2', 16, 1, 'PERSONAL_ACCESS_TOKEN', '[]', 0, '2020-12-29 23:25:04', '2020-12-29 23:25:04', '2020-12-31 00:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'I5jXGWKexTRK9sAcigklfjThZPXf07dnMNsscjJo', NULL, 'http://localhost', 1, 0, 0, '2020-10-17 17:37:39', '2020-10-17 17:37:39'),
(2, NULL, 'Laravel Password Grant Client', 'ZlVN4UBc70VM930pMNrCyXaHyrk6jcWLUl47NBQ3', 'users', 'http://localhost', 0, 1, 0, '2020-10-17 17:37:39', '2020-10-17 17:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-17 17:37:39', '2020-10-17 17:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `part_time_payments`
--

CREATE TABLE `part_time_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `phoneNumber` int(10) UNSIGNED DEFAULT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `paymentDate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_channel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` int(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `part_time_payments`
--

INSERT INTO `part_time_payments` (`id`, `user_id`, `phoneNumber`, `amount`, `paymentDate`, `payment_channel`, `transaction_id`, `created_at`, `updated_at`) VALUES
(2, 5, 678657959, 1, '01/11/2020', NULL, NULL, '2020-11-01 15:01:25', '2020-11-01 15:01:25'),
(3, 3, 678657959, 800, '02/11/2020', '', NULL, '2020-11-02 03:50:53', '2020-11-02 03:50:53'),
(15, 3, 678657959, 800, '2020-Nov-21 12:11:00', '', NULL, '2020-11-21 01:00:22', '2020-11-21 01:00:22'),
(16, 3, 656670795, 800, '2121-Feb-06 12:02:00', 'Orange Money', NULL, '2021-02-06 14:10:45', '2021-02-06 14:10:45'),
(17, 3, 678657959, 800, '2121-Feb-06 12:02:00', 'MTN Mobile Money', NULL, '2021-02-06 14:13:18', '2021-02-06 14:13:18');

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
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `level_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Cameroon Teacher',
  `topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `level_id`, `name`, `author`, `topic`, `url`, `logo`, `created_at`, `updated_at`) VALUES
(1, 8, 'Physics', 'Nelkon with Paker', '8', 'https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4', 'asset/images/Physics.png', '2020-10-17 17:36:43', '2020-11-17 22:07:04'),
(2, 8, 'Chemistry', 'Ngule Emmanuel', '15', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4', 'asset/images/Chemistry.png', '2020-10-17 17:36:43', '2020-10-17 17:36:43'),
(3, 8, 'Biology', 'Tapong Sylvester', '11', 'https://www.googleapis.com/drive/v3/files/1otTfVbHN25XEBVO6K2rYo3_qC8jUKZm1?alt=media&key=AIzaSyBq--c-pvDnzDfG6--HwOuMvOdS1ASJoVE', 'asset/images/Biology.png', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(4, 8, 'Pure Mathematics with Statistics', 'Chadler Bostock', '11', 'https://www.googleapis.com/drive/v3/files/1NVWAegnn2MLtf0zk2UP21uaKCdIKWW1l?alt=media&key=AIzaSyCEUgF8rXlqXwoiXJIrO7lahJKi-mfCmVA', 'asset/images/maths_with_statistics.jpg', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(5, 8, 'Pure Mathematics with Mechanics', 'Chadler Bostock', '11', 'https://www.googleapis.com/drive/v3/files/10YtZUzbQE57xrVO1wzOBq-1-Wg0hODgZ?alt=media&key=AIzaSyBQmDvNblg1yFgHGX7ZJ2BTef2fJKd-XZ8', 'asset/images/maths_with_mechanics.jpg', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(6, 8, 'Geology', 'Unknown', '6', 'https://www.googleapis.com/drive/v3/files/1VmfAqeEkPyPFmnBavG3GNTfo3_8SJBOQ?alt=media&key=AIzaSyCSjp80XrDBXFafzzyqWLUO2nDczjC38m0', 'asset/images/geology.png', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(7, 8, 'Food Science', 'Peter Eves', '6', 'https://www.googleapis.com/drive/v3/files/1aj3SxFCSkvQrSN0Z7yCToil03h1IbuJV?alt=media&key=AIzaSyBAFAIiNLasrJ2u3q09CdDnwXN1-dbm0zk', 'asset/images/Food_Science_and_Nutrition.png', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(8, 8, 'Further Mathematics', 'Bostock and Chadler', '10', 'https://www.googleapis.com/drive/v3/files/1BhRlew5oHudPooIZ7fwHBH6Nig1FRQXg?alt=media&key=AIzaSyBq--c-pvDnzDfG6--HwOuMvOdS1ASJoVE', 'asset/images/further_maths.png', '2020-10-17 17:36:44', '2020-11-17 22:07:48'),
(9, 8, 'Computer Science', 'Unknown', '16', 'https://www.googleapis.com/drive/v3/files/1aR7IyX0-PjzhKhTG88I0q1PPDqnBcFjB?alt=media&key=AIzaSyDOJaT4HZwIdKLz_obWjn832oBTkcIIZy0', 'asset/images/computer_science.png', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(10, 8, 'Information and Communication Technology', 'Unknown', '16', 'https://www.googleapis.com/drive/v3/files/10YtZUzbQE57xrVO1wzOBq-1-Wg0hODgZ?alt=media&key=AIzaSyBQmDvNblg1yFgHGX7ZJ2BTef2fJKd-XZ8', 'asset/images/ICT.png', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(11, 8, 'Religious Studies', 'Unknown', '16', 'https://www.googleapis.com/drive/v3/files/10YtZUzbQE57xrVO1wzOBq-1-Wg0hODgZ?alt=media&key=AIzaSyBQmDvNblg1yFgHGX7ZJ2BTef2fJKd-XZ8', 'asset/images/Religious_studies.jpg', '2020-10-17 17:36:45', '2020-10-17 17:36:45'),
(12, 4, 'English', 'Noel Magaza', '10', 'Http://English', 'asset/images/English Language.png', '2020-11-16 12:39:57', '2020-11-16 12:39:57'),
(19, 7, 'History', 'Noel', '7', 'Http://Englishlit', 'asset/images/history.png', '2020-11-16 14:13:10', '2020-11-16 14:13:10'),
(22, 2, 'English Literature', 'lucy', '2', 'Http://fhrerbrffgxhthdhrnjbstvsgbrhtfs', 'asset/images/Literature.jpg', '2020-11-16 14:21:49', '2020-11-16 14:21:49'),
(23, 3, 'algorithm', 'Noel Magazq', '21', 'Http://fhrerbrffgxhthdhrnjbstvsgbrfvdfrommagaza', 'asset/images/Food_Science_and_Nutrition.png', '2020-11-19 10:26:03', '2020-11-19 10:26:03'),
(24, 2, 'Commerce', 'Noel Magaza', '44', 'Http://fhrerbrffgxhthdhrnjbstvsgbrfgtsrgr', 'asset/images/Commerce.png', '2020-11-19 10:26:46', '2020-11-19 10:26:46'),
(25, 7, 'Philosophy', 'Noel Magaza Coff', '14', 'Http://fhrerbrffgxhthdhrnjbstvsgbrfvdphilofd', 'asset/images/Philosophy.png', '2020-11-19 10:27:46', '2020-11-19 10:27:46'),
(27, 1, 'Mathematics', 'Noel Magaza v', '5', 'Http://Englishsfnryg', 'asset/images/maths_with_mechanics.jpg', '2020-11-19 11:21:19', '2020-11-19 11:21:19');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `topicName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `subject_id`, `topicName`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mechanics', NULL, NULL),
(2, 1, 'Electrostatic', NULL, NULL),
(3, 1, 'Waves', NULL, NULL),
(4, 1, 'Thermodynamic', NULL, NULL),
(5, 2, 'Electrolysis', NULL, NULL),
(6, 2, 'Mole Concept', NULL, NULL),
(7, 2, 'Chemical Eqilibrium', NULL, NULL),
(8, 2, 'Acid Base titration', NULL, NULL),
(23, 19, 'First world War', '2020-11-18 19:55:47', '2020-11-18 19:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `topicvideos`
--

CREATE TABLE `topicvideos` (
  `id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL,
  `videoName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `topicvideos`
--

INSERT INTO `topicvideos` (`id`, `topic_id`, `videoName`, `video_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'mechanics part one', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', NULL, NULL),
(2, 1, 'mechanic part two', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', NULL, NULL),
(3, 2, 'Electricity theory', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4', NULL, NULL),
(4, 2, 'electrocution', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4', NULL, NULL),
(5, 3, 'optics', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4', NULL, NULL),
(6, 3, 'magnetic waves', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4', NULL, NULL),
(7, 7, 'acidity of substances', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4', NULL, NULL),
(8, 7, 'measuring PH scale', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4', NULL, NULL),
(9, 8, 'volumetric', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4', NULL, NULL),
(10, 8, 'redox reaction', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4', NULL, NULL),
(11, 2, 'electrochemical series', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4', NULL, NULL),
(12, 2, 'chemical level', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4', NULL, NULL),
(13, 6, 'Relative molecular mass', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4', NULL, NULL),
(14, 8, 'reflux reaction', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4', NULL, NULL),
(15, 4, 'thermal Energy', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4', NULL, NULL),
(16, 5, 'Electrolysis components', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4', NULL, '2020-11-18 22:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(10) UNSIGNED NOT NULL,
  `typeName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `typeName`, `created_at`, `updated_at`) VALUES
(1, 'fullTime', '2020-10-17 17:36:07', '2020-10-17 17:36:07'),
(2, 'partTime', '2020-10-17 17:36:07', '2020-10-17 17:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `useroptions`
--

CREATE TABLE `useroptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `level_id` int(10) UNSIGNED NOT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `paid_amount` bigint(20) DEFAULT NULL,
  `balance` bigint(20) DEFAULT NULL,
  `deadLine` bigint(20) DEFAULT NULL,
  `formate_deadline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscribed` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `useroptions`
--

INSERT INTO `useroptions` (`id`, `user_id`, `level_id`, `amount`, `paid_amount`, `balance`, `deadLine`, `formate_deadline`, `subscribed`, `created_at`, `updated_at`) VALUES
(1, 3, 8, 800, 800, 0, 1615212797, '2121-Mar-08 03:03:17', 0, '2020-10-18 02:34:04', '2020-10-18 02:34:04'),
(2, 4, 1, NULL, NULL, NULL, NULL, NULL, 0, '2020-10-18 10:14:44', '2020-10-18 10:14:44'),
(3, 5, 8, 1, 1, 0, 1, NULL, 0, '2020-10-18 16:45:38', '2020-10-18 16:45:38'),
(4, 6, 6, NULL, NULL, NULL, NULL, NULL, 0, '2020-10-19 15:08:20', '2020-10-19 15:08:20'),
(5, 7, 8, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-01 16:21:03', '2020-11-01 16:21:03'),
(14, 16, 8, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 23:21:54', '2020-12-29 23:21:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` bigint(10) UNSIGNED DEFAULT NULL,
  `userName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ohipopo',
  `date_of_birth` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isLogin` tinyint(1) NOT NULL DEFAULT 0,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `phoneNumber`, `userName`, `date_of_birth`, `email`, `email_verified_at`, `password`, `isLogin`, `address`, `profile`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Bimeri Noel', 678657959, 'ohipopo', '2009-10-21T04:29:12.768+01:00', 'bimerinoel@gmail.com', NULL, '$2y$10$4hWOqkRS3zsihQ5aj.8Z3.u3Qq7pUcUkuYwYdBuGCHN74ib9Gp7q2', 0, 'buea molyko', NULL, 0, NULL, '2020-10-18 02:34:04', '2021-02-06 17:27:26'),
(4, 'Stephane Ange', 12345678, 'ohipopo', '2015-10-18T12:13:20.955+01:00', 'ste@gmail.com', NULL, '$2y$10$B6XgshI80gewLB3vMqpB8Og/9aFF3Vv/QkcT21T29fadFcv7reM0y', 0, 'buea molyko', NULL, 0, NULL, '2020-10-18 10:14:44', '2020-10-18 10:14:44'),
(5, 'ohipopo student', 652137960, 'ohipopo', '1957-10-18T18:44:21.917+01:00', 'ohipopo.org@gmail.com', NULL, '$2y$10$IVQWWB766HuDWLhOM9GXh.Q5KQ2Vs7DsrDUMHlTcrV.XLhOTW8HtK', 0, 'Limbe Mile 2', NULL, 0, NULL, '2020-10-18 16:45:38', '2020-10-18 16:45:38'),
(6, 'example student', 111111111, 'ohipopo', '2015-10-19T17:07:10.260+01:00', 'exaple@gmail.com', NULL, '$2y$10$Ki61iYRc3yt11f75EU151OFGsLzxm3Ceg0A7OIS0MQDmFaX5QMV9.', 0, 'buea molyko', NULL, 0, NULL, '2020-10-19 15:08:19', '2020-10-19 15:08:19'),
(7, 'Sama Yanick', 653766939, 'ohipopo', '1999-05-28T18:18:56.396+01:00', 'samayanick0074@gmail.com', NULL, '$2y$10$wdLLHktofElMQs7fKNb42.yoTt/fwgEs.l/kY/Rgt2WrTqEsInYBO', 0, 'Limbe', NULL, 0, NULL, '2020-11-01 16:21:03', '2020-11-01 16:21:03'),
(16, 'stp by', 121212121, '123456', '2015-12-30T00:17:28.671+01:00', 'bimerinoel@gmail.com', NULL, '$2y$10$zryctWpJnhAwuMOtfkYScupPlcUdJKVURScjsrwegQDTjhDaV5jIq', 1, 'buea molyko', NULL, 0, NULL, '2020-12-29 23:21:53', '2021-02-06 17:28:19');

-- --------------------------------------------------------

--
-- Table structure for table `usersubjects`
--

CREATE TABLE `usersubjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usersubjects`
--

INSERT INTO `usersubjects` (`id`, `subject_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 3, NULL, NULL),
(2, 2, 3, NULL, NULL),
(3, 9, 3, NULL, NULL),
(4, 8, 3, NULL, NULL),
(5, 4, 3, NULL, NULL),
(7, 6, 3, NULL, NULL),
(31, 1, 5, '2020-10-31 23:27:47', '2020-10-31 23:27:47'),
(32, 3, 5, '2020-10-31 23:27:47', '2020-10-31 23:27:47'),
(33, 8, 5, '2020-10-31 23:27:48', '2020-10-31 23:27:48'),
(34, 9, 5, '2020-10-31 23:27:48', '2020-10-31 23:27:48'),
(35, 10, 5, '2020-10-31 23:27:48', '2020-10-31 23:27:48'),
(36, 11, 5, '2020-10-31 23:27:48', '2020-10-31 23:27:48'),
(37, 11, 7, '2020-11-01 16:22:17', '2020-11-01 16:22:17'),
(38, 10, 7, '2020-11-01 16:22:17', '2020-11-01 16:22:17'),
(39, 9, 7, '2020-11-01 16:22:17', '2020-11-01 16:22:17'),
(40, 1, 7, '2020-11-01 16:22:17', '2020-11-01 16:22:17'),
(53, 2, 16, '2020-12-29 23:22:50', '2020-12-29 23:22:50'),
(54, 3, 16, '2020-12-29 23:22:50', '2020-12-29 23:22:50'),
(55, 1, 16, '2020-12-29 23:22:50', '2020-12-29 23:22:50'),
(56, 11, 16, '2020-12-29 23:22:51', '2020-12-29 23:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `level_id` int(10) UNSIGNED NOT NULL,
  `video_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `user_id`, `level_id`, `video_id`, `created_at`, `updated_at`) VALUES
(1, 3, 8, 13, '2020-12-06 08:53:36', '2020-12-06 08:53:36'),
(2, 3, 8, 7, '2020-12-06 08:53:39', '2020-12-06 08:53:39'),
(3, 3, 8, 16, '2020-12-06 09:05:23', '2020-12-06 09:05:23'),
(4, 3, 8, 13, '2020-12-06 09:05:26', '2020-12-06 09:05:26'),
(5, 3, 8, 7, '2020-12-06 09:05:32', '2020-12-06 09:05:32'),
(6, 3, 8, 9, '2020-12-06 09:05:37', '2020-12-06 09:05:37'),
(7, 3, 8, 14, '2020-12-06 09:05:42', '2020-12-06 09:05:42'),
(8, 3, 8, 16, '2020-12-06 09:27:09', '2020-12-06 09:27:09'),
(9, 3, 8, 16, '2020-12-06 10:26:10', '2020-12-06 10:26:10'),
(10, 3, 8, 8, '2020-12-06 10:37:03', '2020-12-06 10:37:03'),
(11, 3, 8, 9, '2020-12-06 10:37:07', '2020-12-06 10:37:07'),
(12, 3, 8, 14, '2020-12-06 10:39:14', '2020-12-06 10:39:14'),
(13, 3, 8, 13, '2020-12-06 10:39:59', '2020-12-06 10:39:59'),
(14, 3, 8, 16, '2020-12-06 10:40:06', '2020-12-06 10:40:06'),
(15, 3, 8, 14, '2020-12-06 10:42:24', '2020-12-06 10:42:24'),
(16, 3, 8, 14, '2020-12-06 10:43:00', '2020-12-06 10:43:00'),
(17, 3, 8, 10, '2020-12-06 10:43:02', '2020-12-06 10:43:02'),
(18, 3, 8, 14, '2020-12-06 10:43:05', '2020-12-06 10:43:05'),
(19, 3, 8, 14, '2020-12-06 10:44:09', '2020-12-06 10:44:09'),
(20, 3, 8, 10, '2020-12-06 10:44:11', '2020-12-06 10:44:11'),
(21, 3, 8, 14, '2020-12-06 10:45:18', '2020-12-06 10:45:18'),
(22, 3, 8, 14, '2020-12-06 10:45:51', '2020-12-06 10:45:51'),
(23, 3, 8, 10, '2020-12-06 10:45:54', '2020-12-06 10:45:54'),
(24, 3, 8, 16, '2020-12-06 10:46:05', '2020-12-06 10:46:05'),
(25, 3, 8, 16, '2020-12-06 10:53:30', '2020-12-06 10:53:30'),
(26, 3, 8, 13, '2020-12-06 10:53:58', '2020-12-06 10:53:58'),
(27, 3, 8, 14, '2020-12-06 19:41:03', '2020-12-06 19:41:03'),
(28, 3, 8, 8, '2020-12-06 19:41:08', '2020-12-06 19:41:08'),
(29, 3, 8, 13, '2020-12-06 19:46:35', '2020-12-06 19:46:35'),
(30, 3, 8, 16, '2020-12-06 19:48:09', '2020-12-06 19:48:09'),
(31, 3, 8, 16, '2020-12-06 20:03:02', '2020-12-06 20:03:02'),
(32, 3, 8, 13, '2020-12-06 20:03:11', '2020-12-06 20:03:11'),
(33, 3, 8, 13, '2020-12-06 20:03:15', '2020-12-06 20:03:15'),
(34, 3, 8, 7, '2020-12-06 20:52:01', '2020-12-06 20:52:01'),
(35, 3, 8, 13, '2020-12-06 20:56:17', '2020-12-06 20:56:17'),
(36, 3, 8, 7, '2020-12-06 20:56:25', '2020-12-06 20:56:25'),
(37, 3, 8, 16, '2020-12-06 20:57:32', '2020-12-06 20:57:32'),
(38, 3, 8, 13, '2020-12-06 20:57:35', '2020-12-06 20:57:35'),
(39, 3, 8, 13, '2020-12-06 20:58:46', '2020-12-06 20:58:46'),
(40, 3, 8, 7, '2020-12-06 20:58:51', '2020-12-06 20:58:51'),
(41, 3, 8, 7, '2020-12-06 20:59:21', '2020-12-06 20:59:21'),
(42, 3, 8, 7, '2020-12-06 21:00:00', '2020-12-06 21:00:00'),
(43, 3, 8, 7, '2020-12-06 21:00:31', '2020-12-06 21:00:31'),
(44, 3, 8, 13, '2020-12-06 21:00:39', '2020-12-06 21:00:39'),
(45, 3, 8, 16, '2020-12-06 21:00:42', '2020-12-06 21:00:42'),
(46, 3, 8, 10, '2020-12-06 21:00:53', '2020-12-06 21:00:53'),
(47, 3, 8, 16, '2020-12-06 21:18:58', '2020-12-06 21:18:58'),
(48, 3, 8, 8, '2020-12-06 21:20:16', '2020-12-06 21:20:16'),
(49, 3, 8, 13, '2020-12-06 21:22:40', '2020-12-06 21:22:40'),
(50, 3, 8, 7, '2020-12-06 21:22:46', '2020-12-06 21:22:46'),
(51, 3, 8, 13, '2020-12-06 21:23:34', '2020-12-06 21:23:34'),
(52, 3, 8, 7, '2020-12-06 21:23:40', '2020-12-06 21:23:40'),
(53, 3, 8, 13, '2020-12-06 22:34:11', '2020-12-06 22:34:11'),
(54, 3, 8, 7, '2020-12-21 18:57:44', '2020-12-21 18:57:44'),
(55, 3, 8, 16, '2020-12-21 19:00:23', '2020-12-21 19:00:23'),
(56, 3, 8, 13, '2020-12-21 19:00:44', '2020-12-21 19:00:44'),
(57, 3, 8, 7, '2020-12-21 19:01:43', '2020-12-21 19:01:43'),
(58, 3, 8, 8, '2020-12-21 19:01:47', '2020-12-21 19:01:47'),
(59, 3, 8, 7, '2020-12-21 19:01:49', '2020-12-21 19:01:49'),
(60, 3, 8, 16, '2020-12-21 19:06:38', '2020-12-21 19:06:38'),
(61, 3, 8, 13, '2020-12-29 10:47:49', '2020-12-29 10:47:49'),
(62, 3, 8, 9, '2020-12-29 10:50:35', '2020-12-29 10:50:35'),
(63, 3, 8, 16, '2020-12-29 11:46:05', '2020-12-29 11:46:05'),
(64, 3, 8, 16, '2020-12-29 11:52:04', '2020-12-29 11:52:04'),
(65, 3, 8, 16, '2020-12-29 11:52:51', '2020-12-29 11:52:51'),
(66, 3, 8, 16, '2020-12-29 11:54:00', '2020-12-29 11:54:00'),
(67, 3, 8, 13, '2020-12-29 11:54:08', '2020-12-29 11:54:08'),
(68, 3, 8, 16, '2021-01-09 21:11:58', '2021-01-09 21:11:58'),
(69, 3, 8, 13, '2021-02-04 19:45:15', '2021-02-04 19:45:15'),
(70, 3, 8, 10, '2021-02-04 20:05:17', '2021-02-04 20:05:17'),
(71, 3, 8, 16, '2021-02-05 00:55:32', '2021-02-05 00:55:32'),
(72, 3, 8, 16, '2021-02-05 00:56:23', '2021-02-05 00:56:23'),
(73, 3, 8, 13, '2021-02-05 00:56:39', '2021-02-05 00:56:39'),
(74, 3, 8, 16, '2021-02-05 00:56:43', '2021-02-05 00:56:43'),
(75, 3, 8, 16, '2021-02-05 00:56:46', '2021-02-05 00:56:46'),
(76, 3, 8, 16, '2021-02-05 07:22:06', '2021-02-05 07:22:06'),
(77, 3, 8, 8, '2021-02-05 07:22:31', '2021-02-05 07:22:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_contact_unique` (`contact`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `full_time_payments`
--
ALTER TABLE `full_time_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `full_time_payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `levels_type_id_foreign` (`type_id`);

--
-- Indexes for table `likedislikes`
--
ALTER TABLE `likedislikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likedislikes_user_id_foreign` (`user_id`),
  ADD KEY `likedislikes_topicvideo_id_foreign` (`topicvideo_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `part_time_payments`
--
ALTER TABLE `part_time_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `level_id_subjectName` (`level_id`,`name`),
  ADD KEY `subjects_level_id_foreign` (`level_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_email_unique` (`email`),
  ADD UNIQUE KEY `teachers_contact_unique` (`contact`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topics_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `topicvideos`
--
ALTER TABLE `topicvideos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topicvideos_topic_id_foreign` (`topic_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `useroptions`
--
ALTER TABLE `useroptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `useroptions_user_id_foreign` (`user_id`),
  ADD KEY `useroptions_level_id_foreign` (`level_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersubjects`
--
ALTER TABLE `usersubjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_subjects_unique` (`subject_id`,`user_id`),
  ADD KEY `usersubjects_user_id_foreign` (`user_id`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `views_user_id_foreign` (`user_id`),
  ADD KEY `views_level_id_foreign` (`level_id`),
  ADD KEY `views_video_id_foreign` (`video_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `full_time_payments`
--
ALTER TABLE `full_time_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `likedislikes`
--
ALTER TABLE `likedislikes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `part_time_payments`
--
ALTER TABLE `part_time_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `topicvideos`
--
ALTER TABLE `topicvideos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `useroptions`
--
ALTER TABLE `useroptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `usersubjects`
--
ALTER TABLE `usersubjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `full_time_payments`
--
ALTER TABLE `full_time_payments`
  ADD CONSTRAINT `full_time_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `levels`
--
ALTER TABLE `levels`
  ADD CONSTRAINT `levels_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likedislikes`
--
ALTER TABLE `likedislikes`
  ADD CONSTRAINT `likedislikes_topicvideo_id_foreign` FOREIGN KEY (`topicvideo_id`) REFERENCES `topicvideos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likedislikes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `part_time_payments`
--
ALTER TABLE `part_time_payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `topicvideos`
--
ALTER TABLE `topicvideos`
  ADD CONSTRAINT `topicvideos_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `useroptions`
--
ALTER TABLE `useroptions`
  ADD CONSTRAINT `useroptions_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `useroptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `usersubjects`
--
ALTER TABLE `usersubjects`
  ADD CONSTRAINT `usersubjects_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usersubjects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `views_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `views_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `topicvideos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
