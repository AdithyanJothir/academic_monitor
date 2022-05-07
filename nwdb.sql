/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.22 : Database - academic_monitor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`academic_monitor` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `academic_monitor`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add course_tb',7,'add_course_tb'),
(26,'Can change course_tb',7,'change_course_tb'),
(27,'Can delete course_tb',7,'delete_course_tb'),
(28,'Can view course_tb',7,'view_course_tb'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add staff',9,'add_staff'),
(34,'Can change staff',9,'change_staff'),
(35,'Can delete staff',9,'delete_staff'),
(36,'Can view staff',9,'view_staff'),
(37,'Can add subject_tb',10,'add_subject_tb'),
(38,'Can change subject_tb',10,'change_subject_tb'),
(39,'Can delete subject_tb',10,'delete_subject_tb'),
(40,'Can view subject_tb',10,'view_subject_tb'),
(41,'Can add video_tb',11,'add_video_tb'),
(42,'Can change video_tb',11,'change_video_tb'),
(43,'Can delete video_tb',11,'delete_video_tb'),
(44,'Can view video_tb',11,'view_video_tb'),
(45,'Can add time_tb',12,'add_time_tb'),
(46,'Can change time_tb',12,'change_time_tb'),
(47,'Can delete time_tb',12,'delete_time_tb'),
(48,'Can view time_tb',12,'view_time_tb'),
(49,'Can add studymatirial_tb',13,'add_studymatirial_tb'),
(50,'Can change studymatirial_tb',13,'change_studymatirial_tb'),
(51,'Can delete studymatirial_tb',13,'delete_studymatirial_tb'),
(52,'Can view studymatirial_tb',13,'view_studymatirial_tb'),
(53,'Can add student_tb',14,'add_student_tb'),
(54,'Can change student_tb',14,'change_student_tb'),
(55,'Can delete student_tb',14,'delete_student_tb'),
(56,'Can view student_tb',14,'view_student_tb'),
(57,'Can add student_staff_chat_tb',15,'add_student_staff_chat_tb'),
(58,'Can change student_staff_chat_tb',15,'change_student_staff_chat_tb'),
(59,'Can delete student_staff_chat_tb',15,'delete_student_staff_chat_tb'),
(60,'Can view student_staff_chat_tb',15,'view_student_staff_chat_tb'),
(61,'Can add student_chat_tb',16,'add_student_chat_tb'),
(62,'Can change student_chat_tb',16,'change_student_chat_tb'),
(63,'Can delete student_chat_tb',16,'delete_student_chat_tb'),
(64,'Can view student_chat_tb',16,'view_student_chat_tb'),
(65,'Can add staff_chat_tb',17,'add_staff_chat_tb'),
(66,'Can change staff_chat_tb',17,'change_staff_chat_tb'),
(67,'Can delete staff_chat_tb',17,'delete_staff_chat_tb'),
(68,'Can view staff_chat_tb',17,'view_staff_chat_tb'),
(69,'Can add library_tb',18,'add_library_tb'),
(70,'Can change library_tb',18,'change_library_tb'),
(71,'Can delete library_tb',18,'delete_library_tb'),
(72,'Can view library_tb',18,'view_library_tb'),
(73,'Can add attendance_tb',19,'add_attendance_tb'),
(74,'Can change attendance_tb',19,'change_attendance_tb'),
(75,'Can delete attendance_tb',19,'delete_attendance_tb'),
(76,'Can view attendance_tb',19,'view_attendance_tb'),
(77,'Can add allotsub_tb',20,'add_allotsub_tb'),
(78,'Can change allotsub_tb',20,'change_allotsub_tb'),
(79,'Can delete allotsub_tb',20,'delete_allotsub_tb'),
(80,'Can view allotsub_tb',20,'view_allotsub_tb'),
(81,'Can add chat',21,'add_chat'),
(82,'Can change chat',21,'change_chat'),
(83,'Can delete chat',21,'delete_chat'),
(84,'Can view chat',21,'view_chat'),
(85,'Can add marks_tb',22,'add_marks_tb'),
(86,'Can change marks_tb',22,'change_marks_tb'),
(87,'Can delete marks_tb',22,'delete_marks_tb'),
(88,'Can view marks_tb',22,'view_marks_tb'),
(89,'Can add parent_tb',23,'add_parent_tb'),
(90,'Can change parent_tb',23,'change_parent_tb'),
(91,'Can delete parent_tb',23,'delete_parent_tb'),
(92,'Can view parent_tb',23,'view_parent_tb'),
(93,'Can add books_tb',24,'add_books_tb'),
(94,'Can change books_tb',24,'change_books_tb'),
(95,'Can delete books_tb',24,'delete_books_tb'),
(96,'Can view books_tb',24,'view_books_tb');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$H16vd8VP0UCJdYLBj0jidy$mAw41Ju5Ix65xRQpwasMOUUw9dKxvmfreTFiqqWFWWo=','2022-04-22 05:43:07.848824',1,'admin','','','admin@gmail.com',1,1,'2022-04-08 07:17:44.440755');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(20,'monitor','allotsub_tb'),
(19,'monitor','attendance_tb'),
(24,'monitor','books_tb'),
(21,'monitor','chat'),
(7,'monitor','course_tb'),
(18,'monitor','library_tb'),
(8,'monitor','login'),
(22,'monitor','marks_tb'),
(23,'monitor','parent_tb'),
(9,'monitor','staff'),
(17,'monitor','staff_chat_tb'),
(16,'monitor','student_chat_tb'),
(15,'monitor','student_staff_chat_tb'),
(14,'monitor','student_tb'),
(13,'monitor','studymatirial_tb'),
(10,'monitor','subject_tb'),
(12,'monitor','time_tb'),
(11,'monitor','video_tb'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2022-04-08 07:11:45.123373'),
(2,'auth','0001_initial','2022-04-08 07:12:14.463373'),
(3,'admin','0001_initial','2022-04-08 07:12:26.569980'),
(4,'admin','0002_logentry_remove_auto_add','2022-04-08 07:12:26.839789'),
(5,'admin','0003_logentry_add_action_flag_choices','2022-04-08 07:12:27.084790'),
(6,'contenttypes','0002_remove_content_type_name','2022-04-08 07:12:30.878428'),
(7,'auth','0002_alter_permission_name_max_length','2022-04-08 07:12:34.191738'),
(8,'auth','0003_alter_user_email_max_length','2022-04-08 07:12:35.060271'),
(9,'auth','0004_alter_user_username_opts','2022-04-08 07:12:35.342176'),
(10,'auth','0005_alter_user_last_login_null','2022-04-08 07:12:39.217074'),
(11,'auth','0006_require_contenttypes_0002','2022-04-08 07:12:39.651625'),
(12,'auth','0007_alter_validators_add_error_messages','2022-04-08 07:12:39.981114'),
(13,'auth','0008_alter_user_username_max_length','2022-04-08 07:12:46.253891'),
(14,'auth','0009_alter_user_last_name_max_length','2022-04-08 07:12:49.580074'),
(15,'auth','0010_alter_group_name_max_length','2022-04-08 07:12:49.966201'),
(16,'auth','0011_update_proxy_permissions','2022-04-08 07:12:50.302128'),
(17,'auth','0012_alter_user_first_name_max_length','2022-04-08 07:12:52.352838'),
(18,'monitor','0001_initial','2022-04-08 07:14:30.031428'),
(19,'sessions','0001_initial','2022-04-08 07:14:31.841655'),
(20,'monitor','0002_chat','2022-04-13 06:23:07.484667'),
(21,'monitor','0003_marks_tb_parent_tb','2022-04-19 04:38:29.079515'),
(22,'monitor','0004_parent_tb_log_id','2022-04-19 05:32:23.616998'),
(23,'monitor','0005_books_tb','2022-04-22 16:09:02.642589');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('55a95pjulmmyaicnktx156czdrqtphgj','.eJxVjssOwiAUBf-FtSFALy-X7vsNhMdFqgaS0q6M_25JutDtnMnkvInz-1bc3nF1SyJXwsnllwUfn1jHkB6-3huNrW7rEuhQ6Ll2OreEr9vp_gWK72VkETSLaVI5WzSYrDUKuOUigNWRGRBMcGQHFlzL7ENMysZJSQFZ-gxHFMc__vkCi9U5Ow:1ndDh5:m39PJmc09z2iP6JUMEG6q1A7t9yVUigPM_uQyA0zeAc','2022-04-23 16:12:11.095295'),
('9jq24arrsj2jlaf2t0yo0bqnt9lshj1b','.eJxVjEsOwiAUAO_C2hCgj59L956BPOAhVUOT0q6Md1eSLnQ7M5kXC7hvNeyd1jBndmaSnX5ZxPSgNkS-Y7stPC1tW-fIR8IP2_l1yfS8HO3foGKvY0tgRcqTKcWTo-y9MyC9VBG8TcKBEkqS-GIlrS4YUzY-TUYrKBoLsPcHys43Lg:1nhm4S:qsc91yTZ7G48QnPBPsFbf5k98vBgOpcSFnq9kzYW36Y','2022-05-06 05:43:08.080681'),
('yzw526ekoyrzqdkcdtgyp4y6gnnbsjqo','.eJxVjEsOwiAUAO_C2hCgj59L956BPOAhVUOT0q6Md1eSLnQ7M5kXC7hvNeyd1jBndmaSnX5ZxPSgNkS-Y7stPC1tW-fIR8IP2_l1yfS8HO3foGKvY0tgRcqTKcWTo-y9MyC9VBG8TcKBEkqS-GIlrS4YUzY-TUYrKBoLsPcHys43Lg:1nh2fY:3erskSLW0JO-zbjr1Q1AQzvUdMdiM_XBJSpCQo7AN_0','2022-05-04 05:14:24.133488');

/*Table structure for table `monitor_allotsub_tb` */

DROP TABLE IF EXISTS `monitor_allotsub_tb`;

CREATE TABLE `monitor_allotsub_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` varchar(20) NOT NULL,
  `sub_id_id` bigint NOT NULL,
  `tea_tb_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `monitor_allotsub_tb_sub_id_id_tea_tb_id_0bfe9134_uniq` (`sub_id_id`,`tea_tb_id`),
  KEY `monitor_allotsub_tb_tea_tb_id_f4ab58e4_fk_monitor_staff_id` (`tea_tb_id`),
  CONSTRAINT `monitor_allotsub_tb_sub_id_id_7177a95c_fk_monitor_subject_tb_id` FOREIGN KEY (`sub_id_id`) REFERENCES `monitor_subject_tb` (`id`),
  CONSTRAINT `monitor_allotsub_tb_tea_tb_id_f4ab58e4_fk_monitor_staff_id` FOREIGN KEY (`tea_tb_id`) REFERENCES `monitor_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_allotsub_tb` */

insert  into `monitor_allotsub_tb`(`id`,`date`,`sub_id_id`,`tea_tb_id`) values 
(1,'2022-04-08',1,1),
(2,'2022-04-08',2,1);

/*Table structure for table `monitor_attendance_tb` */

DROP TABLE IF EXISTS `monitor_attendance_tb`;

CREATE TABLE `monitor_attendance_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `attendance` varchar(10) NOT NULL,
  `date` varchar(40) NOT NULL,
  `student_id_id` bigint NOT NULL,
  `subject_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_attendance_t_student_id_id_fdc464bd_fk_monitor_s` (`student_id_id`),
  KEY `monitor_attendance_t_subject_id_id_d3ad39cf_fk_monitor_s` (`subject_id_id`),
  CONSTRAINT `monitor_attendance_t_student_id_id_fdc464bd_fk_monitor_s` FOREIGN KEY (`student_id_id`) REFERENCES `monitor_student_tb` (`id`),
  CONSTRAINT `monitor_attendance_t_subject_id_id_d3ad39cf_fk_monitor_s` FOREIGN KEY (`subject_id_id`) REFERENCES `monitor_subject_tb` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_attendance_tb` */

insert  into `monitor_attendance_tb`(`id`,`attendance`,`date`,`student_id_id`,`subject_id_id`) values 
(1,'1','2022-04-21 22:36:09.496149',1,1);

/*Table structure for table `monitor_books_tb` */

DROP TABLE IF EXISTS `monitor_books_tb`;

CREATE TABLE `monitor_books_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `author` varchar(60) NOT NULL,
  `book` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_books_tb` */

insert  into `monitor_books_tb`(`id`,`name`,`author`,`book`) values 
(2,'c programming','balaguruswami','settings.gradle');

/*Table structure for table `monitor_chat` */

DROP TABLE IF EXISTS `monitor_chat`;

CREATE TABLE `monitor_chat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `msg` longtext NOT NULL,
  `date` date NOT NULL,
  `fid_id` bigint NOT NULL,
  `tid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_chat_fid_id_219d5ca6_fk_monitor_login_id` (`fid_id`),
  KEY `monitor_chat_tid_id_d25de129_fk_monitor_login_id` (`tid_id`),
  CONSTRAINT `monitor_chat_fid_id_219d5ca6_fk_monitor_login_id` FOREIGN KEY (`fid_id`) REFERENCES `monitor_login` (`id`),
  CONSTRAINT `monitor_chat_tid_id_d25de129_fk_monitor_login_id` FOREIGN KEY (`tid_id`) REFERENCES `monitor_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_chat` */

insert  into `monitor_chat`(`id`,`msg`,`date`,`fid_id`,`tid_id`) values 
(1,'hi','2022-04-13',2,4),
(2,'hello,how r u ?','2022-04-13',4,2),
(3,'hellowwww','2022-04-13',2,4),
(4,'hii','2022-04-13',2,4),
(5,'hi sir','2022-04-18',7,2),
(6,'hi jijo','2022-04-18',2,7),
(7,'hi','2022-04-19',4,3),
(8,'hi miyaa','2022-04-19',4,8),
(9,'how r u','2022-04-19',4,8),
(10,'how r u?','2022-04-19',7,2),
(11,'loooo','2022-04-19',7,3),
(12,'fine','2022-04-19',2,7),
(13,'what about u?','2022-04-19',2,7),
(14,'definitely fine sir...','2022-04-19',7,2);

/*Table structure for table `monitor_course_tb` */

DROP TABLE IF EXISTS `monitor_course_tb`;

CREATE TABLE `monitor_course_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(60) NOT NULL,
  `course` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_course_tb` */

insert  into `monitor_course_tb`(`id`,`description`,`course`) values 
(1,'bachelor of computerscience','bsc'),
(2,'bachelor of comp application','bca');

/*Table structure for table `monitor_library_tb` */

DROP TABLE IF EXISTS `monitor_library_tb`;

CREATE TABLE `monitor_library_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_name` varchar(100) NOT NULL,
  `book_number` bigint NOT NULL,
  `author` varchar(60) NOT NULL,
  `borrowed_date` varchar(20) NOT NULL,
  `due_date` varchar(20) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `student_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_library_tb_student_id_id_862cdb24_fk_monitor_s` (`student_id_id`),
  CONSTRAINT `monitor_library_tb_student_id_id_862cdb24_fk_monitor_s` FOREIGN KEY (`student_id_id`) REFERENCES `monitor_student_tb` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_library_tb` */

/*Table structure for table `monitor_login` */

DROP TABLE IF EXISTS `monitor_login`;

CREATE TABLE `monitor_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_login` */

insert  into `monitor_login`(`id`,`username`,`password`,`type`) values 
(1,'admin','123','ADMIN'),
(2,'jinu','1234','staff'),
(3,'joy','ms','staff'),
(4,'riya','123','student'),
(7,'jijo','123','parent'),
(8,'miya','1234','student');

/*Table structure for table `monitor_marks_tb` */

DROP TABLE IF EXISTS `monitor_marks_tb`;

CREATE TABLE `monitor_marks_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mark` varchar(90) NOT NULL,
  `date` varchar(40) NOT NULL,
  `stud_id_id` bigint NOT NULL,
  `sub_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_marks_tb_stud_id_id_f47a7a7a_fk_monitor_student_tb_id` (`stud_id_id`),
  KEY `monitor_marks_tb_sub_id_id_5755a74c_fk_monitor_subject_tb_id` (`sub_id_id`),
  CONSTRAINT `monitor_marks_tb_stud_id_id_f47a7a7a_fk_monitor_student_tb_id` FOREIGN KEY (`stud_id_id`) REFERENCES `monitor_student_tb` (`id`),
  CONSTRAINT `monitor_marks_tb_sub_id_id_5755a74c_fk_monitor_subject_tb_id` FOREIGN KEY (`sub_id_id`) REFERENCES `monitor_subject_tb` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_marks_tb` */

insert  into `monitor_marks_tb`(`id`,`mark`,`date`,`stud_id_id`,`sub_id_id`) values 
(1,'80','2022-04-18 22:17:21.876892',1,1),
(2,'60','2022-04-20 22:56:51.035484',2,2),
(3,'78','2022-04-20 23:00:40.818979',2,1),
(4,'88','2022-04-20 23:01:08.323284',1,2);

/*Table structure for table `monitor_parent_tb` */

DROP TABLE IF EXISTS `monitor_parent_tb`;

CREATE TABLE `monitor_parent_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `phone` bigint NOT NULL,
  `stud_id_id` bigint NOT NULL,
  `log_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_parent_tb_stud_id_id_46c33d42_fk_monitor_student_tb_id` (`stud_id_id`),
  KEY `monitor_parent_tb_log_id_id_10fefa7e_fk_monitor_login_id` (`log_id_id`),
  CONSTRAINT `monitor_parent_tb_log_id_id_10fefa7e_fk_monitor_login_id` FOREIGN KEY (`log_id_id`) REFERENCES `monitor_login` (`id`),
  CONSTRAINT `monitor_parent_tb_stud_id_id_46c33d42_fk_monitor_student_tb_id` FOREIGN KEY (`stud_id_id`) REFERENCES `monitor_student_tb` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_parent_tb` */

insert  into `monitor_parent_tb`(`id`,`fname`,`mname`,`lname`,`address`,`phone`,`stud_id_id`,`log_id_id`) values 
(1,'jijo','k','m','abcc',9086789090,1,7);

/*Table structure for table `monitor_staff` */

DROP TABLE IF EXISTS `monitor_staff`;

CREATE TABLE `monitor_staff` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `name` varchar(70) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `place` varchar(60) NOT NULL,
  `post` varchar(60) NOT NULL,
  `pin` bigint NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(60) NOT NULL,
  `course_id_id` bigint NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_staff_course_id_id_3fff3c34_fk_monitor_course_tb_id` (`course_id_id`),
  KEY `monitor_staff_lid_id_1efe5dcf_fk_monitor_login_id` (`lid_id`),
  CONSTRAINT `monitor_staff_course_id_id_3fff3c34_fk_monitor_course_tb_id` FOREIGN KEY (`course_id_id`) REFERENCES `monitor_course_tb` (`id`),
  CONSTRAINT `monitor_staff_lid_id_1efe5dcf_fk_monitor_login_id` FOREIGN KEY (`lid_id`) REFERENCES `monitor_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_staff` */

insert  into `monitor_staff`(`id`,`fname`,`mname`,`lname`,`name`,`dob`,`gender`,`place`,`post`,`pin`,`phone`,`email`,`course_id_id`,`lid_id`) values 
(1,'jinu  ','p','k','jinupk','2019-12-04','female','payyoli','payyoli',673523,9090909090,'jinucalicut@gmail.com',1,2),
(2,'joy','m','s','joyms','1995-11-26','male','calicut','calicut',673523,8978900098,'joyms@gmail.com',1,3);

/*Table structure for table `monitor_staff_chat_tb` */

DROP TABLE IF EXISTS `monitor_staff_chat_tb`;

CREATE TABLE `monitor_staff_chat_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL,
  `date` varchar(20) NOT NULL,
  `from_id_id` bigint DEFAULT NULL,
  `to_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_staff_chat_tb_from_id_id_9bf7b4c4_fk_monitor_staff_id` (`from_id_id`),
  KEY `monitor_staff_chat_tb_to_id_id_9198a0d1_fk_monitor_staff_id` (`to_id_id`),
  CONSTRAINT `monitor_staff_chat_tb_from_id_id_9bf7b4c4_fk_monitor_staff_id` FOREIGN KEY (`from_id_id`) REFERENCES `monitor_staff` (`id`),
  CONSTRAINT `monitor_staff_chat_tb_to_id_id_9198a0d1_fk_monitor_staff_id` FOREIGN KEY (`to_id_id`) REFERENCES `monitor_staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_staff_chat_tb` */

/*Table structure for table `monitor_student_chat_tb` */

DROP TABLE IF EXISTS `monitor_student_chat_tb`;

CREATE TABLE `monitor_student_chat_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL,
  `date` varchar(20) NOT NULL,
  `from_id_id` bigint DEFAULT NULL,
  `to_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_student_chat_from_id_id_151d60dd_fk_monitor_s` (`from_id_id`),
  KEY `monitor_student_chat_to_id_id_b67a85db_fk_monitor_s` (`to_id_id`),
  CONSTRAINT `monitor_student_chat_from_id_id_151d60dd_fk_monitor_s` FOREIGN KEY (`from_id_id`) REFERENCES `monitor_student_tb` (`id`),
  CONSTRAINT `monitor_student_chat_to_id_id_b67a85db_fk_monitor_s` FOREIGN KEY (`to_id_id`) REFERENCES `monitor_student_tb` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_student_chat_tb` */

/*Table structure for table `monitor_student_staff_chat_tb` */

DROP TABLE IF EXISTS `monitor_student_staff_chat_tb`;

CREATE TABLE `monitor_student_staff_chat_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL,
  `date` varchar(20) NOT NULL,
  `from_id_id` bigint DEFAULT NULL,
  `to_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_student_staf_from_id_id_79017a36_fk_monitor_s` (`from_id_id`),
  KEY `monitor_student_staf_to_id_id_d21fcab0_fk_monitor_s` (`to_id_id`),
  CONSTRAINT `monitor_student_staf_from_id_id_79017a36_fk_monitor_s` FOREIGN KEY (`from_id_id`) REFERENCES `monitor_staff` (`id`),
  CONSTRAINT `monitor_student_staf_to_id_id_d21fcab0_fk_monitor_s` FOREIGN KEY (`to_id_id`) REFERENCES `monitor_student_tb` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_student_staff_chat_tb` */

/*Table structure for table `monitor_student_tb` */

DROP TABLE IF EXISTS `monitor_student_tb`;

CREATE TABLE `monitor_student_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `place` varchar(60) NOT NULL,
  `post` varchar(60) NOT NULL,
  `pin` bigint NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(60) NOT NULL,
  `course_id` bigint NOT NULL,
  `st_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_student_tb_course_id_466319e7_fk_monitor_course_tb_id` (`course_id`),
  KEY `monitor_student_tb_st_id_id_0c0e81df_fk_monitor_login_id` (`st_id_id`),
  CONSTRAINT `monitor_student_tb_course_id_466319e7_fk_monitor_course_tb_id` FOREIGN KEY (`course_id`) REFERENCES `monitor_course_tb` (`id`),
  CONSTRAINT `monitor_student_tb_st_id_id_0c0e81df_fk_monitor_login_id` FOREIGN KEY (`st_id_id`) REFERENCES `monitor_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_student_tb` */

insert  into `monitor_student_tb`(`id`,`fname`,`mname`,`lname`,`dob`,`gender`,`place`,`post`,`pin`,`phone`,`email`,`course_id`,`st_id_id`) values 
(1,'riya','','k','2004-12-03','female','payyoli','payyoli',78,9978909087,'riyak@gmail.com',1,4),
(2,'miya','k','p','2019-12-03','female','payyoli','kkkk',673523,9048065665,'miyakp@gmail.com',1,8);

/*Table structure for table `monitor_studymatirial_tb` */

DROP TABLE IF EXISTS `monitor_studymatirial_tb`;

CREATE TABLE `monitor_studymatirial_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `material` varchar(1000) NOT NULL,
  `sub_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_studymatiria_sub_id_id_e16d57fc_fk_monitor_s` (`sub_id_id`),
  CONSTRAINT `monitor_studymatiria_sub_id_id_e16d57fc_fk_monitor_s` FOREIGN KEY (`sub_id_id`) REFERENCES `monitor_subject_tb` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_studymatirial_tb` */

insert  into `monitor_studymatirial_tb`(`id`,`material`,`sub_id_id`) values 
(1,'20210127_173021.jpg',1);

/*Table structure for table `monitor_subject_tb` */

DROP TABLE IF EXISTS `monitor_subject_tb`;

CREATE TABLE `monitor_subject_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subjects` varchar(60) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `description` varchar(60) NOT NULL,
  `cid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_subject_tb_cid_id_1cb5e6ae_fk_monitor_course_tb_id` (`cid_id`),
  CONSTRAINT `monitor_subject_tb_cid_id_1cb5e6ae_fk_monitor_course_tb_id` FOREIGN KEY (`cid_id`) REFERENCES `monitor_course_tb` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_subject_tb` */

insert  into `monitor_subject_tb`(`id`,`subjects`,`semester`,`description`,`cid_id`) values 
(1,'network','1','networking system',1),
(2,'os','1','operating system\r\n',1);

/*Table structure for table `monitor_time_tb` */

DROP TABLE IF EXISTS `monitor_time_tb`;

CREATE TABLE `monitor_time_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `day` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  `sid_id` bigint NOT NULL,
  `staff_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_time_tb_sid_id_b0d7c106_fk_monitor_subject_tb_id` (`sid_id`),
  KEY `monitor_time_tb_staff_id_13c79d5c_fk_monitor_staff_id` (`staff_id`),
  CONSTRAINT `monitor_time_tb_sid_id_b0d7c106_fk_monitor_subject_tb_id` FOREIGN KEY (`sid_id`) REFERENCES `monitor_subject_tb` (`id`),
  CONSTRAINT `monitor_time_tb_staff_id_13c79d5c_fk_monitor_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `monitor_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_time_tb` */

insert  into `monitor_time_tb`(`id`,`name`,`day`,`time`,`sid_id`,`staff_id`) values 
(1,'jinupk','2022-04-13','04:13',1,1),
(2,'jinupk','2022-04-13','04:45',2,1);

/*Table structure for table `monitor_video_tb` */

DROP TABLE IF EXISTS `monitor_video_tb`;

CREATE TABLE `monitor_video_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `topic` varchar(40) NOT NULL,
  `video` varchar(100) NOT NULL,
  `sub_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_video_tb_sub_id_id_a6976a4a_fk_monitor_subject_tb_id` (`sub_id_id`),
  CONSTRAINT `monitor_video_tb_sub_id_id_a6976a4a_fk_monitor_subject_tb_id` FOREIGN KEY (`sub_id_id`) REFERENCES `monitor_subject_tb` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_video_tb` */

insert  into `monitor_video_tb`(`id`,`topic`,`video`,`sub_id_id`) values 
(1,'os materials','VID-20210828-WA0005_rdSb6t6.mp4',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
