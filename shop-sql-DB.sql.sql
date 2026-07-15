-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: cws_shop
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9emlp6m95v5er2bcqkjsw48he` (`user_id`),
  CONSTRAINT `FKg5uhi8vpsuy0lgloxk2h4w5o6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'2026-06-24 15:37:19.124022','2026-06-24 15:37:19.124022',2),(2,'2026-07-07 10:42:05.855267','2026-07-07 10:42:05.855267',1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `quantity` int NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6oue0maw421roerltnxn16a38` (`cart_id`,`product_id`),
  KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`),
  CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK99e0am9jpriwxcm6is7xfedy3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (3,'2026-07-10 16:20:09.390174',1,'2026-07-10 16:20:09.390174',2,1),(7,'2026-07-11 12:34:27.941516',1,'2026-07-11 12:34:27.941516',1,1);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `activation_date` date DEFAULT NULL,
  `activation_limit` int NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `license_key` varchar(255) NOT NULL,
  `license_plan` enum('BASIC','STANDARD','PREMIUM','ENTERPRISE') DEFAULT NULL,
  `license_status` enum('ACTIVE','INACTIVE','EXPIRED','SUSPENDED','PENDING_RENEWAL','DEACTIVATED') NOT NULL,
  `license_type` enum('TRIAL','MONTHLY','YEARLY','LIFETIME') NOT NULL,
  `is_manual_key` bit(1) DEFAULT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `generated_by` bigint DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8t8rce88aoep65xlxnvnhy6d7` (`license_key`),
  KEY `FKe5lglta0iih9hpklacova3avm` (`user_id`),
  KEY `FK37k6tcy1xh7jtd1t7jlo27kns` (`generated_by`),
  KEY `FKrwbu30er6kfs9bsiu91xa0vre` (`product_id`),
  CONSTRAINT `FK37k6tcy1xh7jtd1t7jlo27kns` FOREIGN KEY (`generated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FKe5lglta0iih9hpklacova3avm` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKrwbu30er6kfs9bsiu91xa0vre` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `is_read` bit(1) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` enum('ORDER','PAYMENT','PRODUCT','SYSTEM','LICENSE') DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9y21adhxn0ayjhfocscqox7bh` (`user_id`),
  CONSTRAINT `FK9y21adhxn0ayjhfocscqox7bh` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'2026-06-24 13:29:59.528810',_binary '','New product available: Employee Management System','New Product Added','PRODUCT',1),(2,'2026-06-24 13:34:48.488930',_binary '','New product available: Stock Management System','New Product Added','PRODUCT',1),(3,'2026-06-24 13:41:02.495489',_binary '','New product available: Task Management System','New Product Added','PRODUCT',1),(4,'2026-06-24 15:36:33.972615',_binary '','New user registered with email: jadhav.ganesh1700@gmail.com','New User Registered','SYSTEM',1),(5,'2026-06-24 15:37:53.887786',_binary '','Your order ORD-1782295673799 has been placed successfully.','Purchase Successful','ORDER',2),(6,'2026-06-24 15:37:53.941642',_binary '','Ganesh Satish Jadhav placed order ORD-1782295673799 worth ₹9439.0','New Order Received','ORDER',1),(7,'2026-07-07 10:43:11.864157',_binary '','Your order ORD-1783401191780 has been placed successfully.','Purchase Successful','ORDER',1),(8,'2026-07-07 10:43:11.883237',_binary '','Admin User placed order ORD-1783401191780 worth ₹9439.0','New Order Received','ORDER',1),(9,'2026-07-11 12:21:50.808517',_binary '','Your order ORD-1783752710730 has been placed successfully.','Purchase Successful','ORDER',2),(10,'2026-07-11 12:21:50.839177',_binary '\0','Ganesh  Jadhav placed order ORD-1783752710730 worth ₹21238.0','New Order Received','ORDER',1),(11,'2026-07-11 12:33:42.226012',_binary '','Your order ORD-1783753422184 has been placed successfully.','Purchase Successful','ORDER',2),(12,'2026-07-11 12:33:42.246059',_binary '\0','Ganesh  Jadhav placed order ORD-1783753422184 worth ₹10619.0','New Order Received','ORDER',1);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `amount` double NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `product_purchased` varchar(255) DEFAULT NULL,
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `status` enum('PENDING','COMPLETED','FAILED','CANCELLED') NOT NULL,
  `transaction_status` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_irih2b19r48q9x8reuaorvt0h` (`razorpay_payment_id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2026-06-24 15:37:53.804312',_binary '\0','2026-06-24 15:37:53.804312',9439,'Ganesh Satish Jadhav','2026-06-24 15:37:53.800323','ORD-1782295673799','netbanking','Employee Management System','pay_T5QhkSPSqHORzE','COMPLETED','SUCCESS',2),(2,'2026-07-07 10:43:11.784151',_binary '\0','2026-07-07 10:43:11.784151',9439,'Admin User','2026-07-07 10:43:11.780918','ORD-1783401191780','netbanking','Employee Management System','pay_TAUczv8suyuWJW','COMPLETED','SUCCESS',1),(3,'2026-07-11 12:21:50.733351',_binary '\0','2026-07-11 12:21:50.733351',21238,'Ganesh  Jadhav','2026-07-11 12:21:50.731351','ORD-1783752710730','netbanking','Employee Management System, Stock Management System','pay_TC6RhKE2hD1BXr','COMPLETED','SUCCESS',2),(4,'2026-07-11 12:33:42.185252',_binary '\0','2026-07-11 12:33:42.185252',10619,'Ganesh  Jadhav','2026-07-11 12:33:42.184251','ORD-1783753422184','netbanking','Task Management System','pay_TC6eFr9UwJliQI','COMPLETED','SUCCESS',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_limit`
--

DROP TABLE IF EXISTS `password_reset_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_limit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `reset_count` int NOT NULL,
  `reset_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_limit`
--

LOCK TABLES `password_reset_limit` WRITE;
/*!40000 ALTER TABLE `password_reset_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expiry_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_71lqwbwtklmljk3qlsugr1mig` (`token`),
  UNIQUE KEY `UK_la2ts67g4oh2sreayswhox1i6` (`user_id`),
  CONSTRAINT `FKk3ndxg5xp6v7wd4gjyusp15gq` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `active` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `method_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hn6pcph0iahf37xw5rxpvtyjo` (`method_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `buyer_id` bigint NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `failure_reason` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `razorpay_signature` varchar(512) DEFAULT NULL,
  `status` enum('SUCCESS','FAILED','PENDING') NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8vo36cen604as7etdfwmyjsxt` (`order_id`),
  UNIQUE KEY `UK_t4ffsaqe8d6i83gs100u2y3l1` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,9439,2,'2026-06-24 15:37:23.731995','INR',NULL,'order_T5QhWK8Xqz0fTo','pay_T5QhkSPSqHORzE',NULL,'f9e32397dc0a62a5a9fda0d5094967bf37bd1d7414b490cda7d4fdffdc3f85b8','SUCCESS','2026-06-24 15:37:53.835951'),(2,9439,1,'2026-07-07 10:42:38.592479','INR',NULL,'order_TAUciJHI0KFXyH','pay_TAUczv8suyuWJW',NULL,'4e7227390f504a3b4394850672efadda1b29a224634bb4befea1275bab3e1c24','SUCCESS','2026-07-07 10:43:11.791150'),(3,9439,2,'2026-07-11 12:18:54.925037','INR',NULL,'order_TC6OufgsNbZlvc',NULL,NULL,NULL,'PENDING','2026-07-11 12:18:54.926037'),(4,9439,2,'2026-07-11 12:18:59.360689','INR',NULL,'order_TC6OzWJZ2bSOb1',NULL,NULL,NULL,'PENDING','2026-07-11 12:18:59.360689'),(5,9439,2,'2026-07-11 12:19:04.490517','INR',NULL,'order_TC6P59NShkRhh8',NULL,NULL,NULL,'PENDING','2026-07-11 12:19:04.490517'),(6,21238,2,'2026-07-11 12:21:20.777746','INR',NULL,'order_TC6RTumCPh7ll9','pay_TC6RhKE2hD1BXr',NULL,'7e518cdf6976360b6acffeb9e0656a007e547c5761fb5d72fc25f8ad6f8112bd','SUCCESS','2026-07-11 12:21:50.742910'),(7,10619,2,'2026-07-11 12:33:19.895831','INR',NULL,'order_TC6e8pxGEfAmMa','pay_TC6eFr9UwJliQI',NULL,'178b61aa741beb436fcbbfa3e543d99636f995170609f4c9f0666cab694b0868','SUCCESS','2026-07-11 12:33:42.195853');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `demo_url` text,
  `demo_videos` json DEFAULT NULL,
  `documentation_url` text,
  `download_file_url` text,
  `faqs` json DEFAULT NULL,
  `features` json DEFAULT NULL,
  `overview` text NOT NULL,
  `release_notes` text,
  `screenshots` json DEFAULT NULL,
  `technical_requirements` json DEFAULT NULL,
  `use_cases` json DEFAULT NULL,
  `version_history` json DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_d8itpicgj364s8ud8ge17m4qe` (`product_id`),
  CONSTRAINT `FKnfvvq3meg4ha3u1bju9k4is3r` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (1,'','[]','https://res.cloudinary.com/drpdpoxhr/raw/upload/v1782287998/cws-products/docs/141752c9-19de-4f6f-9c20-bcb514cd4a9c_water_quotation_format','https://res.cloudinary.com/drpdpoxhr/raw/authenticated/s--6lu4IYIf--/v1782287999/cws-products/downloads/b61d583e-7cf3-4a37-89fe-12eb722683dc_book-management-service-1','[{\"answer\": \"Employee Managment System\", \"question\": \"What is EMS ?\"}]','[\"Employee Database Management\", \"Attendance and Leave Tracking\", \"Payroll Integration\", \"Admin Dashboard\"]','An Employee Management System (EMS) is an integrated software platform that digitizes and automates workforce administration. It centralizes employee data and streamlines HR processes like attendance tracking, payroll, performance monitoring, and onboarding, reducing manual workload and improving organizational efficiency','An Employee Management System (EMS) this is an first release','[]','[\"React.js\", \"Node.js\", \"MongoDB\", \"JavaScript\"]','[\"HR & Workforce Management\", \"Employee Self Service\", \"Performance Tracking\", \"Compliance Management\"]','[{\"notes\": null, \"version\": \"v2.4.1\", \"releasedOn\": \"2026-12-06\"}]',1),(2,'','[]','https://res.cloudinary.com/drpdpoxhr/raw/upload/v1782288287/cws-products/docs/cdab76b3-9e1a-4026-88e2-5f4b5d371d8b_water_quotation_format','https://res.cloudinary.com/drpdpoxhr/raw/authenticated/s--7ak609zc--/v1782288288/cws-products/downloads/37f31779-b032-41a7-9cb2-24c139c86153_book-management-service-1','[{\"answer\": \"Is for to manage the staock.\", \"question\": \"What is Stock managment System?\"}]','[\"Product Inventory Tracking\", \"Order Management\", \"Stock Alerts and Reports\", \"Supplier Managemnet\"]','An Stock Management System SMS is an integrated software platform that digitizes and automates workforce administration. It centralizes employee data and streamlines HR processes like attendance tracking, payroll, performance monitoring, and onboarding, reducing manual workload and improving organizational efficiency','An Stock Management System SMS this is an first release','[]','[\"Java\", \"JavaScript\", \"Mysql\", \"Springboot\", \"bootstrap\"]','[\"HR & Workforce Management\", \"Employee Self Service\", \"Performance Tracking\", \"Compliance Management\"]','[]',2),(3,'','[]','https://res.cloudinary.com/drpdpoxhr/raw/upload/v1782288660/cws-products/docs/e2f237e2-2eb5-4da3-8a4c-2a68a517fe4b_water_quotation_format','https://res.cloudinary.com/drpdpoxhr/raw/authenticated/s--Y3J5LeDV--/v1782288662/cws-products/downloads/60bbeb84-c580-4733-9f57-1e8cb8f85e5e_book-management-service-1','[{\"answer\": \"Our team will help you.\", \"question\": \"How to use that?\"}]','[\"Project  and Task Tracking\", \"Team Collabroation Tool\", \"Deadlines and Notifications\", \"Performance Reports\"]','An Stock Management System SMS is an integrated software platform that digitizes and automates workforce administration. It centralizes employee data and streamlines HR processes like attendance tracking, payroll, performance monitoring, and onboarding, reducing manual workload and improving organizational efficiency','An Stock Management System SMS is an integrated software platform that digitizes and automates workforce administration. It centralizes employee data and streamlines HR processes like attendance tracking, payroll, performance monitoring, and onboarding, reducing manual workload and improving organizational efficiency','[]','[\"Python\", \"Django\", \"Mysql\", \"React js\"]','[\"HR & Workforce Management\", \"Employee Self Service\", \"Performance Tracking\", \"Compliance Management\"]','[]',3);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ratings`
--

DROP TABLE IF EXISTS `product_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_ratings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` text,
  `created_at` datetime(6) NOT NULL,
  `rating` int NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_product_rating` (`user_id`,`product_id`),
  KEY `FK6vmxt3km86rrgrslgy71ne3e5` (`product_id`),
  CONSTRAINT `FK6vmxt3km86rrgrslgy71ne3e5` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKrinkxs2nb4wouojjdsn4nn8g9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ratings`
--

LOCK TABLES `product_ratings` WRITE;
/*!40000 ALTER TABLE `product_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `average_rating` double NOT NULL,
  `category` enum('ENTERPRISE','SAAS_PLATFORM','UTILITY_SOFTWARE','E_COMMERCE') DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `current_version` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `discount_percent` double DEFAULT NULL,
  `discounted_price` double DEFAULT NULL,
  `download_count` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `revenue` double NOT NULL,
  `sales_count` int NOT NULL,
  `short_description` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('DRAFT','PUBLISHED','ARCHIVED') NOT NULL,
  `thumbnail_image` varchar(255) NOT NULL,
  `total_reviews` int NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ostq1ec3toafnjok09y9l7dox` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,0,'ENTERPRISE','2026-06-24 13:29:59.515225','v2.4.1',_binary '\0',NULL,NULL,0,'Employee Management System',7999,23997,3,'An Employee Management System (EMS) is an integrated software platform that digitizes and automates workforce administration. It centralizes employee data and streamlines HR processes like attendance tracking, payroll, performance monitoring, and onboarding, reducing manual workload and improving organizational efficiency','employee-management-system','PUBLISHED','https://res.cloudinary.com/drpdpoxhr/image/upload/v1782287995/cws-products/thumbnails/1ba2c151-62dd-49cd-bdc9-a1ade7e1adac_stock_management_system.png',0,'2026-07-11 12:21:50.858464'),(2,0,'SAAS_PLATFORM','2026-06-24 13:34:48.478956','v2.4.1',_binary '\0',NULL,NULL,0,'Stock Management System',9999,9999,1,'An Stock Management System SMS is an integrated software platform that digitizes and automates workforce administration. It centralizes employee data and streamlines HR processes like attendance tracking, payroll, performance monitoring, and onboarding, reducing manual workload and improving organizational efficiency','stock-management-system','PUBLISHED','https://res.cloudinary.com/drpdpoxhr/image/upload/v1782288284/cws-products/thumbnails/272968ce-38d7-4429-ab9c-24e590b298da_product__1_.png',0,'2026-07-11 12:21:50.882279'),(3,0,'UTILITY_SOFTWARE','2026-06-24 13:41:02.485515','v2.4.1.1',_binary '\0',NULL,NULL,0,'Task Management System',8999,8999,1,'An Task Management System SMS is an integrated software platform that digitizes and automates workforce administration. It centralizes employee data and streamlines HR processes like attendance tracking, payroll, performance monitoring, and onboarding, reducing manual workload and improving organizational efficiency','task-management-system','PUBLISHED','https://res.cloudinary.com/drpdpoxhr/image/upload/v1782288658/cws-products/thumbnails/175638cc-0617-42b0-8402-e7c743427081_tab2.png',0,'2026-07-11 12:33:42.261654');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchased_products`
--

DROP TABLE IF EXISTS `purchased_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchased_products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `download_count` int NOT NULL,
  `last_downloaded_at` datetime(6) DEFAULT NULL,
  `license_status` enum('ACTIVE','INACTIVE','EXPIRED','SUSPENDED','PENDING_RENEWAL','DEACTIVATED') NOT NULL,
  `purchase_date` datetime(6) NOT NULL,
  `purchase_price` double NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKaghfe6hfcxiqmhlg8kaq752wp` (`order_id`),
  KEY `FKc9dfil8ncv5lckqko7kc00k3b` (`product_id`),
  KEY `FK5kobc1foq6ycuteyvkh71jynr` (`user_id`),
  CONSTRAINT `FK5kobc1foq6ycuteyvkh71jynr` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKaghfe6hfcxiqmhlg8kaq752wp` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKc9dfil8ncv5lckqko7kc00k3b` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchased_products`
--

LOCK TABLES `purchased_products` WRITE;
/*!40000 ALTER TABLE `purchased_products` DISABLE KEYS */;
INSERT INTO `purchased_products` VALUES (1,_binary '','2026-07-07 10:43:11.846714',0,NULL,'ACTIVE','2026-07-07 10:43:11.844707',7999,'2026-07-07 10:43:11.846714',2,1,1),(2,_binary '','2026-07-11 12:21:50.761127',0,NULL,'ACTIVE','2026-07-11 12:21:50.760102',7999,'2026-07-11 12:21:50.761127',3,1,2),(3,_binary '','2026-07-11 12:21:50.785723',1,'2026-07-11 12:22:26.709192','ACTIVE','2026-07-11 12:21:50.784731',9999,'2026-07-11 12:22:26.730508',3,2,2),(4,_binary '','2026-07-11 12:33:42.209994',0,NULL,'ACTIVE','2026-07-11 12:33:42.208718',8999,'2026-07-11 12:33:42.209994',4,3,2);
/*!40000 ALTER TABLE `purchased_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_document_mapping`
--

DROP TABLE IF EXISTS `user_document_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_document_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `orignal_url` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_type` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs3mvtayxvms3lax1a136qhooy` (`user_id`),
  CONSTRAINT `FKs3mvtayxvms3lax1a136qhooy` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_document_mapping`
--

LOCK TABLES `user_document_mapping` WRITE;
/*!40000 ALTER TABLE `user_document_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_document_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `expiry_date` datetime(6) NOT NULL,
  `token` varchar(255) NOT NULL,
  `token_type` enum('EMAIL_VERIFICATION','PASSWORD_RESET') NOT NULL,
  `used` bit(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fvl6k04x11pern525noiw5k6v` (`token`),
  KEY `FK61iiu6gfevpvo2v3yl76sar7r` (`user_id`),
  CONSTRAINT `FK61iiu6gfevpvo2v3yl76sar7r` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
INSERT INTO `user_tokens` VALUES (1,'2026-06-24 15:36:34.040647',_binary '\0','2026-06-24 15:37:01.395690','2026-06-25 15:36:34.034799','316e8962-b89e-413a-a4a7-de3dfc2f7e4c','EMAIL_VERIFICATION',_binary '',2);
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `active_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','BUYER') NOT NULL,
  `status` enum('ACTIVE','INACTIVE','PENDING','SUSPENDED','BLOCKED','DELETED') NOT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2026-06-24 13:23:52.204237',_binary '\0','2026-07-10 17:16:53.537383','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbkBzaG9wLmNvbSIsImlhdCI6MTc4MzY4NDAxMywiZXhwIjoxNzgzNjg3NjEzfQ.Vu-Anc62rCkdpAJxnDwJy-wOa5xM0YSwcLxz3AN7raQ','admin@shop.com','9999999999','Admin User','$2a$10$eLx/uPnoPnlphkMMYPLjj.dmlyKco4HwVsrMv7fe3qqolWCwu34Zu','ADMIN','ACTIVE',NULL,'2026-07-10 17:16:53.534364',NULL),(2,'2026-06-24 15:36:33.808466',_binary '\0','2026-07-15 08:56:32.068306','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqYWRoYXYuZ2FuZXNoMTcwMEBnbWFpbC5jb20iLCJpYXQiOjE3ODQwODU5OTIsImV4cCI6MTc4NDA4OTU5Mn0.qqwuA9TnncU1vYNOJllPMvNsBgAN-Sr4v6PlVabz3eI','jadhav.ganesh1700@gmail.com','9923906995','Ganesh  Satish jadhav','$2a$10$51eqt8RnZsRe2m6.DIiAtOAwlqheyoaaEnag.Ol/ogTnCCR/3dmm6','BUYER','ACTIVE','Creative Web Solution','2026-07-15 08:56:32.053712',NULL);
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

-- Dump completed on 2026-07-15 13:30:15
