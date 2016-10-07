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
INSERT INTO `staClass` VALUES (1,'class1',NULL,'this is first paragraph of class1',NULL,NULL,10,'2016-09-27',100.00,1,1,NULL,1,'2016-09-26 00:00:00','2016-09-26 00:00:00'),(2,'class2',NULL,'this is the first paragraph of class2',NULL,NULL,1,'2016-09-23',12123.00,2,1,NULL,1,'2016-09-26 00:00:00','2016-09-26 00:00:00'),(3,'class3',NULL,'this is first paragraph of 3rd class',NULL,NULL,2,'2016-09-26',50.00,3,1,NULL,1,'2016-09-26 00:00:00','2016-09-26 00:00:00'),(4,'chess','ÿ\Øÿ\à\0JFIF\0\0€\0\0ÿş\0Lavc55.18.102\0ÿ\Û\0C\0\n\n\n\r\r\r\r\r\r##$++3ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0\àT\"\0\0\0ÿ\Ú\0\0\0?\0ò¬QŠ—b€\"\Å©qF(,T²ù\Õ\ÌS5a¨„†_Ã¿J„oõ_Æ¦kU\ì\Ïù\Õfˆ/\\ş$P¤üòÂ•&8\Ü\Ì~¿\á@º¿S“Z( v•\0&\ÜQŠ—¦’	\"]v‰S8ù‡\\}(¦(\ÅKŠ1@bŒT¸£(\ÅKŠ1@bŒT¸£(\ÅKŠ1@bŒT¸£(\ÅKŠ1@bŒT¸£(\ÅKŠ1@bŒT¸£(\ÅKŠ1@bŒT¸£(\ÅKŠ1@bŒT¸£(\ÅKŠ1@bŒT¸£(\ÅKŠ1@bŒT¸£|£5\n\Ç-\ÃmDy]¨¥ä š¶\Èb¡‚K»)Vky^•tb¬?ü¨½ÆŸqo´\ÍĞ†S$n™£pœc®¾\ï\Å\Z\íüO\Å\ì’F\ãk¡XÂ‘\èp‚¹\åwV€3Š‘W\à™‰\Ú\Üú\Z°°\Æ}[ùT\ëŒ b€b¥\Å ±F*\\QŠ\0‹b¥\Å ±F*\\QŠ\0‹b¥\Å ±F*\\QŠ\0‹b¥\Å ±F*\\QŠ\0‹b¥\Å ±F*\\QŠ\0‹b¥\Å ±F*\\QŠ\0‹b¥\Å —\Ãş—Z”–c¼g\ç“$ÿ\0q3\ß\Ôô\í~\Z\ÒmT¬\ÒCıùš\Ç\ê[#òªiQ\Çcam\ncˆÕ‰õfcù\Ö\ÜZ“Aœa‡¡\éõ ô\ë%ùZ\Ö\Ü{yIÿ\0\Ä\Öß‡´k€wZD¤ÿ\0y¿ñ\Ò?•h\Üj\r1\Ëc+=®½¨\Éu\Ï0ù°¹–q\ÏßŒö\r£Ş¹,W¸\Ş\"\Ü\Âñ7!”ƒ^*WBG\å@bŒTØ£(\ÅMŠ1@\âŒTØ©#ˆ\Ë\"F8.Ê£şq@Xé·š”]¬3w\Ú>U÷f?(üMwcÀw‘D\Zi¹\çË>­\ßğ\êšdv\Ú]²[B¡U\'»·vcÜš\è u›£/\Ó<şT\á\r\rõ¯\Ë\"œ8•v\Ş\åG\ß×¯\İ\ÛDG\ïs\Ğ\×\'s¥\Û6H\Û@©ZL³<»Œª\ÌN\î¥rz§\åXØ¯_¸\Ò@\'i®#U\ÒÍª‰@À\'>½\r\0rø£6(\Å\0CŠ1SbŒP8£6(\Å\0CŠ1SbŒP8£6(\Å\0IŠ1R\âŒPX£.(\Å\0EŠ1R\âŒP6\Õ)¶y€i÷RòÆ¨Dv¸÷\ãó ±Œ¥Xó|µRYv&;ô¡cyp\Ìp(y.\Ñ\â\Ù\ä\ßó\Ó{g¯e\ázz\æ©FÁ[8\ë\éO™B°\éô\Æ(*\n\åy¨öÿ\0\n\0Ô†A*û¿\ãS\â°\ãs_ÿ\0]n\Æ\ë\"\î_ÿ\0U\0&(\ÅKŠ\\P8£6(\Å\0CŠ1SbŒP8£6(\Å\0CŠ1SbŒP8£6(\Å\0CŠ1SbŒP8£6(\Å\0CŠ1SbŒP8£6(\Å\0CŠ1SbŒP8£6(\Å\0CŠ1SbŒP8£6(\Å\0CŠ1Sb“(\ÅDnP0jh\ÜH2(1F*lQŠ\0‡„p~•>*7) y1\îÔ©ƒI3  q\ØTË¹\è\ÜcŠ—ÈºÕŒPX£.(\Å\0EŠ1R\âŒPX£.(\Å\0EŠ1R\âŒPX£.(\Å\0EŠ1R\âŒPX£.(\Å\0EŠ1R\âŒPX£.(\Å\0EŠ1R\âŒPX£.(\Å\0EŠ1R\âŒPX£.(\Å\0z6™©´ö\èe£P®½ø\è~†´~\Ö\ÌzcÓµy•²\\\İn$Ü½\Ó<}H\éø\×am¨±E\ã\Ì\îqŠ\0\Ú9<ÿ\0Z˜\Ê\äT’a!\ãCT½š\È\'–ŠÛ\ËBûcühRò\é--\ŞV<\à„\Şc\Ğ\ë^S×ŸZ»=\Ä\×O¾W.{g ú‚«b€\"\Å©qF(,QŠ—b€\"\Å©qF(¦µñ%\ì\nLN£€[‡Æºûme®\"Yv”<\é\ÅyV+¯Z\"LtP­\0vRú\Ô\ëu#ÿ\0\×/g>õ\Ñ\Æ\ÛPŸE\'òBMj\Ír\È1\Ô“ú\n\äõ}^;È¼˜ƒ¸3;t\ì_\Ä\×4y$úš1@\âŒTØ£(\ÅMŠ1@\âŒTØ£(\ÅMŠ1@\âŒTØ£&(\ÅI¶´(\ÅK¶´(\ÅK¶¡˜ìµ\0s“\Î\ÇŞ¡e\Û×¯¥^T\Ø½k4’NM\0O5¥,¢>_\åYtòÅ¹4\0¤–9<Ò£”9üÇ­GE\0[uo^‡¯µ\"3!ÊœTq\ÈPúJ°<¹>\é\Ø}(ôwƒ£\Ä…h++Œ©¹\æFN£ñ\Õb9Sƒ\í@6(\Åd\Çz\ëÃ\Ã×¡­8¥oºyô\ï@\Å©6Ñ¶€#\Å©6Ñ¶€#\Å©6Ñ¶€#\Å©6Ñ¶€#\Å©6Ñ¶€#\Å©6Ñ¶€#\Å©6Ñ¶€#\Å©6Ñ¶€#\Å©6Ñ¶€#\Å©6Ñ¶€#\Å©6Ñ¶€#\Å©6Ñ¶€#\Å!\Z—m!\Z\0\ÇÚ¾‚®À0§e@pM\\·bX÷H&€.bŒT˜£*µ\ËlŒš»ŠÅ¾|°AÛ­\0c°­8yˆVy«öÿ\0\êÿ\0@#8aZ¬®•¬„:†\Å\0&(\ÅIŠ1@\âŒT˜£(\ÅIŠ1@\âŒT˜£(\ÅIŠ1@\âŒT˜£(\ÅIŠ1@\âŒT˜£(\ÅIŠ1@\âŒT˜£(\ÅIŠ1@\âŒT˜£+\Ò|9\áX\ïc[»\â\Ş[s \í.?¼\Är\ì&¼\ë\î\Z~©°E\ä°ÀE{®\0\Å\0uCN²HCH?…øúş5\Ê_øn\'%m>\Õ\ĞC©F‡\ç]\ß\ÌU™u;B¿(lö8¯4\åR\é7\ç\å\æ³.#˜s\Ø÷¯O–\î\'\ì+\ZuN\Ô\äóZ¨ÿ\0gü+7\êRZ\Æ}+„\Ô\âX\î\ä\Ğş$PF(\ÅK¶´(\ÅK¶´(\ÅK¶´kOµ7wp\Ä²\ß\îO\é]\Å\â\r\ØQ\íLğÕ\Èe»a÷ÿ\0u\Ğ}öüğ+bh‡&€9˜AÕ¹Ÿ\Ü\Éş\ãÿ\0\è&ª¬\\š²½õ~t\åØ£)\\=	›h<QŠ“mh<QŠ“m9Q‚¨\É$\0rz\n\0jFò¸DVvc€ª	$û]e¿„uY\Ô3,p\ÚFù¿\ï•\èz‘•,\\8ı\ãú°¾€wõ®\Âóó‚£½*\0ñ¿øB¯qÿ\06ùú?øU¼#ªD2¢\İ|É€¯s\ÏQ\ë\éY\í\"\Ğ\Ïr\é·Ğ±Gµœş\Ã\Ô*?±]ÿ\0Ï¼ÿ\0÷\íÿ\0Â½ü\Ì3Mó…\0|ÿ\0EKŠ1@QR\âŒPU›~ØŒSZø¬=Cùb€)\ÊtO¨—Z\'\æ‡ğşU›@RPE--\06––’€,$®?‹ó©şV\ä¯ü	j…81^Go\Ë\Ï\İ`~¼\Z±l¦7zú{T^b:ÿ\0µÖ¬)\Ü3@)qM‡-\Z“\éSb€#\Å©1F(<QŠ“b€#\Å©1F(<QŠ“b€#\Å©1F(<QŠ“b€#\Å©1F(<QŠ“b€#\Å©1F(<QŠ“b€#\Å©1F(<Trˆ\Ì{V1U®G\î\á@¡@I5±d0T{\Z‹\ĞU\ëE\Ë\è?\0^¢¥\Å \n²¸‰~_Z\åÜ–$õ¥}.\ç\Ø:/ó¬\Ã@\Ó\â}‡†›M \rJš\Âl3Bİ‰+şB$\éÒ›.cu•z© ¯b’\'Æ®;Š—(\ÅIŠ1@\âŒT˜£(\ÅIŠ1@\âŒT˜£(\ÅIŠ1@\ÑRbŒPtT˜£&(\Å\0GEIŠ1@\ÑRbŒPtT˜£=\ã9Fe> \â—b€:-B\é·o°\Ækl]3W5oC\âo\åWaf\èú\Ô\Ñ#¾x5WP»6KlÉ¼\Æ1O«+^9û?\Ñÿ\0¥\0P“Y†#T\ß\ï×Ò°Ø—b\ÌI\'’OSN\Å ñF*LQŠ\0b¤\Å ñW\ì,d\Ô.c‚?\â?3vEXı?VTg`ª3\0I=\0¯d\Ñt•\Ó-şl¤Á‘½={ş¦€.,Á\nC\ÂF¡T}?©\êk.d\à\ÖûŠÊ™h\0\'-L#x®Ö¨¤\\P›\ŞG\å\ÜJ¿\í>‡š§Š\é5x0\Ë(\ïòŸ\é\\ş(<QŠ“b€#\Ålh\Û£n[¢±n}@$~µ—Š’6h\İ]z©È l ô4\ávP‚w®\ÚğÌ¹Œ\ä\ã•\Ï#üúÕ±q!?6E\0u²^³ò\Î[\êj©œ·Cø\×6npi\ë;\á@¾`ú\Òy‹X™s\Îhù¿½@~±\0I\à\É5\ØZøRúx„ñÀOD|–Ç©\Û\Ó\éÖ»/C¶\Ó@|y³w‘‡O÷o¯Z\èh\ËOƒ\îû\\Aù?øS„/¿çµ¿ş?ÿ\0\Ä×ª\Ñ@Qÿ\0†¡ÿ\0=-ÿ\0\ï¦ÿ\0\âk”\×|={¦\Åö‰•\"v»FKl=·p0c\ë^‰¯x\Â\ÛJf··Qsp>÷?»Œú1Xt~&¼{Qñ§©\äOp\Ûü³_–?¦\Ñ\×ñ\Í\0b<¦\nsY•vó0\Æ3\Ï\åUXm$Pt´b’€Š( ®D ¼\Õ*³\à\ãÖ€/\Ã2B\Ï!\n£©$ô;\×H|-©¶\Óß£şÃ¾\è\ä\È\' ‚­x\ä\Zú“\ÃZÀÖ´È§\'÷©û¹Ç¤Š:ı|Â€<?şHùÿ\0ß¦ÿ\0\n-ö3—·½¼§ñâ¾\Í&h\ç\ãev?\å\Şqÿ\0l\ßü)¿d¹ÿ\0ß·ÿ\0\nú4P\Ï?gŸşyKÿ\0|7øS|©Gğ?ıòÂ¾ˆ¤ ¶?÷[ò4›O¡¯¢p=\åLa°@$0­\0|ñŠJô£\â\Û\'–o/N¸¸¶…¶½\ÔQ«&}qŒ\ãñ\é]=ö“©&ûf¶“\Õv uöd`~T\á\ÔW¬_kZ]…Ø¶¹±tÊ‹7‘‰‰\ÇO\âÀ\Ï\'\Ô?ùöƒşı§øP\ÏôW¾ÿ\0gXÿ\0Ï­¿ıû_ğ¦fiÿ\0ó\éoÿ\0~\×ü(Á¨\Å{¹\Òt\ãÿ\0.\ß£ş\Å\Ó?\ç\Î\Ëÿ\0¯@Š1^\áı‡¥ÿ\0Ï¤_¯ø\ÓNƒ¥ùuO\Íÿ\0øª\0ñQŠö³\áı(ÿ\0Ë°ÿ\0¾\äÿ\0â©Ÿği?ó\î\ï\äŸüU\0x¾(\Å{!ğÖ“\×\Êaÿ\0m_úš\Ç’\ám’\á\Zf;Ur\ÌO \ÆE\0y(\Å{ü\"\Úg÷fÿ\0¿‡ü+>-A¸‘¢Šè»©!‘\'B\Ãx\Æx\ï@_Š1^´|\'§~\àÀ\×ÿ\0‰®^úX²_\Ê\Î?‚\"²¶\à+øš\0\ãqU\î17ŸÎ¬\Ü\êš@\Ï\Ù\â½oC#Æ£ò\nÆ±[S?Â˜ú\Ğ<ŠÒ²\ç\áıkIW\Ù¨­õµ€\Ùÿ\0@–)­Â“\è\rsÉ­\ç¬­j\Ûj–q9/ud–õ4\ÎOŸ0Ÿ^j¶jıÌ¶\âV^H³ò1]§\í.N?:¤\Æ3÷O\ç@§*8ÿ\0,\ã_Î¬\ÆDcüŠ\0‘ \Ç\çN *:8ü\é¦\ás\ÆOÒ€7¬xF^ÀŒV–*¾’mnGö«xd\'‘32}m+ù‘]Àğ¾¢À2›vD™\èq@~(\Åu\ç\ÂúŸ÷a?ö\Ğ…7şSşy\Çÿ\0€9,QŠê†µQÿ\0,Tÿ\0\ÛDÿ\0\Zağ\æª?\å\ßÿ\0\"Gÿ\0\ÅP1Š1])ğöª?\åÙ¿\ï¤ÿ\0â©Ÿ\Ø:¯üú¿\æŸüU\0s¸£\Ğa\êŸó\é/\éş4Ã¢\êcş]&ÿ\0¾úô…Š1[?\Ù:üúOÿ\0|\Zoöeøÿ\0—Kûö\Ô‘Š1ZŸ\Ù×£ş]gÿ\0¿mşÏ±]ùwŸşı¿øPv(\Å^6—¬ß·ÿ\0\no\Ù\æÿ\0R\ß\rşOb­y2qÿ\0\ï“ş\ß-¿ºß‘ \nø£6\Ó\èh\Å\0CŠ1Sb’€\"\Å©h ±F\rKŠ\Ü\Ñlş\×z™$_¼¢ô‰\Å\0nQoodr¨3õ<ŸÖ±\ÎUúf»•\ŞI¬	cÁ #ƒYº\ÈÈ€ÿ\0¼?•i‘†R\Ô\Æ\èÿ\0u¿˜ Wb¦\Å qF*lQŠ\0‡b¦\Å \×\Âö\0³\Ş\È>\á\Ù½üMøÖ½urZ%\Ì`Š<€T¶~¹&¶L\Şôu˜U))h\ïU\Z\\\Ğ$.TfŸ÷=)\â€2/ D\ë\ê8ú•Á\à×¤9È®\áB\Í \Ş4Kb¦\Å qJ±\0I\è\0\É?…tš6Ú¤\Ä)\nc{\Ïû«\îJöK6\ÇOP-\àD8ûø\Ü\ç\êÇš\0ğV´»¶VH½	\ÈoË­kÁ¨†\07_~+\Ùnt\èn²H\Ã\ŞøirL|P\ZÎ¯\ïú\Ñs1·‡\Ì	»1\é\î}ªÓ®m\ÏN•NV•F5\0R:­\ÖxØ£\Ón\'ö¥ßª\ß«²¡=1ô¦\ì_z\0÷úJm \Íbë—c¥\İO±\á£1\n\áš\Ø\Íbk&\Ù\ìg†v\Ú%B£¶{=(\æÅ‰$’I\É\'©\'½%\\\ßd¯!]«\Ùş•T,\Ñ0e$2AS\È#¡\èS\ï\nŠ\á1†C]·ü&:£Ú½´ğYÏ½¯n¸aŒ\îM£p\ì\Ø\Ír¤~‘E>D(Ø¨\è\0¤§RPFph©\äg+~ò<÷_\åÿ\0Ö®»Áº\Ğ\Òu ’¶ ¹\Ärz+şƒ\ìkŒ\í5‹±¸\é\ÔP\×\ßmµÿ\0£ò?\áHo\ì\ÇY—õÿ\0\n\ãü-¯G©i‘‰R&E.Qr\Ø+ôş!\×\ÜV¾§«\Ùiğ\ïx!woõiµr\Çò\áGs@\Z§T°nbSMş\Õ\Óÿ\0\ç\îû\ìW…Ï¨Kq#H\Ø]\Ç;TmQ\ì\0\è*±˜ô\ïÿ\0\Úvş^\àÿ\0¿‹ş4ÿ\0\í#ÿ\0/P\ß\Åÿ\0\Zùû\Ì4\ï2€>¶‡¥\Ä÷ñ?Æ™3Y\İBğ\É,,’)VjŒƒ\Ôd6kÀ¼\Ïjw™@ñg…Œo&8\ÆN\Ğ\à\ç=I$’\ZÊ¹ğş‰vşcÁ¿v‰\Ìdÿ\0\ßx\ï™K\æš\0ö;ohÖ²	Rw†‘\ÚR¨\Ş\Ä~•\ÒdW\Ï>qõ4\ï´?÷›ó4ô-óèº“û\ïÿ\0}ñ§ı¶aÿ\0-dÿ\0¾\Ûüh\ß\è¯R¹R1,¤ö\ßükÖ¬4\×û<oss:\Ê\Ã,ª\Ùƒ’y¯½\0oQU…Œcş^g¥û\Zÿ\0\Ï\Ôß—ÿ\0^€,QUş\Çÿ\0Orş_ı•d~\×oÿ\0|ÿ\0õ\è—v©ym5¼…‚LŒŒW‚\Õ\Ã\ÚøV÷O\Â\Ù\êI\ZºZ\ÎÀ\Ï?­we—ş~\Ïıñÿ\0×£\ì³\Ï\àÿ\0¾(_\r\ß\Å3]G­]}¡\Æ\Ù\ãFB;p1Kc\áT·¿ş{¦h\É+²(\àLœòÁ:õük°û-\Çk´ÿ\0¾?úÔŸg»\ísıòÂ€<KÅ$º¹º–\Ê\İ\Ş!c\í8iXu\ÜG;{ù×›\×a\â­.]7U”;ûFgG\ÚÛ\Ì>ªÙ®Dœt\í\Ïó<Ph­A¥ß²\îKie_\ïD<\Ñÿ\0\ËUF¶¸O½\Ëõ\Çóšñ\ÍRz\Õe\ÍWh…\0SQVTS\ÂR„\' 4\0\Úg–	\íõ<?.j\à„÷\â¬K€ ‹y¶•o-ğ\Ş\à\íÁJ\0\Ä9?½úV‹.Áô<\Z` \nŸ\'r\Ç\è)ñ…\\{õ5h ¦•K»?ø÷D•WsMlHó!c÷£\Ï\İa\íÁ\ï\\¾\ÑRö\ÇÖ€>¾‚x\îah›rH¡Õ½A=yo‡<Ame¥[\ÛÌ²–M\à¥‰ZºøµûIˆ\n³{mş@˜ºŒMüøÿ\0^¤ût>’\ß4~’¨ıºVÿ\0¾Mn·şñÿ\0¾M\03R¹š\Î\Êy\à„\Ï$i¹#ù\á\Ïx®#IñW˜\ÌÚ•Õœ\0¯¬s$ˆùş\"À‚1\èk¼°ô?\áQ¼–2}õ‰\ÏûQƒüÖ€8ñ>©w©µ¦Ÿ•\Üd±I?|ªd\ìqƒlf·-u\Ëÿ\0\íh´\Û\ë8`iciâ”¸\à9^ø=ë¦[H\Æ\ËAş\Ê\íş@S¼\ÛRÁÉŒ°\à6\áô8\Í\0\\¢ ûD?ó\Ñ:_>ùè¿\0OIQyñ}:<è¿¾Ÿ˜ 	i0=G\çEÿ\0=şú\ãMó\áÿ\0±ÿ\0\ßkş4.\Åş\êşBšcşy§ıò?ÂKÿ\0–‰ÿ\0}/øÓ·¡ş4ÿ\0¾‡ø\Ğ<˜\ç”÷\Âÿ\0…Wš+8cy$Šˆ¬\ì|µ8U\'\îúUÜQùŠFD‘J°VVy \Ğ Ò®Ak}*\ê\é#|v‰´\ã\ëUÄš\"J±K¥\\\Æ\ìp­Sqú\äş\Ğ?„ô¦%£Y\í‰\ë\äO$cò\É\ëoi¶÷	sş‘<±\È\Ó\Ì\Òm#¡ \nVú—†\îeXL1Á+*Ona,{\0YqŸÆ·\Ú\Ş\Ş\ßrÁqn\Æ\íŠq\Ó5F\ã\Ãö\ßù¼\ée\ä&$aŒNÃŒ\ã¦kM¨e¬I—š\ée*õ \çNE$2K\ZN»£f†H\ã\ê0x«%w\0}*¬‹@oü#šIÿ\0—ü‰\'ÿ\0Mÿ\0„kJ?ò\Å\Çı´ñ­=6\ç\íV¨\Ç\ï/\Èÿ\0Qş=kR€9oøF4¯ù\ç\'ııjiğ¶–†aÿ\0møWWE\0r?ğŠi‡ş{ÿ\0\ß\ÏşÆ¦‹\Â:f\àO\ã\ĞÉ€ \ë]$r«Uõj\0\å\ï4kKHB\Û@#\îX$ırMs-‹÷\\ı\rzº°o”óYw:E´\çr\íÒ€<Ü´\àvªşd\İ\Óõ®ª\çB¹Aû¦\İø\çô\Ås³Y\ê1uˆŸ¥\0A\ç\Ë\Ç\Èiw9\çQ¾Ò¿z)G\æJ?å“š\0Ğ‹d’¬o4p\î\îçŠ˜øE\ß-ö\Å;¹Ï–y\Ï\Ñë•¸\âá¹ŒŒt­½GNa±\Ë\'xÛ•?\áõ¯ÿ\0t¿ó÷ıûoş*˜|?k¨¿ï†®ú\Æö;\èDˆ\nŒ§ªŸó\Ğ\Õú\0\å4ûc¤B¶\î\ÊÍ–}\Ã 6~½\ÇJ\Û[±V\äŠ9—lŠ{ÿ\0OJÆ›NdR\ÑM€ ²Œö‡?h¥†ky:HTú6ÿ\0Z‰\Ş 	Ş\ì\Íyzj[½¿\Z˜_û\Ğe(ë¹´‰ı*ˆ½\É\å¨7\\dh‹iñ“Ò™ı§\éWÄ“0\Î\Æÿ\0¾M.ùÿ\0¸ÿ\0÷\Éÿ\0\n\04½?Ä°O]\ê1K?<{DŒ\Ã\Ğ1E#>¹®Úp\'€:“\\ô·Wò{\0ÿ\0Y9ûˆ>¾¾ƒ© 	/u!ˆ C=\Ãp±¯8÷o§ÿ\0®¡]6H!š\î\å¼û±ŒƒªDÁN6ú°õ\íÚ¶l\ì \ÓĞˆşyıd\Í÷\ßü\Ğ\n´y \çVw/¸\ï$’\İ\Î{\Õ6\á8?5w\Ş\'\Óc\Óu@…a—çˆŸº3\ÕAö=¥rFôj\0\Ì7,: ıGõ«\ë/!»0\éZ_\êq˜£u1\ç;(¦QôóQñøb¨\\K$\í\æH1\ëµ1Ç¢ U€ 	dA\"ñ×±¬²1V\ã}‡Ú–hóó¯\ã@¨¢’€\nµ\í$z\ÕZp \r&E~G£•7\'¸\äQMF4¡şc\èO\ë@ô=Qô«¿0e‘Ô«®qŸCø\ZÚ¹»šöc,­’zz(ô\Õ\ÆL›[\Øò+z\Î_6>z¯€/S\Å   \êJp §QE\0QE\0QE\0QZ:}Œš\ÒAñ³qV?\ÓŞ€:i_h—í’¯\î\â?»£\É\ëô_\ç^­U\í\à\Ö\áˆmH\Ô(\Ôû¦¬PEPEPE%\0QE%\0pş2\ÒÎ£¦4±Œ\Íi™“Jÿ\0\Zş\\ş\ào\ÚÃ¿ZúÔ€x<ƒÁó^·¦ÿ\0ejwÀb2|\Ø\ë›òü\ä~€Û£ù£%Oª\åO\æ1SEy¢\ê\èu\é<£ÿ\0f¢¨\'®(Ñ‹sd±9\ä\ç9$÷\Í1Â¦>P:³PO÷GÖ€2Yº(ø©:úTi\ÄZ…ı(w’‡aõ®¢\ß\Æ^$¶‰\"\ë	\Z„Eò! *Œş¯°®sû;Pº‡u¥´³ªœÆ»Êœg•\\·\ãŒVK‹\Ës‰\"š3\è\Ê\Ëÿ\0¡@z«}«\Ì&»\Øò·zÄ‘–·lQ»‰¬ }¾µ[\íRû\Ñö¹(ï“¼ø¤\Û\îZ¨›‰­E½\Í\0k\îEÂ¿Î ’\ìtN}\ë<+¿©«Klq–!E\0tö÷[\âCÓ•\Øxfrº¤m‰\'şƒŠò\äŸkm^v\Ş›ı;>‘¿ô {\Íı\êx¼oZ\å’Bj\ê“@\0»c\éù\nx¸>‹ÿ\0|ğ¬e5ehO\Îÿ\0a?\ï•ÿ\0\nx‘\çœ÷\Âÿ\0…Q0 YŒÿ\0\Ë(¿\ï‘ş¿¹ÿ\01\ß#ü*O \í€ÿ\0\Ë¿\ï‘Mò\íÿ\0\çŒ•%-\0]±ÿ\0–\Ó|‹Où÷O\×üi\ÔPv³±~¶\ãğfÿ\0\Zñ­\\\Éiq\0\áUò>\ër¿¡¯n¯+ñ¶Ë¨.IP¡ÿ\0yøÒ€8¿=qª\ÔPŸ=‡sOR\âo\Ìÿ\0S¢€/ı²où\è\ãş\ß\ãZ6s{u,ƒ{rw7Ê£©\ë\ØW?]¯…™İ±¸FûyşT\éJQsµ\0Q““\êOzc5Vó*3-\0,œ\Öl‚¬´•MŞ€+\É­Xe¿*‰.–\î·B!)„K\Æq‘¸t\ãß¥v\â\Òùüÿ\0\Ç+Í‰*Á”á”‚¡+\Ğô\Ë\Ô\Ô-czŸ•\×û®¼0ş£Ú€,‹Yÿ\0\ç\éOüÿ\0­Oû-\Æ?\×\ÆşµZM˜ùH©\Å\0qÿ\0jû<ò@\ì7Fq‘Ó™­h\ï}ê†­¢ÿ\0hŸµZK\äÜƒŸ¹ ôa\\I½¹\Ó\ßË¿‚Kvşú‚ÑŸóš\0õ\Èn!|~ói÷\×5¤c «}+\Éá¿a˜\åI>‡Ÿ\ÄUñ,}¡4\è­!O½‘õ\éù\Óªz\à×œV\\`»ŸbOõ¤ş\Õ=\Í\0w\î nªµ$0vQ\\\ÕO÷©?´ş*\0Ú–\Ú/jÉ–(\ÆqƒU\á5VIØ‚O\Ê=O$Z€Ò¤\ÚXm+œ}pj\ßü%\ÑÏ¿şDüMaMdº•“<2fTbBô\Ãõ=A¯?,\ÊJ¶A û\Ğ¯ÿ\0\Â[üû·ıü_ğ¨n|MÅ¼±G«:0\r¹N3\Ôñ\í^O\æ\Z\ét»v’%=\Î\Åü94\0\È\ä;M]‰º\Ó%ó\Å:5\Ú\0lE\Õkr\rV\ÓO\Ê\Ì³`ª‰\ÏB\Üş\Ïk~ÕD_\ë@ÿ\0	6ÿ\0M¿\ïÿ\0\ÅQÿ\0	6ÿ\0M¿\ïÿ\0\ÅW‹\î4d\Ğ·¤7\Z±\Üå µÿ\0\Ç\åÿ\0wÿ\0Š\é\é]$PF\"…h½\0şd÷\'¹5\á\Ûú·üşÍÀ\áGöş­ÿ\0?’ÿ\0\ã¿üM\0{•%x€ñ­ÿ\0?oÿ\0|§ÿ\0Rj\ãş^ñ\Èÿ\0øš\0õ\ë\Ë[øŒW1$¨{0\Ï\å\é^wwğö\É\ÉkK™­¿\Ù?¼O\×õ¬\â}_ş{¯ıûÿ\0‰©Šuoù\ëÿ\0¶I@³xWıUÕ¼£\ßrŸ\äk•Õ´KG7¼	µØªlòq]øñ^ª?Šÿ\0l‡ø\×?\â\rfóU²\Ï\å‰T\Ús\Ó\×Ş€<î§öğz\Z¯E\0,\Ñ\ìn:•^´T‰\Æü*¸³@š°±Õ‘Zk¶\Ş;\ĞM…\ã½CKE\0Kşµ\n÷)¶’ù2CÁ¦‚T‚(x÷:‘Ào\Ğ\Ğ`\0<Óª÷‡ô\ç\ÕÌ$\Ñ\Ç$j\ÏÌ½	ô=~µ\×ÿ\0\Â{\Ú{sÿ\0}ÿ\0ñ4ÁÓ«·ÿ\0„?Pÿ\0¶\çş\ßüM4øCRşı¹ÿ\0·ÿ\0@]\Ø	jƒş}\Ïı´ÿ\0\ìi‡Âš¨şOıµ\á@•\Õj\ÃşYGÿ\0V™ÿ\0Î®?\å‚ÿ\0\ß\Èÿ\0øª\0\æ(®“ş½\\Ë·ş?ÿ\0Lÿ\0„{Wÿ\0ŸGÿ\0¾“ÿ\0Š z½Ÿ\Ã\ÚWöu®ù\ï\æŸı•ìŸ‡S\ï\\F•c\rğmQ’\Û\Ê\Ò9Ë±\è~\\ğ1Ÿ­z?öŞ–\åòû\ëÿ\0­@VP\Õô\Ó\Òò\ßşûñªi\ç¥İ¿ıü_ñ \r**€\ÔlOK«ûúŸ\ãR\ËC\Ò\âÿ\0müh\İ\\\\Û“B\í¢;Î‡şz\Çÿ\0}¯ø\Ğ\ÔT~b\ã_û\è;p=\Ç\ç@F)h \â¼\×\Çz›i\ròšÙ¶¹ÿ\0¦Rqú6?:ôÊ¥}h/­.-˜q4nŸ‰À\Ğ\Ë#©•Iø“ñ«2‰Àn\n–şªpZ«/\ß4¥U§şÆ¦C•Ú«\Í÷‡Ò€$_¸´YG\ãK\Ü_Æ¬\"*¾¿\Èõ õ¹’)¼Ø¥xœ6*\Ã\èTƒZŸ\Ûz³Jé‡£J\çÿ\0B\Í#\éŸ¸ÎŸ¨ª¤\Ê>\ìª~ Š\0†ygº`óJ$`1’FqøP‡r£ò©Î™t;¡üi¿\Ù\×^ß\03Ë„w&šZ%\è£ñ©³®O ©—)\ê\ÔT\Ü\à`UZGz\Ü],¤š¸–(½¨†\'8®÷\Ãpºh\Ïó˜ µw>·\İsq\íş­@dhE^QWş\ÏO\â€+%[ZpŠ¥h\08¦§€hQO¦ŠPE-%\0--%\0µ\Èx®\ß\Î\Ó€s«ş\å?Îº\ê«u\0¹¶šÿ\0-#tü\Ç­\0|ñE9”¡*x*H?QM Š+¹ğÎ‰ó«•\İ6\ÔN\Ò8\êOû+\é\Ü\Ğ\r†‹©sGgüô•?3\×ğ»û	\Íbv»]ûÈ¨vb\ÌsúW F¡@\0\0\0\0ú\n¹…t*z(\Ëş\Ñ\"|®¹\ÇqIö•nÿ\0Òº;ı*d%\Ğo_Ö¹yi\ÃF\Ãğ4\0­0õ¨„™<*±7ÿ\0®¢+ÿ\0õ\Ğö™Oz«\æŒuªÿ\0º^™ü\é‹\×\0{š\0l\Ó,q³“À™\ì?\Zo…µ_²^yEr@öY?„ş=\áX·—\æeŒt\ì\n£\' ym\ê:g\é\Ûğ ¥«j~gØ¤h“\Ìd\Ã\ìX/P=ñÒ°ô\rH\ßÙ¯™şº,G(õ#£ısõ\Íu±°4\ÄZ^¤\È$‰ò?U=Áˆô5¬n#•vO\ZÊ§¨`ó¨µ\Åq#\\\ÚJ\ÖW–dCÿ\0M#\è~£¹÷:­‡–m\"ùokû\Å>\í\ß_\È\Ğ\×\Z\Ğ\ï\è÷Z¿ª+&O\njPÿ\0Ç¥ú\È;+ñ\Í^‹T²›…ş\ëŒ?\à-ƒVÌ„ı\Ö\Èú\Ğ=†¿jq$Q¿\à9üg—\ÔS\ïÙƒô»––a\ïP´\Òv€8Ÿ´\Üw´\Ç\àÂµ\\ÏºÀÿ\0…u¬\ìO\Ü4\Âÿ\0–\0rÿ\0iº=¶ı4¾DórÛ¾­şÒ•²ŠÈ»¾··/½»\"ÿ\0Z\0­\Â\Å\Â\åù?…RÕ¬–\íM\Ì÷€fE\Æqş\Ğık!D÷w>i\Û\ĞA]¥¤`u 2‰\Zi4g`ª=I8¯^[U³·\çb\ã\ê\İ\Ï\çE…7¦û¦\íN\ÂC\Õ\Ç\á\ÛÖ´§\Í\0r³«1\æªF„f¶å©…\ëøPQğÆ¹\Í[ş>¿\à](f®sW™ª#@Ô´\ÌÑš\0ZZJ(i(¢€ŠJ(j—|N¾ªjjJ\0\â(®†M5Y‰V\Æy\ÅTm6AÑ”\ĞP89k\Îœ\Ò\Éi4@’¼ãš§@]\Ç¦ù99&Ÿ\àg¹©\è!\Z\Ô\í‹\è)\Õ•sIö\ĞTûT\nü§¡\è}\rk}’óş}.ÿ\0\ïÄ¿üM4\Ú\\‘ƒksÿ\0~%ÿ\0\âhÎ•¨I¦\ŞAtœa¸y§\ê3_PF\ë,i\"«¨e>¡†E|ı\á\ï\r\\jw\í\Ë\r¬x.Î¬\'ı3\\€yş#\ØW\ĞHŠŠ¨ *¨\n t\0ø\n\0}Q@%-\0”R\ÒPTo¯#°¶’\âNˆ8Ù»(÷&¯Wx“Uû}Ï“ı\Ä$\è\ïĞ·Ó²\Ğ9us%\äòO)\ËH\Ù>Ş€{Àª´Q@Q@	Š1KE\0QE\0\í\Ì?‰¿3M¢€$H:;ÿ\0\ßGüi\Ş|\ÃşZ\Ëÿ\0}·ø\Ô4P‘ur:O7ıüñ¤“R¼…¾\ÓqÀÿ\0¯ş5^¡™‘²§¥\0sHe\ÜXü\ÌÅ{“\Ô\çù\Ôer\Ï\çÿ\0Ö§Ê˜b>\é\î­9d’¥‹ËŒ‰ve™:\í?ò\Íú®‹E\08?– }\ï¥5Ô¹\Ü?.õL\ï\éó{u©„S·V#\êh\Úüƒ¯\×5\ÚLr#&©\î‘\éø÷¤\Ë\ÕØµkXXKq­²eÜÓ…\Øú\0;š\0÷\ÛMG¼µ‚²…óbGÀ’N7(8ûİªs\á ÿ\0\ËIdÿ\0\â«r\Î\İl\í`·RH†5Œ\ßh\Æ\Z·@¯ü\"ºOüò\ÛWÿ\0\Zağ¦“ıÉ‡ıµ?\á]e <øKKÿ\0§ÿ\0m?û\ZŒøCMşıÀÿ\0¯ÿ\0]¥%\0q?ğ‡\é\ßó\Ö\çşú_ş&›ÿ\0uü÷¸ÿ\0\Ç?øš\î( ş\ËN\×3ÿ\0\ß)şNh\Ó\ÂEd‡7F\ç*DŸ&Ğ˜9G|×¤×šø\Ğóf=¥?ú\r\0Eÿ\0	‹ÿ\0Ï’\ß\Ãÿ\0\Ä\ÓÇŒ}l‡\á/ÿ\0a^uK@’<c{&ÿ\0¿£ÿ\0ˆ©Œ ÿ\0Ÿ9?\ï\âÿ\0…y•\éÿ\0ğ˜\Ûw´˜À’<cg\Ş\Úqø§ø×–Q@°<ccÿ\0<.?ñ\Ïş*¤0Ó¿\ç\Ïıò¿üUy-\0z\ïü%úo÷nü\0ñU ñf•\ë?ıûÿ\0\ì«Ç¨ d*\ÒOñ\Ê?\í“Tƒ\Å\ZGüõ\Û\'ÿ\0\nñz(\Úÿ\0\á&\Ñ\Ïü¼û÷\'ÿ\0R\éóô?\ï‰?øšñ\n(ª»\Òno®g¸°ˆ\Ü[\É#2:<‘† Œöª_\Ø:·üù\Ëÿ\0ÿ\0v¸\İÍ¹şY\è\Ãõ½\à\Øz¨ÿ\0—)ÿ\0\ïŸş½zn‰º\Ò\Æ]Ln¹Ş­\ÃNy®\Ãmrš\ã‹F†ã¯ò;vøs\é\éš\0\é\ÒPj\Èz\âa½q[0\ê~ò«\èh¨Y7\n¯-µ¼\ßy@>£ƒúUh\î\ì\äş#÷<~}*6÷gŒû?\0s÷µ—%x¬	¼0\Ã\îHk·k•C‚G\àA˜¦}ª?Z\0ó‡ğ\í\Êÿ\0\ËFª\çA˜}\ç5\éMuP’xÏ¥\0y\ØÑ‚œ¶OÖúX8®¾IS°¬™¤­\0g\Ù].•q¹ù8o÷	û\ßğ\Èö\Íz\Ôgø‡ ô=ˆ¯,±g¼@P2.K†\0©\ès\ÇZ«\âyc2\Ëoq4p\ÉÀEv÷@\Î\0#(ÙƒT›«\æ¿\íHt¼¹ÿ\0¿ş52\ëÚ²ÿ\0\Ë\íÁú¹ ~ºÓ¬/‡úE´{²\rßŸ_Ö¹\Ù<#¥±\Ì-sj\é”\îıòÛ…yHñ«ÿ\0?³ş`ÿ\0J”xVÿ\0Ÿ\Ù?ñ\ßş&€=\rü)r¿\êuiÇ´±£ş£©·†õ\Õûš³ÿ\0½Èš\ãG‰µ‘ÿ\0/Œ\à1ÿ\0ñ5 ñN´?\å\ë?X\ãÿ\0\âh¤oøş~m\ÑZ£>ñ}ë¸‡û«XcÅš\Èÿ\0–\éÿ\0~£ÿ\0\nx¿Xò\Ö#ÿ\0l–€5¿\á¾“ı}Ü\ì8şµv\Ã,}kÿ\0„\ÇWşôş\Ùñ¥>2\Õq\Ò\Üÿ\0\Û3ÿ\0\ÅPm‰]\n·ö$OA\\E‰µ‹û„‚(­‰n¤£aW»› ¯@g-\Ë\ãğ\ÉúPI:`t¬\Ù5¤\ÕU\Å\0aÊ•IW\ïVÄ«T\0ùˆ \Â>f¬\rY2ˆÿ\0\İ$~u\Óùš¨\\B&C \ãœgõÇµ\0p˜£\è\ßğ…\È@\"ö2#÷Mÿ\0\ÅRÿ\0\Â/üşGÿ\0~›ÿ\0Š 9¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢‘˜(\É SY3jxŒg\Üÿ\0…\0nEm-\ãy1.öpF;t\êO@rkˆTùö\Ä\çğ§=\İÄ„\ì3×œ}D—$\0s\ë@\Z4Višc\è)dŞ¿Ê€5j¿š±““\ÎsÒ©y“æ£³œ\ã´\ë0|D¼P¡­\í\Û\0ùh§}\ÇùV\í¿\ÄKfÀ\Õ\Ó\Ô\Ç oÑ•xi\Şe\0}Uc\â\Zü…\éQ\Ï&ı\Û¦~Sø\Z\êk\ã\0\à\×k¡x²ûGuFf¸¶\È\İœ•ôÍ*}ºP\ÓTU+\Ø5h®m\Û|r©\î=Aˆ<Wh\0¢Š(\0¢Š§{w¼—Ÿ•qİe\ä\Ğ1\âm[\ìvÿ\0f‰¿}09\ÇT¡?V\è?\Zò\Z·yu-\íÄ“\Êr\Îs\ìeÀUJ\0(¢Š\0(¢Š\0(¥¢€–Š(\0¢ŠJ\0Z)( ¨¤‘#cŠ’¹«™L²AÀ±«\ßC~¶©+\Ù\â\Ø_ ¼¤ó—Àó\Î+™>oR3Šq®jw1y°\ËbA]Ê¢ö\r\ï\ìÙ±@±‘°	Lş\'úS÷J\İMyc§·´y<e‘\Ç<fÚuıh@’	\Æ=+ª\ĞüC\'‡^LG\É6\Ó\"±\"L.~\ãzŠ\ã\Í\Ù\ìµMÜ¹É ¬t]~\Ã]„\Éj\çrcÌ‰ø’<ú\ãÑ‡\ĞW\É\Z\ì\Úv©k4LW÷Š®Fˆ¤w¯­\è(§Q@Q@\r¢–’€¼¿\Ægı\"\ĞzF\çóoşµzyGŒOúl\Ò\æ\æ€8ZZ( Š( ¥¢Š\0(¢Š\0(¢Š\0(¢Š\0(¥¢€:¯\Üy\Z¬@œ	ƒD~§•ıE{€ól˜&U\ë«ø	\Í}\'¬¨’/GUaô#4)BQ±\×işU‰û›¸š”20ÁºT¯?yš\ÚòKYşG\Éh›´¨z÷ ~óC\Ôt\Â^Å¾\Õ_)¹eúwü«.=b%;fYmœu	_\ÌQ^‘\Ë%,\Ñ\é\×Ë¶\ê\İı 0\Ô\Æ\Çx’££ÿ\0ºÔ­r\ã³U\Ùü¦\ÎKZ\İO¡=?‘¬y</¬Áş¢\ée‚@F\æ€&7\î=G\áIı {±¬\'ƒ[„\á€l{-@d\Ô×¬#şùÿ\0\ë\ĞFu©¦ı±\ß\îƒú\×;ö‹\ïù\äüÓ¼\ë\ãş\Ï\ÑE\0o³\Î{\Õ\'UûÏ¸ú/õ5•²\æ_¼d\åV\É\Èùğ£Ò€5´\Ûı’¸8\nÃb=ı\ëz\íc¿¶’?x|§û¬:\Z\àn\ä[@z“úw5³gvXh‡}\Ñ\Èñ\È6²¤{Š+£×­7\ì»A\×/ş\Ê\ß\Ğş\ÌŠ\0––˜\Z‘@\âM\âÇ­\0:M (õ\Ô\Ò\Õ=®\Ósşbg\éš\0õ]N6\Ø~ö`\Ïu^\Ëş>õ\Ñ\ÍSór¼S|\Ê\0²MB\Ô\Íõz\0‚AY\Î0sWİª›|\Ç¯&¨Èµ¢\ç\rU$ ŸL¾ìª²°\r)õ¡ü+Sí¶¿ó\ĞW›‘\Í&=\Í\0@|}\Ú{sÿ\0}ÿ\0ñ4\Ã\á\rCşzÛŸøñ5\ë4P‘Ÿ\ê_Ş·ÿ\0¾\Ïÿ\0Q	ê¾ûiÿ\0\Ø×°\Ñ@6|+«\àˆÿ\0\ÛU¨Ï…õqÿ\0,Pÿ\0\ÛTÿ\0\ZöŠJ\0ñS\á­XË¾~’Gÿ\0\ÅU+­P²…\ç‘ \Ë6ô\ãòj÷l×˜øú\á\Ò\Ê\Ú8H\Ìşû\0\Ç\êh\Æ\ç¸i›\ÑGATÈ§Q@\í£mII@JºiŠ0LEÿ\0ˆ‘tŸ\İ\ëùYW+°òŠvşŒU?•CI@`\Òb¥\Å7QL(*zm\0V1\Ò`Š³‚\İjO!û\â€=‹\á\Í\ä„]Y’J… ô9\Ú\Øúñ^Ëƒ_+iRµ¼’\åd}¡~F*qõ«¥\Z•ğ\éuqÿ\0_üh\èLRW€\r[Pòùqÿ\0üi\ãY\Ô\ÇKËû\ì\Ğ¾Wø›Vûm\Ç\Ù\â?¹€‘‘\Ñ\ä\èO\ĞtixzmKP™{©\Ú\Ş>Kq#÷>\ÍuŸØšAÿ\0—8¿ñ\ïñ ¢½³ûG?òèŸƒ?ÿ\0M>\Ñ\Ïü»~O\'ÿ\0@+E{1ğŞ\åƒ\ß\É?øªağÆå”ƒşÚµ\0x\å-{	ğ®”†aÿ\0møTg\ÂZa\ïp?\í ÿ\0\âh\ÈikÖ¿\áÓ¿\ç¥Àÿ\0/ÿ\0M>°ÿ\0\×ñOş&€<ŠõS\à\ë>\×ğOğ¨Ïƒm»]Mÿ\0|%\0ym\é\ßğ†C\Ú\îOûö¿üUF|¯ñˆñt\æ´W£ÿ\0\Â{^ûõÿ\0\Ù\Ó‚\å\íxŸ÷\ìÿ\0ñT\æ“\Ì!M\ÇğÌ³«“­v\'Ñ¦\Ò^\Ü4‹*È®AU ¤dsõ®\Ğ?\Ôt4¥e%œrÿ\0¦A-\ÄDs\ä\Ë\åÈ¾\êJ°?Ft÷6>™Z\ê—V®G)slò\ìZ%Ç¨\İ\\\0i£\èCÖ“\Ï`~eü\Å\0h]Á»…†\æ;¥#;\ãIz*©\Ï~2*3HgŒö#\éğ©\ØŒşŸ\ĞP|—o\á5*\ÚóóÀTj|\äf¢i%n§ ¯*\Û\ã\Ê\á\Æ#±}«\èoø\ë¶\Í\ã6\ày„t•Oñ\Øÿ\0xz\×\Í*ŒÇŒšô\ßM¨K-Ä«4,§99;”¨\àzš\0úŠ\Â\Zş’\åò/üx\ì´ñ­\éGş_ ÿ\0¾¿ú\ÔµEdcL=/-ÿ\0\ï±O\Z¦\å\î\ßşş/ø\ĞDj\'ş^­ÿ\0\ï\êIö\ËC\Ò\âÿ\0müh\Íy‹\Îu$\'\êZ½[\í\ç¤\ÑûhŸ\ã^K\â\Ò\êl\È¨Š1¹Aa\Ğ÷\ÈQO(\ãøşù?\áMÁô4\0”QE\0RR\Ğ\ÑIšZ\0(¤¥ Š( ¢’–€\n÷o\İ}§Jƒ\'&<\Ä\àüw\á5\é\n¹ÿ\0«cşÌ«ÿ\0 ·ô WF\æ«\ê\Zm®§•:gº¸\á\Ğú«A¤­«PO§k:^v\í8La.T{ü\ê¤z½¤‡c¹·“¡u1°>Ÿ7ğ5\êaª­Í•\êí¸‚)‡ûj	üú\Ğ\r»pÊ°>\à\æ¢g”V¤\Ş\r\Ó›w¹³?ô\ÆV\Ûÿ\0|¶Ee¿…58ÿ\0\ã\ßV,;	£õY¤—Ò .\İÁüªG\Ñ<M\İ{)¿5ª/a\â…ÿ\0—[f÷ÿ\0× ’?¸\Ô\Ò	\è€}j«Xø˜ÿ\0Ë¼ø\çú\Ô_\Ù\"“\ï<Qı?É \Ç\å°•b\İjPE§\ÍnŸ‰\éW—Â·ó¯¸föÿ\0?¥kA\á8\â\ÆAc\ï@lcò]\ì	\Ï\è=«¯³²u»Hôt¢Š\Ğ[ ½¨›û’&\ÆU\Æ\Ö\Õå·–ogq$/ü\'ƒı\å=\â+\Şş\Ï\í\\—‰4¯>\Û\í(¿<{Z?ş\Äóô\Í\0y74\áSm¤\Û@§\n\\QŠ\0p¦Ÿ˜€9>ƒ©¥\Îz¿†4X\í\âKÉ”4\Ò\rÑ†)\è@şñõ\í@ÆŸ\á=Bô—¨¿Ë‘ìƒ§üŠ\í\í|§Çƒ+\Í1ı\íƒò^Z\íÖ­#Pœ\\¬–3<C\ç@x=ñQ‹”nøö5\Ô\ê:{1inMq\Ò\ÂQŠ\0»\æTM-g\ìeû­Q7›\ÛxÉšpp¹¬‚Ó\á\Ó,ä–€.\Ìı\rBÍš¬K·QP;ùjY\Û\0zu 4¸ªv\Úõœ\í{Q!\ÜN\â\Ä\äj\ßü$–ó\ä¿÷\Ùÿ\0\âh\Ói)i(\0¢’’€›š)ÊŠYˆUQ’O\0\Ü\ĞI\"Ä¬\îÁUFY\0^#\âmWûY\×b\âwl\Èù›=Xş\\J\Ò\×u\Æ\Ô\\\Ã	+n§\èe#ø· ük‰¸b‘1J\0\ç6^œŠ‡4ß´<GWùRù\É\'a@\î…/\ã\Ş\Ïw§N.]^÷Rc%?\İn=\rn·†ü\"~\ïˆÀúùGú\nòŠÃ†/Ş«@˜\Şğ¨ÿ\0™–?ûô§ù5pz‚\é\ÑJR\Æ[‹…S6TX\Ã{ª[\ì\n\ÏòÚ°xş_u7š¼UM«úÿ\0:ŠI\Ü1\í@ˆœõÀúÔ¢r\Ø\íTüĞ½É¤k–\è8úPUGeJ[\Éù\Õ\"\Ì\İM9#f\è3@[Hc“~~µ\Ó-ÀnõÌ²ù@\ç\éO†S\Ó4\Õy™«V\ÑIu2C,\çOR}€¬(\Ü×©x~\Ç\ìñy\î?y(\ãı”ôú¦€;;$\Ê\İ \î \ëİv?Z\Ğ\ÖZš´´xIOU…L¢€\'\rR5©\0Ii\à\Ó)\â€š}4R\Ğ¨¤¢€ŠJZ\0(¢Š\0\á|h!}1c`(ò[º>fúcƒõ¯\0–F!—˜\èkÖ¼WwöC\É+n¡\àm\ËA\\i†\ë@\é\Úô–1¬W\Z„#€³Dh‚P7\ß[«B\ãXğµ\Úü\Ú°7smu·ô)·ÿ\0®~ò\ÑU,µ`oecz\0·zlšl\Ù\Ç<q`|³²;†\ïó \0N3T\ÄdôJq“UO\çRyŒr8\03\Ènø\'‹\É9úqML¹\äÿ\0Z×´]œ0n1š\0¯&N`zö­¸b.\Ñ\Ïr}MKÒ–€\n(¢€\n(¢€–Š(\0¯jğ\Â\ãHƒ\Ü\Èñó^+^\ã\á\á\"\Óı\Ö?›µ\0t‚›\å§÷Wò\áO¥ ¼˜ü³şù_ğ¦ks\Ö¿\ï\Ú…X¢€*+C\Ö\Şÿ\0l\Óü*/\ì\ëÿ\0.¶ÿ\0÷\é?Â´( \ã¥\é\çş]-ÿ\0\ï\Úÿ\0…Ft}1º\Ù\Ûÿ\0\ßµ¨ S¡\éGş\\ ÿ\0¾úô\Ï\ì\r\'ş|\âÿ\0Ç¿øªİ¢€9\ã\á\İ ÿ\0Ë¢\ßOÿ\0\ÅS†´ƒÿ\0.\ßùOş*ºZ(–>\Ò?\çƒ\ß\Ù?Æ™ÿ\0®åœ£şÚµut´\Èÿ\0\Â\'¤ÿ\0vqÿ\0mOøTo£A¢C=í‰“ÎŠ&!dm\èWø\0Ó‘\Ívt\×A\"27!”©úŠ\0òtñ–£‘˜­ü¿øª´<g~:Ál\ï¿ş*¸+ˆš\Şib<İÿ\0ÀN)ªİ\0z\"ø\Úğu¶·?‹\ëS\\w´‡şûğ¯8¤ L7—ş|\ãü%oş&¥8nöCğ›ÿ\0°¯.¢€=Tx\äw²o\ÂQÿ\0\ÄSÿ\0\á9‹ş|\äÿ\0¿‹ÿ\0\Ä×“óFM\0z\ßü\'ı\í&ÿ\0¾’œ<ofz\Ú\Ü\Åõ¯\"\æŠ\0ö\ã]?şx\\~Iÿ\0\ÅS¿\á3\ÓOü³¹ğÿ\0\â«\Çi	\Å\0zÿ\0ü&\ZWu¸ö\ÌñT\ïøK4ƒüSûdÆ¼^Š\0ö¯øJtsÿ\0-%Xš¤_h­Á˜\àğAŠNAÿ\0€×ˆ\Ñ@{h²\Ş\Ë3\é \\[‡;[!\nç¥\\«q\Ó8\æ£>\Õ\Çüº7ıõÿ\0SxwSşÎ½P\çÍ„“\Ğuÿ\0\×\Ø×·Pƒj\ãş\\\åÿ\0\ÇOş\ÍQUş<§ÿ\0¾úõï¸¦‘@>\rRŞ»\ì\î\äg\ä=3\Í{]«®\Å\Æ\0¯ık‰’u¶»–ğ­Ç¨¥\0v`Ô¡«œŠ\ëŞµb™_À}heT\î, ¸*4ğ²@\Ï\Ğæ¿A_­\0r·:!\0˜Á\î·ş\Ê\Ùşb¹9í¯¡<¦kÖ·\Ócı\à\r\0x«O2}\è\ØUf½ö`~•\ìr\Ù[I\ÕfI£\Û7ğŠ\0ò£v]ÕŸqp\Ò\rŠ§Î½VMşY\ï¥\ÆvŠ\0òŸ²\È\Ü\í£\ìrv½4\Ø(\íIö\é@µ%-\0\Ú)\ÔÓ€	\'\0rI\à@bb\0\0’O\0\Ü×’k\Ú\é¿conH·S\É\ï)\Ïû>ƒ¿Z—\Ä\Z\é½cmn\Ä@§\æaÿ\0-Hÿ\0\Ù==kŠ ª÷\0˜9\Ç8õÿ\0\"¬\ÒP$\è1«\ëş5E ‘\Åi]+\ÛJOğ±\È=¾†ª\ï\r\Ï\é@‚\Ê\î\åü»x\ä™ğ[bÍÔ€9?…,–\×ö\ä‰mçŒ»\ãuş`T\ÊJ°d“i ‚Tƒ\ê­\ímcşĞ»#ş¾ÿ\06 g|\Ãûß­4\É\'¿\ë]\ß\ê÷®®\ë!?Ö¨H³\Î\å\åb\Ìz³¶O\ç@{“\æ­O!VşT%G@O\âh0!=‰«+l\ç¯\Ëõ§ù›xŠa±Ö€,ˆc\ïızSp8J¤XµH‘;v \É,rj\Ô1µf;S\Ô\ÖÅ­“\Ï*Dƒ,\çü~ƒ½\0ihzq»œ3\İÇ‚\Ú=—ük\×b]£Z\Ê\Â;($tr¼{š\ÕU  ö«*)€U@¦˜*a@4T‚€)µ  ¥¤¥ ¢’–€’ŠJ\0*\ç[hd™¾\ìh\Îšš¸¿]ù6+\0?4\ïƒş\âò\\\n\0ò™¥i\å’W\å¤fcõ\'5%F÷˜\ÇûÂ¹\Â>ñúÿ\0:\é.ş\àúÿ\0J\çG\Ü© \n\ì0¿QR \Ï\åM~\í\Z’„ı(T#\İ­j\Ù¬÷EgÂŸb+_L‚[›¤†.ò\rª£¹ÿ\0=M\0hÖ´\ZF¡rGm&\ÓüM„›b½cJğ¤z|bYOqŒœò©\ì€ñŸs\Ím09Á “BÔ¢0gı\ÖV?5Œ\èÑ±WR¤u`şµ\ïk\Ô4ø®¬‹ôo\âS\ì¥\0yj\ê\Ù\ífhŸ¨\è{\ëUh\0¢Š(\0¯x\Ğ\Æ\İ*\Ì\Ó!ú\ä×ƒ×¿\éCnf?\é„ú\r\0jQE\0R\ÑE\0QE\0QE\0QE\0QE\0QE\0--6–€<_\Å6\ŞF©#ceY×£~¢¹Jõ[\î‚\Ú\à¸\íf¨¯- 	Pš›Š…*J\0\\Rb’Š\0ZJ\\Ñš\0JZJct \Ü*2sM¢€Š( Š)û\r\0K^\Ñ\áS\íö~Sœ\Ío…oVO\áo\èk\ÅkcI\ÔL½q÷~\ìƒû\Èzş]G¸  \éUsQ£¬ˆ®‡r¸\î\È5e(•Áò\Ş1\ë“\\¶»¤Kx¢\ê\Ğ\âx\ÇN\Î=\ï[ú¼‹\nB\íÀ/³w¦\á\Æ\Z«\Ë!\ë@gk«m*qöy”\à«ğ§\èOò5\Ó\Çwø*\Ú\Ôt?Y_\ß Y;H¼\ÇÖ¸+Z\Òr\Ö\ïö˜z\í?7N£ğ4\ÛÃ¨I\İn=:ÊµWYR0ñƒø\à~D\ZòTÖ„gm\Ì2@Ã©0ş†µ\ã\Ô!Ÿı\\Ñ·±8?‘Á DşĞ¶n\Ó\é‚?,\ÔbøzŠ\àÌ®;~F£ûTƒ¨j\0ô?¶¯µ0\ŞZó\ï·ı\êS\Ç \é®P\ÕG¹^\Õ\È\rB£7I\Ó?­\0t\í?4Ò¹RóÖ“tŞ¿Ê€=:Šó\ã;ö°ÿ\0\ßoO3—ş|\ãü$oş&€=,œrx¯*ñ¿ö¢Ö¶­ûq#ùj}ûõ®\ÎX/µ{Wa§ùœ²\0drƒ®\Ü÷\Í\Â{^ûõÿ\0\Ù\Ğ›\Ñ^Š|/k\Èÿ\0\ï\ÛñT\ÏøC.{]Cÿ\0|=\0yõŞŸ\Şv¸·?ƒ\éQŸ_“[Ÿ\Åÿ\0øš\0\à5‘pÀ\ïX“i*y‰Šû•\ê§\Â\Z—÷\í\Ïü\r¿øšŒøKTóÀÿ\0\ÛOşÆ€<q¬n\ãş\ßCUŠ\\/X\Ø~\ì\çÂš·÷!?ö\Ô…F|+«\Ï\ÏıµOñ \İ\'÷[ò4›¤?\Â#^\Â|-ªÿ\0Ï¨?I#ÿ\0\âª\áPË›~\rÿ\0Ù¨\É1)şü<A;	¯U>\Õü¹Iÿ\0ÿ\0ñT\Ã\áıM\å\Êoû\ä\äh\Ì\Ö\Æc×Š´šq\îk¾:.¢?\å\Ê\ãşıšiÒµÿ\0.—÷\í¿Â€9±U\íW\İGj\Ş:u\è\ëkp?\í“ÿ\0…Fl®‡[y\Çı³ğ €W§øwG0Eö™W÷’\áOño\åXZ“ö»°n—Xvòo=”n\ÆA\ï\í^Áˆû2~Pg“NV˜Eõ?e\0fùtğ†¯ˆ\èòı¨ Z“ceM\0EŠx§\í§m S\éqK@Q@EPEP^/\âkÏµjN \å`Púõo×Â½rò\åm-¦¿\åš3~8\à~\'ó\ë9vgnK\Äû““@¢Š(•\ß\İ_¯ô®}~\ãş5»x~\çüùV\"«oÆ€!”~\é)\Ğı\Æü(“ıR\Ñ\Üo¥\0Y_õb»\ßM:õ¹€\Z9ÙŠd\"+Oõoh2yz¥“ù\êıôş´õ\È9\äUY\í\Ö^G\r\ë\ëõ®Z©\"ûŒG·oÊ¶b\ÔÁ\âEüWü\r\0Ud*p\Ã«¼[…n»Áp¼:\î\íÓš¤¨X\â€<\ï[Ò\Ì[~ñ9_ö‡q^bx8<W¾\Ë.\é<¸€sœn\íVFŸ\n©{„¶ü\ÌÌŠBú`c­\0xM®›{zq\ãû\ØÚ£ş\Øµÿ\0\Å\è4–\ê}7“ü—\Ş]j[‰Hø±GnI4\Å\Ü\è÷¶\à’‚E\ã;¿O½úW·X¶v\Ã\Òÿ\0ô^vÒ•ş*\İ\Ó5b°\Ì\ÙSÂ·÷Oø*\0\íh¢Š\0(¢Š\0(¢Š\0(¤\ÍS–p´h¸Y®Uk3Ì–v\Âÿ\0!õ5q-Uys¼ÿ\0\ã´\0¢ğ“\Â\îúf­,\Ùû\Ê\ËùT\r\" ÀÀª/q@>jxS\ÃĞƒ\\»Nj?8ölP]Es‘j/\Æñ\ëŞ·b•&]\Èr?—Ö€2u\Ëoµi—1÷]~©óJğzúL€ÀƒĞŒÆ¾x½€\Ú\İ\Ï	ÿ\0–r:ş\0ñúP@pj\×Z©S\Æ{P©1O¤ \ÑKI@	Q1\Í9G@Q@Q@\'Z– 0!½¨\0¥¥\Å%\0zÏ„5O6&±ü\Ñ\r\Ñgºg•ÿ\0€Ÿ\Ğ×£\nù²\Î\êK+ˆ®#8h\Ø7\ÔwØ+\è;[\È\ï-\ã#•‘CoP}Á\à\Ğ»»X¯­\ä‚Q•`úB=\Åy³\Íq£J-¯òc\'\İc\äq\Ø9şµ\ê\ÜS\'·†\ê&Šh\ÖDn\n°\È4\Ç$¼§ ò9\È?hE{$}øô<ŠÃ¸ğ\Õİ‰/¤\Î6u6“’Sş\0ıV±[WkFòõY¬›û\ÄˆıGJ\0\í\æ]2üb\æ\Ï÷±ş\×/u\á\r.š	ü£\Øş½O\r\Ü˜eAş\ËR–n\Ç\È\Ï\á}FÓ˜nw\Û_\æk-­µ¸:\åÿ\0j\ïLò\n…®Oq@¹\Ô\Ó\ïBü\0\Ó~\ßy\Şüš»–™[©YŒG¸ ?\í\×GşY¨ü\ri»o\â\ÛôZ\ê™aô\ÍBg„•\0s›enO˜\Şü\Ñ\å\É\é\'\ë]6 £\ĞP›W§øw\ÃşV\ÛË´ùú\Åşö\Øzú\Õ‡|?——i\ÏXba\Ó\Ñ\Ü\è#ñ5\èô\0R\ÒR\ĞE%&hh¤¥ ¢’Š\0ZJ( ’ŠJ\0u”Pš9¢’€ ¸¸\ÚšVÚˆ¥˜ı?©\è*zò¯\ê\Ş|¿b‰¿wÌ¤ƒø~‹ü\è”Ô¯\ä\Ônw\ï\Â/÷t_ñ÷¬\ìš( aüMùšw(ÿ\0–’\ßMş5%\0X7¤Òûhÿ\0\ãRÛ±\Ò\âqÿ\0müj 5\á\Ò\ê\ãşş?ø\ÓÆ«¨——÷ñ«2Š\0\×\ZÎ¦?\åò\ãşû©F»ªù|›óúV¾<A«ù{“òOş&¤#\Õ\Çü¼“õHÿ\0øš\ç( ˜x›Wò\İO\Ö8ÿ\0øšx§Vò\Ö3ÿ\0l–¹Z(®+\ÕGñB\íÿ\0\Z”x»SE¹ÿ\0¶gÿ\0Š®2Š\0í‡Œ5ñÛŸøñTñ\ã\îğ[Ÿû\ïÿ\0Š®\ZŠ\0õ+;‹[\ÏÁm\âR™h²Y›9\Ûó\äc¹¦ÿ\0\Âoÿ\0?s\ß	[\Ş³û›#\r\'\ï_\êıà¸®Š€<ğø2.×’ßµÿ\0\âª#\àÁ\Úóÿ\0!öu\èôP\Ï^$\Òÿ\0²g†/;\Î-¿\İÛq\êkŠ\êwş4¹jò¨\éIü–o\Ô\â¼ùrÀ\Ğ@¹z\nlG¨õ ®AÀ\è9©!CòœqŠ\0˜0\nG½Zµ“Êš?¹\"7\äÂ©ñ\É=\é\àğhè¥›<úÕ¤–¹m*\è]XÁ\'\ÊNÀ­şòğk_ù\Í\0tK’-\Åó.b‚\Ø÷\Çp>µ“›O9ªpË¾\äg±şT\ÙA\äÚ¯,«’}\\ÿ\0E¬\rWR2‘lv/Sıö\î\ÇúTWW[#\Îz\×+\æ\îbOz\0¿\Zzw­ø49\ç]Í„û\ß\áRhP\ÆÅ¦qœp™\è=O\×Ò»C0 ?º\Ğ\çŒe\Ë\ì:şµ\È\ÜG4-ƒ§®\å#ùÿ\0JöV“5]\Õ\\a€#\Ğóü\è#K¿I\ì\âi$Ep60fPr¼g“\ÜV·ÿ\0–‘ÿ\0\ßKş5…u¡i·\\¼\n÷”?§¥sSøF\Ø\çÉ¹–?gP\ãóM\0z(u=O\â)\Õ\åğ‰\\+\à\İ\Ä¨W\İùtık¨°Ò­¬9R\Ò\É\ŞG9?ğ\ÑŸ½\0u¥”w¥Pd8_ş°÷5J0d`ƒ©«W³¥¬~J™¾ù\ïşOò \nW3ª!\Î;úı*œ05Á\Ü\Ùü\é°Dfl·A\×ü+¦%Hü\ÇU-\0P\ÂÄ ´v¬ùn1Iut]‰ü‡ ô®z{¾\æ€.K?©¬\ç¹=ªrÇ´P†F=\é»\ÛÖ©³\î>•O­\0iy¤U\ËkÇ÷/\â;0¬=\ì)\âJ\0õ\'KˆÄˆx?˜>†¼“Å–\ŞN¥\æ\Äñ«À—\å?\ÈVÀ\Ô.\ì\"‘­ö1\êUÁ \ã\ÓsŠ§kr<Qt–÷ Gå£´m\ÊI\ã \î\İ\Æ9 \nœ§½\\ø6Ç´÷ø\çÿ\0Qÿ\0\Âk\Ú\êû\å(\Íi+\ÓÏƒ ÿ\0Ÿ¹\ï\Úÿ\0D|¯ñˆñt\æ”\Æ8¯J>=¯8¿û:®ş“<^\'ıú?ü]\0y½\èGÁw®\âÿ\0¾üi‡Áw}®`üŸü(€¢»£\à\Ûÿ\0ù\ïlÿ\0\âi‡ÁÚi-ü	¿øš\0\â(®\ÌøCTõ·?ö\Ğÿ\0ñ5ğ–¬?†ÿ\0mGøP#Ö¦\0\n\éÇ…up\ÕF~’­)ğÆ°?\å\Üûiÿ\0@\ÆM;&ºøG5qÿ\0.§şûÿ\0‹¦\Â?«ÿ\0Ï¤ŸšñT\Î6}k\Ğ|ªyRµŒò\ÊKE\Ï\İ\àCŸ¨®qô-Tøó›ğ\0ÿ\0#P.“«\Â\ê\ëir¬¤2‡‚:(\èpjP\Õ\ÎZ\ê±5¼-t\Ék3(\ß¤FÁ‡€\Ø\àA«ƒQ±=.­ÿ\0\ï\ê\0m†¦\És)I]OU`À\Öj\ßZ—ûhŸ\ãS»s\Òh¿\ï\âÿ\0\0s·~\Ò.¼q½¤‡ø\àrŸ§JÃ“\ÂúÅ·üzjBa\Ù.Ÿû\èf½O\é\"\ßCüi\âE?\Ä\â(\ÉdƒÄ¶\ß\ë,\"¸ø¢q\Ï\á\Íg¾©w\Äú]\Òzü¹¯n)IŞ€< \ë\Ö\ã\ï[\Ü/\Õ*?\í\ë?ù\ç7ıñ^\è\Ğ@ÿ\0z$?U\áUÎŸf\å„÷\Èÿ\0\n\0ğ\æ×¢ş&oøÖ :¥\ì¿\êm{œŸ\ä?­{§öm \é\Z¢ŠO°[ÿ\0v€<\'\ÊÖ¥ù¾eöGó£\ì\Ú×«ÿ\0\ã¿\á^\ëö(}(û>”^Š( \Í&ih ¤§RPQE\0QE\0´´”´\0”´Q@	E-%\0”T3M¼O,ŒK1öƒ¯\ê£M´;\ï¥\Ê\Æ?»\êÿ\0‡ozñ2I9\'$òO­jjz„š•\Û\Î\Ù¤kı\Äõ>õ—@	KE%\0-%PEPEPEPEPEPEPZZe¡½½‚\Ì\ãwû£–ı+6½Áö›¤\é‡\İ$ú[ôÀüh\ÓƒKIE\0-Uº¹\Î\Ş[‰$g?€\éø*\ÍyGuo–=2&åˆ’|vÂ§ÿ\0B?…\0yMÔ²]\É-Ä„\î•\Ùÿ\05QDjŸ_Jl\Òg\å^ƒõªtmY2\ç®jx†#_¥fV”-˜Ç·\0\ìu¨ûû\ZŸÖ¢\Ç\Ùx^ód¯h\çOš<ÿ\0xuˆşU\è\ÛMxB;\Ä\ë,gk!¡+\ÙtıZ\ëT›![£®~\ë¿\ê(LZÎ™.¾\ãúRË©\ÚG÷¤_ÃŸ\åT¢\Ô\ì\î%Ú­±»C{\ëõ šŒ\ÜcÚ±^)ú„‡xÿ\0v±ü\Ê\0ôı6\è$*­¯µd{W”\Ú_ş\\\×Oo}¸}\ê\0\ì…Àõ©|ú\æ\È=G\â*O<c‡ ‹\Í\Í1¥À5Š³\ĞóŒb€.´\Şüš½GFBArv¢õ\Çûd{v®tI“šº@qH-¢3X\åcı\Ûğ¬\\´òz’zÿ\0SP\Í1l.zaÖ®Ù®Ñ¸÷\éôÿ\0\ë\ĞCe\ÈùTg\ê}ê¦¥z÷h~Py>§ü$·>Tòü±ô‡ø\×14¸\Ğ\íúš\ÈbXúšVb\ìM@®G#vü\êMÛºT~W½\0W¥«>RûÓ¼µô \ntU½‹\éI±}(¸nŞµe\'öv¯ôQ(\ÏûÁşuº\Ñ\ç§\ÏjhAG\ï\Êş\\Š\0÷š+?LŸ\í–6óg;\ã\\ÿ\0¼\ê+S\0´RR\ĞP\Ô\ÕZ\0mQ@E%-\0´”PÔ¡\ëP\Ñ@(\àT”!4™¦\Ò\Ğ+\âM;\í¶~j.e·ËVO\â_\ê>•\ã¼•ômx—ˆ4Ã¦\ß\Ä3e\ãôø“ğ==\0sØ¢š1@	\r<H\ã¹ü\ÍGE\0L\'£ñ©\Ô\ãş[L?\í£ÿ\0U¢€.‹Û¡\Ò\æqÿ\0mÿ\0Š©¥|:]\Üÿ\0\ß\×ÿ\0\ZÎ¢€5F¯©——?÷ñ¿Æ¤\ZÖ¨:^\Ü\ßf±¨ \r\Ï\í\í[şgÿ\0¾¿ú\Ôojÿ\0óû?ıõÿ\0Ö¬,Š2(\èŠ))hh¤¢€Š( ¤§Q@\r¢Š(h¤¥ ¢’Š\0ZJ)h1^[\â­WÍ“\ì17\É\Ì\ÄöO¢÷÷®\Ë]\Õ™hJ‘\çI•ˆz\ïô_\ç^ \ÌX–bI$’OROz\0mQ@%PEPEPEPEPE%\0´QE\0QE\0%{¶‹iö-:ˆ\Ã\Şÿ\0\ï?\'ò\é^E£Z}·P·ˆŒ®\í\ïş\êr>•\îô\0QE“«j1\éVS]>>Q„_\ï9û«ıOµ|\Éws-Ä’M+’bY\×üşU\İx\ÏUûv¡öDl\Ãk\Ãc£Iügğû¿y»Äš\0™O¦\Ğj\å¹áª¥=cù\Ğ¥!¢Š\0‹§4´-\Ô\ín£\Û\×ğ¨›Ö“\Ñy$óÖ&¶|9n5(e‡şZ[\àıcnŸ‘\ãò­iôyb\ìh&7i\á\n~üCö—ÿ\0­Ò«jÉ‚kv#õö5p$W#)…~ñ¿‡¨ \à8«‘HT\äÂ£12œE0ü´´—Dw«ir\\W#-Ç—¸#\å\ÎNj5$|d\ì>ı??ñ ÿ\0\ÏÁ©–\\\ä\×(—[°+f\'ù÷\Í\0lF\Ùn¿Z\Ğß…¬{v\Î\ãøU·|\n\0•~wû\Çô­\Ğ\Ø…kË“\è1ùÖ›¾\02i3\Åa\Ü>\î;U\É$\àŸZÆ•¨\"ŞœSy4Úš!“š\0°ƒh§\ÒR\ĞIKI@	M§SM\0%cj‹˜s\è\ËıElVn¤?\Ñ_\ê¿Î€;/\Üù¶2@O0\É\Çû¯\Ïó\ÍwU\ã~¹òµ‡<Mÿ\0¾“‘úf½Œh\0¢ŠLPQKŠa4\0\ÃIE\0QE\0QE\0R\ÒR\ĞEPE”\0¹¬}cO]N\Í\â\ã\Ì_#\è\ã·ü¡­z(\çvR¤«H õv¦\×s\â­7Èœ]\Æ?w?\á—ÿ\0²ıs\\5\0.isM¢€Š8¤¢€Š)( –˜X\ÓO4”\0QEôu&j\Ôn 	³KQfŒ\Ğ¹£5h\Í\0KšJe:€E6–€–›N ŠJZ\0*)eH#y$`¨€³\Ø\n’¼\Ë\Åz®öûMÂg#»vOÃ©÷ KU\Ô_S»y›!~\ìkı\Ô?\Ôû\ÖM%-\0”´”\0QE\0QE\0QE\0QE\0QE\0”R\Ñ@	E-%\0QG^”\é^´\Â\ÏvÃ¯\î“\è9o\è+Ñ«/K´V0CŒ@[ıö\å¿ZÓ ª——\Ò\Öy\ÏH£y?\ï•&­W7\â[˜ \Ò/IQ\ZH$XÕ˜v#¢¦€>r‘™\ÖI[––cşñÉªt³˜ \Õ\n\0)´RPE\åR\Ä@\Z}Å©(\0K@n•_<T\ìz\Õ2h¼ğ-×‘\ât\'\å¸Iaa\ëò–_üyE}#>Ÿ ñ_ \é7£OÔ­.\È, •d*¤Áz€O\×\Õz7‰t\Ítm.%-ƒd£\Üá‡º“@—š 9À®÷G1“\í^ô\ÊŠ\ãµ+d9 ‘g5ÿ\0Ÿ\çX’»“ó1?všŒAsŠ\ã6-À&€3®¤eÇ®?a	H­\Ë\Ø\Ù`9¨®{©o$$rJ÷\á^or²[«Á\ä•\×i?¹x‰\åG\Ğ\Ğ¥Ú·\î\×\ß\'õ«üı9¬û6Zº\rN\ç\n\Çğ \rkSˆÇ¹&¦–N*¬\'`)e¾œ\Ğ3¾?•f1É«¶Nj\0?­\\^!j\Å\0?4´\Ê\\Z\0u%7zúŠg˜¾´%6£óŞ˜e”=d\êL>\Î\Ãı¥l\ÊMc\ê-ˆ‘}XŸ\Èõ\è–pmom\æş\äŠOĞœ\Ğ\×\Ñ<c•ó8\ë_BikÓ­e\îc\n\ß\ï\'\Ê•\0i\Òæ–Š\0i¨\êjˆõ \ÑKI@RPE´\0”QE\0QE\0-”´\0RR\ÒPk»Hï­¥¶“¤ƒƒı\Öğ5\áIm4\È0ñ±VO\è{W\Ğ#Š\à|[¦\ä-ôc¦lzÿ\0CøPšRR\Ñ@\r¤¥¢€£cÚ†j€\n(¢€\n(¢€:1\âPG\ë\Zÿ\0J”x¯SóÀÿ\0\Û?şÊ¸\êu\0vcÅºˆşsÿ\0\0oş*¤/¿\ï\r¹üÿ\0Š®\"–€;±\ã¾öğ\Å\Çõ©GŒ§\ïkıö\ß\á^E\0z(ñ”\ì\×ğ”ÿ\0ñ5*ø\Ï\Ö\Ïò—ÿ\0°¯7¢€=8x\Î.öoÿ\0ÿ\0‰©Œ\íû\ÚMÿ\0}¥y}\ê\Ã\ÆV}\í\î?4ÿ\0\Z”x\ÃO\ïÀüÿ\0\ì\Õä”´\ë£\Å\Úo÷nü\0ñU(ñf”{\Î?\íŸÿ\0^¼vŸ\Z<®¨€³1\n u$ô hMe5¦]5^Y•xŞ»I\à\ÍÇ¸\ë\Ï_\ÃZ\Ã1f‰X±$Ÿ52I\êz×§i\Zji–‹ÁsóJ\ß\ŞsıA[T\â\'\Ãz¸ÿ\0—lı3ÿ\0³Tg\Ãú°ÿ\0—Gü\Ğÿ\0\ì\Õ\î4P…Uò\ç7\ä?Æ¡:>¦:\Ù\Ü\ß½\êŠ\0ğ¥\ê­¥\Çıûoğ¨ÎŸz:\Ú\Üß·ÿ\0\nú\nŒ\Ğ\Ï&\Ö\èu‚oûöÿ\0\áQ˜&b”Àü+\èªJ\0ù\Ì\Æ\ãª8ÿ\0€Ÿğ¦\àúÊ¾â›±Oğ¯\ä(\ç*Jú(\Ã	\ëgş\0¿\áL6¶Ç¬ŸûfŸ\á@<Q_A#\Ö\Ö\ßşı\'øTgL\Ó\Ïüº[ÿ\0ßµÿ\0\n\0ğ\Z+\ŞN¦¶vÿ\0÷À¨‡¥ùs‡ò?\ã@E{‡ö’\å\Ò?Í¿øªağ\î\å\Ø£\Éÿ\0\ÅP‰Vşƒiö\ÍJ#*‡\Í¢s\Ä\àW¤Ÿ\éşX0ÿ\0¶’ñU\È\ê3\Ç\á\ë\Ï/NUFhÇœ_2u9P2xõ4ê´™¯,\Õ?\éÿ\0¶ı•R¾ñ†£\ä<¹F‘J†E!\×\İN\î\r\0v\"ñ\\:Xk{m³]w\îû·«³ù×„\Ü\İOy)–y^Wc’\ÌIü½°¨‹I\É<šm\0OÄƒÎ£ec´€8\Ïù\íUß±Ş.Hù\\~#­\0#D\ë\Û#\ÔTU?›“\Ã~|T¨™\ä\à\ç\é@\êåº[ğ<?\İ_\Ç5$A\Ğ`Ö€,\Ôc½#1¿QT¼Ã P§\"©œÓÀ9÷5Qœ·\Ì\İ=(şb\çf	¤†D–)\Z7C•t8e> Š\Ç<Ó…\0}#\á_µ\ä‘\ØjXó_\åŠ\ä\0\Ùd\Ì8&½2\ê ù¯‹\"‘•‡${\ç¡\ìGÒ¾’ğ¿‹\í¯l„Z„\É\Ì\0+3ñ\ç/gÿ\0{³{ó@\Z\×:b¾~Z\Ã} g\îÊ»_\í})¿\åò\ßşûß·\éo\Ò\î\Ûşş/ø\Ğx‚\ÃÉ´\Î:È£ù×›´U\ï~(Xn\ì\ã[V[†óC0„ù„(S\É	’½yTºuÀ\ëo0ÿ\0¶oş\Ç2bŸ\Æ\ŞUN£\Ôw­-¤£¬rø…f¼,:© X°‘d\"§ ¨Á«Rƒõ®kC—±\î’?Z\ènI\ÏZ\0Ú…ğsI\Ç\ÌGÒ«[¶h$€\Ù\íŸÆ€+8,\Øÿ\0)GZ‘zS$8õ 7\Ğ\àQ¹½M6Š\0^ih¥ ¦Ó©\r\0%6–’€\nÁ\Ôt¡º¿©æ·²\0$ô&¹9\È\ìÇ¹&€#¯\\ğ]ß™k=»bp\ëş\ëñ\äu\ØxN\ç\È\Ô\Ädñ:2~#\æ_\å@İŠn*,\Ò\Ğ\0j:}%\02ŠZJ\0)(¢€\n(¢€\n(¢€\n(¢€\nZJ(\0¢Š(\0§K\\B\ÑH7#©V \ÓjQÒ€<Q²}>\îKwş•?\ŞC÷O\åú\Ömz÷Š4Ïµ\Úı¦1û\ÛpIõhûøQø×PQ±§\Ô\0QE\0QE\0QE^–ŠZ\0JZ( ¢Š(h¢–€Š( –’–€\nô¯\n\éXo•z\ä@§Bÿ\0\Ñ\Z\ätm1µKµ‘\ZüÒ·¢ú}[ ¯rDX\ÕQ\0UP\0   R\ÑI@%-%\0QE\0QE\0%Q@Q@Q@RP\Óh¤ ¤¤¢€˜(,\Ç\0Iö\à7\×&ò\îy\Ïü´rG²ö–+\Ö|Gwö]6@\Zo\İ/\ã÷ıóšñŠ\0+›¸s$Œ*\é+—•p\ßZ\0ŠŠ( #5U\ĞÕºC\Í\0gÑ¸Š¾¥\ã;‘ŠŸQQLòK÷¶“ıàª¤ıJš\0ƒ\Ìqİ¿Z_5ÿ\0¼:k{Ò‚\ëĞš\0v]½O\çN¹\ë…§ŠayOñ\Zz\æ€%;¾\ãúTÅ©û\r.\Ê\0„\nx.\Ú1@½a&Ë¥ôl¯\éY1¯~Â­\Ûÿ\0®Cş\Õ\0v[©3U÷f—u\0zƒ¸¹º?ô\ÉG\æ\Õ\é¬w\nò\Ïœ=\Ùÿ\0f1úµz0’€*\Ü[«W%ybx®Ø°9\ÍQš Â€<Á¢07\ãV$bÀlV\İ\í¶A\â±\Ñr›M\0X¶“‘ô«2HA¬µY\ëV™‰94|Šª\ç,jHF=*&û\Ç\ë@\r¥¤§P\Ò\ÒR\ĞM§SM\00\ÒS©@\ÉÀ \r+=1u‘]\Ú4\Æ7.2O§?­X>µ\íw7\â‰WmgX#N¿Z\Ñ[À{\Ğ=ÿ\0t=¯$ÿ\0¿kÿ\0\ÅT¶ş6³\Å<w„´N3·œg\é]\Z\İg½X\Ê\Z\"±\rd\à‚Aı\è\ê?\à ñ­¾9´˜}ô®[‹\ìú•Â7˜¿G\çùæ±³@º<ifz\Û\\\Åõ©Œ¬;\Ãr?ÿ\0\â«\È3K@\Ãÿ\0	†š‚\äÀÿ\0Š§\éGş~ı³ÿ\0\ì«\Çi(\ÙÇŠô“ÿ\0-%öÉªA\â ÿ\0\ËwX¤ÿ\0\nñJ(\ÛÇ‰4ƒÿ\0/ }ROş&¤!\Òü½§\â®?öZğ\Ê(\İÆ½¤Ÿù|‡ó#ùŠ”k:Y\é{oÿ\0}Šğ:(\èªi\Çş_-ÿ\0\ï\âÿ\0H5\Ò\ê\Üÿ\0\ÛTÿ\0\Zù\î“ôP»µ=. ?ö\Ñ?Æ¤\ÂzKÿ\0¯ø\×\Î4´ôx’3\Ñ\Ğÿ\0À‡ø\Óòq_7f¦Fa\Î\æü\Í\0}ƒO\0\×Î‚iGI$ğ6ÿ\0\Zpº¹ò\Şoûøÿ\0\ã@E\Íxn»¦2õ”\İI—ˆû\Êÿ\0ÀOLV`¿½.®?\ï\ëÿ\0jéš‘‘}¸ı¦ò0›÷7İœ`\ã>\Ô\Í5G_A#L~~\Çn}ö\n®\Ú•\Ş\Êû\çÿ\0¯@E{©\Ğ4“ÿ\0.q~‡òjŒøsH?ò\ê£\èòıš€<:Šö\Ã\á ÿ\0Ë¹I$ÿ\0â©‡\Â\ÚAÿ\0–R¤¯@-E{7ü\"zO÷fÿ\0¿§ü(ÿ\0„OIş\ìÿ\0÷ôÿ\0…\0x•-%-\0´R\ĞKE\0R\ÒR\ĞEPR\"4¨€³1\n u$ôz?…4¬Ÿ·Ì½2 ò/ıñ ¿F\ÓK´Xø27\Í+z·§\Ñz\nÛ¢Š\0(¢Š\0)(¢€\n(¢€\nJ( Š( Š( Š)(\0¤¥¤ ’ŠJ\0JJkºF¥İ•y,\Ä\0¹5Áj>6Ó­	Kp\×n;¯\Ë\Ş<ŸÀPG‹.ü\ÛÄ·\år\ß~AŠ\â«*\ïU\îyf8\r#=ñß‡J\Ï73\ã4\Ò\×?2\äU& ûD\ß\ß4‚f†€!¥ô¤c“œb…fR%H\äÁ\Ô\Z\0ZJôM/]Ñ¯[\ëöI)\à-\ìK²`?é·•µ›\ß\äúƒ]\Øğ‡õH„úuôÁ¡GI\Ğ{a€aô\'4\àW±\Ü|1½Sşn\ãşšFñŸüt¸¬[‡š\ì\î¿e˜*–\ÂHÛ9Â†A“\è(\ÍvŠnÚ’’€\"\ÛF*Zm\0EŠJ’“ô S\Ân\è*u€ÿ\0\Çó§²ó\Å\0AÀ\ãµMyn§ÿ\0!Q±qÂ¢h¡Y*pÕW\è\Ó<*p·G\Ş1ú5wªõ\ço\Ü\Î}]Gş;]ºš\0\Ğ\rKœŒUu©À“t™¹yk\×s,y\Î\\Û\ÔŠ\ËŞ\ßZ²£<¿Î™³i P\í4\ã\Ë\Z³°¢Ÿ\å‚=(¥-Jba\ïQ\à\ĞR\Ò\í>†—kz\Z\0mı\éRñÖ€ šÊ¸¿\'1©xûúSu-DB0Ÿœı\â?‡ÿ\0¯ü«Œ4\ÙÇ¨Z¾—şõç¡ˆ«Q\Ê\Ù\ï@“\î{Ö¬w9¯=¶g5\ÒÀ\Ì(7\ÄÉ—·œwS?NGó5\È]ş±§\É\Ü\ÆDƒğ\àş†¼\è\Z\0³O¨§ƒ@R\ÒR\ĞE-\0”QE\0QE\0QE\0QE\0*t¨©G=%(;¨\Å\06–Š(\Ø|1©ı²\ÓÈşö\Ü\î\Ñÿ\0	ü:ÂºóÒ¼L¾}:\î9\×8?¼‡\ï\ê=\ë\ŞTš4’3¹]C)õ¥\0-Q@-%\0\ê)´P\Ì\ÔQK@-´\0R\ÑE\0R\Ñ@	E-*«;PIb\0©\'µ\0k\é\Zk\êwi\ÈAóJ\ß\İAıOA^\éi,h¡U\0U ¥bhšb\év¯†•½ÿ\0»ô^•½@-%\0´RR\ĞE”\0QIK@	EPEPEPIKE\0%%:’€²u=N\ÛI¶i\î¢ ûò7÷T3\Ğw­)eH#yd;Q³\Ø“_6øƒW—V¼i!\ËvD\íÿ\0=Z€Yñö³!óË„’? ÷?\ŞosøW5E\0”QE\0QE\0%\0ö<\åô¤¦š\0” \ZŸ\r\ÅÅ±\İ²\Ä{˜İ“ó\ÚEG\İòş#Ú˜.\0%XG\àh¢\Äú\ìC	©\Ş\0;K\èY«‹\ã/\'MFcõX\Ûù¡®`<\'µ;÷\r\è(9§{‰d–B\È\ÅØ€NIÂ€\à*ÕŸ&?\ïÿ\0*r¢\'ñÿ\0*\0¯±\Ïğš”@\ç©¬y«ı\áP´\É\ê\Çô \ÊEû\Ç5 t(\Ï\ĞU•=\âIª¦nÂ€5Œ€r\Ä}*œ—=–¨cS,]\Ï\å@\n ·\Ì\n³Œ)¤ş}*)$\ÉÀ\è?Z\0·v«\ÈkÖœLGZ\0ô\ß\r[\É\ï/ş\Ê+¸S‘\\O‡WıŸYù\n\íS¥\0\\^jĞªkV–€&Û‘Udƒ5yjB VkNµ&øú\ßÎ»I€®Vìš\0©©&@\à£½Z\Åq·R•l©*GqÖ¥ƒ\\dùgM\ãû\Ë\Ã~#¡ ¶–²\ÓS²“¤¡}›*Z±ö»ù\ëıô?Æ€-\ÑY¯¨\ÚG\ÖUü•eM­ \â$-\îx\ã@0PI \Ü\×+}«n8±ş\'ük{™\î¿\Ö9\Ç÷GùU,\Z\0a\æ›Ö¯Ei,½°+j=W\ïrhŸ\Ù\ä=+fu­Ô·\0p*\êA@±\Ûã ­h£5i ö«\Éµ\0C\äù‘´g£©_\Ìb¼\Æì‡‚¬TıA\Å{‚\Ç^[®\Û}ŸQ—\ÒM²ø\çõ\Í\0aŠ”S>€)õ>€E%-\0”´PQKI@Q@	EPOQšeJ(ôQE\0.h¤¢€\"$×¦øGSŞc!\å2ğ\çºÿ\0şGµy›ö©m®$µ9\ã8x\Ø0ü;}C@E\ÑT\ì®ã¾¶Š\â?»\"\ç\İ=\Ôır€\n(¢€\n(¢€>f§QE\0-”´\0´´”P\ÑIE\0-z…4\íöù‡Ê¤ˆ\î\İ\ßğ\è=\ë’Ò´\ç\Ô\î\Ò\È_½#u_\Äôõ\î\ÑFF‘Æ¡Q\0U°%Q@Q@Q@Q@%-\0”QE\0QE\0QE\0QE\0QE\0yÏµ³\Ú\Åf§\à–úæ¿şU\á,w1>µ\ßx\Ê\àÍ®H‡;`Š5ğ\ÜS^|z\Ğ×¬[|:¹¼µ†\â\rFÙ–h\ÖE\Ìng¨\'ñâ¼š½w\Â^5¶\Ñô÷³¾8·[˜\×q\ÚÜ”9#<­\0W†º\ÊıÛ‹\'ÿ\0H¿\Î:ó½F\Âm.ò[IŒm$Dò\Î\å\É\0\ã8¼ñ^\ã\'\Ä\í8}\Ë+·ú˜\×ÿ\0f5\áÚ¥\è\Ôu«°¥ò¼I\ÉPÇ€H\ëŠ\0Î¤¤\Í6€\ĞsOH\Ùşµ} \â€+¤%[9«VzÖ³,©jaó#P\Å$‘b.3¾>£\"\ÕG¸$\Z\0}\ç‡u­<şş\Æ\é÷„l\éÿ\0}¦\åık¬©Á¿PGó­\è\ïo\à\æ\ê1\è’È£ò\rR_S\èo.O³9oı4\Í\ï“Ö—{ú\Õ\é\Ê\ì\ï\Ë1\É8\'ğ\â˜=h¦\çõ¤Á5¤-œöñ© \î*\0\Ê\ÛR¬L\İkOË?‡?_ş½p:\0(µ\Ç,S¶\Å\"ªµÁ\íUK\ë@¼¹\áx\0¥U-W’*\0dq\ÕôZrGV•(Ò¼8¸°_wsú\×\\¢¹\İ1§C\î\\ÿ\0\ãÆºd¥\0HµiM@L¢€-¯57j®*|ñ@W9\í\\½\ÔNsÖ»I#\ÍgKo‘@gqh\Äæ²ÔŠôI\íú\ÖğJ\0\ãš,T{+^kw\Ï\0\ÔKi3\r\0gl©	\à\ÖüZY<µnCb‰\ÑE\0rğ\ØK\'_”V\Ü:tkü9>õĞ¥µ][z\0\Å[^:T\ëo\í[‚jœA\í@\Ëµ[XkDE\íV”Ib«kZX\êÀLPU¸_\Ú\ám®\0şôMÿ\0¡/õ¯I	Š\Ãñ¯\Ú4»€J*ÿ\0ÀO\éš\0ñ\nv)qKŠ\0)iih\0¢Š(\0¢ŠJ\0Z))h\0¤¥¤ Š( œ§›E\0Y\ëÒ“\0$t©<\Ïj\0u\İş\Ô\Â\Ä\Ğ1\Í%%-\0w\Ôü‰ÍœòLs{I\éÿ\0¨¯W¯›•™2’H  †½\ãG\ÔWS²I¸\Ş>IG£¿\ê(fŠ( Š( š)h¥ Š( ŠZ()@,@$œ\0:’{Q]ÿ\0…tŸ6O·J¿$gƒüOİ¾‹\ÛŞ€;\rK\Ze &\ZS\è{\'\Ñt´”\0QE\0QE\0QE\0QIK@Q@%-\0”R\Ñ@	E-\0”R\Ò\Ğh§RP\Ï>1ŒÇ®\\1ş1	B£ü+¸LÃ¡\ë^½\ã\İ<Ÿ³\ß•È—ÛÑ·\ç‘ùW”‡R9ú\Ğm%K\å-·\Z…^ Š\03Fi´ 8\0 85q –\çÛµYD\Ú\0§\ĞqHi\Õ{w 5Fy6}wEY$/\İ\'ÿ\0Ö­E°£\Æ[©ühMı\ïÎ¤ûQ\ï´Ö„šJÿ\0UJta@y\éı\Åÿ\0?…/\Úû‹L:|\ã\Ğ\Ó~Á?§\ë@ı¨ú\n‰®X÷\ÇÒœ,&ö§­ƒ÷\"€)	¨\É&¶VÀwÉ«Kf£µ\0s\ë7AWÔµº°Ú¦b€2\Ò\n¶±U\Ñ;e\0V	O\ÛS\í¤\Û@±¢G6\Û\İIü\Ø\ÖğJ«¤E6\Óş¹)üù­m”SÀ©B\ÓÀ SŠhZ\n\0pZk\Æ©…8Š\0Âš\ß9¬‰-sÚºój±‡=¨6*{R­«ªò=©\ŞE\0skk\íV–\ßÚ·|š”C@\ëµX\âµU €3\ÄU0†¯§m ÿ\0/¤\ÕÂ¼Ñ¶€+„©T¸§\í v\Ğñ««!\èÀ©úŠŸ\í´óu\Ä&\Şya=cvCøT\×xª\Û\ìú«°L« úı\ÖıErT\0QE\0QE\0QE\0”R\Ñ@	E-\0”QE\0QE\0QE\0QE\0%´P]O‡5?\ìûĞ®qøGôVşü\Ø\×-E\0}\'Er¾\Ôş\ßd\ÎeƒŞ¬¿\Âß—\ÜWU@gº¾\ßl\Õ·ûVf ø¹aœp¿Ê³ü\Ïz\0½ÿ\0Æ\åƒ¤’ñUğ®’åœ£\é+õëª¥ <øKK?ó\Ü\ÛOñZŒøCM\í%Àÿ\0/ÿ\0]¥%\0p\çÁ\Ö=§¸÷Áÿ\0\Ùj#\à\Û^\×Sÿ\0\ß)]\í“Àåš—†\í4\Ûg\î\ä8\áSb‚\ìz(9ü\ÏaR\Ûø¹-\âH’\Ä*\"…P%\ì?\àakú©Ô®ˆCû˜²±\ïz¿\ã\ÛÚ¹ª\0ô\á\ãHûÙ¿\á\"ÿ\0ñ4ñ\ã;~ö³~†¼ºŠ\0õa\ã+.ö÷şø?Ö¤0\Óÿ\0\ç•\Èÿ\0€¯ÿ\0^KE\0zøñn˜z‹ÿ\0l\Çÿ\0RiGø\æXø×\Ñ@\Ğ<Q¤Ÿùl\ã\ëÿ\0…H<G¤ùy\ê’ñ5\âtP¸i\'ş^\ãüœ\ìµ \×4£ÿ\0/ş$\é^E\0{\Ø\Õô\Ó\Òò\ßşû(Ô¬ü½\Ûÿ\0\ß\Åÿ\0\Zùş’€>†¶\Ò\æÿ\0müjQq\é4Gş¿\ã_:\Ñ@F‰#=ü8\ê?:ùÂŸ½\Çñ7\æh\è\Ú^k\çA4Ã¤²£·øÔ‚\î\ètaÿ\0müh\èz+\çÑ¨_—W÷õÿ\0Æ¤\Z®¢?\åò\ãşş5\0{õ%x8ÖµA\Òòû\ë5(\×õaÿ\0/’ÿ\0\ã§ù­\0{E\å¤7\Öò\ÛL»£•J°ş£\ÜAõ¯šõ}mñ­\å\é÷¡“øe<¨\è\ÃÖ»\â-\\\Ë\ÓªFöZ¯®j\Ö76±$\Éö\ë\ã\Ï.\æH\à\ÎHP\0º\çœq´\çƒ0¶z©\ëV„ˆ\İÁú\Õ3+\'şGº#Ğ•ıhñğŠz…^€\n§ˆ:±\Ï\éSù±ÿ\0z€&\ÍFdQŞ£ib#\æªLğ	Z\0º$\rÀ\Ó\ÈU\äÿ\0õª‹LÁr\ÑTZW\'9 \r\ÛI`y‰v\0ŸŸJ\èkƒŸ\â¿JÖµ¿\ØBó·û§ÿ\0e?Ò€:zLW]iá«‹\ëx\î-\îmdAr\ã\ê\ÛÁ\íSŸjc£[Ÿøÿ\0\âh‰\Ú)6-vG\Âz¨\íÿ\0¶¿ıjŒøWWò\Ê3ô•h\Ø(\Ø+«>\Õ\Çü»ƒô’?ş*¡>\Õ\Çüº7\àÑŸıš€9­‚¢º j\Ãş\\\åü6Ÿ\ëPTl®?\ïŒ\Ğ.)1Z\ÇJ\ÔG[;ûö\ß\áQ>ôuµ¸ÿ\0¿OşŠm]6·#¬¬oş‚Q\Ö9\Õü(µ1F\î¬?L\"€=\×LM¶ƒş˜\Çÿ\0 Ö\Úe”x´·\Çÿ\0 \n·¶€ \Í;mK°Ô»h°ZxZ—»h<S±š~)qŠ\0LR\í§Q@\Ø(*AKŠ\0fÁK¶ŸN m¥\ÛN§PvÓ±KK@F)\ÄóI@)Ô”´\0RQI@y\ãKm\Ğ[\\÷\Æ\Ç\Ù\ÆG\ê+Ê«\ß5\Ëoµ\é—Q\ã$!uú§\Íı+À\è\0¢Š(\0¢Š(\0¢ŠJ\0Z)( ¢’Š\0ZJ( Š( ¢–Š\0J)h Š( Š( \rPm6ö9¿€ü²T=.£\é^ò¬®¡”†V\0‚:z\Zù¶½_\ÂZŸŸ²üğ\Ñ\çø£ôÿ\0€Ÿ\Ğ\ĞE{§µÌ¡Ôò€~ š¡ıÿ\0\Ş\ÕÑŠ\0†Š\\Q@	EPW\âW\ìñ}#û\ÉFd#ªG\éõo\å]^£}k%ÄŸ\ÃÂ¯÷\Øô_ñö¯¸K©¤šS¹\äb\Ì ö\0V¢Š(\0¢Š(\0¢Š(\0¥¤¢€’Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¥¤¨¤}‹ŸÀP[™\Â\r¹Ç®:ıbAòoñ¢F\Ş\Ä\ÔTZJ¥’¦´T\ÖZeÖ§9‚\Ú=\î#’S\ØwO\è=I€(‰\ã#o®9©sş?üt\Õ,R\Ğ>`©7A}\Çó¬ºZ\0YŒ\ÃÒ«\ÑE\06Šu%\0z/ƒ¼BúUØŠg?f˜…\Ädğ²LtoQ_I\×Å°ıüzñ_SxNü\ê\Z5»±\ËÅ˜\ë\0ş+Š\0\ë(¢Š\0(¢Š\0Z(¢€\n9¢Š\0)1KE\04¨=‡\ä*3G¬h\à+ş55¸R}şTóÔ·7i6\Í*ü\ïŒ;|\ÇŞz½.®ı´ñªŒr\Äú’Zm\0i\rSP/.?\ï\ãXMgS}²\ãşû5J:\Ğø\×5Qÿ\0/’şŸ\áR\ê\ãş^›ñT?û-`RPH¾%\Õ\Çü¼g\ëüML<S«ùkúÄ¿Ò¹jZ\0\ëGŠõQüPûd?Æ¤-Ô‡U·?ğ?öjã¨ \Üx\Âÿ\0¼6\Çğş*¥2»\ïmü\\Z\à©h\ĞGŒ\ç\ïi\à\ì?¡©G½šşŸş\"¼\æŠ\0ô±\ãE\ïd\ß÷ôñ(ñ¤\ì\åIÿ\0A^_E\0z ñ§{Yÿ\0ï¤©¿\á2°\ïÀÿ\0¾ş\Í^KLc@º<c¦ÿ\0r\äÀÿ\0Š©W\ÅúQ\ë\ç¯\Ö?ğjñš(\ÚÇŠôƒÿ\0-eX›úT£\Å\Z9ÿ\0—‚>±\Éÿ\0\Ä×‡\Ñ@\ê<I£Ÿù{QõIş\ËRiş_\"ÿ\0Ç‡ş\Ë^\rE\0{÷öÖ’\à¶\Û\àğr\Ø\ëõ¯›J»ó$0Á,\Ñoo.DB\Èë“†R:‚+½“\ÂW>v™\å“\Ì2À[\æ\Ì\Ğ•:øuµ¸ÿ\0¿Oş³º^¶óûfÿ\0\á_Eæ“š\0ùÀÁ0\ë£ş\0\ß\áL(ãª·\äk\é*L\ØP\Íx4•ô™TCÿ\0\áQ›xXb?ğÿ\0\n\0ùÂŠú$\ÙZ7[hı²Oğ¨¿³lüº[ÿ\0ß¤ÿ\0\n\0ù\îŠ÷ö\Ò4\Æ\ëgoÿ\0~\ÅDt-(ÿ\0Ë”–?‘ ¢½\Üø{H?ò\ç\à\\\ì\Õ	ğÖ\å\ÛG\ì\Ô\á\ÔW¶işX8úK\'ø\ÔGÂšIş	‡\ÒSıh\Æ)k\ØO„t³\Ó\íş\Úö5ğvÿ\0=.Gü	øš\0ò:Jõ“\à\Ë\×şø?û-D|m\Ú\îaõD4\åtW§Ÿ\Å\Úñÿ\0\×ÿ\0Š¨O‚½/8¿û:\0ój+\ÑO‚¥\íyıûoş*£>¹\íw\â®(Ï«¡\Ñ-uºŠ{8Y¼¶±ùc\Çu,x\äq\Æk±\Ó|%Ry—r,\à‘![İ³‚~•èˆ\"\0Š8\n£\0~T\0¸oJ6·¥z0}\è\ZJ( –’¸j\ßeƒ\ì‘7\ïf9R?ñnŸJ\0\ã¼C«h\İlŒş\âU=»¿\ã\Ğ{W-E\0RR\ÒPEPEPEPE´\0”R\ÒPEPEPKIE\0-”´\0QE\0VM\ì˜`¾Š3ZÕ‡w5\Éô\Ç\é@tRR\ĞH¯¦|\áÑ¤\éÿ\0h?\Òo3‚9/\áñû\Í\îqÚ¼‹ÁZ(\Ö5e2\0`µ\ÄÒƒüD‘>…¹>À\×\Ô\ÔògŒ|3.…~\ï\Z²N\ì\Ğ8\è™\ä\ÄŞ…{z­p8¯ºn- »‰¡$š7dpO\àk\æ\èz~‡}vBEY¢iY÷ùğ\çœu\êM\0y–(©ˆ¦‘@\ÑN\Å \ÑN\Å\\†ü\ÍÓµ\06\í\Ä`õ\îÿ\0$-iz„\È\Ãş¸ş•\ãG\Å{€-\Z*I\Ûş^&%İŒmñ9 H¢Š(\0¥¤¢€Š( Š( Š(  œ\âO¤nñ\ÓS\Õ;Ó¶\Ò\äúC/ş€h\çzZm-\0-9i´\å\ë@QKE\0QE\0QE\0QE\0QE\0QE\0PS˜\æ›@RPEPKIK@w¹ò\ï&€ô–=\Ãı\ä?\àMpu«¤\\ı“Qµ—8E\rş\ë|§ô4ô”PE%\0\ì\ÑM¢€E%-\0%-PE-%\0%´Ph¥¤ Š( ’–Š\0*nBzò~•5g£n–C\èH…\0h­NWŒÕ¡@\Å¥¥ ºZ( \n÷‘\éö\Ò\\I\Ñ»1\è£\êkÁ®ne»I\å9y\'\Û\Ø{À®\Äz·ö…Ï•ı\Ä$…ôw\îÿ\0\Ñ}«“ Š( ’–Š\0JZ( Š( ’–’€\n(¢€\n(¥ ¢–Š\0))h ¢–’€\nZJZ\0(¢Š\0*…õœ\Â$¹\Ûû¹Æ­ÿ\0M##ò?¥h`Zös \Ãq¢¦/`m\ãªM\×xúq@6Ê˜;‡Cú\Z‚·/¬®4»‡µºBt?\Â\ËØ©\î­cH¡H\Ús\İ\Å\0z?€µ«M&şdºo-n–4Y\ÜFV8\ß\èzô\ë\éš)>\äˆÿ\0î²Ÿ\äk\â,Ó•\Ù~\é#\èHşT÷\r|\Íñ\"C&¼şy\ÛB¿™fşµ\ç\Â\î\åzO8úJ\ãÿ\0f¨$‘\åm\Î\ì\íı\æb\Çó$š\0ƒ˜§S\Ö7n‚€!\Åš¾¶\ß\Ş?€«AB(¤v\àr\Üûv«9Á\Å+V–¦]\êómc,‰\Ï	õfÿ\0$\Ğ4\Í6}Z\î;XG/\Ë7h\ãy\Ûú{\×\ÓÖ¶\ÑY\Û\Åo\ÛH¨£\Ø\æzš\Æ\Ğô;m\ßËˆo‘ñ\æ\ÌG\Ì\ç\Ğz(\ì+¢ ¤¢Š\0(¢Š\0(¢Š\0Z)( ¢’Š\0Z\Ì\Õ\İ:ğÿ\0\Ó	?ô\ZÒ¬mm¶\éW§ş˜·\ë@EPN\Ú(\Í%F­\ØÔ´\0”QI@-%-\0QE\0QK@	LcÚ•›\0QI@E%\0´RQ@E%\0´QE\0}¦\Üı®\Æ\Ún\ï\Z\çı\à0QZ5\Ãø>\çÍ°’y†C÷_Ÿ\çš\î()i( ¤¥¢€ŠZ()h¢€E%-\0%´”\0RR\ÒPIN¢€E-\0V&\ï.W\í×šÛ¬‹\Øöº\Ê:+{\ÇúP\Ôlpjòµcy™Ç­[I(S4¹¨D\Ç9ü)şd\í~”N¸¿\ê\ßbƒ\ì\Ñ6&˜rGT¹ú·A]=\í\ÜV6ò\\K÷Pt\îÇ²rkÁnî¥½I\å9g9ö°Àq@(¢–€\n(¢€\n(¢€\n(¤ ¤¢Š\0(¢Š\0(¥¢€Š( –’–€\n(¤ ¢’Š\0(¢Š\0)i( ‡\ÃöŸl\Ô\àR2±Ÿ5ş‰\ÓólW¸\×\àûO.\Şk¦\Ê\Ûı\Ô\ëù·ò®ú€25M\"\ËX‡Ê¹L‘’3ş\Éş`ğkÃµ\ê:vdM\ÌC£\Ä2À¶Ÿx}FE}N ‘·+ñ \Ãx4\Ón?…¿­}?}¡izŸ76±³}~Gÿ\0¾“ş9¯š¯aHo®á„‘SÈ‰N\ÕbO\á@M»úŠAnş T†b‡šrÏ¼\àÖ€*œ““V*,· üÿ\0ú\ÕM¥c\í@™À\êj*\ÔP¨l\çšY\Æ1Š\0õÁ­7W“*\Ã\"‡X\â9w·7EıM{\r¥•µ„\"h–$—¹õ\'©>\æ¹]}§D‰s\Ìñ¦w\Ğ\×u@Q@Q@Q@Q@Q@Q@sş!8\Ò.ÿ\0\ÜQùº\×A\\Ï‰\Ûn‘q\îcøø ¢Š(\0¢Š(\0©Pö¨¨ 4\Ú³N\Å\06–’Š\0Z(¦–€Q–ô¦–&›@Q@Q@Q@Q@Q@Q@·„.|­A\â\'‰£#şŸ0ı3^½_=i÷\Òö\Şo\îH¤ı3ƒúf¾„\ë@E”\0´RR\Ğ\ÑIK@´”\0R\ÒQ@EPEPEPEPMuWR¬2Á\êJ\0\ç\Ü5«ml\íşõ‡\Ü~µ$rƒÓšÙ’5•J¸\È5\ÎOm-¡Ş¹tõ\î¿\ï\0j‰i|\ßz\Èo\çŠ<\Ã@‰uo·\\y\Ü\ÂHã£¿B\ßA\ĞWE%\0-”P\ÑE\0QIE\0-%PEPKIK@Q@	EPKIE\0QE\0QE\0QE\0\åR\ìFK\0õ\'M®Ÿ\ÃVŸjÔ£$e`ı\ë}G\İ÷\×ò ]±µ[;H ò\Í\0>\ç¹üóWé”¹ ¢›E\0)` ±è ŸËšù-ŸÍšy?¿+·\æ\Ä\×\Ó:\í\×\Ù4›ÙºÀÿ\0y†\Ñúšù|.*\0¯/ß¢#‡œ\ä÷© _\âü¨\Ï\Í\íôª \ÌF*¼Éƒ¸Pcm™>\Ô÷}\é\à\ÒÆ™½ÿ\0¥@\0µ\Å\0z¯\Ã\Ë\ï.\æ\æÍú\Ô\'û\É\×ÿ\0?¥{…|™¤\ß6›¨[Ü¯ü³«Ñ‡\â3_W\Ç\"J‰\"\Ê\êO¨#\"€$¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0®O\Åg\ZKû\Éık¬®3\Å\í1G¬\éú ¢Š(\0¢Š(\0¢Š(\0§‡\"™E\0I¿Úõ\0\â\Ä\Óh¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n÷\Í\ç\ízu´¹\ÉòÂ·û\ÉòŸ\å^^«\àÛö³Û±¸qş\ëñ\ß\ÒQK@	E:Š\0(¢Š\0)h¢€ŠZ()i( ¢Š(\0¤¥¢€\n)h ¢—¸ \Ô3\Ê ‰\änˆ¤ı}¿\Z±\\¶»q¶1\nO\Ì\ß\ĞZ\0ó\Ç\ÔnQ\Ø>ñ==iŸÚ—^£ò¨¤O˜\Ô~]\0ÿ\Ù','123','123','oh',5,'2016-10-19',123.00,1,1,NULL,0,'2016-10-27 00:00:00','2016-10-27 00:00:00');
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
