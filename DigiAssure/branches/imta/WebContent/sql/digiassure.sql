CREATE DATABASE  IF NOT EXISTS `digiassure` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `digiassure`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: digiassure
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `accountid` int(11) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(45) NOT NULL,
  `accountdescription` varchar(100) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`accountid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'DigiAssure','DigiAssure - Digital and Mobile COE',1,NULL,1,NULL,'Y');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `batchid` int(11) NOT NULL AUTO_INCREMENT,
  `batchname` varchar(150) DEFAULT NULL,
  `dated` datetime DEFAULT NULL,
  `machinedetails` varchar(200) DEFAULT NULL,
  `devicename` varchar(150) DEFAULT NULL,
  `buildid` int(11) NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`batchid`),
  KEY `buildid_batch_idx` (`buildid`),
  KEY `userid_batch_idx` (`userid`),
  CONSTRAINT `buildid_batch` FOREIGN KEY (`buildid`) REFERENCES `builds` (`buildid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userid_batch` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `builds`
--

DROP TABLE IF EXISTS `builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `builds` (
  `buildid` int(11) NOT NULL,
  `buildname` varchar(45) NOT NULL,
  `buildversion` varchar(45) DEFAULT NULL,
  `projectid` int(11) DEFAULT NULL,
  `buildsremarks` varchar(45) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`buildid`),
  KEY `projectid_builds_idx` (`projectid`),
  CONSTRAINT `projectid_builds` FOREIGN KEY (`projectid`) REFERENCES `project` (`projectid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builds`
--

LOCK TABLES `builds` WRITE;
/*!40000 ALTER TABLE `builds` DISABLE KEYS */;
INSERT INTO `builds` VALUES (1,'Sample1Build','1.0',1,'Build for project',1,NULL,1,NULL,'Y');
/*!40000 ALTER TABLE `builds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_batch`
--

DROP TABLE IF EXISTS `manual_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manual_batch` (
  `batchid` int(11) NOT NULL AUTO_INCREMENT,
  `batchname` varchar(45) NOT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `toolid` int(11) DEFAULT NULL,
  `allocatedUser` int(11) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `creationTime` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedTime` datetime DEFAULT NULL,
  `executionstatus` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `executionpercentage` varchar(45) DEFAULT NULL,
  `totalcount` int(11) DEFAULT NULL,
  `passedcount` int(11) DEFAULT NULL,
  `failedcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`batchid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_batch`
--

LOCK TABLES `manual_batch` WRITE;
/*!40000 ALTER TABLE `manual_batch` DISABLE KEYS */;
INSERT INTO `manual_batch` VALUES (10,'Accessibility','New Suite for Deepika for Smoke Release ',4,9,10,'2016-10-20 12:05:59',NULL,NULL,'No Run','Y','0%',NULL,NULL,NULL),(12,'Suite_Deepika','New Suite for Deepika for Smoke Release ',4,11,10,'2016-10-20 12:44:01',11,'2016-10-21 14:21:41','No Run','Y','0.0 %',7,0,0),(13,'Smoke_Sowmya','do Smoke_Sowmya test',4,9,10,'2016-10-20 16:18:59',9,'2016-10-20 17:19:48','Inprogress','Y','10%',5,2,1),(14,'RUn1','asdasdasd',4,11,10,'2016-10-20 17:36:26',11,'2016-10-21 14:22:25','Completed','Y','100.0 %',5,5,0),(15,'Sowmya_Demo','Demo Test',4,9,10,'2016-10-21 15:29:40',9,'2016-10-21 15:31:38','In Progress','Y','80.0 %',5,2,2),(16,'DemoSuite','DemoSuite',4,11,10,'2016-10-21 18:01:19',11,'2016-10-21 18:03:09','In Progress','Y','60.0 %',5,2,1),(17,'NewBatch','Nw',4,11,11,'2016-10-21 19:18:26',11,'2016-10-21 19:18:59','In Progress','Y','40.0 %',5,2,0),(18,'Vani','Vani',3,8,11,'2016-10-24 12:15:57',NULL,NULL,'No Run','Y','0%',NULL,NULL,NULL),(19,'Accessibilityaaa','New Suite for Deepika for Smoke Release ',4,8,11,'2016-10-24 12:16:19',NULL,NULL,'No Run','Y','0%',NULL,NULL,NULL);
/*!40000 ALTER TABLE `manual_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_testcaseresults`
--

DROP TABLE IF EXISTS `manual_testcaseresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manual_testcaseresults` (
  `testcaseresultsid` int(11) NOT NULL AUTO_INCREMENT,
  `testcaseid` int(11) DEFAULT NULL,
  `batchid` int(11) DEFAULT NULL,
  `tcstatus` varchar(45) DEFAULT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`testcaseresultsid`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_testcaseresults`
--

LOCK TABLES `manual_testcaseresults` WRITE;
/*!40000 ALTER TABLE `manual_testcaseresults` DISABLE KEYS */;
INSERT INTO `manual_testcaseresults` VALUES (40,7,13,'PASSED','No Comments',NULL,NULL,9,'2016-10-20 17:19:48','Y'),(41,8,13,'PASSED','No Comments',NULL,NULL,9,'2016-10-20 17:19:48','Y'),(42,9,13,'FAILED','No Comments',NULL,NULL,9,'2016-10-20 17:19:48','Y'),(43,10,13,'NOT_COMPLETED','No Run',NULL,NULL,9,'2016-10-20 17:19:48','Y'),(44,11,13,'NOT_COMPLETED','No Run',NULL,NULL,9,'2016-10-20 17:19:48','Y'),(45,7,14,'PASSED','s',NULL,NULL,11,'2016-10-21 14:22:25','Y'),(46,8,14,'PASSED','s',NULL,NULL,11,'2016-10-21 14:22:25','Y'),(47,9,14,'PASSED','s',NULL,NULL,11,'2016-10-21 14:22:25','Y'),(48,10,14,'PASSED','s',NULL,NULL,11,'2016-10-21 14:22:25','Y'),(49,11,14,'PASSED','s',NULL,NULL,11,'2016-10-21 14:22:25','Y'),(50,7,12,'NOT_COMPLETED','d',NULL,NULL,11,'2016-10-21 14:21:41','Y'),(51,8,12,'NOT_COMPLETED','d',NULL,NULL,11,'2016-10-21 14:21:41','Y'),(52,9,12,'NOT_COMPLETED','d',NULL,NULL,11,'2016-10-21 14:21:41','Y'),(53,10,12,'NOT_COMPLETED','d',NULL,NULL,11,'2016-10-21 14:21:41','Y'),(54,11,12,'NOT_COMPLETED','d',NULL,NULL,11,'2016-10-21 14:21:41','Y'),(55,12,12,'NOT_COMPLETED','d',NULL,NULL,11,'2016-10-21 14:21:41','Y'),(56,13,12,'NOT_COMPLETED','d',NULL,NULL,11,'2016-10-21 14:21:41','Y'),(57,7,15,'PASSED','d',NULL,NULL,9,'2016-10-21 15:31:37','Y'),(58,8,15,'PASSED','d',NULL,NULL,9,'2016-10-21 15:31:37','Y'),(59,10,15,'FAILED','d',NULL,NULL,9,'2016-10-21 15:31:37','Y'),(60,12,15,'FAILED','d',NULL,NULL,9,'2016-10-21 15:31:38','Y'),(61,13,15,'NOT_COMPLETED','d',NULL,NULL,9,'2016-10-21 15:31:38','Y'),(62,7,15,'PASSED','d',NULL,NULL,9,'2016-10-21 15:31:37','Y'),(63,8,15,'PASSED','d',NULL,NULL,9,'2016-10-21 15:31:37','Y'),(64,10,15,'FAILED','d',NULL,NULL,9,'2016-10-21 15:31:37','Y'),(65,12,15,'FAILED','d',NULL,NULL,9,'2016-10-21 15:31:38','Y'),(66,13,15,'NOT_COMPLETED','d',NULL,NULL,9,'2016-10-21 15:31:38','Y'),(67,7,16,'PASSED','Comment ',NULL,NULL,11,'2016-10-21 18:03:08','Y'),(68,8,16,'FAILED','Faile at Page 2 ',NULL,NULL,11,'2016-10-21 18:03:09','Y'),(69,9,16,'PASSED','Comment ',NULL,NULL,11,'2016-10-21 18:03:09','Y'),(70,10,16,'NOT_COMPLETED','Comment ',NULL,NULL,11,'2016-10-21 18:03:09','Y'),(71,11,16,'NOT_COMPLETED','Comment ',NULL,NULL,11,'2016-10-21 18:03:09','Y'),(72,7,10,NULL,NULL,NULL,NULL,NULL,NULL,'Y'),(73,8,10,NULL,NULL,NULL,NULL,NULL,NULL,'Y'),(74,9,10,NULL,NULL,NULL,NULL,NULL,NULL,'Y'),(75,10,10,NULL,NULL,NULL,NULL,NULL,NULL,'Y'),(76,12,10,NULL,NULL,NULL,NULL,NULL,NULL,'Y'),(77,7,17,'PASSED','Comment ',NULL,NULL,11,'2016-10-21 19:18:59','Y'),(78,8,17,'PASSED','Comment ',NULL,NULL,11,'2016-10-21 19:18:59','Y'),(79,9,17,'NOT_COMPLETED','Comment ',NULL,NULL,11,'2016-10-21 19:18:59','Y'),(80,10,17,'NOT_COMPLETED','Comment ',NULL,NULL,11,'2016-10-21 19:18:59','Y'),(81,11,17,'NOT_COMPLETED','Comment ',NULL,NULL,11,'2016-10-21 19:18:59','Y');
/*!40000 ALTER TABLE `manual_testcaseresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manualchecklist_testcase`
--

DROP TABLE IF EXISTS `manualchecklist_testcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manualchecklist_testcase` (
  `testcaseid` int(11) NOT NULL AUTO_INCREMENT,
  `testcasename` varchar(500) NOT NULL,
  `testcasedescription` varchar(2000) DEFAULT NULL,
  `testcasedetaildescription` varchar(4000) DEFAULT NULL,
  `toolid` int(11) DEFAULT NULL,
  `level` varchar(100) DEFAULT NULL,
  `severity` varchar(45) DEFAULT NULL,
  `priority` varchar(45) DEFAULT NULL,
  `createdby` int(45) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `modifiedby` int(45) DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`testcaseid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manualchecklist_testcase`
--

LOCK TABLES `manualchecklist_testcase` WRITE;
/*!40000 ALTER TABLE `manualchecklist_testcase` DISABLE KEYS */;
INSERT INTO `manualchecklist_testcase` VALUES (7,'Guideline 1.1.1 - Non-Text Content ','Guideline 1.1.1 - Non-Text Content \r\n','Guideline 1.1.1 - Non-Text Content \r\n',4,'Level A','NA','NA',10,'2016-10-19 06:57:02',NULL,NULL,'Y','Perceivable  Appearance'),(8,'Guideline 1.2.1 - Audio-only and Video-only (Pre-recorded)','','',4,'Level AAA','NA','NA',10,'2016-10-19 06:57:40',NULL,NULL,'Y','Perceivable  Appearance'),(9,'Guideline 1.2.2 - Captions (Pre-recorded)','Guideline 1.2.2 - Captions (Pre-recorded)\r\n','',4,'Level AAA','NA','NA',10,'2016-10-19 06:58:17',NULL,NULL,'Y','Perceivable  Appearance'),(10,'Guideline 1.2.3 - Audio Description or Media Alternative (Pre-recorded)','Guideline 1.2.3 - Audio Description or Media Alternative (Pre-recorded)\r\n','',4,'Level AAA','NA','NA',10,'2016-10-19 06:58:49',NULL,NULL,'Y','Perceivable  Appearance'),(11,'Guideline 1.2.4 - Captions (Live) ','Guideline 1.2.4 - Captions (Live) \r\n','',4,'Level AA','NA','NA',10,'2016-10-19 14:39:57',NULL,NULL,'Y','Perceivable  Appearance'),(12,'Guideline 1.2.5 Audio Description (Prerecorded)','Guideline 1.2.5 Audio Description (Prerecorded)\r\n','',4,'Level A','NA','NA',10,'2016-10-19 14:40:26',NULL,NULL,'Y','Perceivable  Appearance'),(13,'Guideline  1.2.6 Sign Language (Prerecorded)','Guideline  1.2.6 Sign Language (Prerecorded)\r\n','',4,'Level AAA','NA','NA',10,'2016-10-19 14:41:05',NULL,NULL,'Y','Perceivable  Appearance'),(14,'Guideline 1.2.7 Extended Audio Description (Prerecorded)','Guideline 1.2.7 Extended Audio Description (Prerecorded)\r\n','',4,'Level AAA','NA','NA',11,'2016-10-21 18:24:03',NULL,NULL,'Y','Perceivable  Appearance'),(15,'Guideline 1.2.8 Media Alternative (Prerecorded)','Guideline 1.2.8 Media Alternative (Prerecorded)\r\n','',4,'Level AAA','NA','NA',11,'2016-10-21 18:24:31',NULL,NULL,'Y','Perceivable  Appearance');
/*!40000 ALTER TABLE `manualchecklist_testcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `projectid` int(11) NOT NULL AUTO_INCREMENT,
  `projectname` varchar(45) DEFAULT NULL,
  `projectdescription` varchar(100) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `accountid` int(11) NOT NULL,
  PRIMARY KEY (`projectid`),
  KEY `accountid_idx` (`accountid`),
  CONSTRAINT `accountid` FOREIGN KEY (`accountid`) REFERENCES `accounts` (`accountid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'DigiAssure','DigiAssure- Digital COE',NULL,NULL,1,NULL,1,NULL,'Y',1),(2,'COE','MobileCoE',NULL,NULL,1,NULL,1,NULL,'Y',1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL,
  `rolename` varchar(45) DEFAULT NULL,
  `roledescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN','Administrator has all access to the credentials'),(2,'USER','User has limited previleages you know');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runs`
--

DROP TABLE IF EXISTS `runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runs` (
  `runid` int(11) NOT NULL AUTO_INCREMENT,
  `runname` varchar(2000) NOT NULL,
  `runsremarks` varchar(2000) DEFAULT NULL,
  `buildid` int(11) NOT NULL,
  `toolid` int(11) NOT NULL,
  `scheduledtime` datetime DEFAULT NULL,
  `scheduledstatus` varchar(50) DEFAULT NULL,
  `toollanguageid` int(11) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `runhome` varchar(2000) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`runid`),
  KEY `toolid_idx` (`toolid`),
  KEY `toollanguageid_idx` (`toollanguageid`),
  KEY `buildid_runs_idx` (`buildid`),
  CONSTRAINT `buildid_runs` FOREIGN KEY (`buildid`) REFERENCES `builds` (`buildid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toollanguageid_runs` FOREIGN KEY (`toollanguageid`) REFERENCES `toollanguage` (`toollanguageid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runs`
--

LOCK TABLES `runs` WRITE;
/*!40000 ALTER TABLE `runs` DISABLE KEYS */;
INSERT INTO `runs` VALUES (64,'Smoke1Test',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-07 23:16:49',NULL,NULL,'N','D:\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\Smoke1Test',9,NULL),(65,'Smoke2Test',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-07 23:55:59',NULL,NULL,'N','D:\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\Smoke2Test',9,NULL),(66,'Sample3Test',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-08 00:14:26',NULL,NULL,'N','D:\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\Sample3Test',9,NULL),(67,'hharish',NULL,1,3,NULL,'No Run',NULL,9,'2016-10-08 08:04:39',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cukes_Digital\\hharish',9,NULL),(68,'HarisdzfwePemmasani',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-10 15:59:20',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\HarisdzfwePemmasani',9,NULL),(69,'pROGRAM1rUN',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-10 16:10:06',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\pROGRAM1rUN',9,NULL),(70,'pROGRAM1rUN',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-10 16:10:52',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\pROGRAM1rUN',9,NULL),(71,'dfdfhrtfhzsd',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-10 17:41:56',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\dfdfhrtfhzsd',9,NULL),(72,'dfsdfsdfdsf',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-11 12:01:40',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\dfsdfsdfdsf',9,NULL),(73,'DigiSmokeTest1',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-11 13:36:27',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\DigiSmokeTest1',9,NULL),(74,'DemoDigi12',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-11 13:48:21',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\DemoDigi12',9,NULL),(75,'HarishPemmasani1Run',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-13 14:07:16',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\HarishPemmasani1Run',9,NULL),(76,'Run1Name',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-13 17:36:05',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\Run1Name',9,NULL),(77,'Run1Name',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-13 17:38:12',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\Run1Name',9,NULL),(78,'Harish2016Pemmasani',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-13 18:15:49',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\Harish2016Pemmasani',9,NULL),(79,'Harish2015Pemmasani',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-13 18:20:51',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\Harish2015Pemmasani',9,NULL),(80,'gfhgfhgfh',NULL,1,1,NULL,'No Run',NULL,9,'2016-10-13 18:27:18',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\gfhgfhgfh',9,NULL),(81,'vhgfhj542542',NULL,1,1,NULL,'RunOnSave',NULL,9,'2016-10-13 18:29:28',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\vhgfhj542542',9,NULL),(82,'EEEEEERampl',NULL,1,1,NULL,'RunOnSave',NULL,9,'2016-10-14 09:59:17',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\EEEEEERampl',9,NULL),(83,'cvbcvbcvb',NULL,1,1,NULL,'RunOnSave',NULL,9,'2016-10-14 10:01:47',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\cvbcvbcvb',9,NULL),(84,'cghgfnjgfngfnh',NULL,1,1,NULL,'DonotRun',NULL,9,'2016-10-14 10:15:39',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\cghgfnjgfngfnh',9,NULL),(85,'Ramprasadfdgdf',NULL,1,1,NULL,'RunOnSave',NULL,9,'2016-10-14 10:17:29',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\Ramprasadfdgdf',9,NULL),(86,'S2RunS2',NULL,1,1,NULL,'Progress',NULL,9,'2016-10-14 13:33:23',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\S2RunS2',9,NULL),(87,'S3RunS3',NULL,1,1,NULL,'Pending',NULL,9,'2016-10-14 13:35:05',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\S3RunS3',9,NULL),(88,'S4RunS4',NULL,1,1,NULL,'Pending',NULL,9,'2016-10-14 13:38:22',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\S4RunS4',9,NULL),(89,'S5SRunS5',NULL,1,1,NULL,'Pending',NULL,9,'2016-10-14 14:29:52',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\S5SRunS5',9,NULL),(90,'S6RunS6',NULL,1,1,NULL,'Pending',NULL,9,'2016-10-14 14:31:15',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\S6RunS6',9,NULL),(91,'Viswa1Run',NULL,1,1,NULL,'Pending',NULL,9,'2016-10-14 15:03:45',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\Viswa1Run',9,NULL),(92,'SmokeTest1',NULL,1,1,NULL,'SUCCESS',NULL,9,'2016-10-14 15:23:39',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\SmokeTest1',9,NULL),(93,'SmokeTest2',NULL,1,1,NULL,'SUCCESS',NULL,9,'2016-10-14 15:26:37',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\SmokeTest2',9,NULL),(94,'Smoketest3',NULL,1,1,NULL,'SUCCESS',NULL,9,'2016-10-14 15:31:10',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\Smoketest3',9,NULL),(95,'SmokeTest4',NULL,1,1,NULL,'SUCCESS',NULL,9,'2016-10-14 15:45:12',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\SmokeTest4',9,NULL),(96,'SmokeTest5',NULL,1,1,NULL,'SUCCESS',NULL,9,'2016-10-14 15:50:35',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\SmokeTest5',9,NULL),(97,'SmokeTest6',NULL,1,1,NULL,'SUCCESS',NULL,9,'2016-10-14 16:14:31',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\SmokeTest6',9,NULL),(98,'SmokeTest7',NULL,1,1,NULL,'SUCCESS',NULL,9,'2016-10-14 16:15:22',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\SmokeTest7',9,NULL),(99,'SmokeTest8',NULL,1,1,NULL,'SUCCESS',NULL,9,'2016-10-14 16:46:57',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Anuja_Saraf\\Cafe_Seetest\\SmokeTest8',9,NULL),(108,'SmokeTestRun1',NULL,1,1,NULL,'SUCCESS',NULL,6,'2016-10-15 09:57:45',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\COE\\Sowmya_Moolya\\Cafe_Seetest\\SmokeTestRun1',6,NULL),(109,'SmokeRun2',NULL,1,1,NULL,'SUCCESS',NULL,6,'2016-10-15 10:03:42',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\COE\\Sowmya_Moolya\\Cafe_Seetest\\SmokeRun2',6,NULL),(110,'SmokeRun3',NULL,1,1,NULL,'SUCCESS',NULL,6,'2016-10-15 10:04:24',NULL,NULL,'N','D:\\digi_workspace\\ContinonusDelivery\\COE\\Sowmya_Moolya\\Cafe_Seetest\\SmokeRun3',6,NULL),(111,'SmokeRun4',NULL,1,1,NULL,'SUCCESS',NULL,6,'2016-10-15 10:08:55',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\COE\\Sowmya_Moolya\\Cafe_Seetest\\SmokeRun4',6,NULL),(112,'SmokeRun5',NULL,1,1,NULL,'SUCCESS',NULL,6,'2016-10-15 10:09:39',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\COE\\Sowmya_Moolya\\Cafe_Seetest\\SmokeRun5',6,NULL),(113,'SmokeRun6',NULL,1,1,NULL,'SUCCESS',NULL,6,'2016-10-15 10:10:46',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\COE\\Sowmya_Moolya\\Cafe_Seetest\\SmokeRun6',6,NULL),(114,'fRam1SmokeTest',NULL,1,1,NULL,'SUCCESS',NULL,10,'2016-10-19 00:46:25',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Harish_Pemmasani\\Cafe_Seetest\\fRam1SmokeTest',10,NULL),(115,'Sowmya_SmokeTest',NULL,1,6,NULL,'Jenkins Offline',NULL,10,'2016-10-21 14:56:18',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Harish_Pemmasani\\Cucumber_mobile_web\\Sowmya_SmokeTest',10,NULL),(116,'Harish_Run1',NULL,1,6,NULL,'Jenkins Offline',NULL,10,'2016-10-21 14:58:04',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Harish_Pemmasani\\Cucumber_mobile_web\\Harish_Run1',10,NULL),(117,'Run1Name_Demo',NULL,1,6,NULL,'Jenkins Offline',NULL,10,'2016-10-21 17:14:05',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Harish_Pemmasani\\Cucumber_mobile_web\\Run1Name_Demo',10,NULL),(118,'Run2_Name_Schedule',NULL,1,6,NULL,'Jenkins Offline',NULL,10,'2016-10-21 17:15:30',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Harish_Pemmasani\\Cucumber_mobile_web\\Run2_Name_Schedule',10,NULL),(119,'SmokeRunner1',NULL,1,6,NULL,'Jenkins Offline',NULL,11,'2016-10-21 19:20:18',NULL,NULL,'Y','D:\\digi_workspace\\ContinonusDelivery\\DigiAssure\\Deepika_Govindaiah\\Cucumber_mobile_web\\SmokeRunner1',11,NULL);
/*!40000 ALTER TABLE `runs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcexecutionactions`
--

DROP TABLE IF EXISTS `tcexecutionactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcexecutionactions` (
  `tcexecutionactionid` int(11) NOT NULL AUTO_INCREMENT,
  `testcaseid` int(11) NOT NULL,
  `keywords` varchar(75) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `tcfail` varchar(2000) DEFAULT NULL,
  `tcpass` varchar(2000) DEFAULT NULL,
  `remarks` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`tcexecutionactionid`),
  KEY `testcaseid_tcexecutionactions_idx` (`testcaseid`),
  CONSTRAINT `testcaseid_tcexecutionactions` FOREIGN KEY (`testcaseid`) REFERENCES `testcases` (`testcasesid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcexecutionactions`
--

LOCK TABLES `tcexecutionactions` WRITE;
/*!40000 ALTER TABLE `tcexecutionactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcexecutionactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcases`
--

DROP TABLE IF EXISTS `testcases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcases` (
  `testcasesid` int(11) NOT NULL AUTO_INCREMENT,
  `testcasesname` varchar(250) DEFAULT NULL,
  `toollanguageid` int(11) NOT NULL,
  `executiondate` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `errormessage` varchar(2500) DEFAULT NULL,
  `testcasesremarks` varchar(45) DEFAULT NULL,
  `toolid` int(11) NOT NULL,
  `batchid` int(11) NOT NULL,
  PRIMARY KEY (`testcasesid`),
  KEY `toollanguageid_testcases_idx` (`toollanguageid`),
  KEY `toolid_testcases_idx` (`toolid`),
  CONSTRAINT `toolid_testcases` FOREIGN KEY (`toolid`) REFERENCES `tool` (`toolid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toollanguageid_testcases` FOREIGN KEY (`toollanguageid`) REFERENCES `toollanguage` (`toollanguageid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcases`
--

LOCK TABLES `testcases` WRITE;
/*!40000 ALTER TABLE `testcases` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool` (
  `toolid` int(11) NOT NULL AUTO_INCREMENT,
  `toolname` varchar(45) DEFAULT NULL,
  `tooldescription` varchar(100) DEFAULT NULL,
  `toolgroup` varchar(45) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`toolid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
INSERT INTO `tool` VALUES (1,'Cafe_Seetest','Capgemini Seetest Automation Tool','Capgemini',1,NULL,1,NULL,'Y','Automation'),(2,'Sprintest_Appium','IGATE Appium Framework','IGATE',1,NULL,1,NULL,'Y','Automation'),(3,'Cukes_Digital','Cukes Digital BDD framework','Capgemini',1,NULL,1,NULL,'Y','Automation'),(4,'AccessibilityTesting','Accessbility Testing','Capgemini',1,NULL,1,NULL,'Y','Manual'),(5,'MAC','IGATE Mobile Application Certifier','IGATE',1,NULL,1,NULL,'Y','Manual'),(6,'Cucumber_mobile_web','BDD Framework Mobile and Web Cucumber based','Capgemini/IGATE',1,NULL,1,NULL,'Y','Automation');
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toollanguage`
--

DROP TABLE IF EXISTS `toollanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toollanguage` (
  `toollanguageid` int(11) NOT NULL AUTO_INCREMENT,
  `toollanguagename` varchar(45) NOT NULL,
  `toolid` int(11) NOT NULL,
  `toollanguageremarks` varchar(2000) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`toollanguageid`),
  KEY `toolid_idx` (`toolid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toollanguage`
--

LOCK TABLES `toollanguage` WRITE;
/*!40000 ALTER TABLE `toollanguage` DISABLE KEYS */;
INSERT INTO `toollanguage` VALUES (1,'Java',1,'Cafe Seetest with Java','Y',1,NULL,1,NULL);
/*!40000 ALTER TABLE `toollanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toolusage`
--

DROP TABLE IF EXISTS `toolusage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toolusage` (
  `toolusageid` int(11) NOT NULL AUTO_INCREMENT,
  `toolid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `sessionid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`toolusageid`),
  KEY `toolid_idx` (`toolid`),
  KEY `userid_idx` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toolusage`
--

LOCK TABLES `toolusage` WRITE;
/*!40000 ALTER TABLE `toolusage` DISABLE KEYS */;
/*!40000 ALTER TABLE `toolusage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `userpassword` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `roleid` int(11) NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `projectid` int(11) NOT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `roleid_idx` (`roleid`),
  KEY `projectid_idx` (`projectid`),
  CONSTRAINT `projectid` FOREIGN KEY (`projectid`) REFERENCES `project` (`projectid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `roleid` FOREIGN KEY (`roleid`) REFERENCES `roles` (`roleid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'sowmya.moolya@capgemini.com','Sowmya@123','Sowmya','Moolya',1,2,'2016-10-06 12:04:00',NULL,NULL,'Y',2,NULL,'sowmya.moolya@capgemini.com'),(7,'tejasawani.devil@capgemini.com','eqhFyCWadF','tejaswini','devil',1,1,'2016-10-06 13:07:12',NULL,NULL,'N',1,NULL,'tejasawani.devil@capgemini.com'),(8,'ankita.wali@capgemini.com','Ankita@123','ankita','wali',1,2,'2016-10-06 21:20:51',NULL,NULL,'Y',1,NULL,'ankita.wali@capgemini.com'),(9,'anuja.saraf@capgemini.com','Anuja@123','Anuja','Saraf',1,1,'2016-10-07 15:56:46',NULL,NULL,'Y',1,NULL,'anuja.saraf@capgemini.com'),(10,'harish.a.pemmasani@capgemini.com','Harish@123','Harish','Pemmasani',1,1,'2016-10-19 00:34:30',NULL,NULL,'Y',1,NULL,'harish.a.pemmasani@capgemini.com'),(11,'deepika.govindaiah@capgemini.com','Deepika@123','Deepika','Govindaiah',1,2,'2016-10-20 12:40:15',NULL,NULL,'Y',1,NULL,'deepika.govindaiah@capgemini.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Device Selection Matrix tabels START


--
-- Table structure for table `dscandroid_version`
--

DROP TABLE IF EXISTS `dscandroid_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscandroid_version` (
  `Version_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Version_Name` varchar(20) NOT NULL,
  `Rate` decimal(5,3) NOT NULL,
  PRIMARY KEY (`Version_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscandroid_version`
--

LOCK TABLES `dscandroid_version` WRITE;
/*!40000 ALTER TABLE `dscandroid_version` DISABLE KEYS */;
INSERT INTO `dscandroid_version` VALUES (1,'2.2',0.001),(2,'2.3',0.017),(3,'3.x',0.000),(4,'4.1.x',0.060),(5,'4.2.x',0.083),(6,'4.3',0.024),(7,'4.4',0.292),(8,'5.0',0.141),(9,'5.1',0.214),(10,'Android M',0.152);
/*!40000 ALTER TABLE `dscandroid_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscuserandroid_version`
--

DROP TABLE IF EXISTS `dscuserandroid_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscuserandroid_version` (
  `Version_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Version_Name` varchar(20) NOT NULL,
  `Rate` decimal(5,3) NOT NULL,
  PRIMARY KEY (`Version_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscuserandroid_version`
--

LOCK TABLES `dscuserandroid_version` WRITE;
/*!40000 ALTER TABLE `dscuserandroid_version` DISABLE KEYS */;
INSERT INTO `dscuserandroid_version` VALUES (1,'2.2',0.001),(2,'2.3',0.017),(3,'3.x',0.000),(4,'4.1.x',0.060),(5,'4.2.x',0.083),(6,'4.3',0.024),(7,'4.4',0.292),(8,'5.0',0.141),(9,'5.1',0.214),(10,'Android M',0.152);
/*!40000 ALTER TABLE `dscuserandroid_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscbasic_device_details`
--

DROP TABLE IF EXISTS `dscbasic_device_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscbasic_device_details` (
  `Sr_No` int(11) NOT NULL AUTO_INCREMENT,
  `Vendor_ID` int(11) NOT NULL,
  `OS_ID` int(11) NOT NULL,
  `Version_ID` int(11) NOT NULL,
  `Version_Name` varchar(50) NOT NULL,
  `Model_name` varchar(500) NOT NULL,
  `Type` varchar(10) NOT NULL,
  `Resolution` varchar(50) NOT NULL,
  PRIMARY KEY (`Sr_No`)
) ENGINE=MyISAM AUTO_INCREMENT=234 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscbasic_device_details`
--

LOCK TABLES `dscbasic_device_details` WRITE;
/*!40000 ALTER TABLE `dscbasic_device_details` DISABLE KEYS */;
INSERT INTO `dscbasic_device_details` VALUES (1,1,1,3,'iOS 9.3','Apple iPhone SE','SP','640 x 1136'),(2,1,1,3,'iOS 9.3','Apple iPad Pro 9.7','TB','1536 x 2048'),(3,1,1,3,'iOS 9','Apple iPad Air 2','TB','1536 x 2048'),(4,1,1,3,'iOS 9','Apple iPad 3 Wi-Fi','TB','1536 x 2048'),(5,1,1,2,'iOS 8.2','Apple iPhone 5','SP','640 x 1136'),(6,1,1,2,'iOS 8.2','Apple iPhone 5c','SP','640 x 1136'),(7,1,1,3,'iOS 9','Apple iPhone 5s','SP','640 x 1136'),(8,1,1,3,'iOS 9','Apple iPhone 6','SP','750 x 1334'),(9,1,1,3,'iOS 9','Apple iPhone 6 Plus','SP','1080 x 1920'),(10,1,1,3,'iOS 9','Apple iPhone 6S','SP','750 x 1334'),(11,1,1,3,'iOS 9','Apple iPhone 6S Plus','SP','1080 x 1920'),(12,1,1,2,'iOS 8.1','Apple iPad mini 2','TB','1536 x 2048'),(13,1,1,2,'iOS 8.1','Apple iPad mini Wi-Fi','TB','768 x 1024'),(14,1,1,2,'iOS 8','Apple iPad 4 Wi-Fi','TB','1536 x 2048'),(15,1,1,3,'iOS 9','Apple iPad Air','TB','1536 x 2048'),(16,1,1,3,'iOS 9','Apple iPad mini 3','TB','1536 x 2048'),(17,1,1,2,'iOS 8.1','Apple iPhone 4s','SP','640 x 960 '),(18,1,1,2,'iOS 8.3','Apple iPad 2 Wi-Fi','TB','768 x 1024'),(19,1,1,1,'iOS 7','Apple iPhone 4','SP','640 x 960'),(20,1,1,3,'iOS 9','Apple iPad mini 4','TB','1536 x 2048'),(21,1,1,3,'iOS 9','Apple iPad Pro','TB','2048 x 2732'),(22,2,2,9,'v6.0 (Marshmallow)','Samsung Galaxy S7 edge','SP','1440 x 2560'),(23,2,2,9,'v6.0 (Marshmallow)','Samsung Galaxy S7  ','SP','1440 x 2560  '),(24,2,2,9,'v5.1.1 (Lollipop)','Samsung Galaxy J1','SP','480 x 800 '),(25,2,2,9,'v5.1.1 (Lollipop)','Samsung Galaxy A9','SP','1080 x 1920'),(26,2,2,9,'v5.1.1 (Lollipop)','Samsung Galaxy Tab E 8.0','TB','800 x 1280'),(27,2,2,9,'v5.1.1 (Lollipop)','Samsung Galaxy Tab A 7.0','TB','800 x 1280'),(28,2,2,9,'v5.1 (Lollipop)','Samsung Galaxy J1 Nxt','SP','480 x 800'),(29,2,2,9,'v5.1.1 (Lollipop)','Samsung Galaxy J3','SP','720 x 1280'),(30,2,2,9,'v6.0 (Marshmallow)','Samsung Galaxy On7 Pro','SP','720 x 1280'),(31,2,2,9,'v5.1 (Lollipop)','Samsung Galaxy On5','SP','720 x 1280'),(32,2,2,9,'v6.0 (Marshmallow)','Samsung Galaxy S6  ','SP','1440 x 2560  '),(33,2,2,9,'v6.0 (Marshmallow)','Samsung Galaxy S6 edge','SP','1440 x 2560'),(34,2,2,9,'v6.0 (Marshmallow)','Samsung Galaxy S6 edge+','SP','1440 x 2560'),(35,2,2,8,'v5.0.2 (Lollipop)','Samsung Galaxy Tab S 8.4','TB','1600 x 2560'),(36,2,2,8,'v5.0.2 (Lollipop)','Samsung Galaxy Tab S 10.5','TB','2560 x 1600'),(37,2,2,9,'v5.1.1 (Lollipop)','Samsung Galaxy On7','SP','1280 x 720'),(38,2,2,9,'v5.1 (Lollipop)','Samsung Galaxy J2','SP','540 x 960'),(39,2,2,8,'v5.0.2 (Lollipop)','Samsung Galaxy A3','SP','540 x 960'),(40,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Tab 4 7.0','TB','800 x 1280 '),(41,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy S5(Active)','SP','1080 x 1920'),(42,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy S5(Sport)','SP','1080 x 1920'),(43,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy S5','SP','1080 x 1920'),(44,2,2,5,'v4.2(Jelly Bean)','Samsung Galaxy Mega 6.3','SP','720 x 1280'),(45,2,2,5,'v4.2(Jelly Bean)','Samsung I9500 Galaxy S4','SP','1080 x 1920'),(46,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy Core Prime','SP','480 x 800  '),(47,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy E7','SP','720 x 1280'),(48,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy Note 4','SP','1440 x 2560'),(49,2,2,6,'v4.3 (Jelly Bean)','Samsung Galaxy Note 3','SP','1080 x 1920'),(50,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Grand 2','SP','720 x 1280'),(51,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Tab 4 10.1','TB','1280 x 800'),(52,2,2,7,'v4.4 (KitKat)','Samsung Galaxy Tab® Pro 12.2','TB','2560 x 1600'),(53,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy E5','SP','720 x 1280'),(54,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy A7','SP','1080 x 1920 '),(55,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Core II','SP','480 x 800'),(56,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy Grand Neo','SP','480 x 800'),(57,2,2,8,'v5.0.2 (Lollipop)','Samsung Galaxy Alpha','SP','720 x 1280'),(58,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy Grand Max','SP','720 x 1280'),(59,2,2,7,'v4.4.4 (KitKat)','Samsung I9300I Galaxy S3 Neo','SP','720 x 1280'),(60,2,2,7,'v4.4.2 (KitKat)','Samsung I9190 Galaxy S4 mini','SP','540 x 960'),(61,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy V','SP','480 x 800'),(62,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Note 3 Neo','SP','720 x 1280'),(63,2,2,5,'v4.2(Jelly Bean)','Samsung Galaxy S Duos 2 S7582','SP','480 x 800'),(64,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy Grand Prime ','SP','540 x 960'),(65,2,2,7,'v4.4 (KitKat)','Samsung Galaxy Tab 3 V','TB','600 x 1024'),(66,2,2,8,'v5.0.2 (Lollipop)','Samsung Galaxy Tab S 8.4 LTE','TB','1600 x 2560'),(67,2,2,8,'v5.0 (Lollipop)','Samsung Galaxy Tab A 9.7','TB','768 x 1024'),(68,2,2,8,'v5.0 (Lollipop)','Samsung Galaxy Tab A 8.0','TB','768 x 1024'),(69,2,2,8,'v5.0.2 (Lollipop)','Samsung Galaxy Tab S 10.5 LTE','TB','2560 x 1600'),(70,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Tab 4 7.0 3G','TB','800 x 1280'),(71,2,2,7,'v4.2 (Jelly Bean)','Samsung Galaxy Tab 3 Lite 7.0','TB','600 x 1024'),(72,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Core2(DUOS)','SP','480 x 800'),(73,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy A5','SP','720 x 1280'),(74,2,2,8,'v5.0 (Lollipop)','Samsung I9500 Galaxy S4','SP','1080 x 1920'),(75,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy J1','SP','480 x 800'),(76,3,2,9,'v6.0 (Marshmallow)','LG Stylus 2 Plus','SP','1080 x 1920'),(77,3,2,9,'v5.1.1 (Lollipop)','LG K5','SP','480 x 854'),(78,3,2,10,'v6.0 (Marshmallow)','LG G5','SP','1440 x 2560'),(79,3,2,9,'v5.1.1 (Lollipop)','LG K10','SP','720 x 1280'),(80,3,2,10,'v6.0 (Marshmallow)','LG Google Nexus 5X','SP','1080 x 1920'),(81,3,2,9,'v6.0 (Marshmallow)','LG G4','SP','1440 x 2560'),(82,3,2,7,'v4.4.2 (KitKat)','LG G2 mini','SP','540 x 960'),(83,3,2,4,'v4.1.2 (Jelly Bean)','LG Optimus L5','SP','480 x 800'),(84,3,2,9,'v5.1.1 (Lollipop)','LG Ray','SP','720 x 1280'),(85,3,2,7,'v4.4.2 (KitKat)','LG G3','SP','1440 x 2560'),(86,3,2,7,'v4.4.2 (KitKat)','LG G3 S','SP','720 x 1280'),(87,3,2,7,'v4.4.2 (KitKat)','LG G3 Stylus','SP','540 x 960'),(88,3,2,9,'v6.0 (Marshmallow)','LG X screen','SP','720 x 1280'),(89,3,2,8,'v5.0.1 (Lollipop)','LG G Flex2','SP','1080 x 1920'),(90,3,2,8,'v5.0 (Lollipop)','LG G4 Stylus','SP','720 x 1280'),(91,3,2,8,'v5.0.1 (Lollipop)','LG Leon','SP','480 x 854'),(92,3,2,7,'v4.4.2 (KitKat)','LG L Bello','SP','480 x 854 '),(93,3,2,8,'v5.0.1 (Lollipop)','LG Spirit','SP','720 x 1280 '),(94,3,2,8,'v5.0 (Lollipop)','LG G4c','SP','720 x 1280'),(95,3,2,7,'v4.4.2 (KitKat)','LG L70 Dual D325','SP','480 x 800'),(96,3,2,8,'v5.0.1 (Lollipop)','LG Magna','SP','720 x 1280'),(97,3,2,8,'v5.0 (Lollipop)','LG G Stylo (CDMA)','SP','720 x 1280'),(98,3,2,7,'v4.4.2 (KitKat)','LG L Fino','SP','480 x 800'),(99,3,2,7,'v4.4.2 (KitKat)','LG L90 D405','SP','540 x 960'),(100,3,2,7,'v4.4.2 (KitKat)','LG G Pro 2','SP','1080 x 1920'),(101,3,2,7,'v4.4.2 (KitKat)','LG G3 Dual-LTE  ','SP','1440 x 2560'),(102,3,2,7,'v4.4.2 (KitKat)','LG F60','SP','480 x 800'),(103,3,2,7,'v4.4.2 (KitKat)','LG L90 Dual D410','SP','540 x 960'),(104,3,2,7,'v4.4.2 (KitKat)','LG AKA','SP','720 x 1280'),(105,3,2,7,'v4.4.2 (KitKat)','LG G Pad 7.0','TB','800 x 1280'),(106,3,2,7,'v4.4.2 (KitKat)','LG G Pad 8.0','TB','800 x 1280'),(107,3,2,7,'v4.4.2 (KitKat)','LG G Pad 8.0 LTE','TB','800 x 1280'),(108,3,2,7,'v4.4.2 (KitKat)','LG G Pad 10.1','TB','1280 x 800'),(109,3,2,7,'v4.4.2 (KitKat)','LG G Pad 7.0 LTE','TB','800 x 1280'),(110,3,2,5,'v4.2(Jelly Bean)','LG G Pad 8.3 LTE','TB','1200 x 1920'),(111,4,2,9,'v6.0 (Marshmallow)','Moto G4 plus','SP','1080 x 1920'),(112,4,2,9,'v6.0 (Marshmallow)','Moto G4 plus','SP','1080 x 1920'),(113,4,2,9,'v5.1.1 (Lollipop)','Motorola Moto G Turbo Edition','SP','720 x 1280'),(114,4,2,7,'v5.0 (Lollipop)','Motorola Moto G (3nd gen)','SP','720 x 1280'),(115,4,2,8,'v5.0 (Lollipop)','Motorola Moto E (3nd gen)','SP','540 x 960'),(116,4,2,7,'v4.4.4 (KitKat)','Motorola Moto G (2nd gen)','SP','720 x 1280'),(117,4,2,8,'v5.0 (Lollipop)','Motorola Moto E (2nd gen)','SP','540 x 960'),(118,4,2,8,'v6.0 (Marshmallow)','Motorola Nexus 6','SP','1440 x 2560'),(119,4,2,7,'v4.4.2 (KitKat)','Motorola Moto E','SP','540 x 960'),(120,4,2,9,'v5.1.1 (Lollipop)','Motorola Moto X Style','SP','1440 x 2560'),(121,4,2,9,'v5.1.1 (Lollipop)','Motorola Moto X Play','SP','1080 x 1920'),(122,4,2,9,'v5.1.1 (Lollipop)','Motorola Moto X Force','SP','1440 x 2560'),(123,4,2,7,'v4.4.4 (KitKat)','Motorola Moto X (2nd Gen)','SP','1080 x 1920'),(124,4,2,8,'v5.0.2 (Lollipop)','Motorola Moto G 4G Dual SIM (2nd gen)','SP','720 x 1280'),(125,4,2,7,'v4.4.2 (KitKat)','Motorola Moto G 4G','SP','720 x 1280'),(126,4,2,7,'v4.4.4 (KitKat)','Motorola DROID Turbo','SP','1440 x 2560'),(127,4,2,7,'v4.4.2 (KitKat)','Motorola Moto E Dual SIM','SP','540 x 960'),(128,4,2,7,'v4.2 (Jelly Bean)','Motorola DROID Ultra','SP','720 x 1280 '),(129,4,2,8,'v5.0.2 (Lollipop)','Motorola Moto G 4G (2nd gen)','SP','720 x 1280'),(130,4,2,7,'v4.4.4 (KitKat)','Motorola Moto Maxx','SP','1440 x 2560'),(131,4,2,8,'v5.0 (Lollipop)','Motorola Moto E Dual SIM (2nd gen)','SP','540 x 960'),(132,4,2,7,'v4.4.2 (KitKat)','Motorola Moto G Dual SIM','SP','720 x 1280'),(133,4,2,7,'v4.4.2 (KitKat)','Motorola Luge','SP','540 x 960'),(134,4,2,3,'v3.2 (Honeycomb)','Motorola XOOM 2 MZ615','TB','800 x 1280'),(135,4,2,3,'v3.2 (Honeycomb)','Motorola DROID XYBOARD 10.1 MZ617','TB','800 x 1280'),(136,4,2,3,'v3.2 (Honeycomb)','Motorola XOOM 2 3G MZ616','TB','800 x 1280'),(137,4,2,3,'v3.2 (Honeycomb)','Motorola XOOM 2 Media Edition 3G MZ608','TB','800 x 1280'),(138,4,2,3,'v3.2 (Honeycomb)','Motorola DROID XYBOARD 8.2 MZ609','TB','800 x 1280'),(139,4,2,3,'v3.0 (Honeycomb)','Motorola XOOM MZ600','TB','800 x 1280'),(140,4,2,3,'v3.1 (Honeycomb)','Motorola XOOM Media Edition MZ505','TB','800 x 1280'),(141,5,2,8,'v5.1.1 (Lollipop)','HTC One M9 Prime Camera','SP','1080 x 1920'),(142,5,2,8,'v6.0 (Marshmallow)','HTC One X9','SP','1080 x 1920'),(143,5,2,8,'v5.1.1 (Lollipop)','HTC One M9s','SP','1080 x 1920'),(144,5,2,8,'v6.0 (Marshmallow)','HTC One A9','SP','1080 x 1920'),(145,5,2,8,'v5.0.2 (Lollipop)','HTC One ME','SP','1440 x 2560'),(146,5,2,8,'v6.0 (Marshmallow)','HTC Desire 825','SP','720 x 1280'),(147,5,2,8,'v5.0 (Lollipop)','HTC Butterfly 3','SP','1440 x 2560'),(148,5,2,8,'v5.0.2 (Lollipop)','HTC One M9+','SP','1440 x 2560'),(149,5,2,8,'v5.0 (Lollipop)','HTC One M8s','SP','1080 x 1920'),(150,5,2,5,'v4.2 (Jelly Bean)','HTC One M7','SP','1920 x 1080'),(151,5,2,7,'v4.4.4 (KitKat)','HTC Desire 620G dual sim','SP','720 x 1280'),(152,5,2,7,'v4.4.2 (KitKat)','HTC Desire 820','SP','720 x 1280'),(153,5,2,7,'v4.4.2 (KitKat)','HTC Desire 510','SP','480 x 854'),(154,5,2,8,'v5.0 (Lollipop)','HTC Nexus 9','TB','1536 x 2048'),(155,5,2,7,'v4.4.4 (KitKat)','HTC Desire 820s dual sim','SP','720 x 1280'),(156,5,2,7,'v4.4.4 (KitKat)','HTC Desire 626G+','SP','720 x 1280'),(157,5,2,7,'v4.4.2 (KitKat)','HTC Desire 626','SP','720 x 1280'),(158,5,2,8,'v5.0.1 (Lollipop)','HTC Desire 526G+ dual sim','SP','540 x 960'),(159,5,2,7,'v4.4.2 (KitKat)','HTC Desire 826 dual sim','SP','1080 x 1920'),(160,5,2,7,'v4.4.2 (KitKat)','HTC Desire 320','SP','480 x 854'),(161,5,2,8,'v5.0 (Lollipop)','HTC One E9+','SP','1440 x 2560'),(162,5,2,7,'v4.4.4 (KitKat)','HTC Desire 620 dual sim','SP','720 x 1280'),(163,5,2,8,'v6.0 (Marshmallow)','HTC Nexus 9','SP','1536 x 2048'),(164,5,2,7,'v4.4.2 (KitKat)','HTC Desire 816G dual sim','SP','720 x 1280'),(165,5,2,7,'v4.4.4 (KitKat)','HTC One (M8 Eye)','SP','1080 x 1920'),(166,5,2,7,'v4.4.4 (KitKat)','HTC Desire Eye','SP','1080 x 1920'),(167,5,2,7,'v4.4.2 (KitKat)','HTC Desire 612','SP','540 x 960'),(168,5,2,7,'v4.4.2 (KitKat)','HTC Desire 820q dual sim','SP','720 x 1280'),(169,5,2,7,'v4.4.2 (KitKat)','HTC Desire 820 dual sim','SP','720 x 1280'),(170,5,2,8,'v5.0 (Lollipop)','HTC One M9','SP','1080 x 1920'),(171,5,2,7,'v4.4.2 (KitKat)','HTC One (E8) CDMA','SP','1080 x 1920'),(172,5,2,7,'v4.4.2 (KitKat)','HTC Desire 326G dual sim','SP','480 x 854'),(173,5,2,3,'v3.1 (Honeycomb)','HTC Jetstream','TB','800 x 1280'),(174,5,2,3,'v2.4 (Gingerbread)','HTC EVO View 4G','TB','600 x 1024'),(175,5,2,2,' v2.3.3 (Gingerbread)','HTC Flyer Wi-Fi','TB','600 x 1024'),(176,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 730 Dual SIM','SP','720 x 1280 '),(177,7,4,1,'Microsoft Windows Phone 8','Nokia Lumia 520','SP','480 x 800'),(178,7,4,2,'Microsoft Windows Phone 10','Nokia Lumia 930','SP','1080 x 1920'),(179,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 630','SP','480 x 854'),(180,7,4,1,'Microsoft Windows Phone 8','Nokia Lumia 625','SP','480 x 800'),(181,7,2,4,'v4.1.2 (Jelly Bean)','Nokia XL','SP','480 x 800'),(182,7,2,6,'v4.3 (Jelly Bean)','Nokia X2 Dual SIM','SP','481 x 800'),(183,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 635','SP','480 x 854'),(184,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 830','SP','720 x 1280'),(185,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 530','SP','480 x 854'),(186,7,2,4,'v4.1.2 (Jelly Bean)','Nokia X','SP','480 x 800 '),(187,7,4,2,'Microsoft Windows Phone 10','Nokia Lumia 735','SP','720 x 1280'),(188,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 638','SP','480 x 854'),(189,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 630 Dual SIM','SP','480 x 854'),(190,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 530 Dual SIM','SP','480 x 854'),(191,7,4,1,'Microsoft Windows Phone 8','Nokia Lumia Icon','SP','1080 x 1920 '),(192,7,2,4,'v4.1.2 (Jelly Bean)','Nokia X+','SP','480 x 800'),(193,7,2,8,'v5.0 (Lollipop)','Nokia N1','TB','1536 x 2048 '),(194,7,4,5,'Microsoft Windows RT','Nokia Lumia 2520','TB','1080 x 1920'),(195,7,4,3,'Internet Tablet OS 2007 edition','Nokia N800','TB','480 x 800'),(196,7,4,4,'Internet Tablet OS 2008 edition','Nokia N810','TB','480 x 800'),(197,8,2,8,'v6.0 (Marshmallow)','Nexus 6P','SP','1440 x 2560'),(198,8,2,8,'v6.0 (Marshmallow)','Nexus 5X','SP','1080 x 1920'),(199,8,2,8,'v6.0 (Marshmallow)','Google Nexus 6','SP','1440 x 2560'),(200,8,2,7,'v6.0 (Marshmallow)','Google Nexus 5','SP','1080 x 1920'),(201,8,2,5,'v4.2 (Jelly Bean)','Google Nexus 4','SP','768 x 1280'),(202,8,2,2,'v2.3 (Gingerbread)','Google Nexus S 4G','SP','480 x 800'),(203,8,2,2,'v2.3 (Gingerbread)','Google Nexus S','SP','480 x 800'),(204,8,2,8,'v6.0 (Marshmallow)','Google Nexus 9','TB','1536 x 2048'),(205,8,2,5,'v4.2 (Jelly Bean)','Google Nexus 10','TB','2560 x 1600'),(206,8,2,4,'v6.0 (Marshmallow)','Google Nexus 7','TB','1280 x 800'),(207,9,5,2,'Android OS 5.1','BlackBerry Priv','SP','1440 x 2560'),(208,9,5,2,'BlackBerry OS 10.3.1','BlackBerry Leap','SP','720 x 1280'),(209,9,5,2,'BlackBerry OS 10.3','BlackBerry Passport','SP','1440 x 1440'),(210,9,5,2,'BlackBerry OS 10.2.1','BlackBerry Z3','SP','540 x 960'),(211,9,5,2,'BlackBerry OS 10.2','BlackBerry Z30','SP','720 x 1280'),(212,9,5,2,'BlackBerry OS 10.2','BlackBerry Q5','SP','720 x 720'),(213,9,5,1,'BlackBerry OS 7.1','BlackBerry Curve 9320','SP','320 x 240'),(214,9,5,1,'BlackBerry OS 7','BlackBerry Bold Touch 9900','SP','640 x 480'),(215,9,5,1,'BlackBerry OS 7','BlackBerry Torch 9860','SP','480 x 800'),(216,9,5,1,'BlackBerry OS 7','BlackBerry Curve 9360','SP','480 x 360'),(217,9,5,2,'BlackBerry OS 10.3.1','BlackBerry Classic Non Camera','SP','720 x 720'),(218,9,5,2,'BlackBerry OS 10.3.1','BlackBerry Classic','SP','720 x 720'),(219,9,5,2,'BlackBerry OS 10.3.1','BlackBerry Porsche Design P\'9983','SP','720 x 720'),(220,9,5,2,'BlackBerry OS 10.2','BlackBerry Porsche Design P\'9982','SP','768 x 1280'),(221,9,5,1,'BlackBerry OS 7.1','BlackBerry 9720','SP','480 x 360'),(222,9,5,2,'BlackBerry OS 10','BlackBerry Z10','SP','768 x 1280'),(223,9,5,2,'BlackBerry OS 10','BlackBerry Q10','SP','720 x 720'),(224,9,5,1,'BlackBerry OS 7.1','BlackBerry Curve 9220','SP','320 x 240'),(225,9,5,1,'BlackBerry OS 7','BlackBerry Curve 9380','SP','360 x 480'),(226,9,5,1,'BlackBerry OS 7','BlackBerry Porsche Design P\'9981','SP','640 x 480'),(227,9,5,1,'BlackBerry OS 7','BlackBerry Curve 9370','SP','480 x 360'),(228,9,5,1,'BlackBerry OS 7','BlackBerry Curve 9350','SP','480 x 360'),(229,9,5,3,'BlackBerry Tablet OS v2.0','BlackBerry 4G LTE PlayBook','TB','600 x 1024'),(230,9,5,3,'BlackBerry Tablet OS','BlackBerry PlayBook','TB','600 x 1024'),(231,9,5,3,'BlackBerry Tablet OS','BlackBerry 4G PlayBook HSPA+','TB','600 x 1024'),(232,9,5,3,'BlackBerry Tablet OS','BlackBerry PlayBook WiMax','TB','600 x 1024'),(233,9,5,3,'BlackBerry Tablet OS v2.0','BlackBerry PlayBook 2012','TB','600 x 1024');
/*!40000 ALTER TABLE `dscbasic_device_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscblackberry_version`
--

DROP TABLE IF EXISTS `dscblackberry_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscblackberry_version` (
  `Version_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Version_Name` varchar(50) NOT NULL,
  `Rate` decimal(5,3) NOT NULL,
  PRIMARY KEY (`Version_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscblackberry_version`
--

LOCK TABLES `dscblackberry_version` WRITE;
/*!40000 ALTER TABLE `dscblackberry_version` DISABLE KEYS */;
INSERT INTO `dscblackberry_version` VALUES (1,'Blacberry 7',0.000),(2,'Blacberry 10',0.000),(3,'Tablet OS',0.000);
/*!40000 ALTER TABLE `dscblackberry_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscconsolidated_data`
--

DROP TABLE IF EXISTS `dscconsolidated_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscconsolidated_data` (
  `Sr_No` int(11) NOT NULL AUTO_INCREMENT,
  `Vendor_ID` int(11) NOT NULL,
  `OS_ID` int(11) NOT NULL,
  `Version_ID` int(11) NOT NULL,
  `Version_Name` varchar(100) NOT NULL,
  `Model_name` varchar(500) NOT NULL,
  `Type` varchar(5) NOT NULL,
  `Resolution` varchar(20) NOT NULL,
  `Priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sr_No`)
) ENGINE=MyISAM AUTO_INCREMENT=234 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscconsolidated_data`
--

LOCK TABLES `dscconsolidated_data` WRITE;
/*!40000 ALTER TABLE `dscconsolidated_data` DISABLE KEYS */;
INSERT INTO `dscconsolidated_data` VALUES (1,1,1,3,'iOS 9.3','Apple iPhone SE','SP','640 x 1136',1),(2,1,1,3,'iOS 9.3','Apple iPad Pro 9.7','TB','1536 x 2048',1),(3,1,1,3,'iOS 9','Apple iPad Air 2','TB','1536 x 2048',1),(4,1,1,3,'iOS 9','Apple iPad 3 Wi-Fi','TB','1536 x 2048',1),(5,1,1,3,'iOS 9','Apple iPhone 5s','SP','640 x 1136',1),(6,1,1,3,'iOS 9','Apple iPhone 6','SP','750 x 1334',1),(7,1,1,3,'iOS 9','Apple iPhone 6 Plus','SP','1080 x 1920',1),(8,1,1,3,'iOS 9','Apple iPhone 6S','SP','750 x 1334',1),(9,1,1,3,'iOS 9','Apple iPhone 6S Plus','SP','1080 x 1920',1),(10,1,1,3,'iOS 9','Apple iPad Air','TB','1536 x 2048',1),(11,1,1,3,'iOS 9','Apple iPad mini 3','TB','1536 x 2048',1),(12,1,1,3,'iOS 9','Apple iPad mini 4','TB','1536 x 2048',1),(13,1,1,3,'iOS 9','Apple iPad Pro','TB','2048 x 2732',1),(14,1,1,2,'iOS 8.2','Apple iPhone 5','SP','640 x 1136',1),(15,1,1,2,'iOS 8.2','Apple iPhone 5c','SP','640 x 1136',1),(16,1,1,2,'iOS 8.1','Apple iPad mini 2','TB','1536 x 2048',1),(17,1,1,2,'iOS 8.1','Apple iPad mini Wi-Fi','TB','768 x 1024',1),(18,1,1,2,'iOS 8','Apple iPad 4 Wi-Fi','TB','1536 x 2048',1),(19,1,1,2,'iOS 8.1','Apple iPhone 4s','SP','640 x 960 ',1),(20,1,1,2,'iOS 8.3','Apple iPad 2 Wi-Fi','TB','768 x 1024',1),(21,1,1,1,'iOS 7','Apple iPhone 4','SP','640 x 960',2),(22,2,2,9,'v6.0 (Marshmallow)','Samsung Galaxy S7 edge','SP','1440 x 2560',1),(23,2,2,9,'v6.0 (Marshmallow)','Samsung Galaxy S7  ','SP','1440 x 2560  ',1),(24,2,2,9,'v5.1.1 (Lollipop)','Samsung Galaxy J1','SP','480 x 800 ',1),(25,2,2,9,'v5.1.1 (Lollipop)','Samsung Galaxy A9','SP','1080 x 1920',1),(26,2,2,9,'v5.1.1 (Lollipop)','Samsung Galaxy Tab E 8.0','TB','800 x 1280',1),(27,2,2,9,'v5.1.1 (Lollipop)','Samsung Galaxy Tab A 7.0','TB','800 x 1280',1),(28,2,2,9,'v5.1 (Lollipop)','Samsung Galaxy J1 Nxt','SP','480 x 800',1),(29,2,2,9,'v5.1.1 (Lollipop)','Samsung Galaxy J3','SP','720 x 1280',1),(30,2,2,9,'v6.0 (Marshmallow)','Samsung Galaxy On7 Pro','SP','720 x 1280',1),(31,2,2,9,'v5.1 (Lollipop)','Samsung Galaxy On5','SP','720 x 1280',1),(32,2,2,9,'v6.0 (Marshmallow)','Samsung Galaxy S6  ','SP','1440 x 2560  ',1),(33,2,2,9,'v6.0 (Marshmallow)','Samsung Galaxy S6 edge','SP','1440 x 2560',1),(34,2,2,9,'v6.0 (Marshmallow)','Samsung Galaxy S6 edge+','SP','1440 x 2560',1),(35,2,2,9,'v5.1.1 (Lollipop)','Samsung Galaxy On7','SP','1280 x 720',1),(36,2,2,9,'v5.1 (Lollipop)','Samsung Galaxy J2','SP','540 x 960',1),(37,2,2,8,'v5.0.2 (Lollipop)','Samsung Galaxy Tab S 8.4','TB','1600 x 2560',1),(38,2,2,8,'v5.0.2 (Lollipop)','Samsung Galaxy Tab S 10.5','TB','2560 x 1600',1),(39,2,2,8,'v5.0.2 (Lollipop)','Samsung Galaxy A3','SP','540 x 960',1),(40,2,2,8,'v5.0.2 (Lollipop)','Samsung Galaxy Alpha','SP','720 x 1280',1),(41,2,2,8,'v5.0.2 (Lollipop)','Samsung Galaxy Tab S 8.4 LTE','TB','1600 x 2560',1),(42,2,2,8,'v5.0 (Lollipop)','Samsung Galaxy Tab A 9.7','TB','768 x 1024',1),(43,2,2,8,'v5.0 (Lollipop)','Samsung Galaxy Tab A 8.0','TB','768 x 1024',1),(44,2,2,8,'v5.0.2 (Lollipop)','Samsung Galaxy Tab S 10.5 LTE','TB','2560 x 1600',1),(45,2,2,8,'v5.0 (Lollipop)','Samsung I9500 Galaxy S4','SP','1080 x 1920',1),(46,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Tab 4 7.0','TB','800 x 1280 ',1),(47,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy S5(Active)','SP','1080 x 1920',1),(48,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy S5(Sport)','SP','1080 x 1920',1),(49,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy S5','SP','1080 x 1920',1),(50,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy Core Prime','SP','480 x 800  ',1),(51,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy E7','SP','720 x 1280',1),(52,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy Note 4','SP','1440 x 2560',1),(53,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Grand 2','SP','720 x 1280',1),(54,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Tab 4 10.1','TB','1280 x 800',1),(55,2,2,7,'v4.4 (KitKat)','Samsung Galaxy Tab® Pro 12.2','TB','2560 x 1600',1),(56,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy E5','SP','720 x 1280',1),(57,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy A7','SP','1080 x 1920 ',1),(58,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Core II','SP','480 x 800',1),(59,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy Grand Neo','SP','480 x 800',1),(60,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy Grand Max','SP','720 x 1280',1),(61,2,2,7,'v4.4.4 (KitKat)','Samsung I9300I Galaxy S3 Neo','SP','720 x 1280',1),(62,2,2,7,'v4.4.2 (KitKat)','Samsung I9190 Galaxy S4 mini','SP','540 x 960',1),(63,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy V','SP','480 x 800',1),(64,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Note 3 Neo','SP','720 x 1280',1),(65,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy Grand Prime ','SP','540 x 960',1),(66,2,2,7,'v4.4 (KitKat)','Samsung Galaxy Tab 3 V','TB','600 x 1024',1),(67,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Tab 4 7.0 3G','TB','800 x 1280',1),(68,2,2,7,'v4.2 (Jelly Bean)','Samsung Galaxy Tab 3 Lite 7.0','TB','600 x 1024',1),(69,2,2,7,'v4.4.2 (KitKat)','Samsung Galaxy Core2(DUOS)','SP','480 x 800',1),(70,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy A5','SP','720 x 1280',1),(71,2,2,7,'v4.4.4 (KitKat)','Samsung Galaxy J1','SP','480 x 800',1),(72,2,2,6,'v4.3 (Jelly Bean)','Samsung Galaxy Note 3','SP','1080 x 1920',2),(73,2,2,5,'v4.2(Jelly Bean)','Samsung Galaxy Mega 6.3','SP','720 x 1280',2),(74,2,2,5,'v4.2(Jelly Bean)','Samsung I9500 Galaxy S4','SP','1080 x 1920',2),(75,2,2,5,'v4.2(Jelly Bean)','Samsung Galaxy S Duos 2 S7582','SP','480 x 800',2),(76,3,2,10,'v6.0 (Marshmallow)','LG G5','SP','1440 x 2560',1),(77,3,2,10,'v6.0 (Marshmallow)','LG Google Nexus 5X','SP','1080 x 1920',1),(78,3,2,9,'v6.0 (Marshmallow)','LG Stylus 2 Plus','SP','1080 x 1920',1),(79,3,2,9,'v5.1.1 (Lollipop)','LG K5','SP','480 x 854',1),(80,3,2,9,'v5.1.1 (Lollipop)','LG K10','SP','720 x 1280',1),(81,3,2,9,'v6.0 (Marshmallow)','LG G4','SP','1440 x 2560',1),(82,3,2,9,'v5.1.1 (Lollipop)','LG Ray','SP','720 x 1280',1),(83,3,2,9,'v6.0 (Marshmallow)','LG X screen','SP','720 x 1280',1),(84,3,2,8,'v5.0.1 (Lollipop)','LG G Flex2','SP','1080 x 1920',1),(85,3,2,8,'v5.0 (Lollipop)','LG G4 Stylus','SP','720 x 1280',1),(86,3,2,8,'v5.0.1 (Lollipop)','LG Leon','SP','480 x 854',1),(87,3,2,8,'v5.0.1 (Lollipop)','LG Spirit','SP','720 x 1280 ',1),(88,3,2,8,'v5.0 (Lollipop)','LG G4c','SP','720 x 1280',1),(89,3,2,8,'v5.0.1 (Lollipop)','LG Magna','SP','720 x 1280',1),(90,3,2,8,'v5.0 (Lollipop)','LG G Stylo (CDMA)','SP','720 x 1280',1),(91,3,2,7,'v4.4.2 (KitKat)','LG G2 mini','SP','540 x 960',1),(92,3,2,7,'v4.4.2 (KitKat)','LG G3','SP','1440 x 2560',1),(93,3,2,7,'v4.4.2 (KitKat)','LG G3 S','SP','720 x 1280',1),(94,3,2,7,'v4.4.2 (KitKat)','LG G3 Stylus','SP','540 x 960',1),(95,3,2,7,'v4.4.2 (KitKat)','LG L Bello','SP','480 x 854 ',1),(96,3,2,7,'v4.4.2 (KitKat)','LG L70 Dual D325','SP','480 x 800',1),(97,3,2,7,'v4.4.2 (KitKat)','LG L Fino','SP','480 x 800',1),(98,3,2,7,'v4.4.2 (KitKat)','LG L90 D405','SP','540 x 960',1),(99,3,2,7,'v4.4.2 (KitKat)','LG G Pro 2','SP','1080 x 1920',1),(100,3,2,7,'v4.4.2 (KitKat)','LG G3 Dual-LTE  ','SP','1440 x 2560',1),(101,3,2,7,'v4.4.2 (KitKat)','LG F60','SP','480 x 800',1),(102,3,2,7,'v4.4.2 (KitKat)','LG L90 Dual D410','SP','540 x 960',1),(103,3,2,7,'v4.4.2 (KitKat)','LG AKA','SP','720 x 1280',1),(104,3,2,7,'v4.4.2 (KitKat)','LG G Pad 7.0','TB','800 x 1280',1),(105,3,2,7,'v4.4.2 (KitKat)','LG G Pad 8.0','TB','800 x 1280',1),(106,3,2,7,'v4.4.2 (KitKat)','LG G Pad 8.0 LTE','TB','800 x 1280',1),(107,3,2,7,'v4.4.2 (KitKat)','LG G Pad 10.1','TB','1280 x 800',1),(108,3,2,7,'v4.4.2 (KitKat)','LG G Pad 7.0 LTE','TB','800 x 1280',1),(109,3,2,5,'v4.2(Jelly Bean)','LG G Pad 8.3 LTE','TB','1200 x 1920',2),(110,3,2,4,'v4.1.2 (Jelly Bean)','LG Optimus L5','SP','480 x 800',2),(111,4,2,9,'v6.0 (Marshmallow)','Moto G4 plus','SP','1080 x 1920',0),(112,4,2,9,'v6.0 (Marshmallow)','Moto G4 plus','SP','1080 x 1920',0),(113,4,2,9,'v5.1.1 (Lollipop)','Motorola Moto G Turbo Edition','SP','720 x 1280',1),(114,4,2,9,'v5.1.1 (Lollipop)','Motorola Moto X Style','SP','1440 x 2560',1),(115,4,2,9,'v5.1.1 (Lollipop)','Motorola Moto X Play','SP','1080 x 1920',1),(116,4,2,9,'v5.1.1 (Lollipop)','Motorola Moto X Force','SP','1440 x 2560',1),(117,4,2,8,'v5.0 (Lollipop)','Motorola Moto E (3nd gen)','SP','540 x 960',1),(118,4,2,8,'v5.0 (Lollipop)','Motorola Moto E (2nd gen)','SP','540 x 960',1),(119,4,2,8,'v6.0 (Marshmallow)','Motorola Nexus 6','SP','1440 x 2560',1),(120,4,2,8,'v5.0.2 (Lollipop)','Motorola Moto G 4G Dual SIM (2nd gen)','SP','720 x 1280',1),(121,4,2,8,'v5.0.2 (Lollipop)','Motorola Moto G 4G (2nd gen)','SP','720 x 1280',1),(122,4,2,8,'v5.0 (Lollipop)','Motorola Moto E Dual SIM (2nd gen)','SP','540 x 960',1),(123,4,2,7,'v5.0 (Lollipop)','Motorola Moto G (3nd gen)','SP','720 x 1280',1),(124,4,2,7,'v4.4.4 (KitKat)','Motorola Moto G (2nd gen)','SP','720 x 1280',1),(125,4,2,7,'v4.4.2 (KitKat)','Motorola Moto E','SP','540 x 960',1),(126,4,2,7,'v4.4.4 (KitKat)','Motorola Moto X (2nd Gen)','SP','1080 x 1920',1),(127,4,2,7,'v4.4.2 (KitKat)','Motorola Moto G 4G','SP','720 x 1280',1),(128,4,2,7,'v4.4.4 (KitKat)','Motorola DROID Turbo','SP','1440 x 2560',1),(129,4,2,7,'v4.4.2 (KitKat)','Motorola Moto E Dual SIM','SP','540 x 960',1),(130,4,2,7,'v4.2 (Jelly Bean)','Motorola DROID Ultra','SP','720 x 1280 ',1),(131,4,2,7,'v4.4.4 (KitKat)','Motorola Moto Maxx','SP','1440 x 2560',1),(132,4,2,7,'v4.4.2 (KitKat)','Motorola Moto G Dual SIM','SP','720 x 1280',1),(133,4,2,7,'v4.4.2 (KitKat)','Motorola Luge','SP','540 x 960',1),(134,4,2,3,'v3.2 (Honeycomb)','Motorola XOOM 2 MZ615','TB','800 x 1280',3),(135,4,2,3,'v3.2 (Honeycomb)','Motorola DROID XYBOARD 10.1 MZ617','TB','800 x 1280',3),(136,4,2,3,'v3.2 (Honeycomb)','Motorola XOOM 2 3G MZ616','TB','800 x 1280',3),(137,4,2,3,'v3.2 (Honeycomb)','Motorola XOOM 2 Media Edition 3G MZ608','TB','800 x 1280',3),(138,4,2,3,'v3.2 (Honeycomb)','Motorola DROID XYBOARD 8.2 MZ609','TB','800 x 1280',3),(139,4,2,3,'v3.0 (Honeycomb)','Motorola XOOM MZ600','TB','800 x 1280',3),(140,4,2,3,'v3.1 (Honeycomb)','Motorola XOOM Media Edition MZ505','TB','800 x 1280',3),(141,5,2,8,'v5.1.1 (Lollipop)','HTC One M9 Prime Camera','SP','1080 x 1920',1),(142,5,2,8,'v6.0 (Marshmallow)','HTC One X9','SP','1080 x 1920',1),(143,5,2,8,'v5.1.1 (Lollipop)','HTC One M9s','SP','1080 x 1920',1),(144,5,2,8,'v6.0 (Marshmallow)','HTC One A9','SP','1080 x 1920',1),(145,5,2,8,'v5.0.2 (Lollipop)','HTC One ME','SP','1440 x 2560',1),(146,5,2,8,'v6.0 (Marshmallow)','HTC Desire 825','SP','720 x 1280',1),(147,5,2,8,'v5.0 (Lollipop)','HTC Butterfly 3','SP','1440 x 2560',1),(148,5,2,8,'v5.0.2 (Lollipop)','HTC One M9+','SP','1440 x 2560',1),(149,5,2,8,'v5.0 (Lollipop)','HTC One M8s','SP','1080 x 1920',1),(150,5,2,8,'v5.0 (Lollipop)','HTC Nexus 9','TB','1536 x 2048',1),(151,5,2,8,'v5.0.1 (Lollipop)','HTC Desire 526G+ dual sim','SP','540 x 960',1),(152,5,2,8,'v5.0 (Lollipop)','HTC One E9+','SP','1440 x 2560',1),(153,5,2,8,'v6.0 (Marshmallow)','HTC Nexus 9','SP','1536 x 2048',1),(154,5,2,8,'v5.0 (Lollipop)','HTC One M9','SP','1080 x 1920',1),(155,5,2,7,'v4.4.4 (KitKat)','HTC Desire 620G dual sim','SP','720 x 1280',1),(156,5,2,7,'v4.4.2 (KitKat)','HTC Desire 820','SP','720 x 1280',1),(157,5,2,7,'v4.4.2 (KitKat)','HTC Desire 510','SP','480 x 854',1),(158,5,2,7,'v4.4.4 (KitKat)','HTC Desire 820s dual sim','SP','720 x 1280',1),(159,5,2,7,'v4.4.4 (KitKat)','HTC Desire 626G+','SP','720 x 1280',1),(160,5,2,7,'v4.4.2 (KitKat)','HTC Desire 626','SP','720 x 1280',1),(161,5,2,7,'v4.4.2 (KitKat)','HTC Desire 826 dual sim','SP','1080 x 1920',1),(162,5,2,7,'v4.4.2 (KitKat)','HTC Desire 320','SP','480 x 854',1),(163,5,2,7,'v4.4.4 (KitKat)','HTC Desire 620 dual sim','SP','720 x 1280',1),(164,5,2,7,'v4.4.2 (KitKat)','HTC Desire 816G dual sim','SP','720 x 1280',1),(165,5,2,7,'v4.4.4 (KitKat)','HTC One (M8 Eye)','SP','1080 x 1920',1),(166,5,2,7,'v4.4.4 (KitKat)','HTC Desire Eye','SP','1080 x 1920',1),(167,5,2,7,'v4.4.2 (KitKat)','HTC Desire 612','SP','540 x 960',1),(168,5,2,7,'v4.4.2 (KitKat)','HTC Desire 820q dual sim','SP','720 x 1280',1),(169,5,2,7,'v4.4.2 (KitKat)','HTC Desire 820 dual sim','SP','720 x 1280',1),(170,5,2,7,'v4.4.2 (KitKat)','HTC One (E8) CDMA','SP','1080 x 1920',1),(171,5,2,7,'v4.4.2 (KitKat)','HTC Desire 326G dual sim','SP','480 x 854',1),(172,5,2,5,'v4.2 (Jelly Bean)','HTC One M7','SP','1920 x 1080',2),(173,5,2,3,'v3.1 (Honeycomb)','HTC Jetstream','TB','800 x 1280',3),(174,5,2,3,'v2.4 (Gingerbread)','HTC EVO View 4G','TB','600 x 1024',3),(175,5,2,2,' v2.3.3 (Gingerbread)','HTC Flyer Wi-Fi','TB','600 x 1024',3),(176,7,2,8,'v5.0 (Lollipop)','Nokia N1','TB','1536 x 2048 ',1),(177,7,2,6,'v4.3 (Jelly Bean)','Nokia X2 Dual SIM','SP','481 x 800',2),(178,7,2,4,'v4.1.2 (Jelly Bean)','Nokia XL','SP','480 x 800',2),(179,7,2,4,'v4.1.2 (Jelly Bean)','Nokia X','SP','480 x 800 ',2),(180,7,2,4,'v4.1.2 (Jelly Bean)','Nokia X+','SP','480 x 800',2),(181,7,4,5,'Microsoft Windows RT','Nokia Lumia 2520','TB','1080 x 1920',3),(182,7,4,4,'Internet Tablet OS 2008 edition','Nokia N810','TB','480 x 800',3),(183,7,4,3,'Internet Tablet OS 2007 edition','Nokia N800','TB','480 x 800',3),(184,7,4,2,'Microsoft Windows Phone 10','Nokia Lumia 930','SP','1080 x 1920',3),(185,7,4,2,'Microsoft Windows Phone 10','Nokia Lumia 735','SP','720 x 1280',3),(186,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 730 Dual SIM','SP','720 x 1280 ',3),(187,7,4,1,'Microsoft Windows Phone 8','Nokia Lumia 520','SP','480 x 800',3),(188,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 630','SP','480 x 854',3),(189,7,4,1,'Microsoft Windows Phone 8','Nokia Lumia 625','SP','480 x 800',3),(190,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 635','SP','480 x 854',3),(191,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 830','SP','720 x 1280',3),(192,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 530','SP','480 x 854',3),(193,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 638','SP','480 x 854',3),(194,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 630 Dual SIM','SP','480 x 854',3),(195,7,4,1,'Microsoft Windows Phone 8.1','Nokia Lumia 530 Dual SIM','SP','480 x 854',3),(196,7,4,1,'Microsoft Windows Phone 8','Nokia Lumia Icon','SP','1080 x 1920 ',3),(197,8,2,8,'v6.0 (Marshmallow)','Nexus 6P','SP','1440 x 2560',0),(198,8,2,8,'v6.0 (Marshmallow)','Nexus 5X','SP','1080 x 1920',0),(199,8,2,8,'v6.0 (Marshmallow)','Google Nexus 6','SP','1440 x 2560',1),(200,8,2,8,'v6.0 (Marshmallow)','Google Nexus 9','TB','1536 x 2048',1),(201,8,2,7,'v6.0 (Marshmallow)','Google Nexus 5','SP','1080 x 1920',1),(202,8,2,5,'v4.2 (Jelly Bean)','Google Nexus 4','SP','768 x 1280',2),(203,8,2,5,'v4.2 (Jelly Bean)','Google Nexus 10','TB','2560 x 1600',2),(204,8,2,4,'v6.0 (Marshmallow)','Google Nexus 7','TB','1280 x 800',2),(205,8,2,2,'v2.3 (Gingerbread)','Google Nexus S 4G','SP','480 x 800',3),(206,8,2,2,'v2.3 (Gingerbread)','Google Nexus S','SP','480 x 800',3),(207,9,5,3,'BlackBerry Tablet OS v2.0','BlackBerry 4G LTE PlayBook','TB','600 x 1024',3),(208,9,5,3,'BlackBerry Tablet OS','BlackBerry PlayBook','TB','600 x 1024',3),(209,9,5,3,'BlackBerry Tablet OS','BlackBerry 4G PlayBook HSPA+','TB','600 x 1024',3),(210,9,5,3,'BlackBerry Tablet OS','BlackBerry PlayBook WiMax','TB','600 x 1024',3),(211,9,5,3,'BlackBerry Tablet OS v2.0','BlackBerry PlayBook 2012','TB','600 x 1024',3),(212,9,5,2,'Android OS 5.1','BlackBerry Priv','SP','1440 x 2560',3),(213,9,5,2,'BlackBerry OS 10.3.1','BlackBerry Leap','SP','720 x 1280',3),(214,9,5,2,'BlackBerry OS 10.3','BlackBerry Passport','SP','1440 x 1440',3),(215,9,5,2,'BlackBerry OS 10.2.1','BlackBerry Z3','SP','540 x 960',3),(216,9,5,2,'BlackBerry OS 10.2','BlackBerry Z30','SP','720 x 1280',3),(217,9,5,2,'BlackBerry OS 10.2','BlackBerry Q5','SP','720 x 720',3),(218,9,5,2,'BlackBerry OS 10.3.1','BlackBerry Classic Non Camera','SP','720 x 720',3),(219,9,5,2,'BlackBerry OS 10.3.1','BlackBerry Classic','SP','720 x 720',3),(220,9,5,2,'BlackBerry OS 10.3.1','BlackBerry Porsche Design P\'9983','SP','720 x 720',3),(221,9,5,2,'BlackBerry OS 10.2','BlackBerry Porsche Design P\'9982','SP','768 x 1280',3),(222,9,5,2,'BlackBerry OS 10','BlackBerry Z10','SP','768 x 1280',3),(223,9,5,2,'BlackBerry OS 10','BlackBerry Q10','SP','720 x 720',3),(224,9,5,1,'BlackBerry OS 7.1','BlackBerry Curve 9320','SP','320 x 240',3),(225,9,5,1,'BlackBerry OS 7','BlackBerry Bold Touch 9900','SP','640 x 480',3),(226,9,5,1,'BlackBerry OS 7','BlackBerry Torch 9860','SP','480 x 800',3),(227,9,5,1,'BlackBerry OS 7','BlackBerry Curve 9360','SP','480 x 360',3),(228,9,5,1,'BlackBerry OS 7.1','BlackBerry 9720','SP','480 x 360',3),(229,9,5,1,'BlackBerry OS 7.1','BlackBerry Curve 9220','SP','320 x 240',3),(230,9,5,1,'BlackBerry OS 7','BlackBerry Curve 9380','SP','360 x 480',3),(231,9,5,1,'BlackBerry OS 7','BlackBerry Porsche Design P\'9981','SP','640 x 480',3),(232,9,5,1,'BlackBerry OS 7','BlackBerry Curve 9370','SP','480 x 360',3),(233,9,5,1,'BlackBerry OS 7','BlackBerry Curve 9350','SP','480 x 360',3);
/*!40000 ALTER TABLE `dscconsolidated_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscdevice_os`
--

DROP TABLE IF EXISTS `dscdevice_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscdevice_os` (
  `OS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OS_Name` varchar(20) NOT NULL,
  `Month` varchar(50) NOT NULL,
  `Value` double NOT NULL,
  PRIMARY KEY (`OS_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscdevice_os`
--

LOCK TABLES `dscdevice_os` WRITE;
/*!40000 ALTER TABLE `dscdevice_os` DISABLE KEYS */;
INSERT INTO `dscdevice_os` VALUES (1,'iOS','2015-07',56.57),(2,'iOS','2015-08',57.31),(3,'iOS','2015-09',56.97),(4,'iOS','2015-10',56.69),(5,'iOS','2015-11',57.86),(6,'iOS','2015-12',57.79),(7,'iOS','2016-01',58.7),(8,'iOS','2016-02',58.82),(9,'iOS','2016-03',57.65),(10,'iOS','2016-04',57.87),(11,'iOS','2016-05',58.11),(12,'iOS','2016-06',58.48),(13,'iOS','2016-07',57.24),(14,'Android','2015-07',39.63),(15,'Android','2015-08',39.07),(16,'Android','2015-09',39.78),(17,'Android','2015-10',40.36),(18,'Android','2015-11',39.49),(19,'Android','2015-12',39.58),(20,'Android','2016-01',39.16),(21,'Android','2016-02',39.22),(22,'Android','2016-03',40.67),(23,'Android','2016-04',40.52),(24,'Android','2016-05',40.31),(25,'Android','2016-06',40.05),(26,'Android','2016-07',41.42),(27,'Linux','2015-07',1.6),(28,'Linux','2015-08',1.53),(29,'Linux','2015-09',1.14),(30,'Linux','2015-10',0.7),(31,'Linux','2015-11',0.64),(32,'Linux','2015-12',0.5),(33,'Linux','2016-01',0.37),(34,'Linux','2016-02',0.27),(35,'Linux','2016-03',0.13),(36,'Linux','2016-04',0.11),(37,'Linux','2016-05',0.1),(38,'Linux','2016-06',0.1),(39,'Linux','2016-07',0.09),(40,'Windows Phone','2015-07',1.23),(41,'Windows Phone','2015-08',1.19),(42,'Windows Phone','2015-09',1.23),(43,'Windows Phone','2015-10',1.29),(44,'Windows Phone','2015-11',1.2),(45,'Windows Phone','2015-12',1.27),(46,'Windows Phone','2016-01',1.03),(47,'Windows Phone','2016-02',0.97),(48,'Windows Phone','2016-03',0.86),(49,'Windows Phone','2016-04',0.81),(50,'Windows Phone','2016-05',0.8),(51,'Windows Phone','2016-06',0.74),(52,'Windows Phone','2016-07',0.67),(53,'BlackBerry OS','2015-07',0.31),(54,'BlackBerry OS','2015-08',0.27),(55,'BlackBerry OS','2015-09',0.23),(56,'BlackBerry OS','2015-10',0.27),(57,'BlackBerry OS','2015-11',0.22),(58,'BlackBerry OS','2015-12',0.29),(59,'BlackBerry OS','2016-01',0.19),(60,'BlackBerry OS','2016-02',0.19),(61,'BlackBerry OS','2016-03',0.16),(62,'BlackBerry OS','2016-04',0.18),(63,'BlackBerry OS','2016-05',0.19),(64,'BlackBerry OS','2016-06',0.16),(65,'BlackBerry OS','2016-07',0.14);
/*!40000 ALTER TABLE `dscdevice_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscdevice_vendor`
--

DROP TABLE IF EXISTS `dscdevice_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscdevice_vendor` (
  `Sr_No` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_ID` int(10) NOT NULL,
  `OS_ID` int(11) NOT NULL,
  `Month` date NOT NULL,
  `Value` double NOT NULL,
  PRIMARY KEY (`Sr_No`),
  KEY `vendor_ID` (`vendor_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscdevice_vendor`
--

LOCK TABLES `dscdevice_vendor` WRITE;
/*!40000 ALTER TABLE `dscdevice_vendor` DISABLE KEYS */;
INSERT INTO `dscdevice_vendor` VALUES (1,1,1,'2014-06-01',67.88),(2,1,1,'2014-07-01',57.88),(3,1,1,'2014-08-01',69.88),(4,1,1,'2014-09-01',57.88),(5,1,1,'2014-10-01',64.21),(6,1,1,'2014-11-01',55.98),(7,1,1,'2014-12-01',66.98),(8,1,1,'2015-01-01',67.98),(9,1,1,'2015-02-01',52.86),(10,1,1,'2015-03-01',67.88),(11,1,1,'2015-04-01',67.45),(12,1,1,'2015-05-01',73.45),(13,1,1,'2015-06-01',64.35),(14,2,2,'2014-06-01',67.35),(15,2,2,'2014-07-01',59.45),(16,2,2,'2014-08-01',59.28),(17,2,2,'2014-09-01',63.28),(18,2,2,'2014-10-01',65.37),(19,2,2,'2014-11-01',27.37),(20,2,2,'2014-12-01',28.27),(21,2,2,'2015-01-01',34.21),(22,2,2,'2015-02-01',36.81),(23,2,2,'2015-03-01',19.26),(24,2,2,'2015-04-01',23.18),(25,2,2,'2015-05-01',26.18),(26,2,2,'2015-06-01',19.38);
/*!40000 ALTER TABLE `dscdevice_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscios_version`
--

DROP TABLE IF EXISTS `dscios_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscios_version` (
  `Version_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Version_Name` varchar(20) NOT NULL,
  `Rate` decimal(5,3) NOT NULL,
  PRIMARY KEY (`Version_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscios_version`
--

LOCK TABLES `dscios_version` WRITE;
/*!40000 ALTER TABLE `dscios_version` DISABLE KEYS */;
INSERT INTO `dscios_version` VALUES (1,'iOS7',0.030),(2,'iOS8',0.100),(3,'iOS9',0.870);
/*!40000 ALTER TABLE `dscios_version` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `dscuserios_version`
--

DROP TABLE IF EXISTS `dscuserios_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscuserios_version` (
  `Version_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Version_Name` varchar(20) NOT NULL,
  `Rate` decimal(5,3) NOT NULL,
  PRIMARY KEY (`Version_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscuserios_version`
--

LOCK TABLES `dscuserios_version` WRITE;
/*!40000 ALTER TABLE `dscuserios_version` DISABLE KEYS */;
INSERT INTO `dscuserios_version` VALUES (1,'iOS7',0.030),(2,'iOS8',0.100),(3,'iOS9',0.870);
/*!40000 ALTER TABLE `dscuserios_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscmicrosoft_windows_version`
--

DROP TABLE IF EXISTS `dscmicrosoft_windows_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscmicrosoft_windows_version` (
  `Version_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Version_Name` varchar(50) NOT NULL,
  `Rate` decimal(5,3) NOT NULL,
  PRIMARY KEY (`Version_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscmicrosoft_windows_version`
--

LOCK TABLES `dscmicrosoft_windows_version` WRITE;
/*!40000 ALTER TABLE `dscmicrosoft_windows_version` DISABLE KEYS */;
INSERT INTO `dscmicrosoft_windows_version` VALUES (1,'Microsoft Windows 8',0.000),(2,'Microsoft Windows 10',0.000),(3,'Internet Tablet OS 2007',0.000),(4,'Internet Tablet OS 2008',0.000),(5,'Microsoft Windows RT',0.000);
/*!40000 ALTER TABLE `dscmicrosoft_windows_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscos_details`
--

DROP TABLE IF EXISTS `dscos_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscos_details` (
  `OS_ID` int(10) NOT NULL AUTO_INCREMENT,
  `OS_Name` varchar(100) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`OS_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscos_details`
--

LOCK TABLES `dscos_details` WRITE;
/*!40000 ALTER TABLE `dscos_details` DISABLE KEYS */;
INSERT INTO `dscos_details` VALUES (1,'iOS',NULL),(2,'Android',NULL),(3,'Linux',NULL),(4,'Windows Phone',NULL),(5,'BlackBerry OS',NULL);
/*!40000 ALTER TABLE `dscos_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscos_marketshare`
--

DROP TABLE IF EXISTS `dscos_marketshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscos_marketshare` (
  `Sr_No` int(11) NOT NULL,
  `OS_Name` varchar(50) NOT NULL,
  `Month` varchar(50) NOT NULL,
  `Value` double NOT NULL,
  PRIMARY KEY (`Sr_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscos_marketshare`
--

LOCK TABLES `dscos_marketshare` WRITE;
/*!40000 ALTER TABLE `dscos_marketshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `dscos_marketshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsctemp_data`
--

DROP TABLE IF EXISTS `dsctemp_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsctemp_data` (
  `Sr_No` int(11) NOT NULL AUTO_INCREMENT,
  `Model_name` varchar(100) NOT NULL,
  `OS_ID` int(11) NOT NULL,
  `Version_ID` int(11) NOT NULL,
  PRIMARY KEY (`Sr_No`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsctemp_data`
--

LOCK TABLES `dsctemp_data` WRITE;
/*!40000 ALTER TABLE `dsctemp_data` DISABLE KEYS */;
INSERT INTO `dsctemp_data` VALUES (1,'Apple iPhone SE',1,3),(2,'Apple iPhone 5s',1,3),(4,'Apple iPad Pro 9.7',1,3),(5,'Apple iPad Air 2',1,3);
/*!40000 ALTER TABLE `dsctemp_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscukdevice_os`
--

DROP TABLE IF EXISTS `dscukdevice_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscukdevice_os` (
  `OS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OS_Name` varchar(20) NOT NULL,
  `Month` varchar(50) NOT NULL,
  `Value` double NOT NULL,
  PRIMARY KEY (`OS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscukdevice_os`
--

LOCK TABLES `dscukdevice_os` WRITE;
/*!40000 ALTER TABLE `dscukdevice_os` DISABLE KEYS */;
INSERT INTO `dscukdevice_os` VALUES (1,'iOS','2015-07',55.58),(2,'iOS','2015-08',54.79),(3,'iOS','2015-09',54.65),(4,'iOS','2015-10',53.68),(5,'iOS','2015-11',53.98),(6,'iOS','2015-12',53.15),(7,'iOS','2016-01',54.22),(8,'iOS','2016-02',53.7),(9,'iOS','2016-03',52.66),(10,'iOS','2016-04',52.11),(11,'iOS','2016-05',52.43),(12,'iOS','2016-06',53.11),(13,'iOS','2016-07',51.48),(14,'Android','2015-07',34.79),(15,'Android','2015-08',34.47),(16,'Android','2015-09',34.66),(17,'Android','2015-10',36.29),(18,'Android','2015-11',36.92),(19,'Android','2015-12',37.89),(20,'Android','2016-01',37.65),(21,'Android','2016-02',38.36),(22,'Android','2016-03',39.72),(23,'Android','2016-04',40.04),(24,'Android','2016-05',39.68),(25,'Android','2016-06',40.4),(26,'Android','2016-07',42.16),(27,'BlackBerry OS','2015-07',4.89),(28,'BlackBerry OS','2015-08',5.55),(29,'BlackBerry OS','2015-09',5.69),(30,'BlackBerry OS','2015-10',5.31),(31,'BlackBerry OS','2015-11',4.39),(32,'BlackBerry OS','2015-12',4.34),(33,'BlackBerry OS','2016-01',3.97),(34,'BlackBerry OS','2016-02',3.87),(35,'BlackBerry OS','2016-03',3.84),(36,'BlackBerry OS','2016-04',4.02),(37,'BlackBerry OS','2016-05',4.1),(38,'BlackBerry OS','2016-06',3.19),(39,'BlackBerry OS','2016-07',3.02),(40,'Windows Phone','2015-07',2.08),(41,'Windows Phone','2015-08',2.35),(42,'Windows Phone','2015-09',2.44),(43,'Windows Phone','2015-10',2.45),(44,'Windows Phone','2015-11',2.43),(45,'Windows Phone','2015-12',2.56),(46,'Windows Phone','2016-01',2.41),(47,'Windows Phone','2016-02',2.39),(48,'Windows Phone','2016-03',2.21),(49,'Windows Phone','2016-04',2.17),(50,'Windows Phone','2016-05',2.13),(51,'Windows Phone','2016-06',2.13),(52,'Windows Phone','2016-07',2.11),(53,'Linux','2015-07',1.75),(54,'Linux','2015-08',1.87),(55,'Linux','2015-09',1.52),(56,'Linux','2015-10',1.03),(57,'Linux','2015-11',0.92),(58,'Linux','2015-12',0.67),(59,'Linux','2016-01',0.46),(60,'Linux','2016-02',0.37),(61,'Linux','2016-03',0.22),(62,'Linux','2016-04',0.2),(63,'Linux','2016-05',0.19),(64,'Linux','2016-06',0.18),(65,'Linux','2016-07',0.18);
/*!40000 ALTER TABLE `dscukdevice_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscukvendor_marketshare`
--

DROP TABLE IF EXISTS `dscukvendor_marketshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscukvendor_marketshare` (
  `Sr_No` int(11) NOT NULL AUTO_INCREMENT,
  `Vendor_Name` varchar(50) NOT NULL,
  `Month` varchar(50) NOT NULL,
  `Value` double NOT NULL,
  PRIMARY KEY (`Sr_No`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscukvendor_marketshare`
--

LOCK TABLES `dscukvendor_marketshare` WRITE;
/*!40000 ALTER TABLE `dscukvendor_marketshare` DISABLE KEYS */;
INSERT INTO `dscukvendor_marketshare` VALUES (1,'Apple','2015-07',55.58),(2,'Apple','2015-08',54.79),(3,'Apple','2015-09',54.65),(4,'Apple','2015-10',53.68),(5,'Apple','2015-11',53.98),(6,'Apple','2015-12',53.15),(7,'Apple','2016-01',54.22),(8,'Apple','2016-02',53.7),(9,'Apple','2016-03',52.66),(10,'Apple','2016-04',52.11),(11,'Apple','2016-05',52.43),(12,'Apple','2016-06',53.11),(13,'Apple','2016-07',51.48),(14,'Samsung','2015-07',19.03),(15,'Samsung','2015-08',19.46),(16,'Samsung','2015-09',20.07),(17,'Samsung','2015-10',21.13),(18,'Samsung','2015-11',21.9),(19,'Samsung','2015-12',22.17),(20,'Samsung','2016-01',21.72),(21,'Samsung','2016-02',22.24),(22,'Samsung','2016-03',23.39),(23,'Samsung','2016-04',23.64),(24,'Samsung','2016-05',23.49),(25,'Samsung','2016-06',23.81),(26,'Samsung','2016-07',24.78),(27,'RIM','2015-07',5.23),(28,'RIM','2015-08',5.95),(29,'RIM','2015-09',6.18),(30,'RIM','2015-10',5.82),(31,'RIM','2015-11',4.74),(32,'RIM','2015-12',4.72),(33,'RIM','2016-01',4.3),(34,'RIM','2016-02',4.2),(35,'RIM','2016-03',4.24),(36,'RIM','2016-04',4.47),(37,'RIM','2016-05',4.58),(38,'RIM','2016-06',3.44),(39,'RIM','2016-07',3.23),(40,'HTC','2015-07',2.87),(41,'HTC','2015-08',2.43),(42,'HTC','2015-09',2.33),(43,'HTC','2015-10',2.32),(44,'HTC','2015-11',2.23),(45,'HTC','2015-12',2.27),(46,'HTC','2016-01',2.11),(47,'HTC','2016-02',2.11),(48,'HTC','2016-03',2.07),(49,'HTC','2016-04',2.02),(50,'HTC','2016-05',1.93),(51,'HTC','2016-06',1.9),(52,'HTC','2016-07',1.92),(53,'Unknown','2015-07',2.59),(54,'Unknown','2015-08',2.53),(55,'Unknown','2015-09',2.58),(56,'Unknown','2015-10',2.96),(57,'Unknown','2015-11',3.27),(58,'Unknown','2015-12',3.8),(59,'Unknown','2016-01',4.27),(60,'Unknown','2016-02',4.3),(61,'Unknown','2016-03',3.73),(62,'Unknown','2016-04',3.96),(63,'Unknown','2016-05',4.02),(64,'Unknown','2016-06',4.06),(65,'Unknown','2016-07',4.49),(66,'Nokia','2015-07',1.78),(67,'Nokia','2015-08',1.93),(68,'Nokia','2015-09',1.95),(69,'Nokia','2015-10',1.94),(70,'Nokia','2015-11',1.92),(71,'Nokia','2015-12',1.97),(72,'Nokia','2016-01',1.78),(73,'Nokia','2016-02',1.72),(74,'Nokia','2016-03',1.56),(75,'Nokia','2016-04',1.52),(76,'Nokia','2016-05',1.47),(77,'Nokia','2016-06',1.39),(78,'Nokia','2016-07',1.38),(79,'Amazon','2015-07',1.74),(80,'Amazon','2015-08',1.85),(81,'Amazon','2015-09',1.59),(82,'Amazon','2015-10',1.26),(83,'Amazon','2015-11',1.17),(84,'Amazon','2015-12',1.04),(85,'Amazon','2016-01',1.04),(86,'Amazon','2016-02',1.02),(87,'Amazon','2016-03',0.96),(88,'Amazon','2016-04',0.96),(89,'Amazon','2016-05',0.9),(90,'Amazon','2016-06',0.91),(91,'Amazon','2016-07',0.86),(92,'Google','2015-07',1.34),(93,'Google','2015-08',1.43),(94,'Google','2015-09',1.27),(95,'Google','2015-10',1.25),(96,'Google','2015-11',1.2),(97,'Google','2015-12',1.23),(98,'Google','2016-01',1.1),(99,'Google','2016-02',1.07),(100,'Google','2016-03',1.03),(101,'Google','2016-04',1.02),(102,'Google','2016-05',0.97),(103,'Google','2016-06',0.95),(104,'Google','2016-07',0.96),(105,'Motorola','2015-07',0.87),(106,'Motorola','2015-08',0.89),(107,'Motorola','2015-09',0.91),(108,'Motorola','2015-10',0.92),(109,'Motorola','2015-11',0.88),(110,'Motorola','2015-12',0.89),(111,'Motorola','2016-01',0.87),(112,'Motorola','2016-02',0.89),(113,'Motorola','2016-03',0.9),(114,'Motorola','2016-04',0.91),(115,'Motorola','2016-05',0.89),(116,'Motorola','2016-06',0.92),(117,'Motorola','2016-07',1.02),(118,'LG','2015-07',0.88),(119,'LG','2015-08',0.99),(120,'LG','2015-09',0.92),(121,'LG','2015-10',0.95),(122,'LG','2015-11',0.95),(123,'LG','2015-12',0.99),(124,'LG','2016-01',0.99),(125,'LG','2016-02',1.02),(126,'LG','2016-03',1.08),(127,'LG','2016-04',1.07),(128,'LG','2016-05',1.08),(129,'LG','2016-06',1.15),(130,'LG','2016-07',1.24);
/*!40000 ALTER TABLE `dscukvendor_marketshare` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `dscglobaldevice_os`
--

DROP TABLE IF EXISTS `dscglobaldevice_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscglobaldevice_os` (
  `OS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OS_Name` varchar(20) NOT NULL,
  `Month` varchar(50) NOT NULL,
  `Value` double NOT NULL,
  PRIMARY KEY (`OS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscglobaldevice_os`
--

LOCK TABLES `dscglobaldevice_os` WRITE;
/*!40000 ALTER TABLE `dscglobaldevice_os` DISABLE KEYS */;
INSERT INTO `dscglobaldevice_os` VALUES (1,'iOS','2015-07',55.58),(2,'iOS','2015-08',54.79),(3,'iOS','2015-09',54.65),(4,'iOS','2015-10',53.68),(5,'iOS','2015-11',53.98),(6,'iOS','2015-12',53.15),(7,'iOS','2016-01',54.22),(8,'iOS','2016-02',53.7),(9,'iOS','2016-03',52.66),(10,'iOS','2016-04',52.11),(11,'iOS','2016-05',52.43),(12,'iOS','2016-06',53.11),(13,'iOS','2016-07',51.48),(14,'Android','2015-07',34.79),(15,'Android','2015-08',34.47),(16,'Android','2015-09',34.66),(17,'Android','2015-10',36.29),(18,'Android','2015-11',36.92),(19,'Android','2015-12',37.89),(20,'Android','2016-01',37.65),(21,'Android','2016-02',38.36),(22,'Android','2016-03',39.72),(23,'Android','2016-04',40.04),(24,'Android','2016-05',39.68),(25,'Android','2016-06',40.4),(26,'Android','2016-07',42.16),(27,'BlackBerry OS','2015-07',4.89),(28,'BlackBerry OS','2015-08',5.55),(29,'BlackBerry OS','2015-09',5.69),(30,'BlackBerry OS','2015-10',5.31),(31,'BlackBerry OS','2015-11',4.39),(32,'BlackBerry OS','2015-12',4.34),(33,'BlackBerry OS','2016-01',3.97),(34,'BlackBerry OS','2016-02',3.87),(35,'BlackBerry OS','2016-03',3.84),(36,'BlackBerry OS','2016-04',4.02),(37,'BlackBerry OS','2016-05',4.1),(38,'BlackBerry OS','2016-06',3.19),(39,'BlackBerry OS','2016-07',3.02),(40,'Windows Phone','2015-07',2.08),(41,'Windows Phone','2015-08',2.35),(42,'Windows Phone','2015-09',2.44),(43,'Windows Phone','2015-10',2.45),(44,'Windows Phone','2015-11',2.43),(45,'Windows Phone','2015-12',2.56),(46,'Windows Phone','2016-01',2.41),(47,'Windows Phone','2016-02',2.39),(48,'Windows Phone','2016-03',2.21),(49,'Windows Phone','2016-04',2.17),(50,'Windows Phone','2016-05',2.13),(51,'Windows Phone','2016-06',2.13),(52,'Windows Phone','2016-07',2.11),(53,'Linux','2015-07',1.75),(54,'Linux','2015-08',1.87),(55,'Linux','2015-09',1.52),(56,'Linux','2015-10',1.03),(57,'Linux','2015-11',0.92),(58,'Linux','2015-12',0.67),(59,'Linux','2016-01',0.46),(60,'Linux','2016-02',0.37),(61,'Linux','2016-03',0.22),(62,'Linux','2016-04',0.2),(63,'Linux','2016-05',0.19),(64,'Linux','2016-06',0.18),(65,'Linux','2016-07',0.18);
/*!40000 ALTER TABLE `dscglobaldevice_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscglobalvendor_marketshare`
--

DROP TABLE IF EXISTS `dscglobalvendor_marketshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscglobalvendor_marketshare` (
  `Sr_No` int(11) NOT NULL AUTO_INCREMENT,
  `Vendor_Name` varchar(50) NOT NULL,
  `Month` varchar(50) NOT NULL,
  `Value` double NOT NULL,
  PRIMARY KEY (`Sr_No`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscglobalvendor_marketshare`
--

LOCK TABLES `dscglobalvendor_marketshare` WRITE;
/*!40000 ALTER TABLE `dscglobalvendor_marketshare` DISABLE KEYS */;
INSERT INTO `dscglobalvendor_marketshare` VALUES (1,'Apple','2015-07',55.58),(2,'Apple','2015-08',54.79),(3,'Apple','2015-09',54.65),(4,'Apple','2015-10',53.68),(5,'Apple','2015-11',53.98),(6,'Apple','2015-12',53.15),(7,'Apple','2016-01',54.22),(8,'Apple','2016-02',53.7),(9,'Apple','2016-03',52.66),(10,'Apple','2016-04',52.11),(11,'Apple','2016-05',52.43),(12,'Apple','2016-06',53.11),(13,'Apple','2016-07',51.48),(14,'Samsung','2015-07',19.03),(15,'Samsung','2015-08',19.46),(16,'Samsung','2015-09',20.07),(17,'Samsung','2015-10',21.13),(18,'Samsung','2015-11',21.9),(19,'Samsung','2015-12',22.17),(20,'Samsung','2016-01',21.72),(21,'Samsung','2016-02',22.24),(22,'Samsung','2016-03',23.39),(23,'Samsung','2016-04',23.64),(24,'Samsung','2016-05',23.49),(25,'Samsung','2016-06',23.81),(26,'Samsung','2016-07',24.78),(27,'RIM','2015-07',5.23),(28,'RIM','2015-08',5.95),(29,'RIM','2015-09',6.18),(30,'RIM','2015-10',5.82),(31,'RIM','2015-11',4.74),(32,'RIM','2015-12',4.72),(33,'RIM','2016-01',4.3),(34,'RIM','2016-02',4.2),(35,'RIM','2016-03',4.24),(36,'RIM','2016-04',4.47),(37,'RIM','2016-05',4.58),(38,'RIM','2016-06',3.44),(39,'RIM','2016-07',3.23),(40,'HTC','2015-07',2.87),(41,'HTC','2015-08',2.43),(42,'HTC','2015-09',2.33),(43,'HTC','2015-10',2.32),(44,'HTC','2015-11',2.23),(45,'HTC','2015-12',2.27),(46,'HTC','2016-01',2.11),(47,'HTC','2016-02',2.11),(48,'HTC','2016-03',2.07),(49,'HTC','2016-04',2.02),(50,'HTC','2016-05',1.93),(51,'HTC','2016-06',1.9),(52,'HTC','2016-07',1.92),(53,'Unknown','2015-07',2.59),(54,'Unknown','2015-08',2.53),(55,'Unknown','2015-09',2.58),(56,'Unknown','2015-10',2.96),(57,'Unknown','2015-11',3.27),(58,'Unknown','2015-12',3.8),(59,'Unknown','2016-01',4.27),(60,'Unknown','2016-02',4.3),(61,'Unknown','2016-03',3.73),(62,'Unknown','2016-04',3.96),(63,'Unknown','2016-05',4.02),(64,'Unknown','2016-06',4.06),(65,'Unknown','2016-07',4.49),(66,'Nokia','2015-07',1.78),(67,'Nokia','2015-08',1.93),(68,'Nokia','2015-09',1.95),(69,'Nokia','2015-10',1.94),(70,'Nokia','2015-11',1.92),(71,'Nokia','2015-12',1.97),(72,'Nokia','2016-01',1.78),(73,'Nokia','2016-02',1.72),(74,'Nokia','2016-03',1.56),(75,'Nokia','2016-04',1.52),(76,'Nokia','2016-05',1.47),(77,'Nokia','2016-06',1.39),(78,'Nokia','2016-07',1.38),(79,'Amazon','2015-07',1.74),(80,'Amazon','2015-08',1.85),(81,'Amazon','2015-09',1.59),(82,'Amazon','2015-10',1.26),(83,'Amazon','2015-11',1.17),(84,'Amazon','2015-12',1.04),(85,'Amazon','2016-01',1.04),(86,'Amazon','2016-02',1.02),(87,'Amazon','2016-03',0.96),(88,'Amazon','2016-04',0.96),(89,'Amazon','2016-05',0.9),(90,'Amazon','2016-06',0.91),(91,'Amazon','2016-07',0.86),(92,'Google','2015-07',1.34),(93,'Google','2015-08',1.43),(94,'Google','2015-09',1.27),(95,'Google','2015-10',1.25),(96,'Google','2015-11',1.2),(97,'Google','2015-12',1.23),(98,'Google','2016-01',1.1),(99,'Google','2016-02',1.07),(100,'Google','2016-03',1.03),(101,'Google','2016-04',1.02),(102,'Google','2016-05',0.97),(103,'Google','2016-06',0.95),(104,'Google','2016-07',0.96),(105,'Motorola','2015-07',0.87),(106,'Motorola','2015-08',0.89),(107,'Motorola','2015-09',0.91),(108,'Motorola','2015-10',0.92),(109,'Motorola','2015-11',0.88),(110,'Motorola','2015-12',0.89),(111,'Motorola','2016-01',0.87),(112,'Motorola','2016-02',0.89),(113,'Motorola','2016-03',0.9),(114,'Motorola','2016-04',0.91),(115,'Motorola','2016-05',0.89),(116,'Motorola','2016-06',0.92),(117,'Motorola','2016-07',1.02),(118,'LG','2015-07',0.88),(119,'LG','2015-08',0.99),(120,'LG','2015-09',0.92),(121,'LG','2015-10',0.95),(122,'LG','2015-11',0.95),(123,'LG','2015-12',0.99),(124,'LG','2016-01',0.99),(125,'LG','2016-02',1.02),(126,'LG','2016-03',1.08),(127,'LG','2016-04',1.07),(128,'LG','2016-05',1.08),(129,'LG','2016-06',1.15),(130,'LG','2016-07',1.24);
/*!40000 ALTER TABLE `dscglobalvendor_marketshare` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `dscuserdevice_os`
--

DROP TABLE IF EXISTS `dscuserdevice_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscuserdevice_os` (
  `OS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OS_Name` varchar(20) NOT NULL,
  `Month` varchar(50) NOT NULL,
  `Value` double NOT NULL,
  PRIMARY KEY (`OS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscuserdevice_os`
--

LOCK TABLES `dscuserdevice_os` WRITE;
/*!40000 ALTER TABLE `dscuserdevice_os` DISABLE KEYS */;
INSERT INTO `dscuserdevice_os` VALUES (1,'iOS','2015-07',55.58),(2,'iOS','2015-08',54.79),(3,'iOS','2015-09',54.65),(4,'iOS','2015-10',53.68),(5,'iOS','2015-11',53.98),(6,'iOS','2015-12',53.15),(7,'iOS','2016-01',54.22),(8,'iOS','2016-02',53.7),(9,'iOS','2016-03',52.66),(10,'iOS','2016-04',52.11),(11,'iOS','2016-05',52.43),(12,'iOS','2016-06',53.11),(13,'iOS','2016-07',51.48),(14,'Android','2015-07',34.79),(15,'Android','2015-08',34.47),(16,'Android','2015-09',34.66),(17,'Android','2015-10',36.29),(18,'Android','2015-11',36.92),(19,'Android','2015-12',37.89),(20,'Android','2016-01',37.65),(21,'Android','2016-02',38.36),(22,'Android','2016-03',39.72),(23,'Android','2016-04',40.04),(24,'Android','2016-05',39.68),(25,'Android','2016-06',40.4),(26,'Android','2016-07',42.16),(27,'BlackBerry OS','2015-07',4.89),(28,'BlackBerry OS','2015-08',5.55),(29,'BlackBerry OS','2015-09',5.69),(30,'BlackBerry OS','2015-10',5.31),(31,'BlackBerry OS','2015-11',4.39),(32,'BlackBerry OS','2015-12',4.34),(33,'BlackBerry OS','2016-01',3.97),(34,'BlackBerry OS','2016-02',3.87),(35,'BlackBerry OS','2016-03',3.84),(36,'BlackBerry OS','2016-04',4.02),(37,'BlackBerry OS','2016-05',4.1),(38,'BlackBerry OS','2016-06',3.19),(39,'BlackBerry OS','2016-07',3.02),(40,'Windows Phone','2015-07',2.08),(41,'Windows Phone','2015-08',2.35),(42,'Windows Phone','2015-09',2.44),(43,'Windows Phone','2015-10',2.45),(44,'Windows Phone','2015-11',2.43),(45,'Windows Phone','2015-12',2.56),(46,'Windows Phone','2016-01',2.41),(47,'Windows Phone','2016-02',2.39),(48,'Windows Phone','2016-03',2.21),(49,'Windows Phone','2016-04',2.17),(50,'Windows Phone','2016-05',2.13),(51,'Windows Phone','2016-06',2.13),(52,'Windows Phone','2016-07',2.11),(53,'Linux','2015-07',1.75),(54,'Linux','2015-08',1.87),(55,'Linux','2015-09',1.52),(56,'Linux','2015-10',1.03),(57,'Linux','2015-11',0.92),(58,'Linux','2015-12',0.67),(59,'Linux','2016-01',0.46),(60,'Linux','2016-02',0.37),(61,'Linux','2016-03',0.22),(62,'Linux','2016-04',0.2),(63,'Linux','2016-05',0.19),(64,'Linux','2016-06',0.18),(65,'Linux','2016-07',0.18);
/*!40000 ALTER TABLE `dscuserdevice_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscuservendor_marketshare`
--

DROP TABLE IF EXISTS `dscuservendor_marketshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscuservendor_marketshare` (
  `Sr_No` int(11) NOT NULL AUTO_INCREMENT,
  `Vendor_Name` varchar(50) NOT NULL,
  `Month` varchar(50) NOT NULL,
  `Value` double NOT NULL,
  PRIMARY KEY (`Sr_No`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscuservendor_marketshare`
--

LOCK TABLES `dscuservendor_marketshare` WRITE;
/*!40000 ALTER TABLE `dscuservendor_marketshare` DISABLE KEYS */;
INSERT INTO `dscuservendor_marketshare` VALUES (1,'Apple','2015-07',55.58),(2,'Apple','2015-08',54.79),(3,'Apple','2015-09',54.65),(4,'Apple','2015-10',53.68),(5,'Apple','2015-11',53.98),(6,'Apple','2015-12',53.15),(7,'Apple','2016-01',54.22),(8,'Apple','2016-02',53.7),(9,'Apple','2016-03',52.66),(10,'Apple','2016-04',52.11),(11,'Apple','2016-05',52.43),(12,'Apple','2016-06',53.11),(13,'Apple','2016-07',51.48),(14,'Samsung','2015-07',19.03),(15,'Samsung','2015-08',19.46),(16,'Samsung','2015-09',20.07),(17,'Samsung','2015-10',21.13),(18,'Samsung','2015-11',21.9),(19,'Samsung','2015-12',22.17),(20,'Samsung','2016-01',21.72),(21,'Samsung','2016-02',22.24),(22,'Samsung','2016-03',23.39),(23,'Samsung','2016-04',23.64),(24,'Samsung','2016-05',23.49),(25,'Samsung','2016-06',23.81),(26,'Samsung','2016-07',24.78),(27,'RIM','2015-07',5.23),(28,'RIM','2015-08',5.95),(29,'RIM','2015-09',6.18),(30,'RIM','2015-10',5.82),(31,'RIM','2015-11',4.74),(32,'RIM','2015-12',4.72),(33,'RIM','2016-01',4.3),(34,'RIM','2016-02',4.2),(35,'RIM','2016-03',4.24),(36,'RIM','2016-04',4.47),(37,'RIM','2016-05',4.58),(38,'RIM','2016-06',3.44),(39,'RIM','2016-07',3.23),(40,'HTC','2015-07',2.87),(41,'HTC','2015-08',2.43),(42,'HTC','2015-09',2.33),(43,'HTC','2015-10',2.32),(44,'HTC','2015-11',2.23),(45,'HTC','2015-12',2.27),(46,'HTC','2016-01',2.11),(47,'HTC','2016-02',2.11),(48,'HTC','2016-03',2.07),(49,'HTC','2016-04',2.02),(50,'HTC','2016-05',1.93),(51,'HTC','2016-06',1.9),(52,'HTC','2016-07',1.92),(53,'Unknown','2015-07',2.59),(54,'Unknown','2015-08',2.53),(55,'Unknown','2015-09',2.58),(56,'Unknown','2015-10',2.96),(57,'Unknown','2015-11',3.27),(58,'Unknown','2015-12',3.8),(59,'Unknown','2016-01',4.27),(60,'Unknown','2016-02',4.3),(61,'Unknown','2016-03',3.73),(62,'Unknown','2016-04',3.96),(63,'Unknown','2016-05',4.02),(64,'Unknown','2016-06',4.06),(65,'Unknown','2016-07',4.49),(66,'Nokia','2015-07',1.78),(67,'Nokia','2015-08',1.93),(68,'Nokia','2015-09',1.95),(69,'Nokia','2015-10',1.94),(70,'Nokia','2015-11',1.92),(71,'Nokia','2015-12',1.97),(72,'Nokia','2016-01',1.78),(73,'Nokia','2016-02',1.72),(74,'Nokia','2016-03',1.56),(75,'Nokia','2016-04',1.52),(76,'Nokia','2016-05',1.47),(77,'Nokia','2016-06',1.39),(78,'Nokia','2016-07',1.38),(79,'Amazon','2015-07',1.74),(80,'Amazon','2015-08',1.85),(81,'Amazon','2015-09',1.59),(82,'Amazon','2015-10',1.26),(83,'Amazon','2015-11',1.17),(84,'Amazon','2015-12',1.04),(85,'Amazon','2016-01',1.04),(86,'Amazon','2016-02',1.02),(87,'Amazon','2016-03',0.96),(88,'Amazon','2016-04',0.96),(89,'Amazon','2016-05',0.9),(90,'Amazon','2016-06',0.91),(91,'Amazon','2016-07',0.86),(92,'Google','2015-07',1.34),(93,'Google','2015-08',1.43),(94,'Google','2015-09',1.27),(95,'Google','2015-10',1.25),(96,'Google','2015-11',1.2),(97,'Google','2015-12',1.23),(98,'Google','2016-01',1.1),(99,'Google','2016-02',1.07),(100,'Google','2016-03',1.03),(101,'Google','2016-04',1.02),(102,'Google','2016-05',0.97),(103,'Google','2016-06',0.95),(104,'Google','2016-07',0.96),(105,'Motorola','2015-07',0.87),(106,'Motorola','2015-08',0.89),(107,'Motorola','2015-09',0.91),(108,'Motorola','2015-10',0.92),(109,'Motorola','2015-11',0.88),(110,'Motorola','2015-12',0.89),(111,'Motorola','2016-01',0.87),(112,'Motorola','2016-02',0.89),(113,'Motorola','2016-03',0.9),(114,'Motorola','2016-04',0.91),(115,'Motorola','2016-05',0.89),(116,'Motorola','2016-06',0.92),(117,'Motorola','2016-07',1.02),(118,'LG','2015-07',0.88),(119,'LG','2015-08',0.99),(120,'LG','2015-09',0.92),(121,'LG','2015-10',0.95),(122,'LG','2015-11',0.95),(123,'LG','2015-12',0.99),(124,'LG','2016-01',0.99),(125,'LG','2016-02',1.02),(126,'LG','2016-03',1.08),(127,'LG','2016-04',1.07),(128,'LG','2016-05',1.08),(129,'LG','2016-06',1.15),(130,'LG','2016-07',1.24);
/*!40000 ALTER TABLE `dscuservendor_marketshare` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `dscvendor_details`
--

DROP TABLE IF EXISTS `dscvendor_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscvendor_details` (
  `vendor_ID` int(10) NOT NULL AUTO_INCREMENT,
  `vendor_Name` varchar(100) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`vendor_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscvendor_details`
--

LOCK TABLES `dscvendor_details` WRITE;
/*!40000 ALTER TABLE `dscvendor_details` DISABLE KEYS */;
INSERT INTO `dscvendor_details` VALUES (1,'Apple',NULL),(2,'Samsung',NULL),(3,'LG',NULL),(4,'Motorola',NULL),(5,'HTC',NULL),(6,'Amazon',NULL),(7,'Nokia',NULL),(8,'Google',NULL),(9,'RIM',NULL);
/*!40000 ALTER TABLE `dscvendor_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dscvendor_marketshare`
--

DROP TABLE IF EXISTS `dscvendor_marketshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dscvendor_marketshare` (
  `Sr_No` int(11) NOT NULL AUTO_INCREMENT,
  `Vendor_Name` varchar(50) NOT NULL,
  `Month` varchar(50) NOT NULL,
  `Value` double NOT NULL,
  PRIMARY KEY (`Sr_No`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dscvendor_marketshare`
--

LOCK TABLES `dscvendor_marketshare` WRITE;
/*!40000 ALTER TABLE `dscvendor_marketshare` DISABLE KEYS */;
INSERT INTO `dscvendor_marketshare` VALUES (1,'Apple','2015-07',56.57),(2,'Apple','2015-08',57.31),(3,'Apple','2015-09',56.97),(4,'Apple','2015-10',56.69),(5,'Apple','2015-11',57.86),(6,'Apple','2015-12',57.79),(7,'Apple','2016-01',58.7),(8,'Apple','2016-02',58.82),(9,'Apple','2016-03',57.65),(10,'Apple','2016-04',57.87),(11,'Apple','2016-05',58.11),(12,'Apple','2016-06',58.48),(13,'Apple','2016-07',57.24),(14,'Samsung','2015-07',21.36),(15,'Samsung','2015-08',21.48),(16,'Samsung','2015-09',22.38),(17,'Samsung','2015-10',22.47),(18,'Samsung','2015-11',22.1),(19,'Samsung','2015-12',21.88),(20,'Samsung','2016-01',21.72),(21,'Samsung','2016-02',21.98),(22,'Samsung','2016-03',22.91),(23,'Samsung','2016-04',22.86),(24,'Samsung','2016-05',22.61),(25,'Samsung','2016-06',22.57),(26,'Samsung','2016-07',22.4),(27,'LG','2015-07',4.95),(28,'LG','2015-08',4.99),(29,'LG','2015-09',5.26),(30,'LG','2015-10',5.35),(31,'LG','2015-11',5.23),(32,'LG','2015-12',5.18),(33,'LG','2016-01',5),(34,'LG','2016-02',4.99),(35,'LG','2016-03',5.49),(36,'LG','2016-04',5.52),(37,'LG','2016-05',5.48),(38,'LG','2016-06',5.35),(39,'LG','2016-07',5.23),(40,'Motorola','2015-07',2.72),(41,'Motorola','2015-08',2.72),(42,'Motorola','2015-09',2.8),(43,'Motorola','2015-10',2.79),(44,'Motorola','2015-11',2.74),(45,'Motorola','2015-12',2.6),(46,'Motorola','2016-01',2.51),(47,'Motorola','2016-02',2.53),(48,'Motorola','2016-03',2.66),(49,'Motorola','2016-04',2.6),(50,'Motorola','2016-05',2.54),(51,'Motorola','2016-06',2.49),(52,'Motorola','2016-07',2.46),(53,'Unknown','2015-07',2.73),(54,'Unknown','2015-08',2.63),(55,'Unknown','2015-09',2.68),(56,'Unknown','2015-10',2.99),(57,'Unknown','2015-11',3.11),(58,'Unknown','2015-12',3.52),(59,'Unknown','2016-01',3.92),(60,'Unknown','2016-02',3.85),(61,'Unknown','2016-03',3.14),(62,'Unknown','2016-04',3.33),(63,'Unknown','2016-05',3.56),(64,'Unknown','2016-06',3.64),(65,'Unknown','2016-07',3.73),(66,'HTC','2015-07',1.98),(67,'HTC','2015-08',1.86),(68,'HTC','2015-09',1.89),(69,'HTC','2015-10',1.89),(70,'HTC','2015-11',1.84),(71,'HTC','2015-12',1.86),(72,'HTC','2016-01',1.72),(73,'HTC','2016-02',1.66),(74,'HTC','2016-03',1.56),(75,'HTC','2016-04',1.51),(76,'HTC','2016-05',1.49),(77,'HTC','2016-06',1.44),(78,'HTC','2016-07',1.37),(79,'Amazon','2015-07',1.74),(80,'Amazon','2015-08',1.67),(81,'Amazon','2015-09',1.38),(82,'Amazon','2015-10',1.07),(83,'Amazon','2015-11',1),(84,'Amazon','2015-12',0.91),(85,'Amazon','2016-01',0.88),(86,'Amazon','2016-02',0.84),(87,'Amazon','2016-03',0.82),(88,'Amazon','2016-04',0.78),(89,'Amazon','2016-05',0.75),(90,'Amazon','2016-06',0.74),(91,'Amazon','2016-07',0.7),(92,'Nokia','2015-07',1.14),(93,'Nokia','2015-08',1.05),(94,'Nokia','2015-09',1.04),(95,'Nokia','2015-10',1.06),(96,'Nokia','2015-11',0.94),(97,'Nokia','2015-12',0.95),(98,'Nokia','2016-01',0.75),(99,'Nokia','2016-02',0.68),(100,'Nokia','2016-03',0.58),(101,'Nokia','2016-04',0.54),(102,'Nokia','2016-05',0.52),(103,'Nokia','2016-06',0.46),(104,'Nokia','2016-07',0.41),(105,'Google','2015-07',1.24),(106,'Google','2015-08',0.94),(107,'Google','2015-09',0.9),(108,'Google','2015-10',0.99),(109,'Google','2015-11',0.92),(110,'Google','2015-12',1.09),(111,'Google','2016-01',0.95),(112,'Google','2016-02',0.88),(113,'Google','2016-03',0.89),(114,'Google','2016-04',0.95),(115,'Google','2016-05',0.94),(116,'Google','2016-06',1.14),(117,'Google','2016-07',2.93),(118,'RIM','2015-07',0.32),(119,'RIM','2015-08',0.27),(120,'RIM','2015-09',0.24),(121,'RIM','2015-10',0.27),(122,'RIM','2015-11',0.22),(123,'RIM','2015-12',0.29),(124,'RIM','2016-01',0.19),(125,'RIM','2016-02',0.19),(126,'RIM','2016-03',0.17),(127,'RIM','2016-04',0.18),(128,'RIM','2016-05',0.19),(129,'RIM','2016-06',0.16),(130,'RIM','2016-07',0.14);
/*!40000 ALTER TABLE `dscvendor_marketshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `FileID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FileName` varchar(30) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreationTime` datetime DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `ModifiedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`FileID`),
  KEY `CreatedBy` (`CreatedBy`),
  KEY `ModifiedBy` (`ModifiedBy`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (25,'Asdsds.apk',3,'2015-08-26 00:00:00',NULL,NULL),(26,'ESFileExplorer.apk',3,'2015-08-26 00:00:00',NULL,NULL),(24,'Paytm.apk',3,'2015-08-26 00:00:00',NULL,NULL),(23,'HR_Org_Structure.pdf',41,'2015-02-16 00:00:00',NULL,NULL),(22,'McDonaldss.xls',56,'2015-02-12 00:00:00',NULL,NULL),(21,'output.txt',3,'2015-02-12 00:00:00',NULL,NULL),(15,'Bupa.xls',31,'2015-02-03 00:00:00',NULL,NULL),(16,'AddProject.png',2,'2015-02-03 00:00:00',NULL,NULL),(17,'Testcasenames.txt',1,'2015-02-03 00:00:00',NULL,NULL),(18,'bin.zip',1,'2015-02-03 00:00:00',NULL,NULL),(19,'SeeTest - Copy.xls',1,'2015-02-04 00:00:00',NULL,NULL),(20,'ActivityUtils.class',1,'2015-02-05 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folderlocation`
--

DROP TABLE IF EXISTS `folderlocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folderlocation` (
  `FolderLocationID` int(11) NOT NULL AUTO_INCREMENT,
  `DeviceID` int(11) DEFAULT NULL,
  `FolderPath` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`FolderLocationID`),
  KEY `DeviceID` (`DeviceID`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folderlocation`
--

LOCK TABLES `folderlocation` WRITE;
/*!40000 ALTER TABLE `folderlocation` DISABLE KEYS */;
INSERT INTO `folderlocation` VALUES (1,8,'/mnt/sdcard'),(2,8,'/mnt/sdcard/download'),(3,6,'/mnt/sdcard'),(4,6,'/mnt/sdcard/download'),(5,7,'/mnt/sdcard'),(6,7,'/mnt/sdcard/download'),(7,1,'/mnt/sdcard'),(8,1,'/mnt/sdcard/download'),(9,2,'/mnt/sdcard'),(10,2,'/mnt/sdcard/download'),(11,3,'/mnt/sdcard'),(12,3,'/mnt/sdcard/download'),(13,4,'/mnt/sdcard'),(14,4,'/mnt/sdcard/download'),(15,5,'/mnt/sdcard'),(16,5,'/mnt/sdcard/download'),(17,12,'/mnt/sdcard'),(18,12,'/mnt/sdcard/download'),(19,21,'/mnt/sdcard'),(20,21,'/mnt/sdcard/download'),(21,8,'/mnt/sdcard/Pictures/Screenshots'),(22,8,'/mnt/sdcard/TestReport/RunTest');
/*!40000 ALTER TABLE `folderlocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frameworkkeywords`
--

DROP TABLE IF EXISTS `frameworkkeywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frameworkkeywords` (
  `keywordid` bigint(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(50) NOT NULL,
  `tool` varchar(10) NOT NULL,
  `parametercount` int(11) NOT NULL,
  `objecttag` binary(1) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `createdby` int(11) NOT NULL,
  `creationtime` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `flag` binary(1) NOT NULL,
  PRIMARY KEY (`keywordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frameworkkeywords`
--

LOCK TABLES `frameworkkeywords` WRITE;
/*!40000 ALTER TABLE `frameworkkeywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `frameworkkeywords` ENABLE KEYS */;
UNLOCK TABLES;

-- Device Selection tabels END

-- Dump completed on 2016-10-24 12:32:12
