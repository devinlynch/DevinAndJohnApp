-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 09, 2013 at 03:09 PM
-- Server version: 5.6.10
-- PHP Version: 5.3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `n23n7wfhs9a99dd3`
--

-- --------------------------------------------------------

--
-- Table structure for table `BasicInfo`
--

CREATE TABLE IF NOT EXISTS `BasicInfo` (
  `BasicInfoID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `Birthday` date NOT NULL,
  `Country` varchar(52) NOT NULL,
  `City` varchar(50) NOT NULL,
  PRIMARY KEY (`BasicInfoID`),
  UNIQUE KEY `UserID` (`UserID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `BasicInfo`
--

INSERT INTO `BasicInfo` (`BasicInfoID`, `UserID`, `FirstName`, `LastName`, `Email`, `Birthday`, `Country`, `City`) VALUES
(1, 1, 'Devin', 'Lynch', 'devin.lynch.is@gmail.com', '1993-09-29', 'Canada', 'Ottawa');

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE IF NOT EXISTS `Categories` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`CategoryID`, `Name`) VALUES
(1, 'Gaming'),
(2, 'Food'),
(3, 'Music'),
(4, 'Movies'),
(5, 'Television'),
(6, 'Internet'),
(7, 'Technology'),
(8, 'Sports'),
(9, 'Education');

-- --------------------------------------------------------

--
-- Table structure for table `Content`
--

CREATE TABLE IF NOT EXISTS `Content` (
  `ContentID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Likes` int(11) NOT NULL,
  `Dislikes` int(11) NOT NULL,
  `UploaderID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `DateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `Content`
--

INSERT INTO `Content` (`ContentID`, `Title`, `Likes`, `Dislikes`, `UploaderID`, `CategoryID`, `DateTime`) VALUES
(1, 'Facebook', 0, 0, 1, 6, '2013-03-06 17:22:54'),
(2, 'Coheed And Cambria', 0, 0, 1, 3, '2013-03-06 17:24:16'),
(3, 'Pizza', 0, 0, 1, 2, '2013-03-06 17:24:28'),
(4, 'Apple', 0, 0, 1, 6, '2013-03-08 12:58:48'),
(5, 'Snowboarding', 0, 0, 1, 8, '2013-03-08 12:58:56'),
(6, 'Xbox 360', 0, 0, 1, 1, '2013-03-08 12:59:06'),
(7, 'PS3', 0, 0, 1, 1, '2013-03-08 12:59:12'),
(8, 'YouTube', 0, 0, 1, 6, '2013-03-08 12:59:26'),
(9, 'Instagram', 0, 0, 1, 6, '2013-03-08 13:05:46'),
(10, 'Java', 0, 0, 1, 6, '2013-03-08 13:05:53'),
(11, 'node.js', 0, 0, 1, 7, '2013-03-08 13:06:08'),
(12, 'A Day To Remember', 0, 0, 1, 3, '2013-03-08 13:06:24'),
(13, 'Basketball', 0, 0, 1, 8, '2013-03-09 12:28:00'),
(14, 'Baseball', 0, 0, 1, 1, '2013-03-09 12:28:09'),
(15, 'Soccer', 0, 0, 1, 8, '2013-03-09 12:28:19'),
(16, 'Skyrim', 0, 0, 1, 1, '2013-03-09 12:28:26'),
(17, 'University of Ottawa', 0, 9, 1, 9, '2013-03-09 12:29:19'),
(18, 'Carleton University', 8, 0, 1, 9, '2013-03-09 12:29:28');

-- --------------------------------------------------------

--
-- Table structure for table `ContentImages`
--

CREATE TABLE IF NOT EXISTS `ContentImages` (
  `ImageID` int(11) NOT NULL AUTO_INCREMENT,
  `ContentID` int(11) NOT NULL,
  `FileName` tinytext NOT NULL,
  `Height` int(11) NOT NULL,
  `Width` int(11) NOT NULL,
  `DateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ImageID`),
  UNIQUE KEY `ContentID` (`ContentID`),
  UNIQUE KEY `ContentID_2` (`ContentID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `ContentImages`
--

INSERT INTO `ContentImages` (`ImageID`, `ContentID`, `FileName`, `Height`, `Width`, `DateTime`) VALUES
(1, 1, 'fb.png', 447, 979, '2013-03-06 17:22:54'),
(2, 2, 'coheed-and-cambria.jpg', 350, 500, '2013-03-06 17:24:16'),
(3, 3, 'Pizza.jpg', 1066, 1600, '2013-03-06 17:24:28'),
(4, 4, 'Apple_gray_logo.png', 2000, 2000, '2013-03-08 12:58:48'),
(5, 5, 'snowboarding.jpg', 360, 288, '2013-03-08 12:58:56'),
(6, 6, 'xbox360.jpg', 395, 584, '2013-03-08 12:59:06'),
(7, 7, 'ps32.png', 347, 560, '2013-03-08 12:59:12'),
(8, 8, 'youtube-logo.png', 905, 1280, '2013-03-08 12:59:26'),
(9, 9, 'instagram.jpg', 768, 1024, '2013-03-08 13:05:46'),
(10, 10, 'java-logo.jpg', 300, 300, '2013-03-08 13:05:53'),
(11, 11, 'nodejs-light.png', 300, 600, '2013-03-08 13:06:08'),
(12, 12, 'a_day_to_remember.jpg', 480, 600, '2013-03-08 13:06:24'),
(13, 13, 'basketball.jpg', 480, 640, '2013-03-09 12:28:00'),
(14, 14, 'baseball.jpg', 666, 1000, '2013-03-09 12:28:09'),
(15, 15, 'soccer.jpeg', 169, 298, '2013-03-09 12:28:19'),
(16, 16, 'skyrim.jpeg', 707, 1131, '2013-03-09 12:28:26'),
(17, 17, 'ottawau.jpg', 1291, 1451, '2013-03-09 12:29:19'),
(18, 18, 'carleton.gif', 200, 507, '2013-03-09 12:29:28');

-- --------------------------------------------------------

--
-- Table structure for table `Likes`
--

CREATE TABLE IF NOT EXISTS `Likes` (
  `ContentID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `IsLike` tinyint(1) NOT NULL,
  `DateTime` datetime NOT NULL,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Likes`
--

INSERT INTO `Likes` (`ContentID`, `UserID`, `IsLike`, `DateTime`) VALUES
(1, 1, 1, '2013-03-04 19:43:31'),
(2, 1, 0, '2013-03-04 19:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `Stalkings`
--

CREATE TABLE IF NOT EXISTS `Stalkings` (
  `StalkerID` int(11) NOT NULL AUTO_INCREMENT,
  `StalkingID` int(11) NOT NULL,
  `DateTime` datetime NOT NULL,
  PRIMARY KEY (`StalkerID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Stalkings`
--

INSERT INTO `Stalkings` (`StalkerID`, `StalkingID`, `DateTime`) VALUES
(2, 1, '2013-03-04 19:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `UserImages`
--

CREATE TABLE IF NOT EXISTS `UserImages` (
  `ImageID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `Height` int(11) NOT NULL,
  `Width` int(11) NOT NULL,
  `DateTime` datetime NOT NULL,
  PRIMARY KEY (`ImageID`),
  UNIQUE KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(15) NOT NULL,
  `Password` char(32) NOT NULL,
  `DateTime` datetime NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserID`, `Username`, `Password`, `DateTime`) VALUES
(1, 'devinlynch', '1', '2013-02-28 18:24:01');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
