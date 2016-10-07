-- MySQL dump 10.13  Distrib 5.7.12, for osx10.11 (x86_64)
--
-- Host: localhost    Database: southlaketa
-- ------------------------------------------------------
-- Server version	5.7.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CheckInOut`
--

DROP TABLE IF EXISTS `CheckInOut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CheckInOut` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AccountID` int(10) unsigned NOT NULL,
  `CheckIn` datetime DEFAULT NULL,
  `CheckOut` datetime DEFAULT NULL,
  `RecorderID` int(10) unsigned NOT NULL,
  `CreateTime` datetime NOT NULL,
  `UpdateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_cio_receiver` (`RecorderID`),
  CONSTRAINT `fk_cio_receiver` FOREIGN KEY (`RecorderID`) REFERENCES `staAccount` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CheckInOut`
--

LOCK TABLES `CheckInOut` WRITE;
/*!40000 ALTER TABLE `CheckInOut` DISABLE KEYS */;
/*!40000 ALTER TABLE `CheckInOut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CodeBalanceType`
--

DROP TABLE IF EXISTS `CodeBalanceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CodeBalanceType` (
  `ID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `BalanceType` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `BalanceType` (`BalanceType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CodeBalanceType`
--

LOCK TABLES `CodeBalanceType` WRITE;
/*!40000 ALTER TABLE `CodeBalanceType` DISABLE KEYS */;
INSERT INTO `CodeBalanceType` VALUES (2,'HourBased'),(1,'PeriodBased'),(3,'SessionBased');
/*!40000 ALTER TABLE `CodeBalanceType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CodeClassType`
--

DROP TABLE IF EXISTS `CodeClassType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CodeClassType` (
  `ID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `ClassType` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ClassType` (`ClassType`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CodeClassType`
--

LOCK TABLES `CodeClassType` WRITE;
/*!40000 ALTER TABLE `CodeClassType` DISABLE KEYS */;
INSERT INTO `CodeClassType` VALUES (1,'Afterschool Enrichment'),(4,'Art & Music'),(5,'Chess & Ping-Pong'),(6,'Exam Prep'),(2,'Language Tutoring'),(3,'Subject Tutoring');
/*!40000 ALTER TABLE `CodeClassType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CodeRequestStatus`
--

DROP TABLE IF EXISTS `CodeRequestStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CodeRequestStatus` (
  `ID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `RequestStatus` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RequestStatus` (`RequestStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CodeRequestStatus`
--

LOCK TABLES `CodeRequestStatus` WRITE;
/*!40000 ALTER TABLE `CodeRequestStatus` DISABLE KEYS */;
INSERT INTO `CodeRequestStatus` VALUES (3,'approved'),(9,'closed'),(1,'new request'),(2,'pre-approved'),(4,'replied');
/*!40000 ALTER TABLE `CodeRequestStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CodeRequestType`
--

DROP TABLE IF EXISTS `CodeRequestType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CodeRequestType` (
  `ID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `RequestType` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RequestType` (`RequestType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CodeRequestType`
--

LOCK TABLES `CodeRequestType` WRITE;
/*!40000 ALTER TABLE `CodeRequestType` DISABLE KEYS */;
INSERT INTO `CodeRequestType` VALUES (2,'Account Request'),(3,'Class Reserve Request'),(1,'Common Request');
/*!40000 ALTER TABLE `CodeRequestType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CodeRole`
--

DROP TABLE IF EXISTS `CodeRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CodeRole` (
  `ID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `Role` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Role` (`Role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CodeRole`
--

LOCK TABLES `CodeRole` WRITE;
/*!40000 ALTER TABLE `CodeRole` DISABLE KEYS */;
INSERT INTO `CodeRole` VALUES (3,'Manager'),(1,'Regular User'),(2,'Teacher');
/*!40000 ALTER TABLE `CodeRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PayerName` varchar(255) NOT NULL,
  `AmountDollar` decimal(10,2) NOT NULL,
  `CardType` varchar(40) DEFAULT NULL,
  `CheckNo` varchar(40) DEFAULT NULL,
  `IsCash` tinyint(4) DEFAULT '0',
  `StudentName` varchar(255) NOT NULL,
  `ClassID` int(10) unsigned NOT NULL,
  `ReceiverName` varchar(255) NOT NULL,
  `Note` text,
  `CreateTime` datetime NOT NULL,
  `UpdaterName` varchar(255) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_payment_class` (`ClassID`),
  CONSTRAINT `fk_payment_class` FOREIGN KEY (`ClassID`) REFERENCES `staClass` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,'test.payer',1000.00,'undefined','123456',0,'test.student',1,'test.receiver','','2016-09-26 00:00:00','admin','2016-10-07 01:39:18'),(2,'test.payer2',20000.00,'2','123456',0,'test.student.2',2,'test.receiver',NULL,'2016-09-26 00:00:00','test.updater','2016-09-26 00:00:00'),(4,'1234',1234.00,'1234','1234',1,'1234',1,'1234','1234','2016-08-27 15:23:54','test.manager',NULL),(5,'1234',1234.00,'1234','1234',1,'1234',1,'1234','1234','2016-08-27 15:24:00','test.manager',NULL),(6,'1234',1234.00,'1234','1234',1,'1234',1,'1234','1234','2016-08-27 15:24:04','test.manager',NULL),(7,'miaoji',10000.00,'Discover','',0,'mioaji',1,'miaoji','0.0','2016-08-28 13:50:57','test.manager','2016-10-06 22:16:28'),(8,'miaoji',0.00,'undefined','',1,'0.0',2,'0.0','0.0','2016-08-28 13:51:45','test.manager',NULL),(9,'miaoji',1000.00,'Credit','',0,'miaoji',2,'mioaji','miaoji','2016-08-29 00:45:10','test.manager',NULL),(10,'mioaji',1000.00,'Master','',0,'miaoji',2,'miaoji','0.0','2016-09-29 00:52:15','test.manager',NULL),(11,'123',123.00,'undefined','',1,'123',2,'123','123','2016-10-05 20:52:59','admin','2016-10-07 16:52:09'),(12,'123',123.00,'Discover','',0,'123',1,'123','123','2016-10-05 20:53:55','test.manager',NULL),(13,'toupdate',3211111.00,'undefined','',1,'123',2,'123','myupdate','2016-10-05 20:54:31','test.manager','2016-10-06 22:12:20'),(14,'test',123.00,'undefined','',1,'234',1,'1234','1234','2016-10-06 00:28:26','test.manager',NULL),(15,'test',1234.00,'Discover','',0,'1234',2,'1234','1324','2016-10-06 00:31:01','test.manager',NULL),(16,'0testtest',1234.00,'undefined','',1,'1234',1,'123','123','2016-10-06 00:34:34','admin','2016-10-07 17:19:19'),(17,'1234',1234.00,'undefined','',1,'1234',2,'1234','','2016-10-06 17:24:31','test.manager',NULL);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegistrationForm`
--

DROP TABLE IF EXISTS `RegistrationForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegistrationForm` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `StudentID` int(10) unsigned zerofill NOT NULL,
  `StudentName` varchar(255) NOT NULL,
  `AfterSchoolType` varchar(40) DEFAULT NULL,
  `AfterSchoolStart` date DEFAULT NULL,
  `AfterSchoolEnd` date DEFAULT NULL,
  `LanguageTutorType` varchar(40) DEFAULT NULL,
  `LanguageTutorHour` int(10) unsigned DEFAULT NULL,
  `SubjectTutor` varchar(40) DEFAULT NULL,
  `SubjectTutorHour` int(11) DEFAULT NULL,
  `ArtMusicType` varchar(40) DEFAULT NULL,
  `ArtMusicSession` int(10) unsigned DEFAULT NULL,
  `ChessPingpongType` varchar(40) DEFAULT NULL,
  `ChessPingpongSession` int(10) unsigned DEFAULT NULL,
  `ExamPrepType` varchar(40) DEFAULT NULL,
  `ExamPrepSession` int(10) unsigned DEFAULT NULL,
  `FeeProgram` decimal(10,2) DEFAULT NULL,
  `FeeEnrollment` decimal(10,2) DEFAULT NULL,
  `FeeAssessment` decimal(10,2) DEFAULT NULL,
  `FeeMaterials` decimal(10,2) DEFAULT NULL,
  `FeePromotion` decimal(10,2) DEFAULT NULL,
  `PaymentType` varchar(40) NOT NULL,
  `DatePayment` datetime NOT NULL,
  `ReceiverID` int(10) unsigned NOT NULL,
  `ReceiverName` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SubjectTutorHour` (`SubjectTutorHour`),
  KEY `fk_reg_student` (`StudentID`),
  KEY `fk_reg_receiver` (`ReceiverID`),
  CONSTRAINT `fk_reg_receiver` FOREIGN KEY (`ReceiverID`) REFERENCES `staAccount` (`ID`),
  CONSTRAINT `fk_reg_student` FOREIGN KEY (`StudentID`) REFERENCES `staStudent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegistrationForm`
--

LOCK TABLES `RegistrationForm` WRITE;
/*!40000 ALTER TABLE `RegistrationForm` DISABLE KEYS */;
/*!40000 ALTER TABLE `RegistrationForm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Request`
--

DROP TABLE IF EXISTS `Request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Request` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `RequestType` int(1) unsigned NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Subject` text,
  `Message` text NOT NULL,
  `Phone` varchar(40) DEFAULT NULL,
  `IPAddress` varchar(40) DEFAULT NULL,
  `ProxyAddress` varchar(40) DEFAULT NULL,
  `Status` int(2) unsigned NOT NULL DEFAULT '0',
  `LastReplier` int(10) unsigned NOT NULL,
  `CreateTime` datetime NOT NULL,
  `UpdateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_req_replier` (`LastReplier`),
  KEY `fk_req_type` (`RequestType`),
  KEY `fk_req_status` (`Status`),
  CONSTRAINT `fk_req_replier` FOREIGN KEY (`LastReplier`) REFERENCES `staAccount` (`ID`),
  CONSTRAINT `fk_req_status` FOREIGN KEY (`Status`) REFERENCES `CodeRequestStatus` (`ID`),
  CONSTRAINT `fk_req_type` FOREIGN KEY (`RequestType`) REFERENCES `CodeRequestType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Request`
--

LOCK TABLES `Request` WRITE;
/*!40000 ALTER TABLE `Request` DISABLE KEYS */;
/*!40000 ALTER TABLE `Request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentInClass`
--

DROP TABLE IF EXISTS `StudentInClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentInClass` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ClassID` int(10) unsigned NOT NULL,
  `StudentID` int(10) unsigned NOT NULL,
  `HourOrSessionBought` int(10) unsigned DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `ApproverID` int(10) unsigned NOT NULL,
  `Note` text,
  `CreateTime` datetime NOT NULL,
  `UpdateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_sic_class` (`ClassID`),
  KEY `fk_sic_student` (`StudentID`),
  KEY `fk_sic_approver` (`ApproverID`),
  CONSTRAINT `fk_sic_approver` FOREIGN KEY (`ApproverID`) REFERENCES `staAccount` (`ID`),
  CONSTRAINT `fk_sic_class` FOREIGN KEY (`ClassID`) REFERENCES `staClass` (`ID`),
  CONSTRAINT `fk_sic_student` FOREIGN KEY (`StudentID`) REFERENCES `staStudent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentInClass`
--

LOCK TABLES `StudentInClass` WRITE;
/*!40000 ALTER TABLE `StudentInClass` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentInClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TeacherForLesson`
--

DROP TABLE IF EXISTS `TeacherForLesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TeacherForLesson` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TeacherID` int(10) unsigned NOT NULL,
  `LessonID` int(10) unsigned NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tfl_teacher` (`TeacherID`),
  KEY `fk_tfl_lesson` (`LessonID`),
  CONSTRAINT `fk_tfl_lesson` FOREIGN KEY (`LessonID`) REFERENCES `staLesson` (`ID`),
  CONSTRAINT `fk_tfl_teacher` FOREIGN KEY (`TeacherID`) REFERENCES `staAccount` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TeacherForLesson`
--

LOCK TABLES `TeacherForLesson` WRITE;
/*!40000 ALTER TABLE `TeacherForLesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `TeacherForLesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staAccount`
--

DROP TABLE IF EXISTS `staAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staAccount` (
  `ID` int(10) unsigned NOT NULL,
  `Role` int(2) unsigned NOT NULL,
  `Email` varchar(255) NOT NULL,
  `staPassword` varchar(255) NOT NULL,
  `GuardianNameOne` varchar(255) NOT NULL,
  `GuardianPhoneOne` varchar(40) NOT NULL,
  `GuardianEmailOne` varchar(255) NOT NULL,
  `GuardianNameTwo` varchar(255) DEFAULT NULL,
  `GuardianPhoneTwo` varchar(40) DEFAULT NULL,
  `GuardianEmailTwo` varchar(255) DEFAULT NULL,
  `Address` text,
  `IsLocked` tinyint(1) NOT NULL DEFAULT '0',
  `LastLogin` datetime DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `UpdateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `fk_account_role` (`Role`),
  CONSTRAINT `fk_account_role` FOREIGN KEY (`Role`) REFERENCES `CodeRole` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staAccount`
--

LOCK TABLES `staAccount` WRITE;
/*!40000 ALTER TABLE `staAccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `staAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staClass`
--

DROP TABLE IF EXISTS `staClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staClass` (
  `ID` int(10) unsigned NOT NULL,
  `Title` varchar(255) NOT NULL,
  `ImageClass` mediumblob,
  `ParagraphOne` text NOT NULL,
  `ParagraphTwo` text,
  `ParagraohThree` text,
  `MaxSeat` int(4) unsigned NOT NULL,
  `DueRegister` date NOT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ClassType` int(2) unsigned NOT NULL,
  `BalanceType` int(2) unsigned NOT NULL DEFAULT '1',
  `DefaultTeacher` varchar(50) DEFAULT NULL,
  `IsPublished` tinyint(1) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `UpdateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_class_balance` (`ClassType`),
  CONSTRAINT `fk_class_balance` FOREIGN KEY (`ClassType`) REFERENCES `CodeBalanceType` (`ID`),
  CONSTRAINT `fk_class_type` FOREIGN KEY (`ClassType`) REFERENCES `CodeClassType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staClass`
--

LOCK TABLES `staClass` WRITE;
/*!40000 ALTER TABLE `staClass` DISABLE KEYS */;
INSERT INTO `staClass` VALUES (1,'class1',NULL,'this is first paragraph of class1',NULL,NULL,10,'2016-09-27',100.00,1,1,NULL,1,'2016-09-26 00:00:00','2016-09-26 00:00:00'),(2,'class2',NULL,'this is the first paragraph of class2',NULL,NULL,1,'2016-09-23',12123.00,2,1,NULL,1,'2016-09-26 00:00:00','2016-09-26 00:00:00'),(3,'class3',NULL,'this is first paragraph of 3rd class',NULL,NULL,2,'2016-09-26',50.00,3,1,NULL,1,'2016-09-26 00:00:00','2016-09-26 00:00:00'),(4,'chess','�\��\�\0JFIF\0\0�\0\0��\0Lavc55.18.102\0�\�\0C\0\n\n\n\r\r\r\r\r\r##$++3�\��\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\0\�T\"\0\0\0�\�\0\0\0?\0�Q��b�\"\��qF(,T����\�\�S5�a���_ÿJ�o�_ƦkU\�\��\�f�/\\�$P���&8\�\�~�\�@���S�Z(�v�\0&\�Q����	\"]v�S8��\\�}(�(\�K�1@b�T��(\�K�1@b�T��(\�K�1@b�T��(\�K�1@b�T��(\�K�1@b�T��(\�K�1@b�T��(\�K�1@b�T��(\�K�1@b�T��(\�K�1@b�T��|�5\n\�-\�mDy]���䠚�\�b��K�)Vky^�tb�?���Ɵqo�\�ІS$n��p�c��\�\�\Z\��O\�\�F\�k�X\�p��\�wV�3��W\���\�\��\Z��\�}[�T\���b�b�\���F*\\Q�\0�b�\���F*\\Q�\0�b�\���F*\\Q�\0�b�\���F*\\Q�\0�b�\���F*\\Q�\0�b�\���F*\\Q�\0�b�\���\���Z��c�g\�$�\0q3\�\��\�~\Z\�mT�\�C���\�\�[#��iQ\�cam\nc�Չ�fc�\�\�Z�A�a��\����\�%�Z\�\�{yI�\0\�\�߇�k�wZD��\0y���\�?�h\�j\r1\�c��+=���\�u\��0����q\�ߌ�\r��޹,W�\�\"\�\��7!��^*W�BG\�@b�Tأ(\�M�1@\�Tة#�\�\"F8.ʣ�q@X鷚��]�3w\�>U�f?(�Mwc�w�D\Zi�\�ˏ�>�\��\�dv\�]�[B�U\'��vcܚ\�u��/\�<�T\�\r\r��\�\"�8�v\�\�G\�ׯ\�\�DG\�s\�\�\'s�\�6H\�@�ZL�<���\�N\�rz�\�Xد_�\�@\'i�#U\�ͪ�@�\'>�\r\0r��6(\�\0C�1Sb�P8�6(\�\0C�1Sb�P8�6(\�\0I�1R\�PX�.(\�\0E�1R\�P6\�)�y�i�R�ƨDv��\�����X�|�RYv&;��cyp\�p(y.\�\�\�\�\��\�{g�e\�zz\�F�[�8\�\�O�B�\��\�(*\n\�y���\0\n\0ԆA*���\�S\�\�s_�\0]n\�\�\"\�_�\0U\0&(\�K�\\P8�6(\�\0C�1Sb�P8�6(\�\0C�1Sb�P8�6(\�\0C�1Sb�P8�6(\�\0C�1Sb�P8�6(\�\0C�1Sb�P8�6(\�\0C�1Sb�P8�6(\�\0C�1Sb�(\�DnP0jh\�H2(1F*lQ�\0��p~�>*7)�y1\�ԩ�I3� q\�Tˍ�\�\�c��ȺՌPX�.(\�\0E�1R\�PX�.(\�\0E�1R\�PX�.(\�\0E�1R\�PX�.(\�\0E�1R\�PX�.(\�\0E�1R\�PX�.(\�\0E�1R\�PX�.(\�\0z6����\�e�P���\�~��~\�\�zcӵy��\\\�n$ܽ\�<}H\��\�am��E\�\�\�q�\0\�9<�\0Z�\�\�T�a!\�CT��\�\'��ہ\�B�c�hR�\�--\�V<\��\�c\�\�^SןZ�=\�\�O�W.{g����b�\"\��qF(,Q��b�\"\��qF(���%\�\nLN��[��ƺ�me�\"Yv�<\�\�yV+��Z\"LtP�\0vR��\�\�u#�\0\�/g>�\�\�\�P�E\'�BMj\�r\�1\���\n\��}^;ȼ���3;t\�_\�\�4y$��1@\�Tأ(\�M�1@\�Tأ(\�M�1@\�Tأ&(\�I���(\�K���(\�K���썏�\0s�\�\�ޡe\�ׯ�^T\��k4�NM\0O5�,�>_\�Yt�Ź4\0��9<ң�9�ǭGE\0[uo^���\"3!ʜTq\�P��J�<�>\�\�}(�w���\��h++���\�FN��\�b9S�\�@6(\�d\�z\�Í\�ס�8��o�y�\�@\��6Ѷ�#\��6Ѷ�#\��6Ѷ�#\��6Ѷ�#\��6Ѷ�#\��6Ѷ�#\��6Ѷ�#\��6Ѷ�#\��6Ѷ�#\��6Ѷ�#\��6Ѷ�#\��6Ѷ�#\�!\Z�m!\Z\0\�ھ���0��e@pM\\�bX�H&�.b�T��*�\�l����ž|�Aۭ\0c��8y�Vy���\0\��\0@#8aZ�����:�\�\0&(\�I�1@\�T��(\�I�1@\�T��(\�I�1@\�T��(\�I�1@\�T��(\�I�1@\�T��(\�I�1@\�T��+\�|9\�X\�c[�\�\�[s \�.?�\�r\�&�\�\�\Z~��E\��E{�\0\�\0uCN�HCH?����5\�_�n\'%�m>\�\�C�F�\�]\�\�U�u;B�(l�8�4\�R\�7\�\�\�.#��s\���O�\�\'\�+\Zu�N\�\��Z���\0g�+7\�RZ\�}+�\�\�X\�\��\��$PF(\�K���(\�K���(\�K���kO�7wp\��\�\�O\�]\�\�\r\�Q\�L�Վ\�e�a��\0u\�}���+bh�&�9�A�չ�\�\��\��\0\�&��\\����~t\�أ)\\=	�h<Q��mh<Q��m9Q���\�$\0rz\n\0jF�DVvc��	$�]e��uY\�3,p\�F��\�\�z��,\\8�\�����w��\����*\0��B�q�\06��?�U�#�D2�\�|ɀ�s�\�Q\�\�Y\�\"\�\�r\�бG���\�\�*?�]�\0ϼ�\0�\��\0½�\�3M�\0|�\0EK�1@QR\�PU�~،SZ��=C�b�)\�tO��Z\'\���U�@RPE--\06����,$�?���V\��	j�81^Go\�\�\�`~�\Z�l�7z�{T^b:�\0��֬)\�3@)qM�-\Z�\�Sb�#\��1F(<Q��b�#\��1F(<Q��b�#\��1F(<Q��b�#\��1F(<Q��b�#\��1F(<Q��b�#\��1F(<Tr�\�{V1U�G\�\�@�@I5�d0T{\Z�\�U\�E\�\�?�\0^��\��\n���~_Z\�ܖ$���}.\�\�:/�\�@\�\�}����M�\rJ�\�l3B݉+�B$\�қ.cu�z���b�\'Ʈ;��(\�I�1@\�T��(\�I�1@\�T��(\�I�1@\�Rb�PtT��&(\�\0GEI�1@\�Rb�PtT��=\�9Fe>�\�b�:-B\�o��\�kl]3W5oC�\�o\�Waf\��\�\�#�x5WP�6Klɼ�\�1O��+^9�?\��\0�\0P�Y��#T�\�\�׏Ұؗb\�I\'�OSN\���F*LQ�\0�b�\���W\�,d\�.c�?\�?3vEX�?�VTg`�3\0I=\0�d\�t�\�-�l����={���.,�\nC\�F�T}?�\�k.d\�\���ʙh\0\'-L#x�֨�\\P�\�G\�\�J�\�>����\�5x0\�(\��\�\\�(<Q��b�#\�lh\��n[��n}@$~����6h\�]z�Ƞl �4\�vP�w�\��̹�\�\�\�#��ձq!?6E\0u�^��\�[\�j���C�\�6npi\�;��\�@�`�\�y�X�s\�h���@~�\0I\�\�5\�Z�R�x����OD|�ǩ\�\�\�ֻ�/C�\�@|y�w��O�o�Z\�h\�O�\��\\A�?�S�/�絿�?�\0\�ת\�@Q�\0���\0=-�\0\��\0\�k�\�|={�\����\"v�FKl=�p0c\�^��x\�\�Jf��Qsp>�?���1Xt~&�{Q���\�Op\���_�?�\�\��\�\0b�<�\nsY�v�0\�3\�\�UXm$Pt�b���(��D����\�*�\�\�ր/\��2B\�!\n��$�;\�H|-���\�ߣ�þ\�\�\�\' ���x\�\Z��\�Z�ִȧ\'����Ǥ�:�|<?��H��\0ߦ�\0\n�-�3�������⾐\�&h\�\�ev?\�\�q�\0l\��)�d��\0�߷�\0\n�4P\�?g��yK�\0|7�S|�G�?��¾�����?�[�4�O���p=\�La�@$�0�\0|�J��\�\�\'�o/N������\�Q�&}q�\��\�]=����&�f��\�v�u�d`~T\�\�W�_kZ]�ض��tʋ7���\�O\��\�\'\�?�������P\��W��\0gX�\0ϭ���_�fi�\0�\�o�\0~\��(��\�{�\�t\��\0.�\���\�\�?\�\�\��\0�@�1^\�����\0Ϥ_��\�N���uO\��\0��\0�Q���\��(�\0˰�\0�\��\0⩟��i?�\�\�\��U\0x�(\�{!�֓\�\�a�\0m_��\��\�m�\�\Zf;Ur\�O�\�E\0y�(\�{�\"\�g�f�\0���+>-A����軩!�\'B\�x\�x\�@_�1^�|\'�~\��\��\0��^�X�_\�\�?�\"��\�+���\0\�qU\�17�ά\�\�@\�\�\�oC#ƣ�\nƱ[S?�\�<�Ҳ\�\��kIW\������\��\0@�)�\�\rsɭ\��j\�j�q9�/u�d��4\�O�0�^j�j�̶\�V^H��1]�\�.N?:�\�3�O\�@�*8�\0,\�_ά\�Dc��\0� \�\�N *:�8�\�\�s\�OҀ7�xF^��V�*��mnG��xd\'�32}m+��]���2�v�D�\�q@~(\�u\�\����a?�\��7��S�y\��\0�9,Q�ꏆ�Q�\0,T�\0\�D�\0\Za�\�?\�\��\0\"G�\0\�P1�1])���?\�ٿ\��\0⩟\�:����\��U\0s��\�a\��\�/\��4â\�c�]&�\0�����1[?\�:���O�\0|\Zo�e��\0�K���\���1Z�\�ף�]g�\0�m�ϱ]��w�����Pv(\�^6��߷�\0\no\�\��\0�R\�\r�Ob�y2q�\0\��\�-��ߑ�\n��6\�\�h\�\0C�1Sb��\"\��h��F\rK�\�\�l�\�z�$_����\�\0nQoodr�3�<�ֱ\�U�f��\�I�	c��#�Y�\�Ȁ�\0�?�i���R\�\�\��\0u���Wb�\��qF*lQ�\0�b�\��\�\��\0�\�\�>\�\���M�ֽurZ%\�`�<�T�~�&�L\��u�U))�h\�U\Z\\\�$.Tf���=)�\�2/ D\�\�8����\�פ9Ȯ\�B\� \�4Kb�\��qJ�\0I\�\0\�?�t�6�ڤ\�)\nc{�\���\�J�K6\�OP-\�D8��\�\�\�ǚ\0�V���V�H�	\�o˭k���\07_~+\�nt\�n�H\�\��irL|P\Zί\��\�s1��\�	��1\�\�}�Ӯm\�N�NV�F5\0R:�\�xأ\�n�\'��ߪ\����=1��\�_z\0��Jm�\�b뗏c�\�O�\��1\n\�\�\�bk&\�\�g�v\�%B��{=�(\�ŉ$�I\�\'�\'�%\\�\�d�!]�\���T,\�0e$2�AS\�#�\�S\�\n�\�1�C]��&:�ڽ��YϽ�n�a�\�M�p\�\�\�r�~�E>D(ب\�\0��RPFph�\�g+~�<�_\��\0֮���\�\�u �� �\�rz+��\�k��\�5���\�\�P\�\�m��\0���?\�Ho\�\�Y���\0\n\��-�G�i��R&�E.Qr\�+��!\�\�V���\�i�\�x!wo�i�r\��\�Gs@\Z�T�nbSM�\�\��\0\�\��\�W�ϨKq#H\�]\�;TmQ\�\0\�*����\��\0\�v�^\��\0���4�\0\�#�\0/P\�\��\0\Z��\�4\�2�>����\���?ƙ3Y\�B�\�,,�)Vj��\�d6k��\�jw�@�g��o&8\�N\�\�\�=I$�\Zʹ���v�c��v�\�d�\0\�x\�K\�\0�;ohֲ	Rw��\�R�\�\�~�\�dW\�>q�4\�?���4�-�躓�\��\0}���a�\0-d�\0�\��h\�\��R�R1,��\��k֬4\��<oss:\�\�,�\����y��\0oQU��c�^g��\Z�\0\�\�ߗ�\0^�,QU�\��\0Or�_��d~\�o�\0|�\0�\��v�ym5���L��W�\�\�\��V�O\�\�\�I\Z��Z\���\�?�we��~\����\0ף\�\�\��\0�(�_\r\�\�3]G�]}�\�\�\�FB;p1Kc\�T����{��h\�+�(\�L���:��k��-\�k��\0�?�ԟg�\�s��<KŞ$����\�\�\�!c\�8iXu\�G;{�כ\�a\�.]7U�;�FgG\�ۏ\�>�ٮD�t\�\��<Ph�A�߲\�Kie_\�D<\��\0�\�UF��O�\���\����\�Rz\�e\�Wh�\0SQVTS\�R�\'�4\0\�g�	\��<�?.j\���\�K���y��o-�\�\�\��J\0\�9�?��V�.��<\Z�`�\n�\'r\�\�)�\\{�5h���K�?���D�WsMlH�!c���\�\�a\��\�\\�\�R�\�ր>��x\�a�h�rH�սA=yo�<Ame�[\�̲�M\����Z����I�\n�{m��@���M����\0^��t>�\�4~����V�\0�Mn����\0�M\03R��\�\�y\��\�$i�#��\�\�x�#I�W�\�ڕ՜\0��s$���\"��1\�k���?\�Q��2}��\��Q��ր8�>�w�����\�d�I?|�d�\�q��lf�-u\��\0\�h�\�\�8`ici┸\�9^�=릎[H\�\�A�\�\��@S�\�R�Ɍ�\�6\��8\�\0\\���D?�\�:_>�违\0OIQy�}:<迾���	i0=G\�E�\0=��\�M�\��\0���\0\�k�4.\��\��B�c��y���?K�\0���\0}/�ӷ��4�\0���\�<�\��\��\0�W�+8cy$���\�|�8U\'\��U܏Q��FD�J�VVy�\�� ҮAk}*\�\�#|v��\�\�UĚ\"J�K�\\\�\�p�Sq�\��\�?���%�Y\�\�\�O$c�\�\�oi��	s��<��\�\�\�\�m#��\nV���\�eXL1�+*Ona,{\0Yq�Ʒ\�\�\�\�r�qn\�\�q\�5F\�\��\���\�e\�&$a�NÌ\�kM�e�I��\�e�*��\�NE$2K\ZN��f�H\�\�0x�%w\0}*��@o�#�I�\0���\'�\0M�\0�kJ?�\�\����=6\�\�V�\�\�/\��\0Q�=kR�9o�F4��\�\'��ji��a�\0m�WWE\0r?��i��{�\0\�\��Ʀ�\�:f\�O�\�\�ɀ \�]$r�U�j\0\�\�4kKHB\�@#\�X$�rMs-��\\�\rz��o��Yw:E�\�r��\�Ҁ<ܴ\�v��d\�\����\�B�A��\��\��\�s�Y\�1u���\0A\�\�\�\�iw9\�Q�ҿz)G\�J?哚\0Ћd��o4p\�\�犘�E\�-�\�;�ϖy\�\�땸�\�Ṍ�t��GNa�\�\'xە?\����\0t�����o�*�|?k���\��;\�D�\n������\�\��\0\�4�c�B�\�\�͖}\� 6~�\�J\�[�V\�9�l�{�\0OJƛNdR\�M�������?�h��ky:HT�6�\0Z�\� 	ލ\�\�yzj[��\Z�_�\�e(�랹���*��\�\�7\\dh�i�ҙ���\�Wē0\�\��\0�M.��\0��\0�\��\0\n\04�?İO]\�1K?<{D�\�\�1E#>��ڞp\'�:�\\��W�{\0�\0Y9��>�����	/u!� C=\�p��8�o��\0��]6H!�\�\������D�N6���\�ڶl\� \�Ј�y�d\��\��\�\n�y��\�Vw/�\�$�\�\�{\�6\�8?5w\�\'\�c\�u@�a�爟�3\�A�=�rF�j\0\�7,:��G��\�/!�0\�Z_\�q��u1\�;(�Q��Q��b�\\K$\�\�H1\�1Ǣ�U��	dA\"�ױ��1V\�}�ږh��\�@����\n�\�$z\�Zp�\r&E~G��7\'�\�QMF4��c\�O\�@�=Q���0e�ԫ�q�C�\Zڹ���c,��zz(�\�\�L�[\��+z\�_6>z��/S\�  �\�Jp��QE\0QE\0QE\0QZ:}���\�A��qV?\�ހ:�i_h�풯\�\�?��\�\��_\�^�U\�\��\�\�mH\�(\�����PEPEPE%\0QE%\0p�2\�Σ�4��\�i��J�\0\Z�\\�\�o\�ÿZ�Ԁx<���^���\0ejw�b2|\�\���\�~�ۣ��%O�\�O\�1SEy��\�\�u\�<��\0f��\'�(ыsd�9\�\�9$�\�1¦>P:�PO�Gր2Y�(���:�Ti\�Z��(w���a���\�\�^$��\"�\�	\Z�E�! *�����s�;P��u�����ƻʜg�\\�\�VK�\�s�\"�3\�\�\��\0�@z��}�\�&�\���zđ��lQ�����}��[\�R�\���(���\�\�Z����E�\�\0k\�E¿Π�\�tN}\�<+���Klq�!E\0t��[\�Cӎ�\�xfr��m��\'����\�km^�v\���;>����{\��\�x�oZ\�Bj\�@\0�c\��\nx�>��\0|��e5ehO\��\0a?\��\0\nx�\��\��\0�Q0�Y��\0\�(�\�����\0�1\�#�*O�\��\0\��\�M�\��\0\��%-\0]��\0�\�|�O��O\��i\�Pv��~�\��f�\0\Z�\\\�iq\0\�U�>\�r���n�+�˨.IP��\0y�Ҁ8�=�q�\�P�=�sOR\�o\��\0�S��/��o�\�\��\�\�Z6s{u,�{rw7ʣ�\�\�W?]���ݱ�F�y�T\�JQs�\0Q���\�Ozc5V�*3-\0,�\�l����Mހ+\��Xe�*��.�\�B!)�K\�q��t\�ߥv\�\����\0\�+͉*��ᔂ�+\��\�\�\�-c�z��\����0��ڀ,�Y�\0\�\�O��\0�O�-\�?\�\���ZM��H�\�\0q�\0j�<�@\�7Fq�Ӟ��h\�}ꆭ��\0h��ZK\�܁��� �a\\I��\�\�˿�Kv���џ�\0�\�n!|~�i�\�5�c �}+\�῎a�\�I>��\�U�,}�4\�!O���\��\��z\�ל�V\\`��bO���\�=\�\0w\� n���$0vQ\\�\�O��?���*\0ږ\�/jɖ(\�q�U�\�5VI؂O\�=O$Z�ҝ�\�Xm+�}pj\��%\�Ͽ�D�MaMd���<2fTbB�\��=A�?,\�J�A��\���\0\�[�����_�n|Mż�G�:0\r�N3\��\�^O\�\Z\�t�v�%=\�\��94\0\�\�;M]��\�%����\�:5\�\0lE\�kr\rV\�O\�\��`���\�B\��\�k~ՏD_\�@��\0	6��\0M�\��\0\�Q�\0	6��\0M�\��\0\�W�\�4d\���7\Z�\�堵�\0\�\��\0w�\0�\�\�]$PF\"�h�\0�d�\'�5\�\�����́�\�G����\0?��\0\��M\0{�%x����\0?o�\0|��\0Rj\��^�\��\0��\0�\�\�[��W1$�{0\�\�\�^ww��\�\�kK���\�?�O\����\�}_�{�����\0���uo�\��\0�I@�xW��Uռ�\�r�\�k�մKG�7�	�تl�q]��^�?��\0l��\�?\�\rf�U�\�\��T\�s\�\�ހ<��z\Z�E\0,\�\�n:�^�T�\��*���@���ՑZk�\�;\�M�\�CKE\0K��\n�)���2�C���T�(x�:��o\�\�`\0<Ӫ���\�\�̐$\�\�$j\�̽	�=~�\��\0\�{\�{s�\0}�\0�4�ӫ��\0�?P�\0��\��\��M4�CR����\0���\0@]\�	j��}\����\0\�i���O��\�@�\�j\��YG�\0V��\0ή?\��\0\�\��\0��\0\�(����\\˷�?�\0L�\0�{W�\0�G�\0���\0��z��\�\�W�u��\�\����쟇S\�\\F�c\r��mQ�\�\�\�9˱\�~\\�1��z?�ޖ\���\��\0�@VP\��\�\��\����i\�ݿ��_�\r**�\�lOK����\�R\�C\�\��\0m�h\�\\\\۞�B\��;·�z\��\0}��\�\�T~b\�_�\��;p=\�\�@F)h�\�\�\�z�i\r��ٶ��\0�Rq�6?:�ʥ}h/�.-�q4n���\�\�#��I���2��n\n����pZ�/\�4�U��ƦC�ګ\���Ҁ$_��YG\�K\�_Ƭ\"*��\������)�إx�6*\�\�T�Z�\�z�J釣J\��\0B\�#\���Ο����\�>\�~��\0�yg�`�J$`1�Fq�P�r��Ιt;��i�\�\�^ߝ\03˄w&�Z%\����O���)\�\�T\�\�`UZGz\�],����(����\'8��\�p�h\��� �w>�\�sq\���@dhE^QW�\�O\�+%[Zp��h\08���hQO���PE-%\0--%\0�\�x�\�\�\��s��\�?κ\�u\0����\0-#t�\��\0|�E9��*x*H?QM��+��Ή���\�6\�N\�8\�O�+\�\�\�\r���sGg���?3\����	\�bv�]�Ȩvb\�s�W�F�@\0\0\0\0�\n��t*z(\��\�\"|��\�qI��n�\0Һ;�*d%\�o_ֹyi\�F\��4\0�0����<�*�7�\0��+�\0�\���Oz�\�u��\0�^��\��\�\0{�\0l\�,q����\�?\Zo��_�^yEr@�Y?��=\�X��\�e�t\�\n��\' ym\�:g\�\����j~gؤh�\�d\�\�X/P=�Ұ�\rH\�ٯ���,G(�#��s�\�u��4\�Z^�\�$��?U=���5�n#�vO\Zʧ�`�\�q#\\\�J\�W�d�C�\0M#\�~���:���m\"��ok�\�>\�\�_\�\�\�\Z\�\�\��Z���+&O\njP�\0ǥ�\�;+�\�^�T�����\��?\�-�V̄�\�\��\�=��jq$Q�\�9��g�\�S\�ك����a\�P�\�v�8��\�w�\�\��\\Ϻ���\0�u�\�O\�4\��\0��\0r�\0i�=��4�D�r۾��ҕ��Ȼ���/��\"�\0Z\0�\�\�\�\��?�Rլ�\�M\���fE\�q�\��k!D�w>i\�\�A]��`u�2�\Zi4g`�=I8�^[U���\�b\�\�\�\�\�E��7���\�N\�C\�\�\�\�ִ�\�\0r��1\�F�f�厩�\��PQ�ƹ\�[�>�\�](f�sW��#@Դ\�њ\0ZZJ(i(���J(j�|N��jjJ\0\�(��M5Y�V\�y\�Tm6Aє\�P89k\��\�\�i4@��㚧@]\���99&�\�g��\�!\Z�\�\�\�)\��s�I�\�T�T\n���\�}\rk}���}.�\0\�Ŀ�M4\�\\��ks�\0~%�\0\�hΕ�I�\�At�a�y�\�3_PF\�,i\"��e>��E|�\�\�\r\\jw\�\�\r�x.ά�\'�3\\�y�#\�W\�H����*�\n�t\0�\n\0}Q@%-\0�R\�PTo�#���\�N�8ٻ(�&�W�x�U�}ϓ�\�$�\�\�зӲ\�9us%\��O)\�H\�>ހ{���Q@Q@	�1KE\0QE\0\�\�?��3M��$H:;�\0\�G�i\�|\��Z\��\0}��\�4P�ur:O7���R���\�q��\0���5^�������\0sHe\�X�\�Ŏ{�\�\��\�er\�\��\0֧ʘb>\�\��9d���ˌ�ve�:\�?�\����E\08?��}\�5Թ\�?.�L\�\��{u��S�V#\�h\����\�5\�Lr#&�\�\����\�\�صkXXKq��e܁Ӆ\��\0;�\0�\�MG������bG��N7(8�ݪs\� �\0\�Id�\0\�r\�\�l\�`�RH�5�\�h\�\Z�@��\"�O��\�W�\0\Za��ɇ��?\�]e�<�KK�\0���\0m?�\Z��CM����\0���\0]�%\0q?��\�\��\�\���_�&��\0u�����\0\�?��\�(��\�N\�3�\0\�)�Nh\�\�Ed�7F\�*D�&И9G|פך�\��f=�?�\r\0E�\0	��\0ϒ\�\��\0\�\�ǌ}l�\�/�\0a^uK@�<c{&�\0���\0�����\0�9?\�\��\0�y�\��\0�\�w�����<cg\�\�q���זQ@�<cc�\0<.?�\��*�0ӿ\�\����Uy-\0z\��%�o�n�\0�U �f�\�?���\0\�Ǩ�d*\�O�\�?\�T�\�\ZG���\�\'�\0\n�z(\��\0\�&\�\�����\'�\0R\���?\�?���\n(��\�no�g���\�[\�#2:<�� ���_\�:���\��\0��\0�v��\�͹�Y\�\���\�\�z��\0�)�\0\���zn��\�\�]Ln�ޭ\�Ny�\�mr�\�F�㐯�;v�s\�\�\0\�\�Pj\�z\�a�q[0\�~�\�h�Y7\n�-��\�y@>���Uh\�\�\��#�<~}*6�g��?�\0s���%x�	�0\�\�Hk�k�C�G\�A��}�?Z\0��\�\��\0\�F�\�A�}\�5\�MuP�xϥ\0y\�т��O֞�X8��IS�����\0g\�].�q��8�o�	�\��\��\�z\�g�� �=��,��g�@P2.K�\0�\�s\�Z�\�yc2\�oq4p\��Ev�@\�\0#�(كT��\�\�Ht���\0���52\�ڲ�\0\�\�����~�Ӭ/��E�{�\rߟ_ֹ\�<#��\�-sj\�\���ۅyH���\0?��`�\0J�x�V�\0�\�?�\��&�=\r�)r�\�uiǴ��������\������\0�Ț\�G����\0/�\�1�\0�5 �N�?\�\�?X\��\0\�h�o���~m\�Z�>�}븇��XcŚ\��\0�\��\0~��\0\n�x�X�\�#�\0l��5�\����}܍\�8��v\�,}k��\0�\�W���\��>2\�q\�\��\0\�3�\0\�Pm�]\n��$OA\\E�������(��n��aW����@g-\�\��\��PI:`t�\�5�\�U\�\0aʕIW\�VīT\0���\�>f�\rY2��\0\�$~u\����\\B&C�\�g�ǵ\0p��\�\���\�@\"�2#�M�\0\�R�\0\�/��G�\0~��\0��9��(\0��(\0��(\0��(\0���(\� SY3jx�g\��\0�\0nEm-\�y1.�pF;t\�O@rk�T���\�\��=\�Ą�\�3ל}D�$\0s\�@\Z4Vi�c\�)�d޿ʀ5j�����\�sҩy�棐��\��\�0|D�P��\�\�\0�h��}\��V\�\�Kf��\�\�\�\� oѕ�xi\�e\0}Uc\�\Z���\�Q\�&�\��~S�\Z\�k\�\0\�\�k�x��GuFf��\�\����͏*}�P\�TU+\�5h�m\�|r�\�=A�<Wh\0��(\0���{w�����qݏe\�\�1\�m[\�v�\0f��}09\�T��?V\�?\Z�\Z�yu-\�ē\�r\�s\�e�UJ\0(��\0(��\0(�����(\0��J\0Z)(����#c�����L�A���\�C~��+\�\�\�_ �����\�+�>oR3�q��jw1y�\�bA]ʢ�\r\�\�ٱ@���	L�\'�S�J\��Myc����y<e��\�<fڏu�h@��	\�=+�\��C\'�^LG\�6\�\"�\"L.~\��z�\�\�\�\�Mܹɠ�t]~\�]�\�j\�rc̉��<��\�ч\�W\�\Z\�\�v�k4LW���F���w��\�(�Q@Q@\r������\�g�\"\�zF\��o��z�yG�O�l\�\�\�8ZZ(��(����\0(��\0(��\0(��\0(���:�\�y\Z�@�	�D~���E{��l�&�U\����	\�}\'���/GUa�#4)BQ�\�i�U������20��T�?y�\��KY�G\�h���z��~�C\�t\�^ž\�_)�e�w��.=b%;fYm�u	_\�Q^�\�%,\�\�\�˶\�\���0\�\�\�x����\0�ԭr\�U\���\�KZ\�O�=?��y</����\�e�@F\�&7\�=G\�I��{��\'�[�\�l{-@d\�׬#���\0\�\�Fu����\�\��\�;��\��\��Ӽ\�\��\�\�E\0o�\�{\�\'U�ϸ�/�5��\�_�d\�V\�\���Ҁ5�\����8\nÏb=�\�z\�c���?x|���:\Z\�n\�[@�z��w5�gvXh�}\�\��\�6��{�+�׭7\�A\�/�\�\�\��\��\0���\Z��@\�M\�ǭ\0:�M��(�\�\�\�=�\�s��bg\�\0�]N6�\�~�`\�u^\��>�\�\�S�r�S|\�\0�MB\�\��z\0�AY\�0sWݪ�|\��&�ȵ�\�\rU$��L��쪲�\r)����+S��\�W��\�&=\�\0@|}\�{s�\0}�\0�4\�\�\rC�z۟��5\�4P��\�_޷�\0�\��\0Q	꾐�i�\0\�װ\�@6|+�\���\0\�U�υ�q�\0,P�\0\�T�\0\Z��J\0�S\�X˾~�G�\0\�U+�P��\���\�6�\��j�lט��\�\�\�\�8H\���\0\�\�h\�\�i�\�GATȧQ@\�mII@J�i�0LE�\0��t��\�\��YW+���v��U?�CI@`\�b�\�7QL(*zm\0V1\�`���\�jO!�\�=�\�\�\�]Y�J� �9\�\���^˃_+iR���\�d}�~F*q���\Z��\�uq�\0_�h\�LRW�\r[P��q�\0�i\�Y\�\�Kˏ�\�\��W���V�m\�\�\�?����\�\�\�O\�t�ixzmKP��{�\�\�>Kq#�>�\�u�ؚA�\0�8��\������G?�蟃?�\0M>\�\���~O\'�\0@+E{1�ގ\�\�\�?��a�Ɛ唃�ڵ\0x\�-{	��a�\0m�Tg\�Za\�p?\��\0\�h\�ikֿ\�ӿ\���\0�/�\0M>��\0�\��O�&�<���S\�\�>\��O�σm�]M�\0|%\0ym\�\���C\�\�O����UF|����t\�W��\0\�{^����\0\�\��\�\�x��\��\0�T\�\�!M\��̳�����v�\'Ѧ\�^\�4�*ȮAU �ds��\�?\�t4�e%�r�\0�A-\�Ds\�\�\�Ⱦ\�J�?F�t�6>�Z\�V�G)sl�\�Z%Ǩ\�\\\0i�\�C֓\�`~e�\�\0h]����\�;�#;\�Iz*�\�~2*�3Hg��#\��\����\�P|�o\�5*\����Tj|\�f�i%n���*\�\�\�\�\�#�}�\�o��\�\�\�6\�y�t�O�\��\0xz\�\�*�ǌ��\�M��K-ī4,�99;��\�z�\0��\�\Z��\��/�x\��\�G�_ �\0���\��Ed�cL=/-�\0\�O\Z��\�\�\���/�\��Dj\'�^��\0\�\��I�\�C\�\��\0m�h\�y�\�u$�\'\�Z�[\�\�\��h�\�^K\�\�\�l\���1�Aa\��\�QO(\����?\�M��4\0�QE\0RR\�\�I�Z\0(����(�����\n�o\�}�J�\'&<\�\���w\�5\�\n��\0��c�̫�\0����WF\�\�\Zm���:g��\�\���A���P�O�k:^v\�8La.T{���\�z���c�����u1�>�7�5\�a��͕�\��)��j	��\�\r�pʰ>\�\�g�V�\�\r\��w��?�\�V\��\0|�Ee��58�\0\�\�V,;	��Y��Ҡ.\����G\�<M\�{)�5�/a\��\0�[f��\0נ�?�\�\�	\�}j�X���\0˼�\��\�_\�\"�\�<Q�?ɠ\�\���b\�jPE��\�n��\�W�·���f��\0?�kA\�8\�\�Ac\�@lc��]\�	\�\�=����u�H�t���\�[ �����&�\�U\�\�\�巖ogq$/�\'��\�=\�+\��\�\�\\��4�>\�\�(�<{Z?�\���\�\0y74\�Sm�\�@�\n\\Q�\0p����9>���\�z��4X\�\�Kɔ4\�\rц)\�@���\�@Ɵ\�=B����ˑ샧��\�\�|�ǃ+\�1�\��^Z\��֭#P�\\��3<C\�@x=�Q��n��5\�\�:{1inMq\�\�Q�\0�\�TM-g\�e��Q7�\�xɚpp���ӏ\�\�,䏖�.\��\rB͚�K�QP;�jY\�\0zu�4��v\���\�{Q!\�N\�\�\�j\��$��\��\��\0\�h\�i)i(\0������)�ʊY�UQ�O\0\�\�I\"Ĭ\��UFY�\0^#\�mW�Y\�b\�wl\���=X�\\J\�\�u\�\�\\\�	+n�\�e#�����k��b�1J\0\�6^���4ߴ<G�W�R�\�\'a@\��/\�\�\�w�N.]^�Rc%?\�n=\rn���\"~\����G�\n�Æ�/�ޫ@�\���\0��?����5pz�\�\�JR\�[��S�6TX\�{�[\�\n\��ڞ�x�_u7��UM���\0:�I\�1\�@�����Ԣr\�\�T�нɤk�\�8�P�UGeJ[�\��\�\"\�\�M9#f\�3@[Hc�~~�\�-�n�̲�@\��\�O�S\�4\�y��V\�Iu2C,\�OR}��(\�שx~\�\��y\�?y(\��������;;$�\�\� �\�\�ݏv?Z\�\�Z���xIOU�L��\'\rR5�\0I�i\�\�)\��}4R\������JZ\0(��\0\�|h!}1c`�(�[�>f�c���\0�F!��\�kּWw��C\�+n�\�m\�A\\i�\�@\�\���1�W\Z�#��D�h�P7\�[�B\�X�\��\��7smu��)��\0�~�\�U,�`oec�z\0�zl�l\�\�<q`|��;�\�� \0�N3T\�d�Jq��UO\�Ry�r8�\03\�n�\'��\�9�qML�\��\0Z״�]�0n1�\0�&N`z���b.\�\�r}MKҖ�\n(��\n(����(\0�j�\�\�H�\�\���^+^\�\�\�\"\��\�?��\0t��\��W�\�O����������_�ks\��\�\��X��*+C\�\��\0l\��*/\�\��\0.��\0�\�?´(�\�\�\��]-�\0\�\��\0�Ft}1�\�\��\0\����S�\�G�\\��\0���\�\�\r\'�|\��\0ǿ��ݢ�9\�\�\� �\0ˢ\�O�\0\�S����\0.\��O�*�Z(�>\�?\�\�\�?ƙ�\0��圣�ڵut�\��\0\�\'��\0vq�\0mO�To�A�C=퉓Ί&!dm\�W��\0ӑ\�vt\�A\"27!����\0�t񖣑��������<g~:�l\��*�+��\�ib<ݐ�\0�N)�ݍ\0z\"�\��u��?��\�S�\\w�����8��L7��|\��%o�&�8n�C��\0��.��=Tx\�w�o\�Q�\0\�S�\0\�9��|\��\0���\0\�ד�FM\0z\��\'�\�&�\0���<ofz\�\�\���\"\�\0�\�]?�x\\~I�\0\�S�\�3\�O�����\0\�\�i	\�\0z�\0�&\ZWu��\��T\��K4��S��dƼ^�\0���Jts�\0-%X��_h���\��A�NA�\0�׈\�@{h�\�\�3\�\\[�;[!\n睥\\�q\�8\�>\�\���7���\0SxwS�νP\�̈́�\�u�\0\�\�׷P�j\��\\\��\0\�O�\�Q�U�<��\0���︦�@>\rR޻\�\�\�g\�=3\�{]��\�\�\0��k��u����Ǩ�\0v`ԡ���\�޵b�_��}heT\�, �*4�@\�\�板A_�\0r�:!\0��\��\�\��b�9�<�kַ\�c�\�\r\0x�O2}\�\�Uf��`~�\�r\�[I\�fI�\�7��\0�v]՟qp\�\r��νVM�Y\�\�v�\0�\�\�\�\�rv�4\�(\�I�\�@�%-\0\�)\�Ӏ	\'\0rI\�@bb\0\0�O\0\�גk\�\�conH�S\�\�)\��>��Z�\�\Z\�cmn\�@�\�a�\0-H�\0\�==k����\0��9\�8��\0\"�\�P$\�1��\��5E��\�i]+\�JO�\�=���\�\r\�\�@�\�\�\���x\��[b́Ԁ9?�,�\��\�m猎�\�u�`T\�J�d�i �T�\��\�mc�л#���\06�g|\��߭4\�\'�\�]\�\����\�!?֨H�\�\�\�b\�z��O\�@{��\�O!V�T%G@O\�h0!=��+l\�\�����x�a��ր,�c�\��zSp8J�X�H�;v�\�,rj\�1��f;S\�\�ŭ�\�*D�,\��~��\0ihzq��3\�ǂ\�=��k\�b]�Z\�\�;($tr�{�\�U����*)�U�@��*a@�4T���)� �����������J\0*\�[hd��\�h\�����]�6+\0?4\��\��\\\n\0�i\�W\�fc�\'5%F��\��¹\�>���\0:\�.�\���\0J\�G\���\n\�0�QR�\�\�M�~\�\Z���(T#\��j\���Egb+_L�[���.�\r����\0=M\0hִ\ZF�rGm&\��M��b�cJ�z|bYOq���\��s\�m09���BԢ0g�\�V?�5�\�ѱWR�u`��\�k�\�4������o\�S\��\0yj\�\�\�fh��\�{\�Uh\0��(\0�x\�\�\�*\�\�!�\�׃׿\�Cn�f?\��\r\0jQE\0R\�E\0QE\0QE\0QE\0QE\0QE\0--6��<_\�6\�F�#ceYף~��J�[\�\�\��\�f��-�	P����*J\0\\Rb��\0ZJ\\њ\0JZJct�\�*2sM���(��)�\r\0K^\�\�S\��~S�\�o�oVO\�o\�k\�kcI\�L��q�~\��\�z�]G���\�UsQ�����r�\�\�5e(���\�1\�\\���Kx�\�\�\�x\�N\�=\�[���\nB\��/�w�\�\�\Z�\�!\�@gk�m*q�y�\��\�O�5\�\�w�*\�\�t�?Y_\� Y;H�\�ָ+�Z\�r\�\���z\�?7N��4\�èI\�n=:�ʵWYR0��\�~D\Z�Tքgm\�2@é0���\�\�!��\\ѷ�8?���D�жn�\�\�?,\�b�z�\�̮;~F��T��j\0�?���0\�Z�\��\�S\��\�P\�G�^\�\�\rB�7I\�?�\0t\�?4�ҹR�֓t޿ʀ=:��\�;����\0\�oO3��|\��$o�&�=,�rx�*����ֶ���q#��j}���\�X/�{Wa����\0dr���\��\�\�{^���\0\�\��\�^�|/k\��\0\�\��T\��C.{]C�\0|=\0y�ޟ\�v��?��\�Q�_��[�\��\0��\0\��5�p�\�X�i*y����\�\�\Z��\�\��\r�����KT���\0\�O�ƀ<q�n\��\�CU�\\/X\�~\�\���!?�\��F|+�\�\���O�\�\'�[�4��?\�#^\�|-��\0Ϩ?I#�\0\�\�P˛~\r�\0٨\�1)���<A;	�U>\���I�\0��\0�T\�\��M\�\�o�\�\�h\�\�\�c׊��q\�k�:.�?\�\�\����iҵ�\0.��\�9�U\�W\�Gj\�:u\�\�kp?\��\0�Fl��[y\������W��wG0E��W����\�O�o\�XZ����n�Xv�o=�n\�A\�\�^���2~Pg�NV�E��?e\0f�t����\�����Z�ceM\0E�x�\�m�S\�qK@Q@EPEP^/\�kϵjN�\�`P��o׏½r�\�m-���\�3~8\�~\'�\�9vgnK\����@��(�\�\�_���}~\��5�x~\���V\"�oƀ!�~\�)\��\��(��R\�\�o�\0Y_�b�\�M:����\Z9�يd\"+�O��oh2yz���\������\�9\�UY\�\�^G\r\�\���Z�\"��G�oʶb\��\�E�W�\r\0Ud*p\���[�n��p�:\�\�Ӛ��X\�<\�[ҍ\�[�~�9_��q^bx8<W�\�.\�<��s�n\�VF�\n�{����\�̊B�`c�\0xM��{zq\��\�ڣ�\���\0\�\�4�\�}7���\�]j[�H��GnI4\�\�\���\���E\�;�O��W�X��v\�\��\0�^vҕ�*\�\�5b��\�\�S·�O�*\0\�h��\0(��\0(��\0(�\�S�p�h�Y�Uk3̖v\��\0!�5q-Uys��\0\�\0��\�\��f�,\��\�\��T\r\"����/q@>jxS\�Ѓ\\�Nj?8�lP]Es�j/\��\�޷b�&]\�r?�ր2u\�o�i�1�]~��J�z�L���Ќƾx��\�\�\�	�\0�r:�\0��P@pj\�Z�S\�{P�1O��\�KI@	Q1\�9�G@Q@Q@\'Z��0!��\0��\�%\0zτ5O6&���\�\r\�g�g��\0��\�ף\n��\�\�K+��#8h\�7\�w؎+\�;[\�\�-\�#��CoP}�\�\���X��\�Q��`��B=\�y�\�q�J-��c\'\�c\�q\�9��\�\�S\'��\�&�h\�Dn\n�\�4\�$�� �9\�?�hE{$}��<�ø�\�݉/�\�6u6��S�\0�V�[WkF��Y���\���GJ\0\�\�]2�b\�\����\�/u\�\r.�	��\���O\r\��e�A�\�R�n\�\�\�\�}FӘnw\�_�\�k-���:\��\0j\�L�\n��Oq@�\�\�\�B�\0\�~\�y\������[�Y�G��?\�\�G�Y��\ri�o\�\��Z\�a�\�Bg��\0s�enO�\��\�\�\�\�\'\�]6��\�P�W��w\��V\�˴��\���\�z�\��|?���i\�Xba\�\�\�\�#�5\��\0R\�R\�E%&hh������\0ZJ(���J\0u�P�9�������\��Vڈ���?�\�*z�\�\�|�b��w̤��~��\��ԯ\�\�n�w\�\�/�t_���\�(�a�M��w�(�\0��\�M�5%\0X7�ҏ�h�\0\�R۱\�\�q�\0m�j��5\�\�\�\���?�\�ƫ������2�\0\�\ZΦ?\��\����F����|���V�<A��{��O�&�#\�\�����H�\0��\�(��x�W�\�O\�8�\0���x�V�\�3�\0l��Z(�+\�G�B\��\0\Z�x�SE��\0�g�\0��2�\0퇌5�۟��T�\�\��[��\��\0��\Z�\0�+;��[\��m\�R�h�Y�9\��\�c���\0\�o�\0?s\�	[\����#\r\'\�_\��ฮ��<��2.גߵ�\0\�#\��\���\0!�u\��P\�^$\��\0�g�/;\�-�\�ێq\�k�\�w�4�j�\�I��o\�\��r��\�@�z\nlG����A�\�9�!C�q�\0�0\nG�Z��ʚ?�\"7\�©�\�=\�\��h襛<�դ��m*\�]X�\'\�N�����k_�\�\0tK�-\��.b��\��\�p>���O9�p˾\�g��T\�A\�گ,��}\\�\0E�\rWR2�lv/S��\�\��TWW[#\�z\�+\�\�bOz\0�\Zzw��49\�]̈́�\�\�RhP\�Ŧq�p�\�=O\�һC0�?�\�\�e\�\�:��\�\�G4-���\�#��\0J�V�5]\�\\a�#\���\�#K�I\�\�i$Ep60fPr�g�\�V���\0���\0\�K�5�u�i�\\�\n���?��sS�F\�\�ɹ�?gP\��M\0z(u=O\�)\�\���\\+\�\�\��W\��t�k��ҭ�9R\�\�\�G9?�\���\0u��w�Pd8_���5J0d`���W���~J���\��O�\nW3�!\�;��*�05�\�\��\�Dfl�A\��+��%H�\�U-\0P\�Ġ�v��n1Iut]������z{��\�.K?��\�=��rǞ�P�F=\�\�֩�\�>�O�\0iy�U\�kǁ�/\�;0�=\�)\�J\0�\'K�Ĉx?�>���Ŗ\�N�\�\����\�?\�V�\�.\�\"���1\�U� \�\�s��kr<Qt���G壴m\�I\� \�\�\�9�\n���\\�6Ǵ��\��\0Q�\0\�k\�\��\�(\�i+\�σ �\0��\�\��\0�D|����t\�\�8�J>=�8��:���<^\'��?�]\0y�\�G�w�\��\0��i��w}�`���(����\�\��\0�\�l�\0\�i��ڏi-��	���\0\�(�\��CT��?�\��\0�5�?��\0mG�P#֦\0\n\�ǅup\�F~��)�ư?\�\��i�\0@\�M;&��G5q�\0.�����\0��\�?��\0Ϥ���T\�6}k\�|�yR����\�KE�\�\�\�C���q�-T���\0�\0#P.��\�\�\�ir��2���:(\�pjP\�\�Z\�5�-t\�k3(\��F���\�\��A��Q�=.��\0\�\��\0m��\�s)I]OU`�\�j\�Z���h�\�S�s\�h�\�\��\0�\0s�~\�.�q����\�r��JÓ\��ŷ�zjBa\�.��\�f�O\�\"\�C�i\�E?\�\�(\�d�Ķ\�\�,\"���q\�\�\�g��w\��]\�z���n)Iހ< \�\�\�\�[\�/\�*?\�\�?�\�7��^\�\�@�\0z$?U\�UΟf\��\��\0\n\0�\�ע�&o�֠:�\�\�m{��\�?�{��m�\�\Z���O�[�\0v�<\'\�֥��e�G�\�\�׫�\0\�\�^\��(}(�>�^�(�\�&ih���RPQE\0QE\0����\0��Q@	E-%\0�T3M�O,�K1���\�M�;\�\�\�?�\��\0�oz�2I9\'$�O�jjz���\�\�\��k�\��>��@	KE%\0-%PEPEPEPEPEPEPZZe����\�\�w����+6������\�\�$��[���h\���KIE\0-U���\�\�[�$g?�\���*\�yG�uo�=2&划|v§�\0B?�\0yMԲ]\�-Ą\�\��\05QDj�_Jl\�g\�^���tmY2\�jx�#_�fV�-�Ƿ\0\�u���\Z�֢\�\�x^�d�h\�O�<�\0xu��U\�\�MxB;\�\�,gk!�+\�t�Z\�T�![��~\���\�(LZ΁�.��\��R˩\�G��_ß\�T�\�\�\�%ڭ��C{\�����\�cڱ^)���x�\0v��\�\0��6\�$*���d{W�\�_�\\\�Oo}�}\�\0\����|�\�\�=G\�*O<c���\�\�1��5��\��b�.�\����GFBArv��\��d{v�tI����@qH-�3X\�c�\��\\��z�z�\0SP\�1l.za֮ٮѸ�\���\0\�\�Ce\��Tg\�}ꦥz�h~Py>��$�>T������\�14�\�\���\�bX��Vb\�M@�G#v�\�MۺT~W�\0W��>R�Ӽ���\ntU��\�I�}(�n޵�e\'�v��Q(\�����u�\�\�\�jhAG\�\��\\�\0��+?L�\�6�g;\�\\�\0�\�+S\0�RR\�P\�\�Z\0mQ@E%-\0��Pԡ�\�P\�@(\�T�!4��\�\�+\�M;\�~j.e�ˏVO\�_\�>�\���mx��4æ\�\�3e\�����==�\0sآ��1@	\r<H\��\�GE\0L\'����\�\��[L?\��\0�U��.�ۡ\�\�q�\0m�\0���|:]\��\0\�\��\0\Z΢�5F����?��Ƥ\Z֨:^\�\�f���\r\�\�\�[�g�\0���\�oj�\0��?���\0֬,�2(\�))hh����(���Q@\r��(h������\0ZJ)h1^[\�W͓\�17\�\�\��O����\�]\��hJ�\�I��z\��_\�^ \�X�bI$�OROz\0mQ@%PEPEPEPEPE%\0�QE\0QE\0%{��i�-:�\�\��\0\�?\'�\�^E�Z}�P����\�\��\�r>�\��\0QE��j1\�VS]>>Q�_\�9���O�|\�ws-ĒM+�bY�\���U\�x\�U�v��Dl\�k\�c�I�g����y�Ě\0��O�\�j\�᪥=c�\��!��\0��4�-\�\�n�\�\��֓\�y$�֏&�|9n5(e��Z[\��cn��\��i�yb\�h&7i\�\n~�C����\0�ҫ�jɂkv#��5p$W#)�~񞿇��\�8��HT\�£12�E0����Dw�ir\\W#-Ǘ�#\�\�Nj5$|d\�>�??��\0\����\\\�\�(�[�+f\'��\�\0lF\�n�Z\�߅�{v\�\��U�|\n\0�~w�\���\�\��k˓\�1�֛�\02i3\�a\�>\�;U\�$\��Zƕ�\"ޜSy4ښ!��\0��h�\�R\�IKI@	M�SM\0%cj��s\�\��ElVn�?\�_\�΀;/\���2@O0\�\���\��\�wU\�~���<M�\0����f��h\0���LPQK�a4\0\�IE\0QE\0QE\0R\�R\�EPE�\0��}cO]N\�\�\�\�_�#\�\����z(\�vR��H �v�\�s\�7Ȝ]\�?w?�\��\0��s\\5\0.isM���8����)(���X\�O4�\0QE�u&j\�n�	�KQf�\���5h\�\0K�Je:�E6����N��JZ\0*)eH#y$`���\�\n��\�\�z���Mg#�vOé��KU\�_S�y�!~\�k�\�?\��\�M%-\0���\0QE\0QE\0QE\0QE\0QE\0�R\�@	E-%\0QG^�\�^�\�\�vï\�\�9o\�+ѫ/K�V0C�@[��\�ZӠ���\�\�y\�H�y?\�&�W7\�[� \�/IQ\ZH$X՘v#����>r��\�I[���c��ɪt��� \�\n\0)�RPE\�R\�@\Z}ũ(\0K@n�_<T\�z\�2h��-ב\�t\'\�Iaa\��_�yE}#>���_ \�7�Oԭ.\�, �d*��z�O\�\�z7�t\�tm.%-�d�\�ᇺ�@�� 9���G1�\�^�\��\�+d9��g��5�\0�\�X����1?�v��As�\�6-�&�3��e�Ǯ?�a	H�\�\�\�`9��{�o$$rJ�\�^�or�[��\�\�i?�x�\�G\�\��ڷ\�\�\�\'����9��6Z�\rN\�\n\��\rkS�ǹ&��N*�\'�`)e��\�3�?�f1ɫ�Nj�\0?�\\^!�j\�\0?4�\�\\�Z\0u%7z��g���%6��ޘe�=d\�L>\�\���l\�Mc\�-��}X�\��\���pmom\��\�OМ\�\�\�<c���8\�_Bikӭe\�c\n\�\�\'\��\0i\�斊\0i�\�j���\�KI@RPE�\0�QE\0QE\0-��\0RR\�Pk�Hﭥ������\��5\�Im4�\�0�VO\�{W\�#�\�|[�\�-�c�lz�\0C�P�RR\�@\r�����cچj��\n(��\n(��:1\�PG\�\Z�\0J�x�S���\0\�?�ʸ\�u\0vcź��s�\0\0o�*�/�\�\r���\0��\"��;�\����\�\���G��\�k��\�\�^E\0z(�\�\���\0�5*�\�\�\���\0��7��=8x\�.�o�\0�\0���\��\�M�\0}�y}\�\�\�V}\�\�?4�\0\Z�x\�O\����\0\�\�䔴\�\�\�o�n�\0�U(�f�{\�?\��\0^�v�\Z<����1\n�u$��hMe5�]5^Y�x޻I\�\�Ǹ\�\�_\�Z\�1f�X�$�52I\�zקi\Zji���s�J\�\�s�A[T\�\'\�z��\0�l�3�\0�Tg\����\0�G�\��\0\�\�\�4P�U�\�7\�?ơ:>�:\�\�\��\�\0��\���\���o�Οz:\�\�߷�\0\n�\n�\�\�&\�\�u�o���\0\�Q�&b���+\�J\0�\�\�\�8�\0���\��ʾ�⛱O�\�(\�*J�(\�	\�g�\0�\�L6�Ǭ��f�\�@<Q_A#\�\�\���\'�TgL\�\���[�\0ߵ�\0\n\0�\Z+\�N���v�\0�������s��?\�@E{���\�\�?Ϳ��a�\�\�\��\��\0\�P�V��i�\�J#*�\��s�\�\�W��\��X0�\0���U\�\�3\�\�\�\�/NUFhǜ_2u9P2x�4괙�,\�?\��\0���R��\�<�F�J�E!\�\�N\�\r\0v\"�\\:Xk{m�]w\������ׄ\�\�Oy)�y^Wc�\�I�����I\�<�m\0OăΣec��8\��\�U߱ޞ.H�\\~#�\0#D\�\�#\�TU?��\�~|T��\�\�\�\�@\�庞[�<?\�_\�5$A\�`�ր,\�c�#1�QT�Þ�P�\"��Ӎ�9�5Q��\�\�=(�b\�f	��D�)\Z7C�t8e>��\�<Ӆ\0}#\�_�\�\�jX�_\�\�\0�\�d\�8&�2\� ���\"���${\�\�GҾ��\�l�Z�\�\�\0+3�\�/g�\0{�{�@\Z\�:b�~Z\�} g\�ʻ_\�})�\��\���߷\�o\�\�\���/�\��x�\�ɴ\�:ȣ�כ�U\�~(Xn\�\�[V[��C0���(S\�	��yT�u�\�o0�\0�o�\�2b�\�\�UN�\�w�-���r��f�,:���X��d�\"� ���R���kC��\�?Z\�nI\�Z\0څ�sI\�\�Gҫ[�h$�\�\�ƀ+8,\��\0)GZ�zS$8��7\�\�Q��M6�\0^ih���ө\r\0%6���\n�\�t����淲\0$�&�9\�\�ǹ&�#�\\�]ߙk=�bp\��\��\�u\�xN\�\�\�\�d�:2~#\�_\�@݊n*,\�\�\0j:}%\02�ZJ\0)(��\n(��\n(��\n(��\nZJ(\0��(\0�K\\B\�H7#�V�\�jQҀ<Q�}>\�Kw��?\�C�O\��\�mz��4ϵ\���1�\�pI�h���Q�אPQ��\�\0QE\0QE\0QE^��Z\0JZ(���(h����(�����\n��\n\�Xo�z\�@�B�\0\�\Z\�tm1�K���\Z�ҷ��}[��rDX\�Q\0UP\0���R\�I@%-%\0QE\0QE\0%Q@Q@Q@RP\�h�������(,\�\0I�\�7\�&�\�y\���rG���+\�|Gw�]6@\Zo\�/\������\0+��s$�*\�+��p\�Z\0��(�#5U\�պC\�\0gѸ���\�;���QQL�K����ત�J��\0�\�qݿZ_5�\0�:�k{҂\�К\0v]�O\�N�\���ayO�\Z�z\�%;�\��Tũ�\r.\�\0�\nx.\�1@�a&˥�l�\�Y1�~­\��\0�C�\�\0v[�3U�f�u\0z����?�\�G\�\�\�w\n�\��=\��\0f1��z0��*\�[�W%ybx�ذ9\�Q� <��07\�V$b�lV\�\�A\�\�r�M\0X�����2HA��Y\�V��94|��\�,jH�F=*&�\�\�@\r���P\�\�R\�M�SM\00\�S�@\���\r+=1u�]\�4\�7.2O�?�X>�\�w7\�WmgX#N�Z\�[�{\�=�\0t=�$�\0�k�\0\�T��6�\�<w��N3��g\�]\Z\�g�X\�\Z\"�\rd\��A�\�\�?\� �9��}��[�\���7��G\��汳@�<ifz\�\\\�����;\�r?�\0\�\�3K@\��\0	���\���\0���\�G�~���\0\�\�i(\�Ǌ���\0-%�ɪA\� �\0\�wX��\0\n�J(\�ǉ4��\0/ }RO�&�!\����\�?�Z�\�(\�ƽ���|��#���k:Y\�{o�\0}��:(\��i\��_-�\0\�\��\0�H5\�\�\��\0\�T�\0\Z�\��P��=. ?�\�?Ƥ\�zK�\0���\�\�4��x�3\�\��\0���\��q_7f�Fa\�\��\�\0}�O\0\�΂iGI$�6�\0\Zp���\�o���\0\�@E�\�xn���2��\�I���\��\0�OLV`��.�?\�\��\0�j隑�}����0���7ݜ`\�>\�\�5G_A#L~~\�n}�\n�\��\�\��\��\0�@E{�\�4��\0.q~��j��sH?�\�\�����<:��\�\� �\0˹I$�\0⩇\�\�A�\0�R��@-E{7�\"zO�f�\0���(�\0�OI�\��\0���\0�\0x�-%-\0�R\�KE\0R\�R\�EPR\"4����1\n�u$�z?�4���̽2 �/���F\�K�X�27\�+z��\�z\nۢ�\0(��\0)(��\n(��\nJ(��(��(��)(\0������J\0JJk�F�ݕy,\�\0�5�j>6ӭ	Kp\�n;�\�\�<��PG�.�\�ķ\�r\�~A�\�*\�U�\�yf8\r#=�߇J\�73\�4\�\�?2\�U&��D\�\�4�f��!���c��b�fR%H\��\�\Z\0ZJ�M/]ѯ[\��I)\�-\�K�`?鷕��\�\���]\����H��u���GI\�{a�a�\'4\�W�\�|1�S��n\���F��t��[���\�\�e�*�\�Hێ9A�\�(\�v�nڒ��\"\�F*Zm\0E�J����S\�n\�*u��\0\���\�\0A�\�Myn��\0!Q��q�¢�h�Y*pՎ�W\�\�<*p�G\�1�5w��\�o\�\�}]G�;]��\0\�\rK��Uu���t��yk\�s,y\�\\۞\��\�ޝ�\�Z��<�Ι�i�P\�4\�\�\Z����\�=(�-Jba\�Q\�\�R\�\�>��kz\Z\0m��\�R�ր �ʸ��\'1�x��Su-DB0���\�?��\0����4\�Ǩ�Z����硈�Q\�\�\�@�\�{֬w9�=�g5\��\�(7\�ɗ��wS?NG�5\�]����\�\�\�D��\����\�\Z\0�O����@R\�R\�E-\0�QE\0QE\0QE\0QE\0*t��G=%(;�\�\06��(\�|1���\�Ȑ��\�\�\��\0	�:º�ҼL�}:\�9\�8?��\�\�=\�\�T�4�3�]C)��\0-Q@-%\0\�)�P\�\�QK@-�\0R\�E\0R\�@	E-*�;PIb\0�\'�\0k\�\Zk\�wi\�A�J\�\�A�OA^\�i,h�U\0U��bh�b\�v������\0��^��@-%\0�RR\�E�\0QIK@	EPEPEPIKE\0%%:���u=N\�I�i\�����7�T3\�w�)eH#yd;Q�\��_6��W�V�i!\�vD\��\0=Z�Y���!�˄�? �?\�os�W5E\0�QE\0QE\0%\0�<�\�����\0��\Z�\r\�ű\��\�{�ݓ�\�EG\���#ژ.\0%XG\�h��\��\�C	�\�\0;K\�Y��\�/\'MFc�X\����`<\'�;�\r\�(9�{�d�B\�\�؀NI\�*՟&?\��\0*r�\'��\0*\0��\��@\��y��\�P�\�\�\���\�E�\�5 t(\�\�U�=\�I��n5��r\�}*��=��cS,]\�\�@\n��\�\n��)��}*)$\��\�?Z\0�v�\�k֜LGZ\0�\�\r[\�\�/�\�+�S�\\O�W��Y�\n\�S�\0\\^jЪkV��&ۑUd�5yjB�VkN��&���\�λI��V쁚\0��&@\����Z\�q�R�l�*Gq֥�\\d�gM\��\�\�~#�����\�S����}�*Z����\���?ƀ-\�Y��\�G\�U��eM��\�$-\�x\�@0PI \�\�+}�n8��\'�k{�\�\�9\��G�U,\Z\0a\�֯Ei,��+j=W\�rh��\�\�=+fu�Է\0p*\�A@�\�㠭h�5i ��\��\0C\����g��_\�b���\�쇂�T�A\�{�\�^[�\�}�Q�\�M��\��\�\0a��S>�)�>�E%-\0��PQKI@Q@	EPOQ�eJ�(�QE\0.h���\"$צ�GSލc!\�2�\��\0�G�y���m�$��9\�8x\�0�;}C@E\�T\�㾶�\�?�\"\�\�=\��r�\n(��\n(��>f�QE\0-��\0���P\�IE\0-z�4�\����ʤ�\�\�\��\�=\�Ҵ\�\�\�\�\�_�#u_\���\�\�F�F�ơQ\0U�%Q@Q@Q@Q@%-\0�QE\0QE\0QE\0QE\0QE\0yύ��\�\�f�\���板�U\�,w1>�\�x\�\�ͮH�;`�5�\�S^|z\�׬[|:����\�\rFٖh\�E\�ng�\'�⼚�w\�^5�\�����8��[�\�q\�ܔ9#<��\0W��\��ۋ\'�\0�H�\�:�F\�m.�[I�m$D�\�\�\�\0\�8��^\�\'\�\�8}\�+���\��\0f5\�ڥ\�\�u����I\�PǀH\�\0Τ�\�6�\�s�OH\����} \�+�%[9�Vzֳ,�ja�#P\�$�b.3���>�\"�\�G�$\Z\0}\�u�<��\�\���l\��\0}�\��k����PG�\�\�o\��\�\�1\�ȣ�\rR�_S\�o.O�9o�4\�\�֗{�\�\�\�\�\�\�1\�8\'�\�=h�\����5�-����\�*\0\�\�R�L\�kOˍ?�?_��p:\0(�\�,S�\�\"���\�UK\�@��\�x\0�U-W�*\0dq\��ZrGV�(Ҽ8��_ws�\�\\��\�1�C\�\\�\0\�ƺd�\0H�iM@L��-�57j�*|�@W9\�\\�\�NsֻI#\�gKo�@gqh\�沞Ԋ�I\��\��J\0\�,T{+^kw\�\0\�Ki3\r\0gl�	\�\��ZY<�nCb�\�E\0r�\�K\'_�V\�:tk�9>�Х�][z\0\�[^:T\�o\�[�j�A\�@\��[XkDE\�V�Ib�kZX\��LPU��_\�\�m�\0��M�\0�/��I	�\���\�4��J*�\0�O\�\0�\nv)qK�\0)iih\0��(\0��J\0Z))h\0�����(����E\0Y\�ғ\0$t�<\�j\0u\��\�\�\�\�1\�%%-\0w�\���͜��Ls{I\��\0��W����2�H �����\�G\�WS�I�\�>IG����\�(f�(��(��)h���(��Z()@,@$�\0:�{Q]�\0�t�6O�J�$g��Oݾ�\�ހ;\rK\Ze��&\ZS\�{\'\��t��\0QE\0QE\0QE\0QIK@Q@%-\0�R\�@	E-\0�R\�\�h�RP\�>1�Ǯ\\1�1	B��+��Lá\�^�\�\�<��\��ȗ۝ѷ\��W��R9�\�m%K\�-�\Z��^��\03Fi��8\0�85q �\�۵YD\�\0�\�qHi\�{w�5Fy6}wEY$/\�\'��\0֭E���\�[��h�M�\�Τ�Q\�ք�J�\0UJ�ta@y\��\��\0?�/\���L:|\�\�\�~�?�\�@���\n��X�\�Ҝ,&�����\"�)	�\�&�V�wɫKf��\0s\�7AWԞ���ڦb�2\�\n��U\�;e\0V	O\�S\�\�@��G�6\�\�I�\�\��J��E�6\���)���m�S��B\����S�hZ�\n\0pZk\���8�\0\�9��-sں�j��=��6*{R�����=�\�E\0skk\�V�\�ڷ|��C@\��X\�U ��3\�U0���m��\0/�\�¼Ѷ�+��T��\�v\��!\������\��u\�&\�ya=cvC�T\�x�\�\����L� ��\��ErT\0QE\0QE\0QE\0�R\�@	E-\0�QE\0QE\0QE\0QE\0%�P]O�5?\��Юq�G�V��\�\�-E\0}\'Er�\��\�d\�e�ެ�\�ߗ\�WU@g��\�l\���Vf���a�p�ʳ�\�z\0��\0Ɛ\����U�圣\�+�몥�<�KK?�\�\�O�Z��CM\�%��\0�/�\0]�%\0p\��\�=�����\0\�j#\�\�^\�S�\0\�)]\���嚗�\�4\�g�\�\�8\�Sb�\�z(9�\�aR\���-\�H�\�*\"�P%\�?\��ak��Ԯ�C�����\�z�\�\�ڹ�\0�\�\�H�ٿ\�\"�\0�4�\�;~��~����\0�a\�+.����?֤0\��\0\�\��\0���\0^KE\0z��n�z���\0l\��\0R�iG�\�X��׍\�@\�<Q���l\�\��\0�H<G��y\��5\�tP��i\'�^\���\� \�4��\0/��$�\�^E\0{\�\��\�\��\���(Ԭ��\��\0\�\��\0\Z����>���\�\��\0m�jQq\�4G��\�_:\�@F�#=��8\�?:��\��7\�h\�\�^k\�A4ä����Ԃ\�\�t�a�\0m�h\�z+\�Ѩ_�W���\0Ƥ\Z��?\��\���5\0{�%x8ֵA\���\�5(\��a�\0/��\0\���\0{E\�7\��\�L���J���\�A����}m�\�\�����e�<�\�\�ֻ\�-\\\�\��F�Z��j\�76�$\��\�\�\�.\�H\�\�HP\0�\�q��\�0�z�\�V��\���\�3+\'��G�#Е�h���z�^�\n��:�\�\�S���\0z�&\�FdQޣib#\�L�	Z\0�$\r�\�\�U\��\0���L�r\�TZW\'9�\r\�I`y�v\0���J\�k��\��Jֵ�\�B����\0e?Ҁ:zLW]i᫋\�x\�-\�md�A�r\�\�\��\�S�jc�[���\0\�h�\�)6-vG\�z�\��\0���j��WW�\�3��h�\�(\�+�>\�\������?�*�>\�\���7\�џ���9������j\��\\\��6�\�P�Tl�?\�\�.)1Z\�J\�G[;���\�\�Q>�u���\0�O���m]6�#��o��Q\�9\��(�1F\�?L\"�=\�LM����\��\0�֎\�e�x���\��\0�\n��� \�;mK�Իh�ZxZ��h<S��~)q�\0LR\�Q@\�(*AK�\0f�K��N�m�\�N�PvӱKK@F)\��I@)Ԕ�\0RQI@y\�Km\�[\\�\�\�\�\�G\�+ʫ\�5\�o�\�Q\�$!u��\��+�\�\0��(\0��(\0��J\0Z)(����\0ZJ(��(����\0J)h��(��(�\r�Pm6�9�����T=.�\�^򬮡��V\0�:z\Z���_\�Z�������\�\�����\0��\�\�E{��̡ԁ�~������\0\�\�ъ\0��\\Q@	EPW\�W\��}�#�\�Fd#�G\��o\�]^�}�k%ğ\�¯�\��_�����K���S�\�b\���\0V��(\0��(\0��(\0������(\0��(\0��(\0��(\0��(\0��(\0��(\0����}���P[�\�\r�Ǯ:�bA�o�F\�\�\�TZJ����T\�Ze֧9�\�=\�#�S\��wO\�=I�(�\�#o�9�s�?�t\�,R\���>`�7A}\��Z\0�Y��\�ҫ\�E\06�u%\0z/��B�U؊g?f���\�d�LtoQ_I\�Ű��z�_SxN�\�\Z5��\�Ř\�\0�+�\0\�(��\0(��\0Z(��\n9��\0)1KE\04�=�\�*3G�h\�+�55�R}�T�Է7i6\�*�\�;|\�ށz�.����r\���Zm\0i\rSP/.?\�\��XMgS}�\���5�J:\��\�5Q�\0/���\�R�\�\��^��T?�-`RPH�%\�\���g\��ML<S���k�ĿҹjZ\0\�G��Q�P�d?Ƥ-ԇU�?�?�j㨠\�x\��\0�6\���*�2�\�m�\\Z\�h\�G�\�\�i\�\�?��G������\"�\�\0��\�E\�d\����(�\�\�I�\0A^_E\0z��{Y�\0朗�\�2�\���\0��\�^KLc@�<c��\0r\���\0��W\��Q\�\�\�?�j�(\�Ǌ��\0-eX��T�\�\Z9�\0��>�\��\0\�ׇ\�@\�<I���{Q�I�\�Ri�_\"�\0Ǉ�\�^\rE\0{��֒\���\�\��r\�\����J��$0�,\�oo.DB\�듆R:�+��\�W>v�\�\�2�[\�\�\���:�u���\0�O���^���f�\0\�_E據\0���0\���\0\�\�L(㪷\�k\�*L\�P\�x4����TC�\0\�Q�xXb?��\0\n\0��$\�Z7[h��O𨿳l��[�\0ߤ�\0\n\0�\���\�4\�\�go�\0~\�Dt-(�\0˔�?����\��{H?�\�\�\\\�\�	�֎\�\�G�\�\�\�\�W�i�X8�K\'�\�GI�	�\�S�h\�)k\�O�t�\�\��\��5�v��\0=.G�	��\0�:J��\�\�\���?�-D|m\�\�a�D4\�tW��\�\���\0\��\0��O��/8��:\0�j+\�O��\�y��o�*�>�\�w\�(ϫ�\�-u��{8Y����c\�u,x\�q\�k�\�|%Ry�r,\��![ݳ�~�舁\"\0�8\n�\0~T\0�oJ6��z0}\�\ZJ(�����j\�e�\�7\�f9R?�n�J\0\�C�h\�l��\�U=��\�\�{W-E\0RR\�PEPEPEPE�\0�R\�PEPEPKIE\0-��\0QE\0VM\�`��3ZՇw�5\��\�\�@tRR\�H��|\�Ѥ\��\0h�?\�o3�9�/\���\�\�qڼ��Z(\�5e2\0`�\�҃�D�>��>�\�\�\��g�|3.�~\�\Z�N\�\�8\�\�\�ޅ{z�p8��n-�����$�7dpO\�k\�\�z~�}vBEY�iY���\�u\�M\0y�(����@\�N\��\�N\�\\��\�ӵ\06�\�\�`��\��\0$-iz��\�\�����\�G\�{��-\Z*I\��^&%݌m�9�H��(\0�����(��(��(���\�O�n�\�S\�;Ӷ\�\��C/��h\�zZm-\0-9i�\�\�@QKE\0QE\0QE\0QE\0QE\0QE\0�PS�\�@RPEPKIK@w���\�&���=\��\�?\�Mpu��\\��Q��8E\r�\�|��4��PE%\0\�\�M��E%-\0%-PE-%\0%�Ph����(����\0*nBz�~�5g�n�C\�H�\0h�NW�ա@\�����Z(�\n��\��\�\\I\��1\�\�k��ne��I\�9y\'\�\�{���\�z���ϕ�\�$��w\��\0\�}����(����\0JZ(��(�����\n(��\n(�����\0))h�����\nZJZ\0(��\0*���\�$�\���ƭ�\0M##�?�h`�Z�s�\�q���/`m\�M\�x��q@6ʘ;�C�\Z��/��4����Bt?\�\�ة\��cH�H\�s�\�\�\0z?���M&�d�o-n�4Y\�FV8\�\�z�\�\��)>\��\0\�k\�,ӕ\�~\�#\�H�T�\r|\��\"C&��y\�B��f��\�\�\�\�zO8�J\��\0f�$�\�m\�\�\��\�b\��$�\0���S\�7n��!\����\�\�?��AB�(�v\�r\��v�9�\�+V���]\��mc,�\�	�f�\0$\�4\�6}Z\�;XG/\�7h\�y\��{\�\�ֶ\�Y\�\�o\�H��\�\�z�\�\��;m\�ˈo��\�\�G\�\�\�z(\�+�����\0(��\0(��\0Z)(����\0Z\�\�\�:��\0\�	?�\ZҬmm�\�W����\�@EPN\�(\�%F�\�Դ\0�QI@-%-\0QE\0QK@	Lcڕ�\0QI@E%\0�RQ@E%\0�QE\0}�\���\�\�n\�\Z\��\�0QZ5\��>\�Ͱ�y�C��_�\�\�()i(������Z()h��E%-\0%��\0RR\�PIN��E-\0V&\�.W\�ך۬�\���\�:+{\��P\�lpj�cy�ǭ[I(S4��D\�9�)�d\�~�N��\�\�b�\�\�6&�rGT����A]=\�\�V6�\\K�Pt\�ǲ�rk�n�I\�9g9���q@(���\n(��\n(��\n(�����\0(��\0(����(�����\n(�����\0(��\0)i(��\���l\�\�R2��5��\��lW�\�\��O.\�k�\�\��\�\������25M\"\�X�ʹL���3�\��`�kõ�\�:vd�M\�C�\�2���x}FE}N���+� \�x4\�n?���}?}�iz�76��}~G�\0���9���aHo�ᄑSȉ�N\�bO\�@M���An��T�b��rϼ\�ր*���V*,����\0�\�M�c\�@��\�j*\�P�l\�Y\�1�\0���7W�*\�\"�X\�9w�7E�M{\r����\"h�$���\'�>\�]}�D�s\���w\�\�u@Q@Q@Q@Q@Q@Q@s�!8\�.�\0\�Q��\�A\\ω\�n�q\�c�����(\0��(\0�P����4\��N\�\06���\0Z(���Q����&�@Q@Q@Q@Q@Q@Q@��.|�A\�\'��#��0�3^�_=i�\��\�o\�H��3��f��\�@E�\0�RR\�\�IK@��\0R\�Q@EPEPEPEPMuWR�2�\�J\0\�\�5�ml\����\�~�$r�Ӛْ5�J�\�5\�Om-�޹t�\�\��\0j�i|\�z\�o\�<\�@�uo�\\y\�\�H㣿B\�A\�WE%\0-�P\�E\0QIE\0-%PEPKIK@Q@	EPKIE\0QE\0QE\0QE\0\�R\�FK\0�\'�M��\�V�jԣ$e`�\�}G\��\��]��[;H �\�\0>\���W锹���E\0)`��蠟˚�-�͚y?�+�\�\�\�\�:\�\�\�4�ٺ���\0y�\����|.*\0�/ߢ#���\����_\���\�\�\����\�F*�Ƀ�Pcm�>\��}\�\�\�ƙ���\0�@\0�\�\0z�\�\�\�.\�\�͏�\�\'�\�\��\0?�{�|��\�6��[ܯ����ч\�3_W\�\"J�\"\�\�O�#\"�$��(\0��(\0��(\0��(\0��(\0��(\0�O\�g\ZK�\��k��3\�\�1G�\�����(\0��(\0��(\0��\"�E\0I�ڍ�\0\�\�\�h��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n�\�\�\�zu��\��·�\��\�^^�\�۝��۞��q�\��\�\�QK@	E:�\0(��\0)h���Z()i(���(\0����\n)h�����\�3\� �\�n���}�\Z�\\��q�1\n�O\�\�\�Z\0�\�\�nQ\�>�==i�ڗ^��O�\�~]\0�\�','123','123','oh',5,'2016-10-19',123.00,1,1,NULL,0,'2016-10-27 00:00:00','2016-10-27 00:00:00');
/*!40000 ALTER TABLE `staClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staLesson`
--

DROP TABLE IF EXISTS `staLesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staLesson` (
  `ID` int(10) unsigned NOT NULL,
  `ClassID` int(10) unsigned NOT NULL,
  `DateLesson` date NOT NULL,
  `TimeStart` time DEFAULT NULL,
  `TimeEnd` time DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `Creater` int(10) unsigned NOT NULL,
  `UpdateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_lesson_class` (`ClassID`),
  KEY `fk_lesson_creater` (`Creater`),
  CONSTRAINT `fk_lesson_class` FOREIGN KEY (`ClassID`) REFERENCES `staClass` (`ID`),
  CONSTRAINT `fk_lesson_creater` FOREIGN KEY (`Creater`) REFERENCES `staAccount` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staLesson`
--

LOCK TABLES `staLesson` WRITE;
/*!40000 ALTER TABLE `staLesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `staLesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staStudent`
--

DROP TABLE IF EXISTS `staStudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staStudent` (
  `ID` int(10) unsigned NOT NULL,
  `AccountID` int(10) unsigned NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Photo` mediumblob,
  `Note` text,
  `IsDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `UpdateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_student_account` (`AccountID`),
  CONSTRAINT `fk_student_account` FOREIGN KEY (`AccountID`) REFERENCES `staAccount` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staStudent`
--

LOCK TABLES `staStudent` WRITE;
/*!40000 ALTER TABLE `staStudent` DISABLE KEYS */;
/*!40000 ALTER TABLE `staStudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staTeaching`
--

DROP TABLE IF EXISTS `staTeaching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staTeaching` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LessonID` int(10) unsigned NOT NULL,
  `StudentID` int(10) unsigned NOT NULL,
  `IsHappy` tinyint(1) NOT NULL DEFAULT '1',
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `HasAccident` tinyint(1) NOT NULL DEFAULT '0',
  `Note` text,
  `CreateTime` datetime NOT NULL,
  `Creater` varchar(255) NOT NULL,
  `UpdateTime` datetime NOT NULL,
  `Updater` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_teach_lesson` (`LessonID`),
  KEY `fk_teach_student` (`StudentID`),
  CONSTRAINT `fk_teach_lesson` FOREIGN KEY (`LessonID`) REFERENCES `staLesson` (`ID`),
  CONSTRAINT `fk_teach_student` FOREIGN KEY (`StudentID`) REFERENCES `staStudent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staTeaching`
--

LOCK TABLES `staTeaching` WRITE;
/*!40000 ALTER TABLE `staTeaching` DISABLE KEYS */;
/*!40000 ALTER TABLE `staTeaching` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-07 17:29:48
