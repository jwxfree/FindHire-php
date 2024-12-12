-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2024 at 12:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `applicant_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `applicant_id`, `title`, `receiver_id`, `created_at`, `updated_at`, `status`) VALUES
(48, 12, 'DevOps Engineer', 13, '2024-12-12 03:26:50', '2024-12-12 03:26:50', 'Pending'),
(49, 12, 'Data Scientist', 13, '2024-12-12 03:26:52', '2024-12-12 03:27:40', 'Accepted'),
(50, 12, 'Mobile App Developer (iOS/Android)', 13, '2024-12-12 03:29:43', '2024-12-12 03:29:43', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `application_id`, `sender_id`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(7, 48, 12, 'Hello!', 0, '2024-12-12 03:28:36', '2024-12-12 03:28:36'),
(8, 48, 13, 'Hi!', 0, '2024-12-12 03:29:00', '2024-12-12 03:29:00'),
(9, 50, 12, 'Dear Pocket Devs,\r\n\r\nI hope you\'re doing well. I’m following up on my application for the Mobile App Developer (iOS/Android) position submitted on December 12, 2024. I’m excited about the opportunity to join Pocket Devs and wanted to kindly check if there are any updates regarding the hiring process.\r\n\r\nPlease let me know if you need any further information from me. Thank you for your time and consideration!\r\n\r\nBest regards,\r\nEilron Escalante', 0, '2024-12-12 03:32:42', '2024-12-12 03:32:42');

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
-- Table structure for table `listings`
--

CREATE TABLE `listings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`id`, `user_id`, `title`, `tags`, `company`, `location`, `website`, `description`, `created_at`, `updated_at`) VALUES
(14, 13, 'Web Developer', 'developer, react, javascript, python, sql', 'Pocket Devs', 'Philippines', 'https://example.com', '<div><strong>Description:</strong><br>We are seeking a talented Full-Stack Web Developer to design, develop, and maintain scalable web applications. As part of our dynamic team, you will work on both front-end and back-end components, ensuring seamless integration and top-notch user experiences.<br><br></div><div><strong>Responsibilities:<br></strong><br></div><ul><li>Develop and maintain web applications using modern frameworks like React, Angular, or Vue.js for the front-end and Node.js, Django, or Laravel for the back-end.</li><li>Collaborate with designers, product managers, and other developers to create efficient, user-friendly solutions.</li><li>Write clean, modular, and well-documented code.</li><li>Optimize applications for performance, scalability, and security.</li><li>Troubleshoot and resolve bugs or performance issues.</li></ul><div><strong>Requirements:<br></strong><br></div><ul><li>Proficiency in JavaScript, HTML, CSS, and back-end languages like Python, PHP, or Java.</li><li>Experience with RESTful APIs and database management (SQL/NoSQL).</li><li>Familiarity with version control tools like Git.</li><li>Strong problem-solving and communication skills.</li></ul>', '2024-12-10 00:10:40', '2024-12-12 01:44:07'),
(25, 13, 'Mobile App Developer (iOS/Android)', 'kotlin, swift, react native, developer, mobile app', 'Pocket Devs', 'Canada', 'https://example.com', '<div><strong>Description:</strong><br>We are looking for a skilled Mobile App Developer to join our team. The ideal candidate will create innovative mobile applications for Android and/or iOS platforms, delivering seamless user experiences and robust functionalities.<br><br></div><div><strong>Responsibilities:<br></strong><br></div><ul><li>Design, build, and maintain mobile applications using native (Swift/Kotlin) or cross-platform tools like Flutter or React Native.</li><li>Collaborate with UI/UX designers to implement attractive and intuitive user interfaces.</li><li>Ensure optimal performance, quality, and responsiveness of applications.</li><li>Debug and fix software bugs and bottlenecks.</li><li>Stay updated on the latest mobile development trends and technologies.</li></ul><div><strong>Requirements:<br></strong><br></div><ul><li>Strong experience in mobile app development using Swift, Kotlin, or cross-platform tools.</li><li>Familiarity with integrating third-party APIs and services.</li><li>Knowledge of mobile app deployment processes (Google Play Store/App Store).</li><li>Excellent attention to detail and problem-solving skills.</li></ul>', '2024-12-12 01:45:25', '2024-12-12 01:45:25'),
(26, 13, 'Data Scientist', 'Data, Schema, Data Scientist', 'Pocket Devs', 'USA', 'https://example.com', '<div><strong>Description:</strong><br>We are hiring a Data Scientist to analyze complex data sets, extract actionable insights, and contribute to data-driven decision-making. You will work closely with cross-functional teams to develop predictive models and innovative algorithms.<br><br></div><div><strong>Responsibilities:<br></strong><br></div><ul><li>Collect, preprocess, and analyze large data sets using Python, R, or similar tools.</li><li>Develop machine learning models to solve business problems and improve processes.</li><li>Visualize and communicate insights to stakeholders using tools like Tableau, Power BI, or Matplotlib.</li><li>Stay updated with the latest trends in data science and AI.</li><li>Collaborate with engineers and data analysts to implement scalable data solutions.</li></ul><div><strong>Requirements:<br></strong><br></div><ul><li>Strong programming skills in Python, R, or SQL.</li><li>Hands-on experience with machine learning frameworks (e.g., TensorFlow, PyTorch).</li><li>Proficiency in data visualization and statistical analysis.</li><li>Bachelor’s degree in Computer Science, Data Science, or a related field.</li></ul>', '2024-12-12 01:49:51', '2024-12-12 01:49:51'),
(27, 13, 'DevOps Engineer', 'git, github, aws, gcp, azure', 'Pocket Devs', 'United Kingdom', 'https://example.com', '<div><strong>Description</strong>:<br>We are hiring a DevOps Engineer to streamline our development processes and manage the deployment of applications. You will be responsible for maintaining CI/CD pipelines, monitoring systems, and ensuring high availability of applications.<br><br></div><div><strong>Key Responsibilities</strong>:<br><br></div><ul><li>Set up and maintain CI/CD pipelines using tools like Jenkins, GitHub Actions, or GitLab CI.</li><li>Automate infrastructure management using tools like Terraform or Ansible.</li><li>Monitor and troubleshoot system performance issues.</li><li>Work closely with developers to integrate DevOps best practices into workflows.</li></ul><div><strong>Requirements</strong>:<br><br></div><ul><li>Experience with containerization tools like Docker and Kubernetes.</li><li>Proficiency with Linux-based systems and scripting languages.</li><li>Knowledge of cloud platforms like AWS, GCP, or Azure.</li><li>Strong understanding of networking and system administration.</li></ul>', '2024-12-12 03:26:09', '2024-12-12 03:26:09');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_15_025400_create_listings_table', 1),
(6, '2022_05_22_071735_create_applications_table', 1),
(7, '2024_12_04_034338_create_sessions_table', 2),
(8, '2024_12_10_080109_update_users_table', 3),
(9, '2024_12_10_080323_update_image_column_in_users_table', 4),
(10, '2024_12_10_082733_create_messages_table', 5),
(11, '2024_12_10_094643_create_conversations_table', 6),
(12, '2024_12_12_015844_create_chatmessages_table', 7),
(13, '2024_12_12_092522_add_status_to_applications_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('ZGW21Bmm23lwPOqPnT1av89xE6edLxZPKau0rJ37', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidUpWdWoxYTlxYjBlMXpiNERpeHRKM1FqRjBLNm1wZ1VXbjlpWURlZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEyO30=', 1734003248);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `desc` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_recruiter` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(255) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT 'noimage.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `desc`, `address`, `email_verified_at`, `is_recruiter`, `password`, `file`, `remember_token`, `created_at`, `updated_at`, `image`) VALUES
(12, 'Eilron Escalante', 'aeronescalante@gmail.com', '<div>Full-Stack Developer and Software Engineer based in the Philippines, specializing in developing solutions with Python, JavaScript and PHP.</div>', 'Philippines', NULL, 0, '$2y$12$eiRRgm5OLPBu6WLOzZIBTeX64YCposUsLSrfyvYAcikVa83jlFXUS', NULL, NULL, '2024-12-09 23:57:54', '2024-12-12 01:53:27', 'profile-images/FI1RlQQa6HnWjEoGqWNhc9BYOOhWQ2gFF2hsYc0e.jpg'),
(13, 'Pocket Devs', 'daeyldiokno@gmail.com', '<div>Tech Solution Company</div>', 'Philippines', NULL, 1, '$2y$12$qbSbcp8CZpPC2ZUCqohY1uc345eRAmvl.W/hsE.YylmOZYtcMuqWa', NULL, NULL, '2024-12-09 23:58:05', '2024-12-12 02:35:39', 'profile-images/JBRbOK2wOUm7vFP1rtk0IeV2vefDtiPhUxoUnpvV.jpg'),
(14, 'Company', 'company@example.com', NULL, NULL, NULL, 1, '$2y$12$SW2JpYDvrV78L657NhYnYOpxncPP8kTKBx754vf/SzPD2ULEeJDZC', NULL, NULL, '2024-12-10 01:53:13', '2024-12-10 01:53:13', 'noimage.jpg'),
(15, 'Caleb Price IV', 'cynthia.shields@example.net', NULL, NULL, '2024-12-10 01:53:15', 0, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '6BLL3H9ViD', '2024-12-10 01:53:15', '2024-12-10 01:53:15', 'noimage.jpg'),
(16, 'Miss Jacinthe Gerhold PhD', 'daniela.beatty@example.com', NULL, NULL, '2024-12-10 01:53:15', 0, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'MzsGgB11Y8', '2024-12-10 01:53:15', '2024-12-10 01:53:15', 'noimage.jpg'),
(17, 'Aiyana DuBuque', 'timothy.brown@example.com', NULL, NULL, '2024-12-10 01:53:15', 0, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '6yTn6c2Y3N', '2024-12-10 01:53:15', '2024-12-10 01:53:15', 'noimage.jpg'),
(18, 'Test User', 'test@example.com', NULL, NULL, '2024-12-10 01:53:15', 0, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'lBGpXDWWGO', '2024-12-10 01:53:15', '2024-12-10 01:53:15', 'noimage.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_messages_application_id_foreign` (`application_id`),
  ADD KEY `chat_messages_sender_id_foreign` (`sender_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_sender_id_foreign` (`sender_id`),
  ADD KEY `messages_receiver_id_foreign` (`receiver_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `listings`
--
ALTER TABLE `listings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
