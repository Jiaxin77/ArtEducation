-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: ArtEducation
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add course',1,'add_course'),(2,'Can change course',1,'change_course'),(3,'Can delete course',1,'delete_course'),(4,'Can view course',1,'view_course'),(5,'Can add homework',2,'add_homework'),(6,'Can change homework',2,'change_homework'),(7,'Can delete homework',2,'delete_homework'),(8,'Can view homework',2,'view_homework'),(9,'Can add students',3,'add_students'),(10,'Can change students',3,'change_students'),(11,'Can delete students',3,'delete_students'),(12,'Can view students',3,'view_students'),(13,'Can add teacher',4,'add_teacher'),(14,'Can change teacher',4,'change_teacher'),(15,'Can delete teacher',4,'delete_teacher'),(16,'Can view teacher',4,'view_teacher'),(17,'Can add student login log',5,'add_studentloginlog'),(18,'Can change student login log',5,'change_studentloginlog'),(19,'Can delete student login log',5,'delete_studentloginlog'),(20,'Can view student login log',5,'view_studentloginlog'),(21,'Can add log entry',6,'add_logentry'),(22,'Can change log entry',6,'change_logentry'),(23,'Can delete log entry',6,'delete_logentry'),(24,'Can view log entry',6,'view_logentry'),(25,'Can add permission',7,'add_permission'),(26,'Can change permission',7,'change_permission'),(27,'Can delete permission',7,'delete_permission'),(28,'Can view permission',7,'view_permission'),(29,'Can add group',8,'add_group'),(30,'Can change group',8,'change_group'),(31,'Can delete group',8,'delete_group'),(32,'Can view group',8,'view_group'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add content type',10,'add_contenttype'),(38,'Can change content type',10,'change_contenttype'),(39,'Can delete content type',10,'delete_contenttype'),(40,'Can view content type',10,'view_contenttype'),(41,'Can add session',11,'add_session'),(42,'Can change session',11,'change_session'),(43,'Can delete session',11,'delete_session'),(44,'Can view session',11,'view_session'),(45,'Can add cors model',12,'add_corsmodel'),(46,'Can change cors model',12,'change_corsmodel'),(47,'Can delete cors model',12,'delete_corsmodel'),(48,'Can view cors model',12,'view_corsmodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsheaders_corsmodel`
--

DROP TABLE IF EXISTS `corsheaders_corsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corsheaders_corsmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cors` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsheaders_corsmodel`
--

LOCK TABLES `corsheaders_corsmodel` WRITE;
/*!40000 ALTER TABLE `corsheaders_corsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `corsheaders_corsmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseManage_course`
--

DROP TABLE IF EXISTS `courseManage_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courseManage_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `introduction` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseManage_course`
--

LOCK TABLES `courseManage_course` WRITE;
/*!40000 ALTER TABLE `courseManage_course` DISABLE KEYS */;
INSERT INTO `courseManage_course` VALUES (1,'模拟鼠标','请在纸上画出鼠标，提交作业'),(2,'补线','请补充线条');
/*!40000 ALTER TABLE `courseManage_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(8,'auth','group'),(7,'auth','permission'),(9,'auth','user'),(10,'contenttypes','contenttype'),(12,'corsheaders','corsmodel'),(1,'courseManage','course'),(2,'homeworkManage','homework'),(11,'sessions','session'),(5,'userManage','studentloginlog'),(3,'userManage','students'),(4,'userManage','teacher');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-12-12 02:58:02.221972'),(2,'auth','0001_initial','2019-12-12 02:58:02.297932'),(3,'admin','0001_initial','2019-12-12 02:58:02.448384'),(4,'admin','0002_logentry_remove_auto_add','2019-12-12 02:58:02.487791'),(5,'admin','0003_logentry_add_action_flag_choices','2019-12-12 02:58:02.497467'),(6,'contenttypes','0002_remove_content_type_name','2019-12-12 02:58:02.544893'),(7,'auth','0002_alter_permission_name_max_length','2019-12-12 02:58:02.564085'),(8,'auth','0003_alter_user_email_max_length','2019-12-12 02:58:02.580563'),(9,'auth','0004_alter_user_username_opts','2019-12-12 02:58:02.588548'),(10,'auth','0005_alter_user_last_login_null','2019-12-12 02:58:02.615162'),(11,'auth','0006_require_contenttypes_0002','2019-12-12 02:58:02.616952'),(12,'auth','0007_alter_validators_add_error_messages','2019-12-12 02:58:02.623697'),(13,'auth','0008_alter_user_username_max_length','2019-12-12 02:58:02.650301'),(14,'auth','0009_alter_user_last_name_max_length','2019-12-12 02:58:02.674479'),(15,'auth','0010_alter_group_name_max_length','2019-12-12 02:58:02.688079'),(16,'auth','0011_update_proxy_permissions','2019-12-12 02:58:02.695137'),(17,'courseManage','0001_initial','2019-12-12 02:58:02.704212'),(18,'userManage','0001_initial','2019-12-12 02:58:02.733981'),(19,'homeworkManage','0001_initial','2019-12-12 02:58:02.761841'),(20,'sessions','0001_initial','2019-12-12 02:58:02.813793'),(21,'corsheaders','0001_initial','2019-12-12 20:24:54.839570');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeworkManage_homework`
--

DROP TABLE IF EXISTS `homeworkManage_homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homeworkManage_homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) DEFAULT NULL,
  `uploadtime` datetime(6) NOT NULL,
  `score` double DEFAULT NULL,
  `advice` varchar(2000) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `homeworkManage_homew_course_id_f7646dac_fk_courseMan` (`course_id`),
  KEY `homeworkManage_homew_student_id_c2dcd47e_fk_userManag` (`student_id`),
  KEY `homeworkManage_homew_teacher_id_9ac46fea_fk_userManag` (`teacher_id`),
  CONSTRAINT `homeworkManage_homew_course_id_f7646dac_fk_courseMan` FOREIGN KEY (`course_id`) REFERENCES `coursemanage_course` (`id`),
  CONSTRAINT `homeworkManage_homew_student_id_c2dcd47e_fk_userManag` FOREIGN KEY (`student_id`) REFERENCES `usermanage_students` (`id`),
  CONSTRAINT `homeworkManage_homew_teacher_id_9ac46fea_fk_userManag` FOREIGN KEY (`teacher_id`) REFERENCES `usermanage_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeworkManage_homework`
--

LOCK TABLES `homeworkManage_homework` WRITE;
/*!40000 ALTER TABLE `homeworkManage_homework` DISABLE KEYS */;
INSERT INTO `homeworkManage_homework` VALUES (1,'homework/模拟鼠标/2019110907/QQ20190828-3_K3HOBBc.jpg','2019-12-12 18:30:49.456948',95,'棒！',1,1,1),(2,'homework/模拟鼠标/2019110908/QQ20190828-0_757y2Bf.jpg','2019-12-12 19:22:19.690035',NULL,NULL,1,2,NULL),(3,'homework/模拟鼠标/2019110897/QQ20190828-2.jpg','2019-12-12 19:22:33.435853',NULL,NULL,1,3,NULL);
/*!40000 ALTER TABLE `homeworkManage_homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userManage_studentloginlog`
--

DROP TABLE IF EXISTS `userManage_studentloginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userManage_studentloginlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginTime` datetime(6) NOT NULL,
  `browser` varchar(1000) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userManage_studentlo_user_id_820a61ca_fk_userManag` (`user_id`),
  CONSTRAINT `userManage_studentlo_user_id_820a61ca_fk_userManag` FOREIGN KEY (`user_id`) REFERENCES `usermanage_students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userManage_studentloginlog`
--

LOCK TABLES `userManage_studentloginlog` WRITE;
/*!40000 ALTER TABLE `userManage_studentloginlog` DISABLE KEYS */;
INSERT INTO `userManage_studentloginlog` VALUES (1,'2019-12-12 07:16:44.677024',NULL,1),(2,'2019-12-12 07:22:13.655728',NULL,1),(3,'2019-12-12 07:23:20.350189',NULL,1),(4,'2019-12-12 19:22:03.237016',NULL,2),(5,'2019-12-12 20:10:28.040023',NULL,2),(6,'2019-12-12 20:25:10.774100',NULL,1),(7,'2019-12-12 22:17:04.912389',NULL,4),(8,'2019-12-12 22:23:01.583946',NULL,4);
/*!40000 ALTER TABLE `userManage_studentloginlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userManage_students`
--

DROP TABLE IF EXISTS `userManage_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userManage_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `studentId` varchar(1000) NOT NULL,
  `phonenumber` varchar(1000) DEFAULT NULL,
  `password` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userManage_students`
--

LOCK TABLES `userManage_students` WRITE;
/*!40000 ALTER TABLE `userManage_students` DISABLE KEYS */;
INSERT INTO `userManage_students` VALUES (1,'ljx','2019110907','13683158349','pbkdf2_sha256$150000$QImcrUf4TnQs$QWEoqEsv9E28xygJ22AoXbYdyebKhBTzQCXTZLUiJcc='),(2,'hqy','2019110908','12342','pbkdf2_sha256$150000$5wqXVw6QIA03$pU1y717fsgWxQ9ox2KiXrbqw243R5JK0aq3tv6U4sww='),(3,'hhh','2019110897','12342','pbkdf2_sha256$150000$2dcXNIrVxUYY$ZhX//6ca7eU9YdjiZyNWkCEL8/2uJyHquSFkzI73crM='),(4,'jiaxin','2019110909','15826352186','pbkdf2_sha256$150000$z5rG8Nj2tDpy$L91b/zMKQFO2YYOUu1DOFEgbW+x9IgU5EDqynvC9Xno=');
/*!40000 ALTER TABLE `userManage_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userManage_teacher`
--

DROP TABLE IF EXISTS `userManage_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userManage_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `teacherId` varchar(1000) NOT NULL,
  `phonenumber` varchar(1000) DEFAULT NULL,
  `password` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userManage_teacher`
--

LOCK TABLES `userManage_teacher` WRITE;
/*!40000 ALTER TABLE `userManage_teacher` DISABLE KEYS */;
INSERT INTO `userManage_teacher` VALUES (1,'张三','2010111111','138000138000','pbkdf2_sha256$150000$NILOTpTtSCMj$kFVx7/gAlIOzuivJYUcypsOT4GfHeXbQ9DNcQrBeCVY=');
/*!40000 ALTER TABLE `userManage_teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-12 22:27:26
