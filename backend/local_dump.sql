-- MySQL dump 10.13  Distrib 8.4.10, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lifestyle_products
-- ------------------------------------------------------
-- Server version	8.4.10

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
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` int NOT NULL DEFAULT '0',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'Premium Skincare Collection','https://ik.imagekit.io/StringstackSahana/Vitamin%20C%20Serum%20Bottle.jpg','/catalog?categoryId=1',1,'2026-08-04 15:04:02.217201','2026-08-04 15:04:02.217201'),(2,'Luxury Bedding & Bath Set','https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Bed%20Sheet%20Set.jpg?updatedAt=1785413517505','/catalog?categoryId=6',2,'2026-08-04 15:04:02.217201','2026-08-04 15:04:02.217201');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cart_product` (`cart_id`,`product_id`),
  KEY `fk_cart_items_product` (`product_id`),
  CONSTRAINT `fk_cart_items_cart` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chk_cart_items_quantity` CHECK ((`quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (12,1,93,1,'2026-08-08 13:50:52.349777','2026-08-08 13:50:52.349777');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_carts_user` (`user_id`),
  CONSTRAINT `fk_carts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,5,'2026-08-04 09:46:34.108329','2026-08-04 09:46:34.108694');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_categories_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Skincare','Premium organic serums, under-eye creams, and sunscreens.','https://ik.imagekit.io/StringstackSahana/Vitamin%20C%20Serum%20Bottle.jpg','2026-08-04 15:04:02.184850','2026-08-04 15:04:02.184850'),(2,'Beauty & Makeup','High-coverage foundations, waterproof mascaras, and natural blushes.','https://ik.imagekit.io/StringstackSahana/beauty%20and%20makeup/Foundation.jpg?updatedAt=1785162230793','2026-08-04 15:04:02.184850','2026-08-04 15:04:02.184850'),(3,'Fashion Accessories','Classic wristwatches, leather handbags, and UV sunglasses.','https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Handbag.jpg?updatedAt=1785413446124','2026-08-04 15:04:02.184850','2026-08-04 15:04:02.184850'),(4,'Home Decor','Minimalist table lamps, scented candles, and dream catchers.','https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Home%20Decor/Table%20Lamp.jpg?updatedAt=1785415599824','2026-08-04 15:04:02.184850','2026-08-04 15:04:02.184850'),(5,'Kitchen Essentials','Dinner sets, ceramic coffee mugs, and smart air fryers.','https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Dinner%20Set.jpg?updatedAt=1785415638424','2026-08-04 15:04:02.184850','2026-08-04 15:04:02.184850'),(6,'Bedding & Bath','Comfortable cotton sheets, pillows, and premium bath robes.','https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Bed%20Sheet%20Set.jpg?updatedAt=1785413517505','2026-08-04 15:04:02.184850','2026-08-04 15:04:02.184850');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt_tokens`
--

DROP TABLE IF EXISTS `jwt_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jwt_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `token` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhy6n4wirmw0ryw2wdmy9cx2mn` (`user_id`),
  CONSTRAINT `FKhy6n4wirmw0ryw2wdmy9cx2mn` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_tokens`
--

LOCK TABLES `jwt_tokens` WRITE;
/*!40000 ALTER TABLE `jwt_tokens` DISABLE KEYS */;
INSERT INTO `jwt_tokens` VALUES (3,'2026-08-04 11:17:06.707464','2026-08-04 11:17:06.707464','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg1ODQyMjI2LCJleHAiOjE3ODU4NDU4MjZ9.fZi3krYwFK1W_3xjGXlCiJuMMbVKzJwqhSetBgv1YwQA8337pd1QfILbsgR1WT9i5HeEGxVuSQw3bSxYJzC4kw',5),(5,'2026-08-04 11:50:56.086369','2026-08-04 11:50:56.086369','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg1ODQ0MjU2LCJleHAiOjE3ODU4NDc4NTZ9.bcDz4gIB-4nJvMxOcn_1Hu-8myEcfVkUNXTXScmpfoooaPJ9UfSFAn0eSNVOXOZatni1svtQsaNZjPqKEEBmVg',5),(17,'2026-08-04 16:52:47.109217','2026-08-04 16:52:47.109217','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg1ODYyMzY3LCJleHAiOjE3ODU4NjU5Njd9.S5g8VhJ3DSZxCuXXfnrj8iPate3HHqd9uZsa63NbEgWl-ZFkWym8pEqMrPnq2PTHcTeX-TjA_AtM6i5L6hPzYw',5),(25,'2026-08-04 18:49:08.297063','2026-08-04 18:49:08.297063','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc4NTg2OTM0OCwiZXhwIjoxNzg1ODcyOTQ4fQ.IxhlO3MIsyoLMbDU8gEctHof49Gqzt4sbKVOIuyFzlBT75rw_rnMTHAs1GgN8k7rgwN2Z62sl_jGXf165V9ECA',1),(26,'2026-08-04 18:52:17.535404','2026-08-04 18:52:17.535404','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg1ODY5NTM3LCJleHAiOjE3ODU4NzMxMzd9.TJGGbhKnej14ucXi6qlkZmhyJFP9uJHtOMaVkLR4NQYoHS8VtNRMYiNezpaN5FLJ-IjmB1SOQAwo2Z1KVVTcPA',5),(29,'2026-08-05 04:32:03.463839','2026-08-05 04:32:03.463839','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg1OTA0MzIzLCJleHAiOjE3ODU5MDc5MjN9.WKQWr23HZ2GsWUIWjwH5aD421Q-JnjS_BxONPL-4mdwYl8PwaNRdgV1_XLQyfpeoRjtRyzmxGVuutG8WaahiGw',5),(30,'2026-08-05 06:23:34.129681','2026-08-05 06:23:34.130040','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg1OTExMDE0LCJleHAiOjE3ODU5MTQ2MTR9.0B7O6oxrfjX6VrI3Kd1QPSqns5LAS4w8NXoSTLeskTV9XNq-dcC1TiIUSQztNqywcBiC2bkWfjAXsZok7rk5OQ',5),(33,'2026-08-05 11:43:29.929519','2026-08-05 11:43:29.929519','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg1OTMwMjA5LCJleHAiOjE3ODU5MzM4MDl9.Rjl8Vv5ZpRn16OdzCIcKpD6jLMZS4MsMGyEllumWkxEDaWbXyrTxQg7cWGicwmC687vd1Q42UTsSpI3_yzVK0Q',5),(34,'2026-08-06 04:10:14.814625','2026-08-06 04:10:14.815131','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg1OTg5NDE0LCJleHAiOjE3ODU5OTMwMTR9.-kKnnabZi9GxfL8fpV9r67oAPUqGpskSGS7VniIkdfTKgcLtlwKLgAWsFv0hjD2yBVErS1LuEHkN816eR6y6kQ',5),(35,'2026-08-06 05:32:04.440848','2026-08-06 05:32:04.440848','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg1OTk0MzI0LCJleHAiOjE3ODU5OTc5MjR9.ADzafG5GHdifXKsg9yV-7r9_q04EuCuViju3i6dxdMdyPr3KlD_5VfFFYRQH2JN6LE6xozfB05NZLp6rQITWAQ',5),(36,'2026-08-06 07:08:53.796962','2026-08-06 07:08:53.796962','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg2MDAwMTMzLCJleHAiOjE3ODYwMDM3MzN9.c2xexkmsScJEh0G3Y8lUsKw-6oXKOE4vOI0Dkh1wFyP-DqrOqgeKNvObUfonxEyEXWhAAU8xupvwTuk_uRC_dQ',5),(40,'2026-08-07 07:01:50.338333','2026-08-07 07:01:50.338333','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg2MDg2MTEwLCJleHAiOjE3ODYwODk3MTB9.YWavmyjqDT-aidKA4CX5NcKc8cvF2zQGequlAstlFPb2g1U30njTJa_dDxzTanOlW305DpZUt4u5_h9UVshOiQ',5),(44,'2026-08-07 08:44:37.590308','2026-08-07 08:44:37.590308','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg2MDkyMjc3LCJleHAiOjE3ODYwOTU4Nzd9.RSo-1oYtjAkkf_kB6LmhmXNb_fE45Gy8zVY3QoUuVS7e5dR3Bz2c_fqXEr5eZxppgXh9erEzi2jPhR4p__xsXA',5),(45,'2026-08-07 10:11:47.189752','2026-08-07 10:11:47.189752','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg2MDk3NTA3LCJleHAiOjE3ODYxMDExMDd9.0QGpyu5JYL8YadmzqOFxDMm3MLyNbeXqow3w8iuZxs3dpHngDFrAyubkuhmoAuy7moQuXgKpJ4NatbYNd_rATw',5),(46,'2026-08-08 04:52:00.421099','2026-08-08 04:52:00.421099','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg2MTY0NzIwLCJleHAiOjE3ODYxNjgzMjB9.dGm4ZZBnioX7HEKUniepZy706Gt94z_hn5-8ohYwvZcFhjRlmjBFcJowbbtIkJTdqreXOpdKs4dLCLIMAZA_jw',5),(47,'2026-08-08 13:50:38.307259','2026-08-08 13:50:38.307259','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg2MTk3MDM4LCJleHAiOjE3ODYyMDA2Mzh9.aeDHj-R3UPNCEtrbVa2900CQ2ztxbuFcj2RvXl_dPaTbXQY4m9JVBDThmlTIN7sJ_XsUGzzCqXhX2hU0j3sWCA',5),(50,'2026-08-09 14:54:45.655580','2026-08-09 14:54:45.655580','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg2Mjg3Mjg1LCJleHAiOjE3ODYyOTA4ODV9.tl97mjtMWL8kLUdrlcstspcaezMe3_4LfRi8pLgjl-UYKyYcXQZ4-Cc9OOcXhXSkpMZh9WZRp7UfLSe8DGs3MQ',5),(51,'2026-08-11 14:10:42.277857','2026-08-11 14:10:42.277857','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJMYXZhbnlhIiwiaWF0IjoxNzg2NDU3NDQyLCJleHAiOjE3ODY0NjEwNDJ9.pYHqoCYpmUDkiZWSPOqwh6HmU2CgVbPdhZdSbLDJ_6y0QrJueGVehgsl948NdOmyeZlYo8pESb5ShmYEb_oGiA',5);
/*!40000 ALTER TABLE `jwt_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_product` (`order_id`,`product_id`),
  KEY `fk_order_items_product` (`product_id`),
  CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `chk_order_items_price` CHECK ((`price` >= 0.00)),
  CONSTRAINT `chk_order_items_quantity` CHECK ((`quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,7,1,149.00,'2026-08-04 09:47:00.139611','2026-08-04 09:47:00.139611'),(2,1,35,1,149.00,'2026-08-04 09:47:00.146139','2026-08-04 09:47:00.146139'),(3,1,40,1,149.00,'2026-08-04 09:47:00.148134','2026-08-04 09:47:00.148134'),(4,1,34,1,199.00,'2026-08-04 09:47:00.151126','2026-08-04 09:47:00.151126'),(5,2,40,1,149.00,'2026-08-04 10:23:55.532041','2026-08-04 10:23:55.532041'),(6,2,35,2,149.00,'2026-08-04 10:23:55.536361','2026-08-04 10:23:55.536361'),(7,3,35,1,149.00,'2026-08-04 10:25:51.018980','2026-08-04 10:25:51.018980'),(8,4,77,1,3999.00,'2026-08-05 11:38:29.097561','2026-08-05 11:38:29.097561'),(9,4,65,1,299.00,'2026-08-05 11:38:29.115004','2026-08-05 11:38:29.115004'),(10,5,93,1,100.00,'2026-08-06 07:09:25.307678','2026-08-06 07:09:25.307678'),(11,6,7,1,149.00,'2026-08-07 06:15:29.891097','2026-08-07 06:15:29.891097');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `shipping_address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_user` (`user_id`),
  KEY `idx_order_date` (`order_date`),
  KEY `idx_order_status` (`status`),
  CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `chk_orders_total` CHECK ((`total_amount` >= 0.00))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,'2026-08-04 09:47:00.122696','PROCESSING',646.00,'btm layout banglore','2026-08-04 09:47:00.128635','2026-08-04 09:47:26.280074'),(2,5,'2026-08-04 10:23:55.520499','PROCESSING',447.00,'priya','2026-08-04 10:23:55.523841','2026-08-04 10:24:55.963958'),(3,5,'2026-08-04 10:25:51.011759','PENDING',149.00,'bngd','2026-08-04 10:25:51.013986','2026-08-04 10:25:51.013986'),(4,5,'2026-08-05 11:38:29.061719','PROCESSING',4298.00,'asdfghsdfghjdfghjkfghjkl','2026-08-05 11:38:29.074060','2026-08-05 11:38:59.779860'),(5,5,'2026-08-06 07:09:25.304687','PROCESSING',100.00,'fghjkl','2026-08-06 07:09:25.305685','2026-08-06 07:09:54.732621'),(6,5,'2026-08-07 06:15:29.869688','PROCESSING',149.00,'btm','2026-08-07 06:15:29.876645','2026-08-07 06:15:56.337633');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `expiry_date` datetime(6) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` bit(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK71lqwbwtklmljk3qlsugr1mig` (`token`),
  KEY `FKk3ndxg5xp6v7wd4gjyusp15gq` (`user_id`),
  CONSTRAINT `FKk3ndxg5xp6v7wd4gjyusp15gq` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
INSERT INTO `password_reset_tokens` VALUES (1,'2026-08-04 18:47:00.178433','2026-08-04 18:47:31.900221','2026-08-04 19:02:00.176356','52904c88-6b72-433d-b6e9-cc80cc7b3184',_binary '',1);
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `transaction_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_payments_order` (`order_id`),
  UNIQUE KEY `uq_payments_txn` (`transaction_id`),
  KEY `idx_payment_status_date` (`payment_status`,`payment_date`),
  KEY `idx_payment_txn` (`transaction_id`),
  CONSTRAINT `fk_payments_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `chk_payments_amount` CHECK ((`amount` >= 0.00))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'pay_TLeG424jGd2hZE',646.00,'RAZORPAY','COMPLETED','2026-08-04 09:47:26.258084','2026-08-04 09:47:26.258692','2026-08-04 09:47:26.258692'),(2,2,'pay_TLetgGtZi8qf8B',447.00,'RAZORPAY','COMPLETED','2026-08-04 10:24:55.958299','2026-08-04 10:24:55.958299','2026-08-04 10:24:55.958299'),(3,4,'pay_TM4h1NGngnRH7S',4298.00,'RAZORPAY','COMPLETED','2026-08-05 11:38:59.764318','2026-08-05 11:38:59.765322','2026-08-05 11:38:59.765322'),(4,5,'pay_TMOdvMi8H15evP',100.00,'RAZORPAY','COMPLETED','2026-08-06 07:09:54.722791','2026-08-06 07:09:54.722791','2026-08-06 07:09:54.722791'),(5,6,'pay_TMmG11Zpns0Wd9',149.00,'RAZORPAY','COMPLETED','2026-08-07 06:15:56.329104','2026-08-07 06:15:56.330101','2026-08-07 06:15:56.330101');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_payment_insert` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
    IF NEW.payment_status = 'COMPLETED' THEN
        UPDATE orders 
        SET status = 'PROCESSING', updated_at = NOW(6)
        WHERE id = NEW.order_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_payment_update` AFTER UPDATE ON `payments` FOR EACH ROW BEGIN
    IF NEW.payment_status = 'COMPLETED' AND OLD.payment_status != 'COMPLETED' THEN
        UPDATE orders 
        SET status = 'PROCESSING', updated_at = NOW(6)
        WHERE id = NEW.order_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `category_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_name` (`name`),
  KEY `idx_product_featured` (`featured`),
  KEY `idx_product_category_price` (`category_id`,`price`),
  CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `chk_products_price` CHECK ((`price` >= 0.00))
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Vitamin C Serum','Powerful antioxidant serum that brightens skin, reduces dark spots, and improves skin texture for a radiant glow.',599.00,'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQMKzvXM54vs-ea2fNESGZwlJvvRTcBdwFU0qsIAQkhryowN9yojaVQoAU3Iy-vxKQiQux_q74YuPhk3FI-Jf-QZNctGvYa75Csv9791N_rvTQZN3e7zGIq&usqp=CAc',1,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(2,'Under Eye Cream','Nourishing under-eye cream that targets dark circles, reduces puffiness, and smooths fine lines.',499.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLTyLWsodW5RlK1DckZF_-xj3r4xJWmQN58br-gxGsLQ&s=10',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(3,'Sunscreen SPF 50','Broad-spectrum SPF 50 sunscreen that shields skin from harmful UV rays while keeping it hydrated and non-greasy.',399.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqBLrDdEHoGpGhUddxpr9CGvYhIeByZtAgmNpTteKkRw&s=10',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(4,'Olay Night Cream','Rich anti-aging night cream that deeply nourishes, restores elasticity, and rejuvenates skin overnight.',699.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdEf1eMsV-8Zy9PSKLf_9OpMAkhBEmZhjgc_QVebm4mQ&s',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(5,'Micellar Water','Gentle micellar water that effortlessly removes makeup, dirt, and impurities without stripping natural moisture.',299.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3jGDI6JO_xTdonPBUFLG2ornX5A3A4I5cYikULf3vhA&s=10',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(6,'Makeup Remover Wipes','Soft, pre-moistened face wipes that quickly dissolve waterproof makeup and refresh the skin on the go.',249.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK5dYUnoQdDv-cUMD56Vaz4vFUtx-HqbLNcY7tfBvZ-g&s',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(7,'Lip Balm','Ultra-hydrating lip balm infused with natural oils to keep lips soft, supple, and moisturized all day.',149.00,'https://ik.imagekit.io/StringstackSahana/Lip%20Balm.jpg',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(8,'Facewash','Gentle foaming facewash that deeply cleanses, removes excess oil, and leaves skin feeling fresh and balanced.',349.00,'https://ik.imagekit.io/StringstackSahana/Facewash.jpg',1,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(9,'Facial Scrub','Exfoliating facial scrub with fine particles that gently remove dead skin cells and reveal a smoother complexion.',299.00,'https://ik.imagekit.io/StringstackSahana/Facial%20Scrub.jpg',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(10,'Face Toner','Alcohol-free face toner that refines pores, balances pH levels, and preps skin for optimal hydration.',399.00,'https://ik.imagekit.io/StringstackSahana/Face%20Toner.jpg',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(11,'Face Mask','Soothing clay face mask that extracts deep-seated impurities, unclogs pores, and revitalizes tired skin.',249.00,'https://ik.imagekit.io/StringstackSahana/Face%20Mask.jpg',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(12,'Brightening Cream','Advanced skin brightening cream designed to even out skin tone, reduce hyperpigmentation, and restore natural glow.',499.00,'https://ik.imagekit.io/StringstackSahana/Brightening%20Cream.jpg',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(13,'Anti-Acne Gel Combo','Fast-acting anti-acne spot treatment gel that visibly reduces blemishes, redness, and prevents future breakouts.',549.00,'https://ik.imagekit.io/StringstackSahana/Anti-Acne%20Gel%20Combo.jpg',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(14,'Aloe Vera Gel','100% pure organic aloe vera gel that instantly soothes sunburns, hydrates dry skin, and cools irritation.',199.00,'https://ik.imagekit.io/StringstackSahana/Aloe%20Vera%20Gel.jpg',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(15,'Cleansing Balm','Luxurious melting cleansing balm that breaks down stubborn makeup, dirt, and pollution into a soft milky emulsion.',449.00,'https://ik.imagekit.io/StringstackSahana/Cleansing%20Balm.jpg',0,1,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(16,'Nail Polish','Vibrant, long-lasting nail polish available in multiple chip-resistant shades with a high-shine glossy finish.',199.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU59uvGoNGH5kH5XraCiTTmwcMkS7QdvtE65iJCTbq-g&s=10',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(17,'Mascara','Waterproof, smudge-free mascara that adds dramatic volume, length, and lift to your lashes.',349.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8y9T66KitoUfDt2KG6DGXJDSkZ6cFV04lSJCrGDbfSA&s=10',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(18,'Makeup Setting Spray','Ultra-fine weightless mist that locks in your makeup all day with a fresh, dewy, or matte finish.',399.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUnBcqQAhqNX-gfeBYQWWqYAEkHw79kASmq3__LLH0Jw&s',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(19,'Makeup Brush Set','Professional-grade 12-piece makeup brush set with ultra-soft synthetic bristles for flawless application.',599.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrFii-qLWG3WIIuFENzluAEIaZDamDurnV7Seut5unjQ&s=10',1,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(20,'Lipstick','Creamy, highly pigmented matte lipstick that glides on smoothly and stays comfortable for hours.',299.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8vtTZtdYGMa1RX3f2cze7dP7cvXwqzDY0-ERZszfn9w&s=10',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(21,'Lip Liner','Precision lip liner pencil to define, shape, and prevent lipstick feathering for a perfect pout.',199.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3j-tPzBvpYfcQ26VY8lfreXhoc95aZRj8j7g7zE2T9Q&s=10',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(22,'Highlighter','Finely milled shimmering powder highlighter that adds a luminous, buildable glow to the high points of your face.',399.00,'https://ik.imagekit.io/StringstackSahana/beauty%20and%20makeup/Highlighter.jpg?updatedAt=1785162213265',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(23,'Blush','Silky, blendable powder blush that delivers a natural flush of healthy color to your cheeks.',349.00,'https://ik.imagekit.io/StringstackSahana/beauty%20and%20makeup/Blush.jpg',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(24,'Foundation','Lightweight liquid foundation that provides buildable full coverage with a seamless, natural skin-like finish.',549.00,'https://ik.imagekit.io/StringstackSahana/beauty%20and%20makeup/Foundation.jpg?updatedAt=1785162230793',1,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(25,'Eyeliner','Highly pigmented, smudge-proof liquid eyeliner that delivers precise wing definitions with a matte black finish.',249.00,'https://ik.imagekit.io/StringstackSahana/beauty%20and%20makeup/Eyeliner.jpg?updatedAt=1785162249791',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(26,'Contour Palette','Curated contour and highlight palette designed to sculpt, define, and enhance your facial features.',699.00,'https://ik.imagekit.io/StringstackSahana/beauty%20and%20makeup/Contour%20Palette.jpg?updatedAt=1785162267693',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(27,'Concealer','High-coverage liquid concealer that effortlessly hides blemishes, dark circles, and imperfections all day.',449.00,'https://ik.imagekit.io/StringstackSahana/beauty%20and%20makeup/Concealer.jpg?updatedAt=1785162282519',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(28,'Compact Powder','Finely pressed compact powder that sets makeup, controls shine, and provides a smooth velvet finish.',299.00,'https://ik.imagekit.io/StringstackSahana/beauty%20and%20makeup/Compact%20Powder.jpg?updatedAt=1785162334957',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(29,'Blender','Teardrop-shaped makeup sponge blender that ensures seamless, streak-free blending of all liquid and cream products.',149.00,'https://ik.imagekit.io/StringstackSahana/beauty%20and%20makeup/Blender.jpg?updatedAt=1785162335133',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(30,'BB Cream','Lightweight multi-tasking BB cream that hydrates, protects with SPF, and provides a natural tint of coverage.',399.00,'https://ik.imagekit.io/StringstackSahana/beauty%20and%20makeup/BB%20Cream.jpg?updatedAt=1785162335523',0,2,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(31,'Umbrella','Stylish and windproof compact umbrella that provides premium protection from both heavy rain and harsh sun.',499.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMxV1sdU33moEU3ksz6fMNPczIUgyFkQfbwkMGPDfHog&s=10',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(32,'Bracelet','Elegant, hand-crafted silver chain bracelet designed to add a delicate touch of luxury to everyday wear.',299.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx5_-1TcWwHq07TYggFAxN8JWzx2ToLktekk7Vc8X9RQ&s',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(33,'Scarf','Luxuriously soft and lightweight scarf woven from premium breathable fabric, perfect for styling in any season.',399.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRVyK0H0XAF87nFVUH4sfKimsP7x2p64YDixct4-8GHA&s',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(34,'Hair Clip Set','A chic collection of decorative, strong-hold hair clips designed to complement various hairstyles and outfits.',199.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcMiLYqDODJ8Ew2lK3yFRkk04ve7Cl_tr0Rw3tgMFOUA&s=10',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(35,'Keychain','Durable, stylish leather keychain featuring a heavy-duty ring clasp for secure and fashionable key organization.',149.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQECDx5df1vAfti9pWE8MDXe0hlYy8xUqxkghr2EpFyXw&s=10',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(36,'Belt','Classic genuine leather belt with a polished metal buckle, adjustable for a comfortable and refined fit.',499.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEwEtJuCxaqkLGoZ_twQKjUrpGhi5-r4KbIVs-UrFrjA&s=10',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(37,'Sling Bag','Compact and fashionable cross-body sling bag with multiple secure compartments for all your daily essentials.',899.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi1I5VL69h_Xo9UYY0WeibkxWdfyxCDEnWIhSq7m9Fcg&s=10',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(38,'Handbag','Elegant, spacious designer handbag crafted from premium vegan leather, ideal for work, travel, or shopping.',1299.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ3tY3XP4D3LQg5wHpwu0-NgGNhJJTaLu9teoGdf3Xvg&s',1,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(39,'Cap','Breathable, lightweight cotton sports cap with an adjustable strap, offering both sun protection and casual style.',299.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEdk1_dOGQkZ2Wfv5pK2TotHWbib1Yl4UNokLZBVHwtA&s',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(40,'Hair Band','Comfortable, non-slip elastic hair band designed to securely keep hair in place during workouts or daily routines.',149.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Hair%20Band.jpg?updatedAt=1785413446118',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(41,'Tote Bag','Eco-friendly, highly durable canvas tote bag featuring a spacious interior and comfortable shoulder straps.',499.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Tote%20Bag.jpeg?updatedAt=1785413446221',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(42,'Rings','A beautiful set of stackable, minimalist rings made from tarnish-resistant metal for everyday elegance.',299.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Rings.jpg?updatedAt=1785413446019',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(43,'Backpack','Ergonomic, spacious lifestyle backpack equipped with a padded laptop sleeve and multiple utility pockets.',1499.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Backpack.jpg?updatedAt=1785413446023',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(44,'Wrist Watches','Premium analog wrist watch featuring a classic design, quartz movement, and a durable water-resistant build.',1999.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Wrist%20Watches.jpg?updatedAt=1785413446036',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(45,'Anklet','Elegant silver anklet decorated with delicate charms, designed to add charm and grace to any outfit.',249.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Anklet.jpg?updatedAt=1785413445999',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(46,'Earrings','Stunning, lightweight drop earrings designed to add sophistication and sparkle to casual or formal ensembles.',399.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Earrings.jpg?updatedAt=1785413445956',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(47,'Wallet','Sleek, minimalist bifold leather wallet featuring multiple card slots and secure cash pockets.',699.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Wallet.jpg?updatedAt=1785413445846',0,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(48,'Sunglasses','Premium UV400 protected classic sunglasses with a durable, lightweight frame for maximum outdoor style.',999.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Sunglasses.jpg?updatedAt=1785413445709',1,3,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(49,'Wall Clock','Elegant minimalist wall clock featuring a silent, sweep movement, perfect for contemporary homes.',799.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSa7P64LJP8SPVvGN3Hnwm_YKjhzRGObvsVQttaXVdA4Q&s=10',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(50,'Decorative Vase','Beautifully hand-crafted ceramic decorative vase that adds a touch of artistic charm to tables and mantels.',699.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQS49yKx4F_T2sIR0whN_XyrxxSbpwzh3EBWhlGB90tbA&s=10',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(51,'Artificial Plant','Lifelike artificial potted plant that adds fresh, hassle-free greenery to your office or home decor.',499.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmv_H6gYI9RhYrAXlYNAGZAEy765YUq1IEaPbtA3m1uQ&s=10',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(52,'Indoor Plant Pot','Modern, sturdy ceramic plant pot equipped with a drainage hole, ideal for keeping indoor houseplants healthy.',599.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv7xKb8lLzxR_YidglTNY1k0x_H4OKPt1vxZW48wZ1nQ&s',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(53,'Photo Frame','Premium quality wood photo frame designed to preserve and elegantly showcase your cherished memories.',349.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Home%20Decor/Photo%20Frame.jpg?updatedAt=1785415599352',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(54,'Wall Mirror','Chic decorative wall mirror featuring a sleek metal frame, designed to brighten and visually expand any room.',1299.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Home%20Decor/Wall%20Mirror.jpg?updatedAt=1785415599800',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(55,'Scented Candle','Aromatic hand-poured soy wax scented candle that fills your space with a calming, long-lasting lavender fragrance.',299.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Home%20Decor/Scented%20Candle.jpg?updatedAt=1785415599830',1,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(56,'Aroma Diffuser','Ultrasonic aroma oil diffuser and humidifier that creates a relaxing, mist-filled atmosphere in your home.',999.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Home%20Decor/Aroma%20Diffuser.jpg?updatedAt=1785415599446',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(57,'Table Lamp','Stylish bedside table lamp featuring a fabric shade, providing warm, diffused ambient light for bedrooms.',1499.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Home%20Decor/Table%20Lamp.jpg?updatedAt=1785415599824',1,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(58,'Floor Lamp','Modern tripod floor lamp that stands elegantly, casting bright, comfortable light over your reading corner.',2499.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Home%20Decor/Floor%20Lamp.jpg?updatedAt=1785415599447',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(59,'Cushion Cover','Set of soft cushion covers featuring detailed minimalist geometric patterns and hidden zipper closures.',299.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Home%20Decor/Cushion%20Cover.jpg?updatedAt=1785415599845',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(60,'Throw Pillow','Plush, ultra-soft decorative throw pillow designed to provide comfortable back support and elevate sofa aesthetics.',499.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Home%20Decor/Throw%20Pillow.jpg?updatedAt=1785415599759',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(61,'Wall Art','Premium canvas printed wall art featuring beautiful abstract designs, stretched and ready to hang.',899.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Home%20Decor/Wall%20Art.jpg?updatedAt=1785415599501',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(62,'Decorative Tray','Elegant serving and decorative tray crafted from premium wood, perfect for organizing coffee tables.',599.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Home%20Decor/Decorative%20Tray.jpg?updatedAt=1785415599812',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(63,'Dream Catcher','Traditional handcrafted dream catcher decorated with soft feathers, designed to bring positive vibes and sweet dreams.',399.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Home%20Decor/Dream%20Catcher.jpg?updatedAt=1785415600061',0,4,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(64,'Dinner Set','Premium 24-piece ceramic dinnerware set, chip-resistant and microwave-safe, perfect for elegant dining.',1499.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Dinner%20Set.jpg?updatedAt=1785415638424',1,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(65,'Ceramic Mug','Durable, large ceramic coffee mug featuring an ergonomic handle and a beautiful speckled glaze finish.',299.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Ceramic%20Mug.jpg?updatedAt=1785415637953',0,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(66,'Water Bottle','Insulated stainless steel water bottle that keeps your beverages ice-cold for 24 hours or hot for 12 hours.',499.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Water%20Bottle.jpg?updatedAt=1785415638735',0,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(67,'Lunch Box','Leakproof, multi-compartment bento lunch box made from eco-friendly, food-grade BPA-free materials.',399.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Lunch%20Box.jpg?updatedAt=1785415638581',0,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(68,'Storage Containers','Set of airtight glass food storage containers with locking lids, ideal for meal prep and pantry organization.',699.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Storage%20Containers.jpg?updatedAt=1785415638814',0,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(69,'Non-Stick Frying Pan','Heavy-duty aluminum non-stick frying pan with an ergonomic heat-resistant handle for healthy, low-oil cooking.',999.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Non-Stick%20Frying%20Pan.jpg?updatedAt=1785415638742',0,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(70,'Cooking Pot','Premium stainless steel cooking pot with a tempered glass lid, featuring a thick tri-ply base for even heating.',1299.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Cooking%20Pot.jpg?updatedAt=1785415638308',0,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(71,'Knife Set','Professional 6-piece kitchen knife set forged from high-carbon stainless steel with a matching wooden block.',899.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Knife%20Set.jpg?updatedAt=1785415638529',0,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(72,'Cutting Board','Large, durable bamboo cutting board with built-in juice grooves, gentle on knives and easy to clean.',349.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Cutting%20Board.jpg?updatedAt=1785415638410',0,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(73,'Measuring Cups','Stainless steel measuring cups and spoons set with engraved markings, essential for precise baking.',299.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Measuring%20Cups.jpg?updatedAt=1785415638761',0,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(74,'Wooden Spoon Set','Handcrafted non-stick wooden spoon and spatula set, perfect for cooking, stirring, and serving.',449.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Wooden%20Spoon%20Set.jpg?updatedAt=1785415638809',0,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(75,'Electric Kettle','Fast-boiling 1.5L double-wall electric kettle with automatic shut-off and boil-dry protection.',1499.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Electric%20Kettle.jpg?updatedAt=1785415638593',0,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(76,'Mixer Grinder','Powerful 750W mixer grinder equipped with three durable stainless steel jars for dry, wet, and chutney grinding.',2499.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Mixer%20Grinder.jpg?updatedAt=1785415638731',0,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(77,'Air Fryer','Large 4.5L digital air fryer using rapid air circulation to fry your favorite foods with 85% less oil.',3999.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Kitchen%20Essentials/Air%20Fryer.jpg?updatedAt=1785415637814',1,5,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(78,'Bed Sheet Set','Luxuriously soft and breathable 400 thread count cotton bed sheet set, including a flat sheet and pillowcases.',999.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Bed%20Sheet%20Set.jpg?updatedAt=1785413517505',1,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(79,'Pillow','Ergonomic memory foam pillow designed to provide optimal neck support and ensure a restful night sleep.',499.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Pillow.jpg?updatedAt=1785413518046',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(80,'Comforter Set','All-season down-alternative quilted comforter set, offering lightweight warmth and luxurious comfort.',1999.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Comforter%20set.jpg?updatedAt=1785413518011',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(81,'Blanket','Cozy, lightweight microfiber fleece blanket, exceptionally soft and perfect for layering on cold nights.',899.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Blanket.jpg?updatedAt=1785413517579',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(82,'Mattress Protector','100% waterproof, breathable mattress protector designed to shield against spills, dust mites, and allergens.',799.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Mattress%20Protector.jpg?updatedAt=1785413517864',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(83,'Hand Towel','Set of premium long-staple cotton hand towels, exceptionally thick, soft, and highly absorbent.',249.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Hand%20Towel.jpg?updatedAt=1785413518035',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(84,'Bath Mat','Ultra-plush, quick-dry memory foam bath mat featuring a non-slip backing for superior bathroom safety.',399.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Bath%20Mat.jpeg?updatedAt=1785413517460',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(85,'Shower Curtain','Water-repellent, heavy-duty fabric shower curtain featuring rust-resistant metal grommets.',699.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Shower%20Curtain.jpg?updatedAt=1785413518005',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(86,'Laundry Basket','Spacious, collapsible laundry basket made from breathable fabric with durable aluminum handles.',799.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Laundry%20Basket.jpg?updatedAt=1785413517861',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(87,'Bathroom Organizer','Multi-tier rust-proof metal bathroom organizer shelf, designed to maximize storage over sinks or counters.',599.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Bathroom%20Organizer.jpg?updatedAt=1785413517513',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(88,'Soap Dispenser','Elegant refillable glass liquid soap dispenser featuring a rust-proof stainless steel pump.',349.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Soap%20Dispenser.jpg?updatedAt=1785413517986',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(89,'Toothbrush Holder','Compact, hygienic bathroom toothbrush holder with slots for multiple toothbrushes and toothpaste tubes.',249.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Toothbrush%20Holder.jpg?updatedAt=1785413518080',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(90,'Tissue Box','Decorative wooden tissue box cover that fits standard tissue boxes, adding a clean look to countertops.',299.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Tissue%20Box.jpg?updatedAt=1785413517985',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(91,'Bath Robe','Luxurious unisex plush bathrobe made from 100% absorbent cotton terry cloth with a cozy shawl collar.',999.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Bath%20Robe.jpg?updatedAt=1785413517587',1,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(92,'Bathroom Slippers','Lightweight, quick-drying non-slip EVA slippers designed to keep feet comfortable and safe in wet bathrooms.',399.00,'https://ik.imagekit.io/StringstackSahana/Fashion%20accesiories/Bedding%20&%20Bath/Bathroom%20Slippers.jpg?updatedAt=1785413517705',0,6,'2026-08-04 15:04:02.203579','2026-08-04 15:04:02.203579'),(93,'Lipliner','Elegant silver-toned anklet featuring delicate floral charms that add a graceful and timeless touch to your look. Lightweight and comfortable, it\'s perfect for daily wear, festive occasions, and pairing with both traditional and modern outfits.',100.00,'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTxzaSV_a57WXdTHASBH0WPQ9-vBwUNZMOmot68p2SsH4Ezx7JzFdufEc0Z2oZx4xOQ5CcQPcRH8a6QUSBCw73vcky5QjITccBKZEPy0x4&usqp=CAc',0,2,'2026-08-04 17:48:34.227175','2026-08-04 17:48:34.227175');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'ROLE_ADMIN'),(1,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_roles_role` (`role_id`),
  CONSTRAINT `fk_user_roles_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_roles_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (2,1),(3,1),(4,1),(5,1),(6,1),(1,2),(5,2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users_username` (`username`),
  UNIQUE KEY `uq_users_email` (`email`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  KEY `idx_user_names` (`first_name`,`last_name`),
  CONSTRAINT `chk_users_email` CHECK ((`email` like _utf8mb4'%_@__%.__%'))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@lifestyle.com','$2a$10$8tjZ4XwiqEQlW3S9y9ejrO8I/Z81L2nqXLDTF/Yl8.GKJ5A8yYRYO','System','Administrator','+15550100',1,'2026-08-04 15:04:02.174832','2026-08-04 18:47:31.909413'),(2,'alice_green','alice.green@example.com','$2a$10$7Z2v7v9eK7vQo2x7v5uS2.X2g/2g2uGgK9k2t8x7v5uS2.X2g/2g2','Alice','Green','+15550101',1,'2026-08-04 15:04:02.174832','2026-08-04 15:04:02.174832'),(3,'bob_smith','bob.smith@example.com','$2a$10$7Z2v7v9eK7vQo2x7v5uS2.X2g/2g2uGgK9k2t8x7v5uS2.X2g/2g2','Bob','Smith','+15550102',1,'2026-08-04 15:04:02.174832','2026-08-04 15:04:02.174832'),(4,'charlie_brown','charlie.brown@example.com','$2a$10$7Z2v7v9eK7vQo2x7v5uS2.X2g/2g2uGgK9k2t8x7v5uS2.X2g/2g2','Charlie','Brown','+15550103',0,'2026-08-04 15:04:02.174832','2026-08-04 15:04:02.174832'),(5,'Lavanya','lavanya100yadav@gmail.com','$2a$10$VdCLLzYKHriiWKdON7NOIuT.L/u6p/fatlg3QBLwNu38ujKxO2daK',NULL,NULL,NULL,1,'2026-08-04 09:44:10.894112','2026-08-04 09:44:10.894631'),(6,'hariprasad','sathyahari1907@gmail.com','$2a$10$ozi4ruoPjAuhfeCDFh.greW1jTeVWDAy8XO9OiUiNJ/bTvdF61tQq',NULL,NULL,NULL,1,'2026-08-05 04:30:32.437670','2026-08-05 04:30:32.438667');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_product_popularity`
--

DROP TABLE IF EXISTS `view_product_popularity`;
/*!50001 DROP VIEW IF EXISTS `view_product_popularity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_product_popularity` AS SELECT 
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `category_name`,
 1 AS `units_sold`,
 1 AS `gross_sales_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_sales_summary`
--

DROP TABLE IF EXISTS `view_sales_summary`;
/*!50001 DROP VIEW IF EXISTS `view_sales_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_sales_summary` AS SELECT 
 1 AS `sales_date`,
 1 AS `total_orders`,
 1 AS `total_revenue`,
 1 AS `successful_transactions`,
 1 AS `failed_transactions`,
 1 AS `average_order_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wishlist_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `uq_wishlist_user_product` (`user_id`,`product_id`),
  UNIQUE KEY `UKq85ckb2tlq3h7k56ovtqnjls2` (`user_id`,`product_id`),
  KEY `fk_wishlist_product` (`product_id`),
  CONSTRAINT `fk_wishlist_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wishlist_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,5,35,'2026-08-04 09:46:29.187643','2026-08-04 09:46:29.187643'),(2,5,40,'2026-08-04 09:46:30.577852','2026-08-04 09:46:30.577852'),(3,5,7,'2026-08-04 09:46:32.157164','2026-08-04 09:46:32.157164'),(4,5,34,'2026-08-04 10:04:29.328696','2026-08-04 10:04:29.328696'),(5,5,29,'2026-08-04 10:04:35.450142','2026-08-04 10:04:35.450142');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lifestyle_products'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_checkout_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkout_cart`(
    IN p_user_id BIGINT,
    IN p_shipping_address VARCHAR(500),
    OUT p_order_id BIGINT
)
BEGIN
    DECLARE v_cart_id BIGINT;
    DECLARE v_total_amount DECIMAL(10, 2) DEFAULT 0.00;
    
    -- Start Transaction boundary
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- 1. Get user's cart
    SELECT id INTO v_cart_id FROM carts WHERE user_id = p_user_id;
    
    IF v_cart_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cart not found for the given user';
    END IF;

    -- 2. Verify cart is not empty and compute total amount
    SELECT SUM(p.price * ci.quantity) INTO v_total_amount
    FROM cart_items ci
    INNER JOIN products p ON ci.product_id = p.id
    WHERE ci.cart_id = v_cart_id;

    IF v_total_amount IS NULL OR v_total_amount = 0.00 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cart is empty. Checkout aborted';
    END IF;

    -- 3. Create Order
    INSERT INTO orders (user_id, order_date, status, total_amount, shipping_address, created_at, updated_at)
    VALUES (p_user_id, NOW(6), 'PENDING', v_total_amount, p_shipping_address, NOW(6), NOW(6));
    
    SET p_order_id = LAST_INSERT_ID();

    -- 4. Copy Cart Items to Order Items (capturing current product price)
    INSERT INTO order_items (order_id, product_id, quantity, price, created_at, updated_at)
    SELECT p_order_id, ci.product_id, ci.quantity, p.price, NOW(6), NOW(6)
    FROM cart_items ci
    INNER JOIN products p ON ci.product_id = p.id
    WHERE ci.cart_id = v_cart_id;

    -- 5. Empty the user's cart
    DELETE FROM cart_items WHERE cart_id = v_cart_id;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_monthly_revenue_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_monthly_revenue_report`()
BEGIN
    SELECT 
        YEAR(o.order_date) AS sales_year,
        MONTHNAME(o.order_date) AS sales_month,
        COUNT(DISTINCT o.id) AS total_orders,
        SUM(o.total_amount) AS total_gross_sales,
        SUM(CASE WHEN pay.payment_status = 'COMPLETED' THEN o.total_amount ELSE 0.00 END) AS total_net_revenue
    FROM orders o
    LEFT JOIN payments pay ON o.id = pay.order_id
    WHERE YEAR(o.order_date) = YEAR(CURDATE())
    GROUP BY YEAR(o.order_date), MONTH(o.order_date), MONTHNAME(o.order_date)
    ORDER BY MONTH(o.order_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_product_popularity`
--

/*!50001 DROP VIEW IF EXISTS `view_product_popularity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_product_popularity` AS select `p`.`id` AS `product_id`,`p`.`name` AS `product_name`,`c`.`name` AS `category_name`,coalesce(sum(`oi`.`quantity`),0) AS `units_sold`,coalesce(sum((`oi`.`quantity` * `oi`.`price`)),0.00) AS `gross_sales_amount` from ((`products` `p` left join `order_items` `oi` on((`p`.`id` = `oi`.`product_id`))) left join `categories` `c` on((`p`.`category_id` = `c`.`id`))) group by `p`.`id`,`p`.`name`,`c`.`name` order by `units_sold` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_sales_summary`
--

/*!50001 DROP VIEW IF EXISTS `view_sales_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_sales_summary` AS select cast(`o`.`order_date` as date) AS `sales_date`,count(distinct `o`.`id`) AS `total_orders`,coalesce(sum((case when (`p`.`payment_status` = 'COMPLETED') then `o`.`total_amount` else 0.00 end)),0.00) AS `total_revenue`,count((case when (`p`.`payment_status` = 'COMPLETED') then 1 end)) AS `successful_transactions`,count((case when (`p`.`payment_status` = 'FAILED') then 1 end)) AS `failed_transactions`,avg(`o`.`total_amount`) AS `average_order_value` from (`orders` `o` left join `payments` `p` on((`o`.`id` = `p`.`order_id`))) group by cast(`o`.`order_date` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-11 22:02:17
