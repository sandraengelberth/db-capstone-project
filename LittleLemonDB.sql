CREATE DATABASE  IF NOT EXISTS `LittleLemonDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `LittleLemonDB`;
-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: LittleLemonDB
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `BookingSlot` time NOT NULL,
  `TableNumber` int NOT NULL,
  `StaffID` int NOT NULL,
  `DeliveryID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `fk_Bookings_1_idx` (`CustomerID`),
  KEY `fk_Bookings_2_idx` (`StaffID`),
  KEY `fk_Bookings_3_idx` (`DeliveryID`),
  CONSTRAINT `fk_Bookings_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Bookings_2` FOREIGN KEY (`StaffID`) REFERENCES `Employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Bookings_3` FOREIGN KEY (`DeliveryID`) REFERENCES `Delivery` (`DeliveryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
INSERT INTO `Bookings` VALUES (1,1,'19:00:00',12,1,1),(2,2,'19:00:00',12,1,2),(3,3,'15:00:00',19,3,3),(4,4,'17:30:00',15,4,4),(5,5,'18:30:00',5,2,5),(6,6,'20:00:00',8,5,6);
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `CustomerID` int NOT NULL,
  `GuestFirstName` varchar(45) NOT NULL,
  `GuestLastName` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Anna','Iversen'),(2,'Joakim','Iversen'),(3,'Vanessa','McCarthy'),(4,'Marcos','Romero'),(5,'Hiroki','Yamane'),(6,'Diana','Pinto');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery`
--

DROP TABLE IF EXISTS `Delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery` (
  `DeliveryID` int NOT NULL,
  `DeliveryDate` time DEFAULT NULL,
  `DeliveryStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`DeliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery`
--

LOCK TABLES `Delivery` WRITE;
/*!40000 ALTER TABLE `Delivery` DISABLE KEYS */;
INSERT INTO `Delivery` VALUES (1,'20:00:00','Ready to Pay'),(2,'20:00:00','Ready to Pay'),(3,'16:00:00','Ready to Serve'),(4,'18:30:00','Preparing Order'),(5,'19:30:00','Ready to Pay'),(6,'21:00:00','Order Served');
/*!40000 ALTER TABLE `Delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `ContactNumber` int DEFAULT NULL,
  `Salary` varchar(10) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,'Mario Gollini','Manager','724 Parsley Lane, Old Town, Chicago, IL',351258074,'$70,000'),(2,'Adrian Gollini','Assistant Manager','334 Dill Square, Lincoln Park, Chicago, IL',351474048,'$65,000'),(3,'Giorgos Dioudis','Head Chef','879 Sage Street, Chicago, IL',351970582,'$50,000'),(4,'Fatma Kaya','Assistant Chef','132 Bay Lane, Chicago, IL',351963569,'$45,000'),(5,'Elena Salvai','Head Waiter','989 Thyme Square, Edgewater, Chicago, IL',351074198,'$40,000'),(6,'John Miller','Receptionist','245 Dill Square, Lincoln Park, Chicago, IL',351584508,'35000');
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu` (
  `MenuID` int NOT NULL,
  `ItemID` int NOT NULL,
  `Cuisine` varchar(45) NOT NULL,
  PRIMARY KEY (`MenuID`,`ItemID`),
  KEY `fk_Menu_1_idx` (`ItemID`),
  CONSTRAINT `fk_Menu_1` FOREIGN KEY (`ItemID`) REFERENCES `MenuItems` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (1,1,'Greek'),(1,7,'Greek'),(1,10,'Greek'),(1,13,'Greek'),(2,3,'Italian'),(2,9,'Italian'),(2,12,'Italian'),(2,15,'Italian'),(3,5,'Turkish'),(3,11,'Turkish'),(3,16,'Turkish'),(3,17,'Turkish');
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuItems`
--

DROP TABLE IF EXISTS `MenuItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuItems` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `Item` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItems`
--

LOCK TABLES `MenuItems` WRITE;
/*!40000 ALTER TABLE `MenuItems` DISABLE KEYS */;
INSERT INTO `MenuItems` VALUES (1,'Olives','Starters',5),(2,'Flatbread','Starters',5),(3,'Minestrone','Starters',8),(4,'Tomato Bread','Starters',8),(5,'Falafel','Starters',7),(6,'Hummus','Starters',5),(7,'Greek Salad','Main Courses',15),(8,'Bean Soup','Main Courses',12),(9,'Pizza','Main Courses',15),(10,'Greek Yoghurt','Desserts',7),(11,'Ice Cream','Desserts',6),(12,'Cheesecake','Desserts',4),(13,'Athens White Wine','Drinks',25),(14,'Corfu Red Wine','Drinks',30),(15,'Italian Coffee','Drinks',10),(16,'Turkish Coffee','Drinks',10),(17,'Kabasa','Main Courses',17);
/*!40000 ALTER TABLE `MenuItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` int NOT NULL,
  `TableNumber` int NOT NULL,
  `MenuID` int NOT NULL,
  `BookingID` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  `TotalCost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Orders_1_idx` (`BookingID`),
  KEY `fk_Orders_2_idx` (`MenuID`),
  CONSTRAINT `fk_Orders_1` FOREIGN KEY (`BookingID`) REFERENCES `Bookings` (`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Orders_2` FOREIGN KEY (`MenuID`) REFERENCES `Menu` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,12,1,1,2,86),(2,19,2,2,1,37),(3,15,2,3,1,37),(4,5,3,4,1,40),(5,8,1,5,1,43);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-01 12:06:58
