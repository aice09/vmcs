-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.6043
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for vmcs
DROP DATABASE IF EXISTS `vmcs`;
CREATE DATABASE IF NOT EXISTS `vmcs` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `vmcs`;

-- Dumping structure for table vmcs.appointment
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_customerid` varchar(50) DEFAULT NULL,
  `appointment_vetid` varchar(50) DEFAULT NULL,
  `appointment_schedid` varchar(50) DEFAULT NULL,
  `appointment_code` varchar(50) DEFAULT NULL,
  `appointment_reason` text DEFAULT NULL,
  `appointment_time` varchar(50) DEFAULT NULL,
  `appointment_status` enum('Cancel','Booked','In Process','Completed') DEFAULT NULL,
  `appointment_come` enum('Y','N') DEFAULT NULL,
  `appointment_vetcomment` text DEFAULT NULL,
  `appointment_createdby` varchar(50) DEFAULT NULL,
  `appointment_createddate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table vmcs.appointment: ~0 rows (approximately)
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;

-- Dumping structure for table vmcs.pets
DROP TABLE IF EXISTS `pets`;
CREATE TABLE IF NOT EXISTS `pets` (
  `pet_id` int(11) NOT NULL AUTO_INCREMENT,
  `pet_code` varchar(50) DEFAULT NULL,
  `pet_catid` varchar(50) DEFAULT NULL,
  `pet_name` text DEFAULT NULL,
  `pet_adopted` enum('Adopted','Rescued') DEFAULT NULL,
  `pet_adoptedfrom` varchar(50) DEFAULT NULL,
  `pet_rescuedfrom` varchar(50) DEFAULT NULL,
  `pet_processdate` varchar(50) DEFAULT NULL,
  `pet_processby` varchar(50) DEFAULT NULL,
  `pet_status` enum('In Custody','Adopted','Deleted') DEFAULT NULL,
  PRIMARY KEY (`pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table vmcs.pets: ~0 rows (approximately)
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;

-- Dumping structure for table vmcs.pet_category
DROP TABLE IF EXISTS `pet_category`;
CREATE TABLE IF NOT EXISTS `pet_category` (
  `petcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `petcat_name` text DEFAULT NULL,
  `petcat_processdate` varchar(50) DEFAULT NULL,
  `petcat_processby` varchar(50) DEFAULT NULL,
  `petcat_status` enum('Active','Inactive','Deleted') DEFAULT NULL,
  PRIMARY KEY (`petcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table vmcs.pet_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `pet_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_category` ENABLE KEYS */;

-- Dumping structure for table vmcs.schedules
DROP TABLE IF EXISTS `schedules`;
CREATE TABLE IF NOT EXISTS `schedules` (
  `sched_id` int(11) NOT NULL AUTO_INCREMENT,
  `sched_vetid` varchar(50) DEFAULT NULL,
  `sched_date` varchar(50) DEFAULT NULL,
  `sched_day` varchar(50) DEFAULT NULL,
  `sched_starttime` varchar(50) DEFAULT NULL,
  `sched_endtime` varchar(50) DEFAULT NULL,
  `sched_consultingtime` varchar(50) DEFAULT NULL,
  `sched_status` varchar(50) DEFAULT NULL,
  `sched_createdby` varchar(50) DEFAULT NULL,
  `sched_createddate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sched_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table vmcs.schedules: ~0 rows (approximately)
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` (`sched_id`, `sched_vetid`, `sched_date`, `sched_day`, `sched_starttime`, `sched_endtime`, `sched_consultingtime`, `sched_status`, `sched_createdby`, `sched_createddate`) VALUES
	(1, '6', '12/10/2021', 'Friday', '16:00', '17:00', '20 Minutes', 'Active', '6', '12/10/2021 16:03:49'),
	(2, '6', '12/11/2021', 'Saturday', '08:00', '17:00', '15 Minutes', 'Active', '6', '12/10/2021 16:14:37'),
	(3, '6', '12/16/2021', 'Thursday', '09:00', '12:30', '20 Minutes', 'Deleted', '6', '12/10/2021 16:19:19'),
	(4, '6', '12/24/2021', 'Friday', '16:20', '17:20', '10 Minutes', 'Active', '6', '12/10/2021 16:20:52');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;

-- Dumping structure for table vmcs.stocks
DROP TABLE IF EXISTS `stocks`;
CREATE TABLE IF NOT EXISTS `stocks` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_catid` varchar(50) DEFAULT NULL,
  `stock_name` text DEFAULT NULL,
  `stock_quantity` varchar(50) DEFAULT NULL,
  `stock_processdate` varchar(50) DEFAULT NULL,
  `stock_processby` varchar(50) DEFAULT NULL,
  `stock_status` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table vmcs.stocks: ~0 rows (approximately)
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;

-- Dumping structure for table vmcs.stocks_category
DROP TABLE IF EXISTS `stocks_category`;
CREATE TABLE IF NOT EXISTS `stocks_category` (
  `stockcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `stockcat_name` text DEFAULT NULL,
  PRIMARY KEY (`stockcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table vmcs.stocks_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `stocks_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `stocks_category` ENABLE KEYS */;

-- Dumping structure for table vmcs.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `usersalt` text DEFAULT NULL,
  `userpass` text DEFAULT NULL,
  `userfirstname` varchar(255) DEFAULT NULL,
  `usermiddlename` varchar(255) DEFAULT NULL,
  `userlastname` varchar(255) DEFAULT NULL,
  `useremail` varchar(255) DEFAULT NULL,
  `usercategory` varchar(255) DEFAULT NULL,
  `userstatus` enum('activated','suspended','unactivated') DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table vmcs.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userid`, `username`, `usersalt`, `userpass`, `userfirstname`, `usermiddlename`, `userlastname`, `useremail`, `usercategory`, `userstatus`) VALUES
	(6, 'aice0927', 'ALNlJZ04O1PGBbYglCIDR', '$2a$05$ALNlJZ04O1PGBbYglCIDR.HvKbJky1jNh9POES580euMuMsA4mGLi', 'Carl Angelo', 'Pamparo', 'Nievarez', 'carlangelopamparonievarez@gmail.com', '3', 'activated');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table vmcs.user_category
DROP TABLE IF EXISTS `user_category`;
CREATE TABLE IF NOT EXISTS `user_category` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table vmcs.user_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_category` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
