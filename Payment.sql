-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 07, 2016 at 09:14 PM
-- Server version: 5.7.12
-- PHP Version: 5.5.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `southlaketa`
--

-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

CREATE TABLE `Payment` (
  `ID` int(10) UNSIGNED NOT NULL,
  `PayerName` varchar(255) NOT NULL,
  `AmountDollar` decimal(10,2) NOT NULL,
  `CardType` varchar(40) DEFAULT NULL,
  `CheckNo` varchar(40) DEFAULT NULL,
  `IsCash` tinyint(4) DEFAULT '0',
  `StudentName` varchar(255) NOT NULL,
  `ClassID` int(10) UNSIGNED NOT NULL,
  `ReceiverName` varchar(255) NOT NULL,
  `Note` text,
  `CreateTime` datetime NOT NULL,
  `UpdaterName` varchar(255) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Payment`
--

INSERT INTO `Payment` (`ID`, `PayerName`, `AmountDollar`, `CardType`, `CheckNo`, `IsCash`, `StudentName`, `ClassID`, `ReceiverName`, `Note`, `CreateTime`, `UpdaterName`, `UpdateTime`) VALUES
(1, 'test.payer', '1000.00', 'undefined', '123456', 0, 'test.student', 1, 'test.receiver', '', '2016-09-26 00:00:00', 'admin', '2016-10-07 01:39:18'),
(2, 'test.payer2', '20000.00', '2', '123456', 0, 'test.student.2', 2, 'test.receiver', NULL, '2016-09-26 00:00:00', 'test.updater', '2016-09-26 00:00:00'),
(4, '1234', '1234.00', '1234', '1234', 1, '1234', 1, '1234', '1234', '2016-08-27 15:23:54', 'test.manager', NULL),
(5, '1234', '1234.00', '1234', '1234', 1, '1234', 1, '1234', '1234', '2016-08-27 15:24:00', 'test.manager', NULL),
(6, '1234', '1234.00', '1234', '1234', 1, '1234', 1, '1234', '1234', '2016-08-27 15:24:04', 'test.manager', NULL),
(7, 'miaoji', '10000.00', 'Discover', '', 0, 'mioaji', 1, 'miaoji', '0.0', '2016-08-28 13:50:57', 'test.manager', '2016-10-06 22:16:28'),
(8, 'miaoji', '0.00', 'undefined', '', 1, '0.0', 2, '0.0', '0.0', '2016-08-28 13:51:45', 'test.manager', NULL),
(9, 'miaoji', '1000.00', 'Credit', '', 0, 'miaoji', 2, 'mioaji', 'miaoji', '2016-08-29 00:45:10', 'test.manager', NULL),
(10, 'mioaji', '1000.00', 'Master', '', 0, 'miaoji', 2, 'miaoji', '0.0', '2016-09-29 00:52:15', 'test.manager', NULL),
(11, '123', '123.00', 'undefined', '', 1, '123', 2, '123', '123', '2016-10-05 20:52:59', 'test.manager', NULL),
(12, '123', '123.00', 'Discover', '', 0, '123', 1, '123', '123', '2016-10-05 20:53:55', 'test.manager', NULL),
(13, 'toupdate', '3211111.00', 'undefined', '', 1, '123', 2, '123', 'myupdate', '2016-10-05 20:54:31', 'test.manager', '2016-10-06 22:12:20'),
(14, 'test', '123.00', 'undefined', '', 1, '234', 1, '1234', '1234', '2016-10-06 00:28:26', 'test.manager', NULL),
(15, 'test', '1234.00', 'Discover', '', 0, '1234', 2, '1234', '1324', '2016-10-06 00:31:01', 'test.manager', NULL),
(16, '0testtest', '1234.00', 'undefined', '', 1, '1234', 1, '123', '123', '2016-10-06 00:34:34', 'admin', '2016-10-07 16:11:12'),
(17, '1234', '1234.00', 'undefined', '', 1, '1234', 2, '1234', '', '2016-10-06 17:24:31', 'test.manager', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_payment_class` (`ClassID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Payment`
--
ALTER TABLE `Payment`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Payment`
--
ALTER TABLE `Payment`
  ADD CONSTRAINT `fk_payment_class` FOREIGN KEY (`ClassID`) REFERENCES `staClass` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
