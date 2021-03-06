-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for vmcs
DROP DATABASE IF EXISTS `vmcs`;
CREATE DATABASE IF NOT EXISTS `vmcs` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `vmcs`;

-- Dumping structure for table vmcs.adaptions
DROP TABLE IF EXISTS `adaptions`;
CREATE TABLE IF NOT EXISTS `adaptions` (
  `adapt_id` int(11) NOT NULL AUTO_INCREMENT,
  `adapt_petid` varchar(50) DEFAULT NULL,
  `adapt_customerid` varchar(50) DEFAULT NULL,
  `adapt_dateadapted` varchar(50) DEFAULT NULL,
  `adapt_processdate` varchar(50) DEFAULT NULL,
  `adapt_processby` varchar(50) DEFAULT NULL,
  `adapt_status` enum('Temp','Full','Returned') DEFAULT NULL,
  `adapt_remarks` text DEFAULT NULL,
  PRIMARY KEY (`adapt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

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
  `appointment_status` enum('Pending','Cancel','Booked','In Process','Completed') DEFAULT NULL,
  `appointment_come` enum('Yes','No') DEFAULT NULL,
  `appointment_vetcomment` text DEFAULT NULL,
  `appointment_custcreatedby` varchar(50) DEFAULT NULL,
  `appointment_custcreateddate` varchar(50) DEFAULT NULL,
  `appointment_vetcreatedby` varchar(50) DEFAULT NULL,
  `appointment_vetcreateddate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vmcs.breeding
DROP TABLE IF EXISTS `breeding`;
CREATE TABLE IF NOT EXISTS `breeding` (
  `breed_id` int(11) NOT NULL AUTO_INCREMENT,
  `breed_code` varchar(50) DEFAULT NULL,
  `breed_motherid` varchar(50) DEFAULT NULL,
  `breed_fatherid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`breed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vmcs.breed_seeds
DROP TABLE IF EXISTS `breed_seeds`;
CREATE TABLE IF NOT EXISTS `breed_seeds` (
  `bseed_id` int(11) NOT NULL AUTO_INCREMENT,
  `bseed_breedid` varchar(50) DEFAULT NULL,
  `bseed_bday` varchar(50) DEFAULT NULL,
  `bseed_gender` varchar(50) DEFAULT NULL,
  `bseed_processdate` varchar(50) DEFAULT NULL,
  `bseed_processby` varchar(50) DEFAULT NULL,
  `bseed_status` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`bseed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

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
  `pet_birthday` varchar(50) DEFAULT NULL,
  `pet_gender` enum('Male','Female') DEFAULT NULL,
  `pet_processdate` varchar(50) DEFAULT NULL,
  `pet_processby` varchar(50) DEFAULT NULL,
  `pet_status` enum('In Custody','Adopted','Deleted') DEFAULT NULL,
  PRIMARY KEY (`pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vmcs.pet_category
DROP TABLE IF EXISTS `pet_category`;
CREATE TABLE IF NOT EXISTS `pet_category` (
  `petcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `petcat_name` text DEFAULT NULL,
  `petcat_processdate` varchar(50) DEFAULT NULL,
  `petcat_processby` varchar(50) DEFAULT NULL,
  `petcat_status` enum('Active','Inactive','Deleted') DEFAULT NULL,
  PRIMARY KEY (`petcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vmcs.stocks
DROP TABLE IF EXISTS `stocks`;
CREATE TABLE IF NOT EXISTS `stocks` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_code` varchar(50) DEFAULT NULL,
  `stock_catid` varchar(50) DEFAULT NULL,
  `stock_name` text DEFAULT NULL,
  `stock_quantity` varchar(50) DEFAULT NULL,
  `stock_price` varchar(50) DEFAULT NULL,
  `stock_expirationdate` varchar(50) DEFAULT NULL,
  `stock_processdate` varchar(50) DEFAULT NULL,
  `stock_processby` varchar(50) DEFAULT NULL,
  `stock_status` enum('Active','Inactive','Deleted') DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vmcs.stocks_category
DROP TABLE IF EXISTS `stocks_category`;
CREATE TABLE IF NOT EXISTS `stocks_category` (
  `stockcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `stockcat_name` text DEFAULT NULL,
  `stockcat_processdate` varchar(50) DEFAULT NULL,
  `stockcat_processby` varchar(50) DEFAULT NULL,
  `stockcat_status` enum('Active','Inactive','Deleted') DEFAULT NULL,
  PRIMARY KEY (`stockcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table vmcs.user_category
DROP TABLE IF EXISTS `user_category`;
CREATE TABLE IF NOT EXISTS `user_category` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
