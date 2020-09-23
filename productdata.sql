-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: productdata
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Cerelac','Nestle',388,1),(2,'Organic Face Cream','Face Cream',277,2),(3,'Wild Stone Aqua Fresh','Aqua fresh',322,3),(4,'Kinder Joy','baby',50,1),(6,'NAN PRO 2','Follow-Up Formula-Powder 400g Bag',590,1),(7,'LACTOGEN 1','Infant Formula Powder 400g Bag',320,1),(9,'Enfamil A+','Follow Up Formula - 400 g',715,1),(10,'Lakme Absolute Perfect','Radiance Skin Brightening Day Creme 50 g',264,2),(12,'Maybelline New York Baby Lips','Lip Balm, Cherry Kiss, 4g',140,2),(13,'Maybelline New York Colossal Kajal','Black, 0.35g',136,2),(14,'Zebronics Zeb-Monk, Wireless BT Neckband','with Active Noise Cancellation (ANC)',2799,7),(16,'OnePlus Nord 5G','Blue Marble, 8GB RAM, 128GB Storage',27999,7),(17,'Mother Dairy Cow Ghee','1 Ltr',448,8),(18,'Nestle MILKMAID','Sweetened Condensed Milk, 400g',114,8),(19,'DAVIDOFF Cool Water','Man Mild Deodorant 75ml',1399,3),(20,'Paper Boat Chikki','800g Pet Jar',250,9),(21,'Sunfeast Dark Fantasy Choco Fills','600 g',190,9),(22,'OnePlus 7','128 GB',30000,7),(23,'Lays Potato Chips','Cream n Onion',30,9),(24,'Cadbury Celebrations','Rich Dry Fruits 177g',450,10);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (1,'Baby Food'),(2,'Cosmetics'),(3,'Perfumes'),(7,'Electronics'),(8,'Dairy'),(9,'Snacks'),(10,'Chocolate');
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Pushkar','Deshmane','pushkardeshmane@gmail.com','pushkar',1);
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

-- Dump completed on 2020-09-23 16:33:00
