+--
+-- Database: `n23n7wfhs9a99dd3`
+--
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `BasicInfo`
+--
+
+CREATE TABLE IF NOT EXISTS `BasicInfo` (
+  `BasicInfoID` int(11) NOT NULL AUTO_INCREMENT,
+  `UserID` int(11) NOT NULL,
+  `FirstName` varchar(20) NOT NULL,
+  `LastName` varchar(20) NOT NULL,
+  `Email` varchar(256) NOT NULL,
+  `Birthday` date NOT NULL,
+  `Country` varchar(52) NOT NULL,
+  `City` varchar(50) NOT NULL,
+  PRIMARY KEY (`BasicInfoID`),
+  UNIQUE KEY `UserID` (`UserID`)
+) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;
+
+--
+-- Dumping data for table `BasicInfo`
+--
+
+INSERT INTO `BasicInfo` (`BasicInfoID`, `UserID`, `FirstName`, `LastName`, `Email`, `Birthday`, `Country`, `City`) VALUES
+(1, 1, 'Devin', 'Lynch', 'devin.lynch.is@gmail.com', '1993-09-29', 'Canada', 'Ottawa');
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `Categories`
+--
+
+CREATE TABLE IF NOT EXISTS `Categories` (
+  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
+  `Name` varchar(50) NOT NULL,
+  PRIMARY KEY (`CategoryID`)
+) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;
+
+--
+-- Dumping data for table `Categories`
+--
+
+INSERT INTO `Categories` (`CategoryID`, `Name`) VALUES
+(1, 'Gaming'),
+(2, 'Food'),
+(3, 'Music'),
+(4, 'Movies'),
+(5, 'Television'),
+(6, 'Internet'),
+(7, 'Technology'),
+(8, 'Sports');
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `Content`
+--
+
+CREATE TABLE IF NOT EXISTS `Content` (
+  `ContentID` int(11) NOT NULL AUTO_INCREMENT,
+  `Title` varchar(50) NOT NULL,
+  `FileName` tinytext NOT NULL,
+  `Likes` int(11) NOT NULL,
+  `Dislikes` int(11) NOT NULL,
+  `UploaderID` int(11) NOT NULL,
+  `CategoryID` int(11) NOT NULL,
+  `DateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
+  PRIMARY KEY (`ContentID`)
+) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;
+
+--
+-- Dumping data for table `Content`
+--
+
+INSERT INTO `Content` (`ContentID`, `Title`, `FileName`, `Likes`, `Dislikes`, `UploaderID`, `CategoryID`, `DateTime`) VALUES
+(1, 'ads', '', 1, 1, 1, 1, '2013-03-04 19:20:02'),
+(2, 'ds', '', 2, 2, 2, 2, '2013-03-04 19:20:19'),
+(3, 'asd', 'ads', 2, 2, 2, 2, '2013-03-05 23:13:19'),
+(4, 'dsa', 'sadas', 2, 2, 2, 2, '2013-03-05 23:13:55'),
+(5, 'sad', 'as', 2, 2, 2, 2, '2013-03-05 23:43:44'),
+(6, 'sad', 'ads', 2, 2, 2, 2, '2013-03-05 04:13:13'),
+(7, 'asd', '04-Networking-Using-Messaging.pdf', 0, 0, 0, 1, '2013-03-05 23:47:16');
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `ContentImages`
+--
+
+CREATE TABLE IF NOT EXISTS `ContentImages` (
+  `ImageID` int(11) NOT NULL AUTO_INCREMENT,
+  `ContentID` int(11) NOT NULL,
+  `Height` int(11) NOT NULL,
+  `Width` int(11) NOT NULL,
+  `DateTime` datetime NOT NULL,
+  PRIMARY KEY (`ImageID`),
+  UNIQUE KEY `ContentID` (`ContentID`),
+  UNIQUE KEY `ContentID_2` (`ContentID`)
+) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `Likes`
+--
+
+CREATE TABLE IF NOT EXISTS `Likes` (
+  `ContentID` int(11) NOT NULL AUTO_INCREMENT,
+  `UserID` int(11) NOT NULL,
+  `IsLike` tinyint(1) NOT NULL,
+  `DateTime` datetime NOT NULL,
+  PRIMARY KEY (`ContentID`)
+) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;
+
+--
+-- Dumping data for table `Likes`
+--
+
+INSERT INTO `Likes` (`ContentID`, `UserID`, `IsLike`, `DateTime`) VALUES
+(1, 1, 1, '2013-03-04 19:43:31'),
+(2, 1, 0, '2013-03-04 19:43:47');
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `Stalkings`
+--
+
+CREATE TABLE IF NOT EXISTS `Stalkings` (
+  `StalkerID` int(11) NOT NULL AUTO_INCREMENT,
+  `StalkingID` int(11) NOT NULL,
+  `DateTime` datetime NOT NULL,
+  PRIMARY KEY (`StalkerID`)
+) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;
+
+--
+-- Dumping data for table `Stalkings`
+--
+
+INSERT INTO `Stalkings` (`StalkerID`, `StalkingID`, `DateTime`) VALUES
+(2, 1, '2013-03-04 19:29:52');
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `UserImages`
+--
+
+CREATE TABLE IF NOT EXISTS `UserImages` (
+  `ImageID` int(11) NOT NULL AUTO_INCREMENT,
+  `UserID` int(11) NOT NULL,
+  `Height` int(11) NOT NULL,
+  `Width` int(11) NOT NULL,
+  `DateTime` datetime NOT NULL,
+  PRIMARY KEY (`ImageID`),
+  UNIQUE KEY `UserID` (`UserID`)
+) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
+
+-- --------------------------------------------------------
+
+--
+-- Table structure for table `Users`
+--
+
+CREATE TABLE IF NOT EXISTS `Users` (
+  `UserID` int(11) NOT NULL AUTO_INCREMENT,
+  `Username` varchar(15) NOT NULL,
+  `Password` char(32) NOT NULL,
+  `DateTime` datetime NOT NULL,
+  PRIMARY KEY (`UserID`)
+) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;
+
+--
+-- Dumping data for table `Users`
+--
+
+INSERT INTO `Users` (`UserID`, `Username`, `Password`, `DateTime`) VALUES
+(1, 'devinlynch', '1', '2013-02-28 18:24:01');
+
+/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
+/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
+/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
