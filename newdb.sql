-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2020 at 02:12 PM
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
-- Database: `newdb`
--

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
(15, '2020_10_18_201936_create_topicvideos_table', 2);

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
('05999a1b5865169bc535febd1d205e767224f98c896db8b8f6599034e88fe67376c9a8bf2d7163c2', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-18 08:41:38', '2020-10-18 08:41:38', '2021-10-18 09:41:38'),
('07242dd75e5811ea26f65072db0e43744d944a054341524636e56ed5e132f97d837d1f8d94f86004', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-20 20:34:23', '2020-10-20 20:34:23', '2021-10-20 21:34:23'),
('09cdea601a7e3dda413a62e64f841bbd4c99db9cbfab58b10dcccf3b4a0b8274f346fbb644b529a5', 3, 1, 'Personal_Access_Token', '[]', 0, '2020-10-18 03:49:56', '2020-10-18 03:49:56', '2020-10-25 04:49:57'),
('0d5e4ceae44b3a7634895f4a0355a97b91617ca396fa7a6b36d3e5b67fc1474ee8a9b2b9c29456c3', 3, 1, 'Personal Access Token', '[]', 0, '2020-10-18 10:03:14', '2020-10-18 10:03:14', '2021-10-18 11:03:14'),
('10729086628243b287b7251bfbb6213f6e3696f279cac018ab9e7a32790a8546370c40e80cded82a', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-20 19:26:33', '2020-10-20 19:26:33', '2021-10-20 20:26:33'),
('19381de8e85fbe130ce4f4330618adc3d58571920e4a546e064f0931ce3a02507de8a76a4cc84a03', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-20 12:31:37', '2020-10-20 12:31:37', '2021-10-20 13:31:37'),
('1c9cb324768c28daf850d2975571b44848a301ff0a6f3e87bfdb670dcacec6ead5dfaa69a90a5930', 4, 1, 'Personal Access Token', '[]', 1, '2020-10-18 16:22:00', '2020-10-18 16:22:00', '2021-10-18 17:22:00'),
('1cda34bda7690628efc67f8be29a8a6d1c3d9117e281e9f270e6447246f746d71cc4abaa3a755e83', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-18 10:03:21', '2020-10-18 10:03:21', '2021-10-18 11:03:21'),
('1fc7eff31c941903ffb3c5c9b9b1c1b586b964c5d44768d5e86cdbfeb5d5275a764711d92b20c05d', 5, 1, 'Personal Access Token', '[]', 0, '2020-10-21 10:57:37', '2020-10-21 10:57:37', '2021-10-21 11:57:37'),
('202a6f2a4d500e8449eefc68ec3f1231550ae1c6b197c5e186ce50e8e90230a9dcb30978351b6c8f', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-18 21:42:29', '2020-10-18 21:42:29', '2021-10-18 22:42:29'),
('21ddc04a0a6bfc93364e3a2cd07f8c4c7ae8a2f8c4f0ff7657642dbb666113cb1ad186fca8fe20f7', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 06:26:36', '2020-10-19 06:26:36', '2021-10-19 07:26:36'),
('27885ebaf69212f39f42fb87e9ef1dbba92584869bfb8b2d5bb29ec6bf15aae30dec0f48814dd68e', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 13:52:56', '2020-10-19 13:52:56', '2021-10-19 14:52:56'),
('2cabcd18e46da59f6324cdaeb545655b4240049a77f1c594a7e08b1e12c28eb99523780d3f621840', 6, 1, 'Personal Access Token', '[]', 1, '2020-10-19 15:08:42', '2020-10-19 15:08:42', '2021-10-19 16:08:42'),
('38d4c918b6cb1ad32cc0d2cfcc5409b072a3b68da76558be15e3b163e3156995053a536ac4c4d8f6', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-18 10:28:57', '2020-10-18 10:28:57', '2021-10-18 11:28:57'),
('3c462b2d8e9a99d3c7df19313b59a23be5eb6f79f82682d01bd719e92b4d2797ca89c3692b408cfe', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 14:09:24', '2020-10-19 14:09:24', '2021-10-19 15:09:24'),
('453ac9d67b8f552835c12c0387bfea75597ea9fe4634fb7ae2de052a53aaa0ecd2fbb352288b573b', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-18 09:32:54', '2020-10-18 09:32:54', '2021-10-18 10:32:54'),
('4909ac16492eb15958763a66d78b20026c2f1f49f05585e66e845dcec29690224c05e4a93018e845', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-18 16:52:24', '2020-10-18 16:52:24', '2021-10-18 17:52:24'),
('4dc277e870502bea571df0a07d219da638224ded3783e6ef6730c92497ee71957057cdcedae702a3', 2, 1, 'Personal_Access_Token', '[]', 1, '2020-10-18 01:53:45', '2020-10-18 01:53:45', '2021-10-18 02:53:45'),
('512c4f4e0a15c0869aa71ac8d1eec0add1ca0f355d1ff67329e41ca079f9d285398135e83e8df401', 5, 1, 'Personal Access Token', '[]', 1, '2020-10-18 16:46:12', '2020-10-18 16:46:12', '2021-10-18 17:46:12'),
('5a57c04e97dbb85bd4491ed188db8debda2f3807af02c12872a0ec96ca10ffddf19f2758022479e9', 4, 1, 'Personal Access Token', '[]', 1, '2020-10-20 11:26:26', '2020-10-20 11:26:26', '2021-10-20 12:26:26'),
('61fbcab7817035672b5a613cbb9ba4ef7b066a5136ca9c3b877e2ffabe440fbd58a69831fdc3ff36', 4, 1, 'Personal Access Token', '[]', 1, '2020-10-18 16:24:32', '2020-10-18 16:24:32', '2020-10-25 17:24:32'),
('65b419a66d142fddec7e39570fb8917535308fa4dc3d7d68c8ba8dfb94f203ad95cd0f9a33df516e', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-20 19:21:36', '2020-10-20 19:21:36', '2021-10-20 20:21:36'),
('69f8a971057d57da1a78cd9b3bcebb71e649fecc3ba8055a3707653810bfe08e0aa3e08be2b6a1d9', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-20 12:28:54', '2020-10-20 12:28:54', '2021-10-20 13:28:54'),
('6d14336bbfb3649bc2f5745d5a8b19a3728dbbcfd380ea5742044c69033ec76877dbdcb74af2fe0b', 4, 1, 'Personal Access Token', '[]', 1, '2020-10-18 10:33:59', '2020-10-18 10:33:59', '2021-10-18 11:33:59'),
('71b813360ced93b093cce58f916f92e507b0876ffcee2293ea8a88fcb256c5115cbe62fba12b4a05', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 13:39:56', '2020-10-19 13:39:56', '2021-10-19 14:39:56'),
('71fa94ecd0580f63776867e4d730ac05aba12c440086c6d57fc0f04920be5121240613d655256c4e', 5, 1, 'Personal Access Token', '[]', 1, '2020-10-19 15:12:54', '2020-10-19 15:12:54', '2021-10-19 16:12:54'),
('7588cd3e611f4a96448277d3a8df96f57985ae88208f843f03b0f031f13bc5ffc3f3bb3b7cb6f7b1', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 13:51:06', '2020-10-19 13:51:06', '2021-10-19 14:51:06'),
('772e5e2e86ce9ee851cb31a23029cee48ea3fb69ad657f3a85728a61bef368bc753624bc81a0c593', 3, 1, 'Personal Access Token', '[]', 0, '2020-10-18 10:01:27', '2020-10-18 10:01:27', '2021-10-18 11:01:27'),
('7848bfcfb518268d5c160423dd8864a1c50c617babf637b94f91a26ca930995f0fe55ddeaefe2af6', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-18 10:11:40', '2020-10-18 10:11:40', '2021-10-18 11:11:40'),
('88e12e656efb800e7a53df8165d4b7ffbe15b9956b9cae04bf4d162825e8b23f9af94ae3c65c8bf5', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 14:12:18', '2020-10-19 14:12:18', '2021-10-19 15:12:18'),
('9b380ba91c8b6eb60949afcbdaee40f190693241031d23a694d6c78bc5fcbb94d95a6f505a1a328a', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-20 11:40:11', '2020-10-20 11:40:11', '2021-10-20 12:40:11'),
('9cb1b80c768b1b7cc5475d19b274001963ab8b22119122a3f28ecbb47d61f35747b59466621d8b72', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 15:05:26', '2020-10-19 15:05:26', '2021-10-19 16:05:26'),
('9d2b77d585546478d7a77b1a37c5a26e3171c95c0d7fafe973e87638a79357777c4b0a4d827d8b4b', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-18 10:33:20', '2020-10-18 10:33:20', '2021-10-18 11:33:20'),
('a82d0ed85720d2e4c9b86a541133e768085d8ae069e214e44c2d60a8c14c0224718e392c1b107afe', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 14:15:04', '2020-10-19 14:15:04', '2021-10-19 15:15:04'),
('a8c370982d9363277e31d58ded4928b081da72b9ed4cb882a7857a4be49b9118cb9cf26f5f76a5c8', 4, 1, 'Personal Access Token', '[]', 1, '2020-10-18 16:25:53', '2020-10-18 16:25:53', '2021-10-18 17:25:53'),
('b3c8fb3c7c87e80c5c5612abec717c55450a9f120341fd0d98e4c0387e31f9b34bfcd73a38a90720', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 15:18:31', '2020-10-19 15:18:31', '2021-10-19 16:18:31'),
('b50114f269665103f5d362ff9fdbba37b5195ea7225a633ad581296340e95fa21adc5a194e01f740', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-18 10:31:39', '2020-10-18 10:31:39', '2021-10-18 11:31:39'),
('bb62c355a0afdfe4be468b8df034c37f9990a1f1968debd681b972265bd818ff5c7f81cd6a9f341e', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 14:18:56', '2020-10-19 14:18:56', '2021-10-19 15:18:56'),
('c314236a50c552f1bf3d4fb676f113f19a87ef5711c80cdc4aa7cc40ac5a96597a1fcca2ae397e73', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-18 10:35:30', '2020-10-18 10:35:30', '2021-10-18 11:35:30'),
('c54a487c3aa0fc98814bce2c7402bb7c5d09706bd31a0dcb8e139bfe63f02f5c00ba08eb2f0a2689', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 13:54:34', '2020-10-19 13:54:34', '2021-10-19 14:54:34'),
('c7346d095afe713f74e0bab4ad214b3609ef6831c37e94ab2b852ef1863a6d6ecd2d7eb5648f6426', 2, 1, 'Personal_Access_Token', '[]', 1, '2020-10-18 01:02:42', '2020-10-18 01:02:42', '2021-10-18 02:02:42'),
('d1b47e36fcce0bf1f37d10f248ff955af353b6c2178aa0a2e4dad2f1632af12e5bbb622a88a8ea4e', 5, 1, 'Personal Access Token', '[]', 1, '2020-10-19 15:03:39', '2020-10-19 15:03:39', '2021-10-19 16:03:39'),
('d547068b5838f31b7a04e90044e0e8e41fd53c76e3bd5101caa38addfd47494e13c904085b4de5db', 4, 1, 'Personal Access Token', '[]', 1, '2020-10-18 10:17:25', '2020-10-18 10:17:25', '2021-10-18 11:17:25'),
('d70a558a177002d6f655695fc3c37db71689ba892f55eddc578a976e738b7b580e39bc3ad1819d4c', 1, 1, 'Personal_Access_Token', '[]', 1, '2020-10-18 01:50:06', '2020-10-18 01:50:06', '2021-10-18 02:50:06'),
('d7c91f59459ebab8484e83c5eb45ec067a3850e4229742701e4a3d32366903b518735b682ea57f23', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 15:15:45', '2020-10-19 15:15:45', '2021-10-19 16:15:45'),
('d7cabd8b6285d6f5665bae91f302539ab9e3a0ce3a042fdbfff5474bbe23cf08e777c2aff2c9dc89', 4, 1, 'Personal Access Token', '[]', 1, '2020-10-18 10:15:03', '2020-10-18 10:15:03', '2021-10-18 11:15:03'),
('dc758847ab8f10d187b59b7d6a3c8f18a8a99bb050c65c4a7d79abdf4546ed179783aa1517c05d5d', 3, 1, 'Personal_Access_Token', '[]', 1, '2020-10-18 02:34:42', '2020-10-18 02:34:42', '2020-10-25 03:34:44'),
('e158632ce1e440371df04d7e73829a35502518711e593ae0e9362f0b1bc83942590b0e946402dd43', 4, 1, 'Personal Access Token', '[]', 1, '2020-10-19 15:04:39', '2020-10-19 15:04:39', '2021-10-19 16:04:39'),
('e3e7bab482af219257c4c4e14ba7b87fbe0543cc7905f0acb1f45cea3d07f98277bce512d438607d', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-18 16:27:34', '2020-10-18 16:27:34', '2021-10-18 17:27:34'),
('e44acfa17ba8185fb61e227dc0876452cafd75e7b89d8a0ec40d08f10ad909f57c7c7ea18a2083f4', 5, 1, 'Personal Access Token', '[]', 1, '2020-10-21 10:34:21', '2020-10-21 10:34:21', '2021-10-21 11:34:21'),
('f4859205931d78f6df48704605c5e31d25491e35f069d4fb7689b911e83540a05b2cca3445c1f69f', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-19 14:28:36', '2020-10-19 14:28:36', '2020-10-26 15:28:36'),
('f93784afec04e1dd491f6ca97f7691ab262a4679f820f2358a6533f7d7b47e34f3490b4640628498', 3, 1, 'Personal Access Token', '[]', 1, '2020-10-20 12:22:39', '2020-10-20 12:22:39', '2021-10-20 13:22:39'),
('fb115fa1999dd12bd21708a51a57dd4c38f0058fc7483e098a6af6f9c6502689cf2f7fae22ecc92e', 3, 1, 'Personal_Access_Token', '[]', 1, '2020-10-18 02:40:31', '2020-10-18 02:40:31', '2020-10-25 03:40:31');

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
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `level_id` int(10) UNSIGNED NOT NULL,
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
(1, 8, 'Physics', 'Nelkon and Paker', '10', 'https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4', 'asset/images/Physics.png', '2020-10-17 17:36:43', '2020-10-17 17:36:43'),
(2, 8, 'Chemistry', 'Ngule Emmanuel', '15', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4', 'asset/images/Chemistry.png', '2020-10-17 17:36:43', '2020-10-17 17:36:43'),
(3, 8, 'Biology', 'Tapong Sylvester', '11', 'https://www.googleapis.com/drive/v3/files/1otTfVbHN25XEBVO6K2rYo3_qC8jUKZm1?alt=media&key=AIzaSyBq--c-pvDnzDfG6--HwOuMvOdS1ASJoVE', 'asset/images/Biology.png', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(4, 8, 'Pure Mathematics with Statistics', 'Chadler Bostock', '11', 'https://www.googleapis.com/drive/v3/files/1NVWAegnn2MLtf0zk2UP21uaKCdIKWW1l?alt=media&key=AIzaSyCEUgF8rXlqXwoiXJIrO7lahJKi-mfCmVA', 'asset/images/maths_with_statistics.jpg', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(5, 8, 'Pure Mathematics with Mechanics', 'Chadler Bostock', '11', 'https://www.googleapis.com/drive/v3/files/10YtZUzbQE57xrVO1wzOBq-1-Wg0hODgZ?alt=media&key=AIzaSyBQmDvNblg1yFgHGX7ZJ2BTef2fJKd-XZ8', 'asset/images/maths_with_mechanics.jpg', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(6, 8, 'Geology', 'Unknown', '6', 'https://www.googleapis.com/drive/v3/files/1VmfAqeEkPyPFmnBavG3GNTfo3_8SJBOQ?alt=media&key=AIzaSyCSjp80XrDBXFafzzyqWLUO2nDczjC38m0', 'asset/images/geology.png', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(7, 8, 'Food Science', 'Peter Eves', '6', 'https://www.googleapis.com/drive/v3/files/1aj3SxFCSkvQrSN0Z7yCToil03h1IbuJV?alt=media&key=AIzaSyBAFAIiNLasrJ2u3q09CdDnwXN1-dbm0zk', 'asset/images/Food_Science_and_Nutrition.png', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(8, 8, 'Further Mathematics', 'Bostock', '9', 'https://www.googleapis.com/drive/v3/files/1BhRlew5oHudPooIZ7fwHBH6Nig1FRQXg?alt=media&key=AIzaSyBq--c-pvDnzDfG6--HwOuMvOdS1ASJoVE', 'asset/images/further_maths.png', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(9, 8, 'Computer Science', 'Unknown', '16', 'https://www.googleapis.com/drive/v3/files/1aR7IyX0-PjzhKhTG88I0q1PPDqnBcFjB?alt=media&key=AIzaSyDOJaT4HZwIdKLz_obWjn832oBTkcIIZy0', 'asset/images/computer_science.png', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(10, 8, 'Information and Communication Technology', 'Unknown', '16', 'https://www.googleapis.com/drive/v3/files/10YtZUzbQE57xrVO1wzOBq-1-Wg0hODgZ?alt=media&key=AIzaSyBQmDvNblg1yFgHGX7ZJ2BTef2fJKd-XZ8', 'asset/images/ICT.png', '2020-10-17 17:36:44', '2020-10-17 17:36:44'),
(11, 8, 'Religious Studies', 'Unknown', '16', 'https://www.googleapis.com/drive/v3/files/10YtZUzbQE57xrVO1wzOBq-1-Wg0hODgZ?alt=media&key=AIzaSyBQmDvNblg1yFgHGX7ZJ2BTef2fJKd-XZ8', 'asset/images/Religious_studies.jpg', '2020-10-17 17:36:45', '2020-10-17 17:36:45');

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
(8, 2, 'Acid Base titration', NULL, NULL);

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
(15, 6, 'Relative molecular mass', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4', NULL, NULL);

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
  `deadLine` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscribed` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `useroptions`
--

INSERT INTO `useroptions` (`id`, `user_id`, `level_id`, `amount`, `paid_amount`, `balance`, `deadLine`, `subscribed`, `created_at`, `updated_at`) VALUES
(1, 3, 8, NULL, NULL, NULL, NULL, 0, '2020-10-18 02:34:04', '2020-10-18 02:34:04'),
(2, 4, 1, NULL, NULL, NULL, NULL, 0, '2020-10-18 10:14:44', '2020-10-18 10:14:44'),
(3, 5, 8, NULL, NULL, NULL, NULL, 0, '2020-10-18 16:45:38', '2020-10-18 16:45:38'),
(4, 6, 6, NULL, NULL, NULL, NULL, 0, '2020-10-19 15:08:20', '2020-10-19 15:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` bigint(10) UNSIGNED DEFAULT NULL,
  `date_of_birth` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `users` (`id`, `fullName`, `phoneNumber`, `date_of_birth`, `email`, `email_verified_at`, `password`, `address`, `profile`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Bimeri Noel', 678657959, '2009-10-21T04:29:12.768+01:00', 'bimerinoel@gmail.com', NULL, '$2y$10$4hWOqkRS3zsihQ5aj.8Z3.u3Qq7pUcUkuYwYdBuGCHN74ib9Gp7q2', 'buea molyko', NULL, 0, NULL, '2020-10-18 02:34:04', '2020-10-18 02:34:04'),
(4, 'Stephane Ange', 12345678, '2015-10-18T12:13:20.955+01:00', 'ste@gmail.com', NULL, '$2y$10$B6XgshI80gewLB3vMqpB8Og/9aFF3Vv/QkcT21T29fadFcv7reM0y', 'buea molyko', NULL, 0, NULL, '2020-10-18 10:14:44', '2020-10-18 10:14:44'),
(5, 'ohipopo student', 652137960, '1957-10-18T18:44:21.917+01:00', 'ohipopo.org@gmail.com', NULL, '$2y$10$IVQWWB766HuDWLhOM9GXh.Q5KQ2Vs7DsrDUMHlTcrV.XLhOTW8HtK', 'Limbe Mile 2', NULL, 0, NULL, '2020-10-18 16:45:38', '2020-10-18 16:45:38'),
(6, 'example student', 111111111, '2015-10-19T17:07:10.260+01:00', 'exaple@gmail.com', NULL, '$2y$10$Ki61iYRc3yt11f75EU151OFGsLzxm3Ceg0A7OIS0MQDmFaX5QMV9.', 'buea molyko', NULL, 0, NULL, '2020-10-19 15:08:19', '2020-10-19 15:08:19');

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
(6, 1, 3, NULL, NULL),
(7, 6, 3, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `levels_type_id_foreign` (`type_id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_level_id_foreign` (`level_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `usersubjects`
--
ALTER TABLE `usersubjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_subjects_unique` (`subject_id`,`user_id`),
  ADD KEY `usersubjects_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `topicvideos`
--
ALTER TABLE `topicvideos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `useroptions`
--
ALTER TABLE `useroptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usersubjects`
--
ALTER TABLE `usersubjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `levels`
--
ALTER TABLE `levels`
  ADD CONSTRAINT `levels_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
