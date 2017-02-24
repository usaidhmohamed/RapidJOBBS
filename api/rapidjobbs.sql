-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 22, 2017 at 11:10 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rapidjobbs`
--

-- --------------------------------------------------------

--
-- Table structure for table `business_stream`
--

CREATE TABLE `business_stream` (
  `id` int(11) NOT NULL,
  `business_stream_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `profile_description` varchar(1000) NOT NULL,
  `business_stream_id` int(11) NOT NULL,
  `establishment_date` date NOT NULL,
  `company_website_url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_image`
--

CREATE TABLE `company_image` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `company_image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `education_detail`
--

CREATE TABLE `education_detail` (
  `user_account_id` int(11) NOT NULL,
  `certificate_degree_name` varchar(50) NOT NULL,
  `major` varchar(50) NOT NULL,
  `Institute_university_name` varchar(50) NOT NULL,
  `starting_date` date NOT NULL,
  `completion_date` date DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `cgpa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `experience_detail`
--

CREATE TABLE `experience_detail` (
  `user_account_id` int(11) NOT NULL,
  `is_current_job` char(1) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `job_location_city` varchar(50) NOT NULL,
  `job_location_state` varchar(50) NOT NULL,
  `job_location_country` varchar(50) NOT NULL,
  `description` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_location`
--

CREATE TABLE `job_location` (
  `id` int(11) NOT NULL,
  `street_address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_post`
--

CREATE TABLE `job_post` (
  `id` int(11) NOT NULL,
  `posted_by_id` int(11) NOT NULL,
  `job_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `is_company_name_hidden` char(1) NOT NULL,
  `created_date` date NOT NULL,
  `job_description` varchar(500) NOT NULL,
  `job_location_id` int(11) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_post_activity`
--

CREATE TABLE `job_post_activity` (
  `user_account_id` int(11) NOT NULL,
  `job_post_id` int(11) NOT NULL,
  `apply_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_post_skill_set`
--

CREATE TABLE `job_post_skill_set` (
  `skill_set_id` int(11) NOT NULL,
  `job_post_id` int(11) NOT NULL,
  `skill_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_type`
--

CREATE TABLE `job_type` (
  `id` int(11) NOT NULL,
  `job_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seeker_profile`
--

CREATE TABLE `seeker_profile` (
  `user_account_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `current_salary` int(11) DEFAULT NULL,
  `is_annually_monthly` char(1) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seeker_skill_set`
--

CREATE TABLE `seeker_skill_set` (
  `user_account_id` int(11) NOT NULL,
  `skill_set_id` int(11) NOT NULL,
  `skill_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skill_set`
--

CREATE TABLE `skill_set` (
  `id` int(11) NOT NULL,
  `skill_set_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` char(1) NOT NULL,
  `is_active` char(1) NOT NULL,
  `contact_int` int(10) NOT NULL,
  `sms_notification_active` char(1) NOT NULL,
  `email_notification_active` char(1) NOT NULL,
  `user_image` blob,
  `registration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `user_account_id` int(11) NOT NULL,
  `last_login_date` date NOT NULL,
  `last_job_apply_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `user_type_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business_stream`
--
ALTER TABLE `business_stream`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_business_stream` (`business_stream_id`);

--
-- Indexes for table `company_image`
--
ALTER TABLE `company_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_image_company` (`company_id`);

--
-- Indexes for table `education_detail`
--
ALTER TABLE `education_detail`
  ADD PRIMARY KEY (`user_account_id`,`certificate_degree_name`,`major`);

--
-- Indexes for table `experience_detail`
--
ALTER TABLE `experience_detail`
  ADD PRIMARY KEY (`user_account_id`,`start_date`,`end_date`);

--
-- Indexes for table `job_location`
--
ALTER TABLE `job_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_post`
--
ALTER TABLE `job_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_post_company` (`company_id`),
  ADD KEY `job_post_job_location` (`job_location_id`),
  ADD KEY `job_post_job_type` (`job_type_id`),
  ADD KEY `job_post_user_register` (`posted_by_id`);

--
-- Indexes for table `job_post_activity`
--
ALTER TABLE `job_post_activity`
  ADD PRIMARY KEY (`user_account_id`,`job_post_id`),
  ADD KEY `job_post_activity_job_post` (`job_post_id`);

--
-- Indexes for table `job_post_skill_set`
--
ALTER TABLE `job_post_skill_set`
  ADD PRIMARY KEY (`skill_set_id`,`job_post_id`),
  ADD KEY `job_post_skill_set_job_post` (`job_post_id`);

--
-- Indexes for table `job_type`
--
ALTER TABLE `job_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seeker_profile`
--
ALTER TABLE `seeker_profile`
  ADD PRIMARY KEY (`user_account_id`);

--
-- Indexes for table `seeker_skill_set`
--
ALTER TABLE `seeker_skill_set`
  ADD PRIMARY KEY (`user_account_id`,`skill_set_id`),
  ADD KEY `seeker_skill_set_skill_set` (`skill_set_id`);

--
-- Indexes for table `skill_set`
--
ALTER TABLE `skill_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_register_user_type` (`user_type_id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`user_account_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_business_stream` FOREIGN KEY (`business_stream_id`) REFERENCES `business_stream` (`id`);

--
-- Constraints for table `company_image`
--
ALTER TABLE `company_image`
  ADD CONSTRAINT `company_image_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `education_detail`
--
ALTER TABLE `education_detail`
  ADD CONSTRAINT `educ_dtl_seeker_profile` FOREIGN KEY (`user_account_id`) REFERENCES `seeker_profile` (`user_account_id`);

--
-- Constraints for table `experience_detail`
--
ALTER TABLE `experience_detail`
  ADD CONSTRAINT `exp_dtl_seeker_profile` FOREIGN KEY (`user_account_id`) REFERENCES `seeker_profile` (`user_account_id`);

--
-- Constraints for table `job_post`
--
ALTER TABLE `job_post`
  ADD CONSTRAINT `job_post_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `job_post_job_location` FOREIGN KEY (`job_location_id`) REFERENCES `job_location` (`id`),
  ADD CONSTRAINT `job_post_job_type` FOREIGN KEY (`job_type_id`) REFERENCES `job_type` (`id`),
  ADD CONSTRAINT `job_post_user_register` FOREIGN KEY (`posted_by_id`) REFERENCES `user_account` (`id`);

--
-- Constraints for table `job_post_activity`
--
ALTER TABLE `job_post_activity`
  ADD CONSTRAINT `job_post_act_user_register` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`),
  ADD CONSTRAINT `job_post_activity_job_post` FOREIGN KEY (`job_post_id`) REFERENCES `job_post` (`id`);

--
-- Constraints for table `job_post_skill_set`
--
ALTER TABLE `job_post_skill_set`
  ADD CONSTRAINT `job_post_skill_set_job_post` FOREIGN KEY (`job_post_id`) REFERENCES `job_post` (`id`),
  ADD CONSTRAINT `job_post_skill_set_skill_set` FOREIGN KEY (`skill_set_id`) REFERENCES `skill_set` (`id`);

--
-- Constraints for table `seeker_profile`
--
ALTER TABLE `seeker_profile`
  ADD CONSTRAINT `seeker_profile_user_register` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`);

--
-- Constraints for table `seeker_skill_set`
--
ALTER TABLE `seeker_skill_set`
  ADD CONSTRAINT `seeker_skill_set_skill_set` FOREIGN KEY (`skill_set_id`) REFERENCES `skill_set` (`id`),
  ADD CONSTRAINT `skill_set_seeker_profile` FOREIGN KEY (`user_account_id`) REFERENCES `seeker_profile` (`user_account_id`);

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `user_register_user_type` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`);

--
-- Constraints for table `user_log`
--
ALTER TABLE `user_log`
  ADD CONSTRAINT `use_log_user_register` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
