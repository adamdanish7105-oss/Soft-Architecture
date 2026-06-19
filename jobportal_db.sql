-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2026 at 04:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobportal_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `candidate_id` bigint(20) NOT NULL,
  `resume_path` varchar(512) NOT NULL,
  `status` enum('SUBMITTED','SHORTLISTED','REJECTED','INTERVIEW_SCHEDULED') DEFAULT 'SUBMITTED',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `education` text DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `experience` text DEFAULT NULL,
  `expertise` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `job_id`, `candidate_id`, `resume_path`, `status`, `created_at`, `updated_at`, `education`, `skills`, `experience`, `expertise`) VALUES
(1, 1, 6, '/var/storage/resumes/candidate_6_cv.pdf', 'INTERVIEW_SCHEDULED', '2026-06-18 18:14:05', '2026-06-19 04:07:12', NULL, NULL, NULL, NULL),
(3, 3, 6, 'uploads/senior_dev_resume.pdf', 'SHORTLISTED', '2026-06-19 06:40:11', '2026-06-19 06:40:52', 'Bachelor of Software Engineering, UTM (2018â2022)', 'Spring Boot, Java, REST API, Microservices, MySQL, Docker', 'Software Engineer at Tech Solutions Sdn Bhd (2 years)\r\nBuilt HR management system and API services', 'Backend Architecture, API Development, System Design'),
(4, 2, 6, 'uploads/default_resume.pdf', 'INTERVIEW_SCHEDULED', '2026-06-19 13:59:39', '2026-06-19 14:00:32', 'Bachelor Degree', 'Java', 'Fresh Graduate', 'Software Development'),
(5, 4, 7, 'uploads/default_resume.pdf', 'REJECTED', '2026-06-19 14:06:00', '2026-06-19 14:06:38', 'Diploma', 'Java, SQL, Spring book\r\n', 'Internship', 'Software Development');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_profile`
--

CREATE TABLE `candidate_profile` (
  `id` int(11) NOT NULL,
  `candidate_id` bigint(20) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `education` text DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `experience` text DEFAULT NULL,
  `expertise` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidate_profile`
--

INSERT INTO `candidate_profile` (`id`, `candidate_id`, `phone`, `education`, `skills`, `experience`, `expertise`, `created_at`) VALUES
(1, 6, NULL, 'Diploma in Information Technology, XYZ College (2022â2025)', 'Java, JSP, Servlets, SQL, HTML, CSS, JavaScript, Bootstrap', 'Intern at ABC Tech (6 months)\r\nDeveloped a job portal system using Java JSP', 'Web Development, Backend Development, Database Management', '2026-06-18 19:33:01');

-- --------------------------------------------------------

--
-- Table structure for table `event_log`
--

CREATE TABLE `event_log` (
  `event_id` varchar(36) NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `payload` longtext NOT NULL,
  `retry_count` int(11) DEFAULT 0,
  `state` enum('PENDING','PROCESSED','FAILED') DEFAULT 'PENDING',
  `exception_context` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interviews`
--

CREATE TABLE `interviews` (
  `id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `interview_date` date NOT NULL,
  `interview_time` time NOT NULL,
  `interview_location` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'SCHEDULED'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interviews`
--

INSERT INTO `interviews` (`id`, `application_id`, `interview_date`, `interview_time`, `interview_location`, `notes`, `status`) VALUES
(1, 1, '2026-06-30', '09:00:00', 'Google Meets', 'formal interview', 'SCHEDULED'),
(2, 4, '2026-07-02', '10:00:00', 'Google Meets', 'Pakaian Formal', 'SCHEDULED');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) NOT NULL,
  `recruiter_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `required_skills` text NOT NULL,
  `salary` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','CLOSED') DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `recruiter_id`, `title`, `description`, `required_skills`, `salary`, `location`, `status`, `created_at`) VALUES
(1, 1, 'architect', 'need experience', 'need degree', 'RM5000', 'Pasir Gudang, Johor', 'ACTIVE', '2026-06-18 15:19:31'),
(2, 1, 'web development', '4 days in office, 2 days at work from home', 'fresh graduate', 'RM4500', 'Puncak Alam, Selangor', 'ACTIVE', '2026-06-19 01:25:57'),
(3, 1, 'game developer', 'We are looking for a creative and passionate Game Developer to design, develop, and maintain interactive games for web and mobile platforms. You will be responsible for building game mechanics, optimizing performance, and collaborating with designers and artists to deliver engaging user experiences.', 'Bachelorâs Degree or Diploma in Computer Science, Game Development, or related field\r\nStrong knowledge of programming languages such as C#, C++, or Java\r\nExperience with game engines like Unity or Unreal Engine\r\nUnderstanding of game physics, AI, and animation systems', 'RM3000', 'Johor Bahru, Johor', 'ACTIVE', '2026-06-19 06:37:18'),
(4, 1, 'Software Engineer', 'Develop and maintain enterprise web applications. Work closely with business analysts and project managers to deliver scalable software solutions.', '-Degree in Computer Science or related field.\r\n-Experience with Java, Spring Boot, JSP, or PHP.\r\n-Knowledge of MySQL database design.\r\n-Familiarity with Git version control.\r\n-Strong problem-solving skills.', 'RM9000', 'Cyberjaya, Malaysia', 'ACTIVE', '2026-06-19 14:03:15'),
(5, 1, 'Mobile App Developer', 'Develop Android and iOS applications with modern UI and smooth user experiences.', '-Experience with Flutter or React Native.\r\n-Knowledge of REST APIs.\r\n-Familiarity with Firebase.\r\n-Strong debugging skills.', 'RM8500', 'Petaling Jaya, Kuala Lumpur', 'ACTIVE', '2026-06-19 14:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('CANDIDATE','RECRUITER') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `role`, `created_at`) VALUES
(1, 'ayam', 'admin@gmail.com', '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c', 'RECRUITER', '2026-06-16 15:04:18'),
(2, 'lan', 'abc@gmail.com', '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c', 'CANDIDATE', '2026-06-16 15:12:36'),
(3, 'ayam', 'aaa@gmail.com', '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c', 'CANDIDATE', '2026-06-16 16:20:18'),
(4, 'radilan', 'gamersp161@gmail.com', '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c', 'CANDIDATE', '2026-06-17 07:34:11'),
(5, 'neymar jr', 'neymar11@gmail.com', '54d5cb2d332dbdb4850293caae4559ce88b65163f1ea5d4e4b3ac49d772ded14', 'RECRUITER', '2026-06-18 13:46:48'),
(6, 'Adam', 'adamdanish7105@gmail.com', '54d5cb2d332dbdb4850293caae4559ce88b65163f1ea5d4e4b3ac49d772ded14', 'CANDIDATE', '2026-06-18 14:57:47'),
(7, 'MJ', 'mj@gmail.com', '54d5cb2d332dbdb4850293caae4559ce88b65163f1ea5d4e4b3ac49d772ded14', 'CANDIDATE', '2026-06-19 14:04:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_job_candidate` (`job_id`,`candidate_id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `candidate_profile`
--
ALTER TABLE `candidate_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `event_log`
--
ALTER TABLE `event_log`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `interviews`
--
ALTER TABLE `interviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_job_recruiter` (`recruiter_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `candidate_profile`
--
ALTER TABLE `candidate_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `interviews`
--
ALTER TABLE `interviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `candidate_profile`
--
ALTER TABLE `candidate_profile`
  ADD CONSTRAINT `candidate_profile_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `fk_job_recruiter` FOREIGN KEY (`recruiter_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
