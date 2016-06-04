-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2016 at 08:06 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `campusweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `cid` int(11) NOT NULL,
  `c_code` varchar(10) DEFAULT NULL,
  `c_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course_offered`
--

CREATE TABLE IF NOT EXISTS `course_offered` (
  `coid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `u_name` varchar(45) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `p_phone_no` varchar(20) NOT NULL,
  `p_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE IF NOT EXISTS `section` (
  `sid` int(11) NOT NULL,
  `coid` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `u_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `section_mark`
--

CREATE TABLE IF NOT EXISTS `section_mark` (
  `smid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `sm_item` varchar(255) NOT NULL,
  `sm_total` float(10,4) NOT NULL,
  `sm_percentage` float(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `section_student`
--

CREATE TABLE IF NOT EXISTS `section_student` (
  `sid` int(11) NOT NULL,
  `u_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE IF NOT EXISTS `semester` (
  `sid` int(11) NOT NULL,
  `s_year` varchar(10) DEFAULT NULL,
  `s_sem` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_mark`
--

CREATE TABLE IF NOT EXISTS `student_mark` (
  `u_name` varchar(45) DEFAULT NULL,
  `smid` int(11) NOT NULL,
  `stum_score` float(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `u_name` varchar(45) NOT NULL,
  `u_password` varchar(255) DEFAULT NULL,
  `u_level` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `course_offered`
--
ALTER TABLE `course_offered`
  ADD PRIMARY KEY (`coid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD KEY `u_name` (`u_name`) USING BTREE;

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `coid` (`coid`),
  ADD KEY `u_name` (`u_name`);

--
-- Indexes for table `section_mark`
--
ALTER TABLE `section_mark`
  ADD PRIMARY KEY (`smid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `section_student`
--
ALTER TABLE `section_student`
  ADD KEY `sid` (`sid`),
  ADD KEY `u_name` (`u_name`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `student_mark`
--
ALTER TABLE `student_mark`
  ADD KEY `smid` (`smid`),
  ADD KEY `u_name` (`u_name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `course_offered`
--
ALTER TABLE `course_offered`
  MODIFY `coid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `section_mark`
--
ALTER TABLE `section_mark`
  MODIFY `smid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_offered`
--
ALTER TABLE `course_offered`
  ADD CONSTRAINT `course_offered_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  ADD CONSTRAINT `course_offered_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `semester` (`sid`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`u_name`) REFERENCES `user` (`u_name`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`coid`) REFERENCES `course_offered` (`coid`),
  ADD CONSTRAINT `section_ibfk_2` FOREIGN KEY (`u_name`) REFERENCES `user` (`u_name`);

--
-- Constraints for table `section_mark`
--
ALTER TABLE `section_mark`
  ADD CONSTRAINT `section_mark_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `section` (`sid`);

--
-- Constraints for table `section_student`
--
ALTER TABLE `section_student`
  ADD CONSTRAINT `section_student_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `section` (`sid`),
  ADD CONSTRAINT `section_student_ibfk_2` FOREIGN KEY (`u_name`) REFERENCES `user` (`u_name`);

--
-- Constraints for table `student_mark`
--
ALTER TABLE `student_mark`
  ADD CONSTRAINT `student_mark_ibfk_1` FOREIGN KEY (`smid`) REFERENCES `section_mark` (`smid`),
  ADD CONSTRAINT `student_mark_ibfk_2` FOREIGN KEY (`u_name`) REFERENCES `user` (`u_name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
