-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2019 at 05:51 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartmcc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admininfo`
--

CREATE TABLE `admininfo` (
  `id` int(11) NOT NULL,
  `fName` varchar(100) NOT NULL,
  `lName` varchar(100) NOT NULL,
  `gender` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `address` varchar(2000) NOT NULL,
  `bdate` date NOT NULL,
  `file_name` varchar(2000) NOT NULL,
  `file_ext` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admininfo`
--

INSERT INTO `admininfo` (`id`, `fName`, `lName`, `gender`, `email`, `mobile`, `password`, `address`, `bdate`, `file_name`, `file_ext`) VALUES
(1, 'Hassan', 'Abdellah', 'Male', 'admin@admin.com', '01068478576', '123456789', 'Zag', '1995-11-28', '0', 'png');

-- --------------------------------------------------------

--
-- Table structure for table `available_dates`
--

CREATE TABLE `available_dates` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `available_dates`
--

INSERT INTO `available_dates` (`id`, `doctor_id`, `date`, `time`) VALUES
(35, 5, '2019-07-12', '13:00:00'),
(36, 5, '2019-07-12', '14:00:00'),
(37, 5, '2019-07-12', '15:00:00'),
(38, 5, '2019-07-12', '16:00:00'),
(39, 5, '2019-07-12', '17:00:00'),
(40, 5, '2019-07-12', '18:00:00'),
(42, 5, '2019-07-12', '20:00:00'),
(43, 5, '2019-07-12', '21:00:00'),
(44, 5, '2019-07-12', '22:00:00'),
(45, 5, '2019-07-12', '23:00:00'),
(46, 5, '2019-07-13', '13:00:00'),
(47, 5, '2019-07-13', '22:00:00'),
(48, 5, '2019-07-13', '21:00:00'),
(49, 5, '2019-07-13', '20:00:00'),
(50, 5, '2019-07-13', '19:00:00'),
(51, 5, '2019-07-13', '18:00:00'),
(52, 5, '2019-07-13', '17:00:00'),
(53, 5, '2019-07-13', '16:00:00'),
(54, 5, '2019-07-13', '15:00:00'),
(55, 5, '2019-07-13', '14:00:00'),
(56, 5, '2019-07-13', '23:00:00'),
(57, 7, '2019-07-14', '13:00:00'),
(58, 7, '2019-07-14', '23:00:00'),
(59, 7, '2019-07-14', '22:00:00'),
(60, 7, '2019-07-14', '21:00:00'),
(61, 7, '2019-07-14', '20:00:00'),
(62, 7, '2019-07-14', '19:00:00'),
(64, 7, '2019-07-14', '17:00:00'),
(65, 7, '2019-07-14', '16:00:00'),
(66, 7, '2019-07-14', '15:00:00'),
(67, 7, '2019-07-14', '14:00:00'),
(68, 7, '2019-07-13', '17:00:00'),
(69, 7, '2019-07-13', '16:00:00'),
(71, 7, '2019-07-13', '14:00:00'),
(72, 7, '2019-07-13', '18:00:00'),
(73, 7, '2019-07-13', '19:00:00'),
(74, 7, '2019-07-13', '20:00:00'),
(75, 7, '2019-07-13', '21:00:00'),
(76, 7, '2019-07-13', '22:00:00'),
(77, 7, '2019-07-13', '13:00:00'),
(78, 7, '2019-07-13', '23:00:00'),
(79, 8, '2019-07-14', '20:00:00'),
(80, 8, '2019-07-14', '16:00:00'),
(81, 8, '2019-07-14', '15:00:00'),
(82, 8, '2019-07-13', '17:00:00'),
(84, 8, '2019-07-13', '18:00:00'),
(85, 8, '2019-07-13', '19:00:00'),
(86, 8, '2019-07-13', '21:00:00'),
(87, 8, '2019-07-14', '13:00:00'),
(88, 8, '2019-07-14', '23:00:00'),
(89, 8, '2019-07-14', '22:00:00'),
(90, 8, '2019-07-14', '21:00:00'),
(91, 8, '2019-07-14', '18:00:00'),
(92, 8, '2019-07-13', '15:00:00'),
(94, 8, '2019-07-13', '22:00:00'),
(95, 8, '2019-07-14', '17:00:00'),
(96, 8, '2019-07-14', '14:00:00'),
(97, 8, '2019-07-13', '14:00:00'),
(98, 8, '2019-07-13', '20:00:00'),
(99, 8, '2019-07-14', '19:00:00'),
(100, 8, '2019-07-13', '23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `specialization` text NOT NULL,
  `info` text NOT NULL,
  `file_name` varchar(2000) NOT NULL,
  `file_ext` varchar(100) NOT NULL,
  `working_time` text NOT NULL,
  `location_map` text NOT NULL,
  `location_text` text NOT NULL,
  `phones` text NOT NULL,
  `fees` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `specialization`, `info`, `file_name`, `file_ext`, `working_time`, `location_map`, `location_text`, `phones`, `fees`) VALUES
(5, 'Ahmed El Gazar', 'andrology, infertility , nephrology', 'Urologist specialized in Adult Nephrology, Andrology, Pediatric Nephrology, Pediatric Urology, Adult Urology, Adult Urology Surgery and Pediatric Urology Surgery', '1560438636', 'jpeg', 'Every Day From 01:00 pm to 12:00 am', '', 'El-Zagazig : next to sednawy hospital and hyper salam and meet ghamr parking', '01068478576', '100'),
(7, 'Rasha Samir', 'Psychiatry and Addiction treatment', 'Psychiatrist specialized in Addiction, Pediatric Psychiatry, Adult Psychiatry, Adolescent Psychiatry and Family Counseling', '1560439462', 'jpeg', 'Every Day From 01:00 pm to 12:00 am except friday', '', 'El-Zagazig : dross street\r\n', '01223652369', '220'),
(8, 'Ghoneum Helal', 'Consultant of orthopedic surgery', ' Arthroscopy and Sports injuries', '1560440128', 'png', 'Saturday, Sunday, Wednesday from 01:00 am to 12:00 pm', '', 'El-Zagazig : al mahatta street anshas blbes\r\n', '01224103249', '100');

-- --------------------------------------------------------

--
-- Table structure for table `medical_history`
--

CREATE TABLE `medical_history` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `medical_history` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medical_history`
--

INSERT INTO `medical_history` (`id`, `userID`, `medical_history`) VALUES
(1, 66, '{\r\n  \"MS\": -1,\r\n  \"PoRD\": null,\r\n  \"DoLPE\": null,\r\n  \"CHI\": {\r\n    \"Me\":-1,\r\n    \"Mu\":-1,\r\n    \"Ru\":-1,\r\n    \"Ch\":-1,\r\n    \"RF\":-1,\r\n    \"Po\":-1\r\n  },\r\n  \"Imu\":{\r\n    \"Tet\":{\r\n      \"chk\":false,\r\n      \"date\":null\r\n    },\r\n    \"Hep\":{\r\n      \"chk\":false,\r\n      \"date\":null\r\n    },\r\n    \"Inf\":{\r\n      \"chk\":false,\r\n      \"date\":null\r\n    },\r\n    \"Phe\":{\r\n      \"chk\":false,\r\n      \"date\":null\r\n    },\r\n    \"Ch\":{\r\n      \"chk\":false,\r\n      \"date\":null\r\n    },\r\n    \"MMR\":{\r\n      \"chk\":false,\r\n      \"date\":null\r\n    }\r\n  },\r\n  \"Other\":[\r\n    null,\r\n    null\r\n  ],\r\n  \"Surgs\":{\r\n    \"1\":{\r\n      \"chk\":false,\r\n      \"year\":null,\r\n      \"reason\":null,\r\n      \"hospital\":null\r\n    },\r\n    \"2\":{\r\n      \"chk\":false,\r\n      \"year\":null,\r\n      \"reason\":null,\r\n      \"hospital\":null\r\n    },\r\n    \"3\":{\r\n      \"chk\":false,\r\n      \"year\":null,\r\n      \"reason\":null,\r\n      \"hospital\":null\r\n    },\r\n    \"4\":{\r\n      \"chk\":false,\r\n      \"year\":null,\r\n      \"reason\":null,\r\n      \"hospital\":null\r\n    },\r\n    \"5\":{\r\n      \"chk\":false,\r\n      \"year\":null,\r\n      \"reason\":null,\r\n      \"hospital\":null\r\n    }\r\n  },\r\n  \"OtherHospitalizations\":{\r\n    \"1\":{\r\n      \"chk\":false,\r\n      \"year\":null,\r\n      \"reason\":null,\r\n      \"hospital\":null\r\n    },\r\n    \"2\":{\r\n      \"chk\":false,\r\n      \"year\":null,\r\n      \"reason\":null,\r\n      \"hospital\":null\r\n    },\r\n    \"3\":{\r\n      \"chk\":false,\r\n      \"year\":null,\r\n      \"reason\":null,\r\n      \"hospital\":null\r\n    },\r\n    \"4\":{\r\n      \"chk\":false,\r\n      \"year\":null,\r\n      \"reason\":null,\r\n      \"hospital\":null\r\n    },\r\n    \"5\":{\r\n      \"chk\":false,\r\n      \"year\":null,\r\n      \"reason\":null,\r\n      \"hospital\":null\r\n    }\r\n  },\r\n  \"PT\":-1,\r\n  \"prescribed drugs\":{\r\n    \"1\":{\r\n      \"chk\":false,\r\n      \"name\":null,\r\n      \"strength\":-1,\r\n      \"freq\":-1\r\n    },\r\n    \"2\":{\r\n      \"chk\":false,\r\n      \"name\":null,\r\n      \"strength\":-1,\r\n      \"freq\":-1\r\n    },\r\n    \"3\":{\r\n      \"chk\":false,\r\n      \"name\":null,\r\n      \"strength\":-1,\r\n      \"freq\":-1\r\n    },\r\n    \"4\":{\r\n      \"chk\":false,\r\n      \"name\":null,\r\n      \"strength\":-1,\r\n      \"freq\":-1\r\n    },\r\n    \"5\":{\r\n      \"chk\":true,\r\n      \"name\":\"voltaren\",\r\n      \"strength\":1000,\r\n      \"freq\":2\r\n    },\r\n    \"6\":{\r\n      \"chk\":false,\r\n      \"name\":null,\r\n      \"strength\":-1,\r\n      \"freq\":-1\r\n    },\r\n    \"7\":{\r\n      \"chk\":false,\r\n      \"name\":null,\r\n      \"strength\":-1,\r\n      \"freq\":-1\r\n    },\r\n    \"8\":{\r\n      \"chk\":false,\r\n      \"name\":null,\r\n      \"strength\":-1,\r\n      \"freq\":-1\r\n    }\r\n  },\r\n  \"allergies\":{\r\n    \"1\":{\r\n      \"chk\":false,\r\n      \"drug\":null,\r\n      \"reaction\":null\r\n    },\r\n    \"2\":{\r\n      \"chk\":false,\r\n      \"drug\":null,\r\n      \"reaction\":null\r\n    },\r\n    \"3\":{\r\n      \"chk\":false,\r\n      \"drug\":null,\r\n      \"reaction\":null\r\n    }\r\n  },\r\n  \"exercise\":-1,\r\n  \"diet\":{\r\n    \"dite\":-1,\r\n    \"medical diet\":-1,\r\n    \"meals\":-1,\r\n    \"salt\":-1,\r\n    \"fat\":-1\r\n  },\r\n  \"caffeine\":{\r\n    \"type\":-1,\r\n    \"cups\":-1\r\n  },\r\n  \"alcohol\":{\r\n    \"drink\":-1,\r\n    \"kind\":null,\r\n    \"drinks per week\":-1,\r\n    \"concerned\":-1,\r\n    \"stopping\":-1,\r\n    \"blackouts\":-1,\r\n    \"binge\":-1,\r\n    \"drive\":-1\r\n  },\r\n  \"tobacco\":{\r\n    \"tobacco\":-1,\r\n    \"cigarettes\":-1,\r\n    \"chew\":-1,\r\n    \"pipe\":-1,\r\n    \"cigars\":-1,\r\n    \"years\":-1,\r\n    \"quit\":-1\r\n  },\r\n  \"drugs\":{\r\n    \"recreational\":-1,\r\n    \"needle\":-1\r\n  },\r\n  \"sex\": {\r\n    \"sexually_active\":-1,\r\n    \"trying_pregnancy\":-1,\r\n    \"barrier_method\":null,\r\n    \"intercourse_discomfort\":-1,\r\n    \"HIV_risk\":-1\r\n  },\r\n  \"personal safety\": {\r\n    \"live_alone\":-1,\r\n    \"frequent_falls\":-1,\r\n    \"vision/hearing_loss\":-1,\r\n    \"advance_directive/living_will\":-1,\r\n    \"information\":-1,\r\n    \"physical/sexual_abuse\":-1\r\n  },\r\n  \"familly\": {\r\n    \"father\": {\r\n      \"chk\":false,\r\n      \"age\":-1,\r\n      \"Health_problems\":null\r\n    },\r\n    \"mother\": {\r\n      \"chk\":false,\r\n      \"age\":-1,\r\n      \"Health_problems\":null\r\n    },\r\n    \"siblings\": {\r\n      \"1\":{\r\n        \"chk\":false,\r\n        \"gender\":-1,\r\n        \"age\":-1,\r\n        \"Health_problems\":null\r\n      },\r\n      \"2\":{\r\n        \"chk\":false,\r\n        \"gender\":-1,\r\n        \"age\":-1,\r\n        \"Health_problems\":null\r\n      },\r\n      \"3\":{\r\n        \"chk\":false,\r\n        \"gender\":-1,\r\n        \"age\":-1,\r\n        \"Health_problems\":null\r\n      },\r\n      \"4\":{\r\n        \"chk\":false,\r\n        \"gender\":-1,\r\n        \"age\":-1,\r\n        \"Health_problems\":null\r\n      },\r\n      \"5\":{\r\n        \"chk\":false,\r\n        \"gender\":-1,\r\n        \"age\":-1,\r\n        \"Health_problems\":null\r\n      }\r\n    },\r\n    \"children\": {\r\n      \"1\":{\r\n        \"chk\":true,\r\n        \"gender\":0,\r\n        \"age\":10,\r\n        \"Health_problems\":null\r\n      },\r\n      \"2\":{\r\n        \"chk\":false,\r\n        \"gender\":-1,\r\n        \"age\":-1,\r\n        \"Health_problems\":null\r\n      },\r\n      \"3\":{\r\n        \"chk\":false,\r\n        \"gender\":-1,\r\n        \"age\":-1,\r\n        \"Health_problems\":null\r\n      },\r\n      \"4\":{\r\n        \"chk\":false,\r\n        \"gender\":-1,\r\n        \"age\":-1,\r\n        \"Health_problems\":null\r\n      }\r\n    },\r\n    \"grandmother(m)\": {\r\n      \"chk\":false,\r\n      \"age\":-1,\r\n      \"Health_problems\":null\r\n    },\r\n    \"grandfather(m)\": {\r\n      \"chk\":false,\r\n      \"age\":-1,\r\n      \"Health_problems\":null\r\n    },\r\n    \"grandmother(p)\": {\r\n      \"chk\":false,\r\n      \"age\":-1,\r\n      \"Health_problems\":null\r\n    },\r\n    \"grandfather(p)\": {\r\n      \"chk\":false,\r\n      \"age\":-1,\r\n      \"Health_problems\":null\r\n    }\r\n  },\r\n  \"mental\":{\r\n    \"stress\":-1,\r\n    \"depress\":-1,\r\n    \"panic\":-1,\r\n    \"appetite\":-1,\r\n    \"cry\":-1,\r\n    \"suicide\":-1,\r\n    \"hurting_self\":-1,\r\n    \"sleeping_trouble\":-1,\r\n    \"counselor\":-1\r\n  },\r\n  \"women\":{\r\n    \"onset_menstruation\":-1,\r\n    \"last_menstruation\":null,\r\n    \"period\":-1,\r\n    \"heavy/irregularity periods\":-1,\r\n    \"pregnancies\":-1,\r\n    \"live_births\":-1,\r\n    \"pregnant/breast_feeding\":-1,\r\n    \"cesarean\":-1,\r\n    \"urinary_tract\":-1,\r\n    \"bloody_urine\":-1,\r\n    \"urination_control\":-1,\r\n    \"hot_flashes\":-1,\r\n    \"menstrual_tension\":-1,\r\n    \"breast_tenderness\":-1,\r\n    \"rectal_exam\":null\r\n  },\r\n  \"men\":{\r\n    \"night_urination\":-1,\r\n    \"number_of_times\":-1,\r\n    \"urination_burn\":-1,\r\n    \"bloody_urine\":-1,\r\n    \"burnning_penis\":-1,\r\n    \"urination_force\":-1,\r\n    \"infection\":-1,\r\n    \"emptying_bladder\":-1,\r\n    \"erection\":-1,\r\n    \"testicle_pain\":-1,\r\n    \"rectal_exam\":null\r\n  },\r\n  \"other\":{\r\n    \"skin\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"head\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"ears\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"nose\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"throat\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"lungs\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"chest\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"back\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"intestinal\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"bladder\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"bowel\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"circulation\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"changes\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"weight\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"energy\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"sleep\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    },\r\n    \"other\":{\r\n      \"chk\":false,\r\n      \"explanation\":null\r\n    }\r\n  }\r\n}\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL,
  `fName` varchar(100) NOT NULL,
  `lName` varchar(100) NOT NULL,
  `gender` enum('0','1') NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `address` varchar(2000) NOT NULL,
  `bdate` date NOT NULL,
  `file_name` varchar(2000) NOT NULL,
  `file_ext` varchar(100) NOT NULL,
  `reg_date` varchar(1000) NOT NULL,
  `upd_date` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`id`, `fName`, `lName`, `gender`, `email`, `mobile`, `password`, `address`, `bdate`, `file_name`, `file_ext`, `reg_date`, `upd_date`) VALUES
(74, 'Ahmed', 'Alsadek', '0', 'alsadek@gmail.com', '01555598067', '123456789', 'Zahraa', '1996-08-24', '1560440512', 'jpeg', '2019-06-13 05:41:52pm', '2019-06-13 05:41:52pm'),
(75, 'Ahmed', 'Samy', '0', 'wewe@gmail.com', '01121050256', '123456789', 'Hosanya', '1996-03-21', '1560440624', 'jpeg', '2019-06-13 05:43:44pm', '2019-06-13 05:43:44pm'),
(76, 'Mona', 'Elsayed', '1', 'Mona@gmail.com', '01068478576', '123456789', 'Zagazig', '1995-05-10', '1560440764', 'jpeg', '2019-06-13 05:46:04pm', '2019-06-13 05:46:04pm');

-- --------------------------------------------------------

--
-- Table structure for table `user_reservation`
--

CREATE TABLE `user_reservation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` text NOT NULL,
  `time` varchar(10) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `ResDate` datetime NOT NULL,
  `confirmed` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_reservation`
--

INSERT INTO `user_reservation` (`id`, `user_id`, `doctor_id`, `date`, `time`, `status`, `ResDate`, `confirmed`) VALUES
(201, 76, 7, '2019-07-14', '18:00:00', 1, '2019-06-13 05:46:18', '0'),
(202, 76, 5, '2019-07-12', '19:00:00', 0, '2019-06-13 05:48:36', '0'),
(203, 74, 8, '2019-07-13', '13:00:00', 0, '2019-06-13 05:48:50', '1'),
(204, 74, 8, '2019-07-13', '16:00:00', 0, '2019-06-13 05:48:56', '0'),
(206, 74, 7, '2019-07-13', '15:00:00', 0, '2019-06-13 05:49:32', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admininfo`
--
ALTER TABLE `admininfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `available_dates`
--
ALTER TABLE `available_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_reservation`
--
ALTER TABLE `user_reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admininfo`
--
ALTER TABLE `admininfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `available_dates`
--
ALTER TABLE `available_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `medical_history`
--
ALTER TABLE `medical_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `user_reservation`
--
ALTER TABLE `user_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
