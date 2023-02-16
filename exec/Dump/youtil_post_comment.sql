CREATE DATABASE  IF NOT EXISTS `youtil` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `youtil`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: i8d210.p.ssafy.io    Database: youtil
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `post_comment`
--

DROP TABLE IF EXISTS `post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_comment` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `depth` int DEFAULT NULL,
  `is_delete` bit(1) DEFAULT b'0',
  `parent_id` bigint DEFAULT NULL,
  `post_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `is_private` bit(1) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FKmqxhu8q0j94rcly3yxlv0u498` (`parent_id`),
  KEY `FKna4y825fdc5hw8aow65ijexm0` (`post_id`),
  KEY `FKtc1fl97yq74q7j8i08ds731s1` (`user_id`),
  CONSTRAINT `FKmqxhu8q0j94rcly3yxlv0u498` FOREIGN KEY (`parent_id`) REFERENCES `post_comment` (`comment_id`),
  CONSTRAINT `FKna4y825fdc5hw8aow65ijexm0` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `FKtc1fl97yq74q7j8i08ds731s1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comment`
--

LOCK TABLES `post_comment` WRITE;
/*!40000 ALTER TABLE `post_comment` DISABLE KEYS */;
INSERT INTO `post_comment` VALUES (30,'2023-02-03 15:25:38.093790','2023-02-03 15:25:38.093790','string',0,_binary '\0',NULL,7,4,_binary ''),(81,'2023-02-04 20:50:03.804378','2023-02-04 20:50:03.804378','ㅇㅇ',0,_binary '\0',NULL,19,11,_binary '\0'),(82,'2023-02-04 20:50:06.531941','2023-02-04 20:50:06.531941','ㅋ',0,_binary '\0',NULL,19,11,_binary '\0'),(83,'2023-02-04 20:50:08.921660','2023-02-04 20:50:08.921660','ㅇㅇ',1,_binary '\0',81,19,11,_binary '\0'),(111,'2023-02-06 14:00:04.138725','2023-02-06 14:00:04.138725','첫번째 댓글',0,_binary '\0',NULL,11,11,_binary '\0'),(113,'2023-02-06 14:00:12.226207','2023-02-06 14:00:12.226207','\n댓글',0,_binary '\0',NULL,11,11,_binary '\0'),(116,'2023-02-06 14:16:03.880038','2023-02-06 14:16:07.583097','ㅇㅇㅁㄴㅇㄹ',0,_binary '\0',NULL,97,11,_binary '\0'),(117,'2023-02-06 14:16:10.235305','2023-02-06 14:16:16.597826','ㅇㅁㄴㅇㄹㅁㄴㅇ라',1,_binary '\0',116,97,11,_binary '\0'),(118,'2023-02-06 14:16:13.659108','2023-02-06 14:16:13.659108','ㅁㄴㅇㄹ',1,_binary '\0',117,97,11,_binary '\0'),(120,'2023-02-06 17:53:31.256945','2023-02-06 17:53:31.256945','dd',0,_binary '\0',NULL,12,11,_binary '\0'),(126,'2023-02-07 12:56:30.930913','2023-02-07 12:56:30.930913','안녕하세여ㅛ',0,_binary '\0',NULL,112,11,_binary '\0'),(127,'2023-02-07 12:56:33.490937','2023-02-07 12:56:33.490937','\nㅋㅋ',0,_binary '\0',NULL,112,11,_binary '\0'),(147,'2023-02-07 15:52:30.070568','2023-02-07 15:52:30.070568','\nd',0,_binary '\0',NULL,11,11,_binary '\0'),(148,'2023-02-07 15:52:30.244055','2023-02-07 15:52:30.244055','\nd',0,_binary '\0',NULL,11,11,_binary '\0'),(159,'2023-02-08 09:20:54.307981','2023-02-08 09:20:54.307981','댓글',0,_binary '\0',NULL,118,11,_binary '\0'),(160,'2023-02-08 09:20:57.973557','2023-02-08 09:27:34.176017','을 달아봅시다 안녕하세요',0,_binary '\0',NULL,118,11,_binary '\0'),(162,'2023-02-08 09:21:11.956414','2023-02-08 09:21:17.463240','이게 답글이지 뭐냐고',1,_binary '\0',160,118,11,_binary '\0'),(163,'2023-02-08 10:06:45.769379','2023-02-08 10:06:45.769379','ㅇㅇ',0,_binary '\0',NULL,118,11,_binary ''),(164,'2023-02-08 10:06:51.023737','2023-02-08 10:06:51.023737','비공개',1,_binary '\0',162,118,11,_binary ''),(165,'2023-02-08 10:06:53.864797','2023-02-08 10:06:53.864797','ㅋㅋ',1,_binary '\0',164,118,11,_binary '\0'),(166,'2023-02-08 10:07:00.436059','2023-02-08 10:07:00.436059','이것도 비공개',1,_binary '\0',164,118,11,_binary ''),(167,'2023-02-08 10:07:04.269862','2023-02-08 10:07:04.269862','ㅎㅎ',1,_binary '\0',164,118,11,_binary '\0'),(168,'2023-02-08 10:24:02.120847','2023-02-08 10:24:02.120847','비공개',0,_binary '\0',NULL,118,13,_binary ''),(169,'2023-02-08 10:42:03.953775','2023-02-08 10:42:03.953775','히히',0,_binary '\0',NULL,120,11,_binary '\0'),(170,'2023-02-08 10:42:10.505818','2023-02-08 10:42:10.505818','비공개',0,_binary '\0',NULL,120,11,_binary ''),(171,'2023-02-08 10:42:44.426626','2023-02-08 10:42:44.426626','하하',0,_binary '\0',NULL,120,11,_binary '\0'),(172,'2023-02-08 10:43:10.925635','2023-02-08 10:43:10.925635','비공개 답글이요',1,_binary '\0',170,120,11,_binary ''),(173,'2023-02-08 16:17:18.453288','2023-02-08 16:17:18.453288','ㄴㅁㅇㄹ',0,_binary '\0',NULL,110,11,_binary '\0'),(178,'2023-02-08 21:03:55.998384','2023-02-08 21:03:55.998384','fasefasefasef',0,_binary '\0',NULL,148,13,_binary '\0'),(179,'2023-02-08 21:04:00.313664','2023-02-08 21:04:00.313664','fesafasef\\',1,_binary '\0',178,148,13,_binary '\0'),(180,'2023-02-08 21:09:03.120598','2023-02-08 21:09:03.120598','grfefds',1,_binary '\0',179,148,13,_binary '\0'),(181,'2023-02-08 21:32:18.082282','2023-02-08 21:32:18.082282','ㅎㄹㅇㄶㅇㄹㄴ',0,_binary '\0',NULL,148,13,_binary '\0'),(182,'2023-02-08 21:37:46.257448','2023-02-09 09:11:52.470315',NULL,0,_binary '',NULL,152,13,_binary '\0'),(183,'2023-02-08 21:38:48.969494','2023-02-08 21:38:48.969494','\nㅗㅍ휴추호',0,_binary '\0',NULL,152,13,_binary '\0'),(184,'2023-02-08 21:39:19.409502','2023-02-08 21:39:19.409502','\nㅗㅍ휴추호\nㄻㅈㄷ\'',0,_binary '\0',NULL,152,13,_binary '\0'),(185,'2023-02-08 21:39:21.462663','2023-02-08 21:39:21.462663','ㅓㅗㅎ',0,_binary '\0',NULL,152,13,_binary '\0'),(186,'2023-02-08 21:39:47.792261','2023-02-08 21:39:47.792261','ㅎㄹㄴㅇㅎㅇㄹ',1,_binary '\0',182,152,13,_binary '\0'),(187,'2023-02-08 22:39:44.386149','2023-02-08 22:39:44.386149','안녕하세요~~! 혹시 댓글은 어떻게 다는건지 아시나요?',0,_binary '\0',NULL,152,13,_binary '\0'),(188,'2023-02-09 15:05:19.182890','2023-02-09 15:05:19.182890','하2',0,_binary '\0',NULL,149,20,_binary ''),(189,'2023-02-09 17:44:10.310194','2023-02-10 09:42:14.972467',NULL,0,_binary '',NULL,12,11,_binary '\0'),(190,'2023-02-09 17:44:17.937616','2023-02-09 17:44:17.937616','오우',1,_binary '\0',189,12,11,_binary '\0'),(191,'2023-02-10 09:53:04.625742','2023-02-10 09:53:04.625742','안녕하세요',0,_binary '\0',NULL,164,11,_binary '\0'),(192,'2023-02-10 09:53:09.516477','2023-02-10 09:53:09.516477','후하하',0,_binary '\0',NULL,164,11,_binary '\0'),(193,'2023-02-10 09:53:35.294848','2023-02-10 09:53:35.294848','??',0,_binary '\0',NULL,103,11,_binary '\0'),(194,'2023-02-10 09:53:36.725982','2023-02-10 09:53:36.725982','???',0,_binary '\0',NULL,103,11,_binary '\0'),(195,'2023-02-10 10:04:42.832341','2023-02-10 10:04:42.832341','ㅇㅇ',0,_binary '\0',NULL,13,11,_binary '\0'),(196,'2023-02-10 10:23:08.229608','2023-02-10 10:23:08.229608','??',0,_binary '\0',NULL,97,11,_binary '\0'),(200,'2023-02-10 10:48:48.440506','2023-02-10 10:48:48.440506','dddd',0,_binary '\0',NULL,154,11,_binary '\0'),(201,'2023-02-10 18:11:52.807992','2023-02-10 18:11:52.807992','그랬나봐',0,_binary '\0',NULL,164,22,_binary ''),(202,'2023-02-10 18:12:03.678018','2023-02-10 18:12:24.208575',NULL,1,_binary '',192,164,22,_binary '\0'),(203,'2023-02-10 18:12:13.347971','2023-02-10 18:12:13.347971','히히',1,_binary '\0',192,164,22,_binary '\0'),(204,'2023-02-10 18:12:18.588166','2023-02-10 18:12:18.588166','우하하',1,_binary '\0',202,164,22,_binary '\0'),(205,'2023-02-11 22:31:37.252030','2023-02-11 22:31:37.252030','토르 나랑 놀자',0,_binary '\0',NULL,116,7,_binary '\0'),(208,'2023-02-13 10:16:44.569836','2023-02-13 10:16:44.569836','```',0,_binary '\0',NULL,184,13,_binary '\0'),(209,'2023-02-13 10:17:34.534975','2023-02-13 10:17:34.534975','```python\nfor i in range(5):\n    a += 1\n```',0,_binary '\0',NULL,184,13,_binary '\0'),(210,'2023-02-13 10:18:43.366198','2023-02-13 10:18:43.366198','# 나는! ㄹㅇㄴㅁㄹㄴㅇㅁㄹ',0,_binary '\0',NULL,184,13,_binary '\0'),(211,'2023-02-13 10:19:57.005668','2023-02-13 10:19:57.005668','# 가나다라마바사\n## 가나다라마바사\n### 가나다라마바사\n#### 가나다라마바사',0,_binary '\0',NULL,184,13,_binary '\0'),(212,'2023-02-13 10:22:39.312472','2023-02-13 10:41:15.757730','```python\nfor i in range(5):\n    a += i\n```',0,_binary '\0',NULL,228,13,_binary '\0'),(213,'2023-02-13 10:38:47.383805','2023-02-13 10:38:47.383805','``` python\nfor i in range(5):\n```',0,_binary '\0',NULL,228,13,_binary '\0'),(214,'2023-02-13 10:53:48.973827','2023-02-13 10:58:01.498674','{```python\n    for i in range(5):\n```}',0,_binary '\0',NULL,228,13,_binary '\0'),(216,'2023-02-14 00:20:32.340189','2023-02-14 00:20:32.340189','fdasfsd',0,_binary '\0',NULL,219,31,_binary '\0'),(217,'2023-02-14 00:20:35.768350','2023-02-14 00:20:35.768350','fdsafsad',1,_binary '\0',216,219,31,_binary '\0'),(218,'2023-02-14 15:23:54.239419','2023-02-14 15:23:54.239419','ㅇㅇㅇ',0,_binary '\0',NULL,236,32,_binary '\0'),(219,'2023-02-14 15:23:57.265111','2023-02-14 15:23:57.265111','ㅇㅇㅇ',0,_binary '\0',NULL,236,32,_binary '');
/*!40000 ALTER TABLE `post_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-14 15:56:35
