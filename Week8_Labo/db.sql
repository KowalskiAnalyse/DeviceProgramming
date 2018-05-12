-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: wielrennen
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `tblland`
--

DROP TABLE IF EXISTS `tblland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblland` (
  `landID` int(11) NOT NULL AUTO_INCREMENT,
  `landAfkorting` varchar(3) CHARACTER SET utf8mb4 DEFAULT NULL,
  `landOmschrijving` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`landID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblland`
--

LOCK TABLES `tblland` WRITE;
/*!40000 ALTER TABLE `tblland` DISABLE KEYS */;
INSERT INTO `tblland` VALUES (1,'FRA','Frankrijk'),(2,'BEL','België'),(3,'ESP','Spanje'),(4,'RUS','Rusland'),(5,'USA','Verenigde staten'),(6,'NED','Nederland'),(7,'ITA','Italië'),(8,'GRB','Groot-Brittanië'),(9,'DEN','Denemarken'),(10,'LUX','Luxemburg');
/*!40000 ALTER TABLE `tblland` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblploeg`
--

DROP TABLE IF EXISTS `tblploeg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblploeg` (
  `ploegID` int(11) NOT NULL AUTO_INCREMENT,
  `omschrijving` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `afkorting` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `budget` decimal(18,2) DEFAULT NULL,
  `typePloegID` int(11) DEFAULT NULL,
  `landID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ploegID`),
  KEY `FK_tblPloeg_tblTypePloeg` (`typePloegID`),
  KEY `landID` (`landID`),
  CONSTRAINT `FK_tblPloeg_tblLand` FOREIGN KEY (`landID`) REFERENCES `tblland` (`landID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblPloeg_tblTypePloeg` FOREIGN KEY (`typePloegID`) REFERENCES `tbltypeploeg` (`typePloegID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblploeg`
--

LOCK TABLES `tblploeg` WRITE;
/*!40000 ALTER TABLE `tblploeg` DISABLE KEYS */;
INSERT INTO `tblploeg` VALUES (100,'AG2R LA MONDIALE','ALM',8000000.00,1,1),(101,'BMC Racing Team','BMC',NULL,1,5),(102,'Omega Pharma - Lotto','OLO',9500000.00,1,2),(103,'SKY Procycling','SKY',NULL,1,8),(104,'Team Garmin-Cervelo','GRM',NULL,1,5),(105,'Team Radioshack','RSH',1100000.00,1,5),(106,'Vacansoleil-DCM Pro Cycling Team','VCD',8500000.00,1,6),(107,'Quickstep Cycling Team','QST',NULL,1,2),(108,'Landbouwkrediet','LAN',NULL,2,2),(109,'Veranda\'s Willems - Accent','VWA',NULL,2,2),(110,'FDJ','FDJ',NULL,2,1),(111,'Saxo Bank-Sungard','SAX',NULL,1,9),(112,'HTC-Highroad','HTC',NULL,1,5),(113,'Rabobank','RAB',15000000.00,1,6),(114,'Leopard-Trek','LEO',NULL,1,10),(115,'Katusha','KAT',15000000.00,1,4),(116,'Orica','ORI',NULL,2,1);
/*!40000 ALTER TABLE `tblploeg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltypeploeg`
--

DROP TABLE IF EXISTS `tbltypeploeg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltypeploeg` (
  `typePloegID` int(11) NOT NULL AUTO_INCREMENT,
  `typeOmschrijving` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`typePloegID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltypeploeg`
--

LOCK TABLES `tbltypeploeg` WRITE;
/*!40000 ALTER TABLE `tbltypeploeg` DISABLE KEYS */;
INSERT INTO `tbltypeploeg` VALUES (1,'UCI World  ploeg'),(2,'Pro-continentale ploeg');
/*!40000 ALTER TABLE `tbltypeploeg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblusers`
--

DROP TABLE IF EXISTS `tblusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblusers` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `settings` varchar(500) DEFAULT NULL,
  `tracking` varchar(500) DEFAULT NULL,
  `rank` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblusers`
--

LOCK TABLES `tblusers` WRITE;
/*!40000 ALTER TABLE `tblusers` DISABLE KEYS */;
INSERT INTO `tblusers` VALUES (1,'dieter','dieter','dieter.roobrouck@howest.be','none',NULL,'10');
/*!40000 ALTER TABLE `tblusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwedstrijd`
--

DROP TABLE IF EXISTS `tblwedstrijd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwedstrijd` (
  `wedstrijdID` int(11) NOT NULL AUTO_INCREMENT,
  `wedstrijdOmschrijving` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `startDatum` date DEFAULT NULL,
  `aantalDagen` int(11) DEFAULT '1',
  `isRittenKoers` tinyint(1) DEFAULT '0',
  `afstand` int(11) DEFAULT NULL,
  `uitzendingOpTV` tinyint(1) DEFAULT NULL,
  `catWedstrijdID` int(11) DEFAULT NULL,
  PRIMARY KEY (`wedstrijdID`),
  KEY `FK_tblWedstrijd_tblWedstrijdCategorie` (`catWedstrijdID`),
  CONSTRAINT `FK_tblWedstrijd_tblWedstrijdCategorie` FOREIGN KEY (`catWedstrijdID`) REFERENCES `tblwedstrijdcategorie` (`categorieID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2008 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwedstrijd`
--

LOCK TABLES `tblwedstrijd` WRITE;
/*!40000 ALTER TABLE `tblwedstrijd` DISABLE KEYS */;
INSERT INTO `tblwedstrijd` VALUES (2000,'Omloop het Nieuwsblad','2017-02-26',1,0,203,1,500),(2001,'Parijs-Nice','2017-03-06',8,1,1305,1,501),(2002,'E3 prijs Harelbeke','2017-03-26',1,0,203,1,500),(2003,'Gent Wevelgem','2017-03-27',1,0,235,1,501),(2004,'Ronde van Vlaanderen','2017-04-03',1,0,259,1,501),(2005,'Scheldeprijs','2017-04-06',1,0,203,0,500),(2006,'Parijs Roubaix','2017-04-10',1,0,258,1,501),(2007,'Luik Bastenaken Luik','2017-04-24',1,0,257,1,501);
/*!40000 ALTER TABLE `tblwedstrijd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwedstrijdcategorie`
--

DROP TABLE IF EXISTS `tblwedstrijdcategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwedstrijdcategorie` (
  `categorieID` int(11) NOT NULL AUTO_INCREMENT,
  `categorieOmschrijving` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`categorieID`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwedstrijdcategorie`
--

LOCK TABLES `tblwedstrijdcategorie` WRITE;
/*!40000 ALTER TABLE `tblwedstrijdcategorie` DISABLE KEYS */;
INSERT INTO `tblwedstrijdcategorie` VALUES (500,'Europe Tour'),(501,'UCI WorldTour');
/*!40000 ALTER TABLE `tblwedstrijdcategorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwielrenner`
--

DROP TABLE IF EXISTS `tblwielrenner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwielrenner` (
  `rennerID` int(11) NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `naam` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `geboortedatum` date DEFAULT NULL,
  `ploegID` int(11) DEFAULT NULL,
  PRIMARY KEY (`rennerID`),
  KEY `FK_tblWielrenner_tblPloeg` (`ploegID`),
  CONSTRAINT `FK_tblWielrenner_tblPloeg` FOREIGN KEY (`ploegID`) REFERENCES `tblploeg` (`ploegID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1048 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwielrenner`
--

LOCK TABLES `tblwielrenner` WRITE;
/*!40000 ALTER TABLE `tblwielrenner` DISABLE KEYS */;
INSERT INTO `tblwielrenner` VALUES (1002,'Mario ','Aerts ','1974-12-31',102),(1003,'Bart','De clercq','1986-08-26',102),(1004,'Philippe ','Gilbert','1982-07-05',102),(1005,'Jurgen','Van Den Broeck','1983-02-01',102),(1006,'Maxime','Bouet','1986-11-30',100),(1007,'Matthieu','Perget','1984-09-18',100),(1008,'Cadel','Evans','1977-02-14',101),(1009,'George','Hincapie','1973-06-29',101),(1010,'Greg','Van Avermaet','1985-05-17',101),(1011,'Tom','Boonen','1980-10-15',107),(1012,'Gert','Steegmans','1980-09-30',107),(1013,'Sylvain','Chavanel','1979-06-30',107),(1015,'Alberto','Contador','1982-12-06',111),(1017,'Juan Antonio','Flecha','1977-09-17',103),(1018,'Bradley','Wiggings','1980-04-28',103),(1019,'Thor','Hushovd','1978-01-18',104),(1020,'Johan','Vansummeren','1981-02-04',104),(1021,'Tyler','Farrar','1984-06-02',104),(1022,'Lance','Armstrong','1971-09-18',105),(1023,'Robie','McEwen','1972-06-24',105),(1024,'Stijn','Devolder','1979-08-29',106),(1025,'Bjorn','Leukemans','1977-07-01',106),(1026,'Dieter','Cappelle','1983-09-24',109),(1027,'Jurgen','Van Goolen','1980-11-28',109),(1028,'Steve','Chainel','1983-09-06',110),(1029,'Sandy','Casar','1979-02-02',110),(1030,'Nick','Nuyens','1980-05-05',111),(1032,'Chris','Sörensen','1984-09-05',111),(1033,'Nicki','Sörensen','1975-05-14',111),(1034,'Mark','Cavendish','1985-05-21',112),(1035,'Sebastian','Langeveld','1985-01-17',113),(1036,'Matthew','Hayman','1978-04-20',103),(1037,'Tony','Martin','1985-04-23',112),(1038,'Andreas','Klöden','1975-06-22',105),(1039,'Fabian','Cancellara','1981-03-18',114),(1040,'Maxime','Monfort','1983-01-14',114),(1041,'Daniele','Bennati','1980-09-24',114),(1042,'Yauheni','Hutarovich','1983-11-29',110),(1043,'Denis','Galimzyanov','1987-03-07',115),(1044,'Stefan','Van Dijk','1976-01-22',109),(1045,'Maarten','Tjallingii','1977-01-05',113),(1046,'Andy','Schleck','1985-06-10',114),(1047,'Frank','Schleck','1980-04-15',114);
/*!40000 ALTER TABLE `tblwielrenner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwielrennerwedstrijd`
--

DROP TABLE IF EXISTS `tblwielrennerwedstrijd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwielrennerwedstrijd` (
  `rennerID` int(11) NOT NULL,
  `wedstrijdID` int(11) NOT NULL,
  `uitslag` int(11) DEFAULT NULL,
  PRIMARY KEY (`rennerID`,`wedstrijdID`),
  KEY `FK_tblWielrennerWedstrijd_tblWedstrijd` (`wedstrijdID`),
  CONSTRAINT `FK_tblWielrennerWedstrijd_tblWedstrijd` FOREIGN KEY (`wedstrijdID`) REFERENCES `tblwedstrijd` (`wedstrijdID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblWielrennerWedstrijd_tblWielrenner` FOREIGN KEY (`rennerID`) REFERENCES `tblwielrenner` (`rennerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwielrennerwedstrijd`
--

LOCK TABLES `tblwielrennerwedstrijd` WRITE;
/*!40000 ALTER TABLE `tblwielrennerwedstrijd` DISABLE KEYS */;
INSERT INTO `tblwielrennerwedstrijd` VALUES (1005,2007,1),(1010,2007,7),(1011,2003,1),(1011,2004,4),(1013,2004,2),(1017,2000,2),(1017,2006,9),(1018,2001,3),(1019,2006,8),(1020,2006,1),(1021,2003,3),(1023,2005,5),(1025,2007,9),(1030,2004,1),(1034,2005,1),(1035,2000,1),(1036,2000,3),(1037,2001,1),(1038,2001,2),(1039,2002,1),(1039,2004,3),(1039,2006,2),(1040,2001,10),(1041,2003,2),(1042,2005,3),(1043,2005,2),(1044,2005,4),(1045,2006,3),(1046,2007,3),(1047,2007,2);
/*!40000 ALTER TABLE `tblwielrennerwedstrijd` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-16 10:40:18
