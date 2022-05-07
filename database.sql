/*
SQLyog Community v13.1.2 (64 bit)
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(25,'Can add attendance_tb',7,'add_attendance_tb'),
(26,'Can change attendance_tb',7,'change_attendance_tb'),
(27,'Can delete attendance_tb',7,'delete_attendance_tb'),
(28,'Can view attendance_tb',7,'view_attendance_tb'),
(29,'Can add chat_tb',8,'add_chat_tb'),
(30,'Can change chat_tb',8,'change_chat_tb'),
(31,'Can delete chat_tb',8,'delete_chat_tb'),
(32,'Can view chat_tb',8,'view_chat_tb'),
(33,'Can add course_tb',9,'add_course_tb'),
(34,'Can change course_tb',9,'change_course_tb'),
(35,'Can delete course_tb',9,'delete_course_tb'),
(36,'Can view course_tb',9,'view_course_tb'),
(37,'Can add login',10,'add_login'),
(38,'Can change login',10,'change_login'),
(39,'Can delete login',10,'delete_login'),
(40,'Can view login',10,'view_login'),
(41,'Can add subject_tb',11,'add_subject_tb'),
(42,'Can change subject_tb',11,'change_subject_tb'),
(43,'Can delete subject_tb',11,'delete_subject_tb'),
(44,'Can view subject_tb',11,'view_subject_tb'),
(45,'Can add video_tb',12,'add_video_tb'),
(46,'Can change video_tb',12,'change_video_tb'),
(47,'Can delete video_tb',12,'delete_video_tb'),
(48,'Can view video_tb',12,'view_video_tb'),
(49,'Can add time_tb',13,'add_time_tb'),
(50,'Can change time_tb',13,'change_time_tb'),
(51,'Can delete time_tb',13,'delete_time_tb'),
(52,'Can view time_tb',13,'view_time_tb'),
(53,'Can add studymatirial_tb',14,'add_studymatirial_tb'),
(54,'Can change studymatirial_tb',14,'change_studymatirial_tb'),
(55,'Can delete studymatirial_tb',14,'delete_studymatirial_tb'),
(56,'Can view studymatirial_tb',14,'view_studymatirial_tb'),
(57,'Can add student_tb',15,'add_student_tb'),
(58,'Can change student_tb',15,'change_student_tb'),
(59,'Can delete student_tb',15,'delete_student_tb'),
(60,'Can view student_tb',15,'view_student_tb'),
(61,'Can add staff',16,'add_staff'),
(62,'Can change staff',16,'change_staff'),
(63,'Can delete staff',16,'delete_staff'),
(64,'Can view staff',16,'view_staff'),
(65,'Can add library_tb',17,'add_library_tb'),
(66,'Can change library_tb',17,'change_library_tb'),
(67,'Can delete library_tb',17,'delete_library_tb'),
(68,'Can view library_tb',17,'view_library_tb'),
(69,'Can add allotsub_tb',18,'add_allotsub_tb'),
(70,'Can change allotsub_tb',18,'change_allotsub_tb'),
(71,'Can delete allotsub_tb',18,'delete_allotsub_tb'),
(72,'Can view allotsub_tb',18,'view_allotsub_tb');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(18,'monitor','allotsub_tb'),
(7,'monitor','attendance_tb'),
(8,'monitor','chat_tb'),
(9,'monitor','course_tb'),
(17,'monitor','library_tb'),
(10,'monitor','login'),
(16,'monitor','staff'),
(15,'monitor','student_tb'),
(14,'monitor','studymatirial_tb'),
(11,'monitor','subject_tb'),
(13,'monitor','time_tb'),
(12,'monitor','video_tb'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2021-10-16 07:05:15.216205'),
(2,'auth','0001_initial','2021-10-16 07:05:16.325472'),
(3,'admin','0001_initial','2021-10-16 07:05:16.575460'),
(4,'admin','0002_logentry_remove_auto_add','2021-10-16 07:05:16.575460'),
(5,'admin','0003_logentry_add_action_flag_choices','2021-10-16 07:05:16.591078'),
(6,'contenttypes','0002_remove_content_type_name','2021-10-16 07:05:16.997355'),
(7,'auth','0002_alter_permission_name_max_length','2021-10-16 07:05:17.091047'),
(8,'auth','0003_alter_user_email_max_length','2021-10-16 07:05:17.137916'),
(9,'auth','0004_alter_user_username_opts','2021-10-16 07:05:17.153539'),
(10,'auth','0005_alter_user_last_login_null','2021-10-16 07:05:17.231714'),
(11,'auth','0006_require_contenttypes_0002','2021-10-16 07:05:17.247337'),
(12,'auth','0007_alter_validators_add_error_messages','2021-10-16 07:05:17.262926'),
(13,'auth','0008_alter_user_username_max_length','2021-10-16 07:05:17.380758'),
(14,'auth','0009_alter_user_last_name_max_length','2021-10-16 07:05:17.490126'),
(15,'auth','0010_alter_group_name_max_length','2021-10-16 07:05:17.521373'),
(16,'auth','0011_update_proxy_permissions','2021-10-16 07:05:17.521373'),
(17,'auth','0012_alter_user_first_name_max_length','2021-10-16 07:05:17.630796'),
(18,'monitor','0001_initial','2021-10-16 07:05:19.364996'),
(19,'sessions','0001_initial','2021-10-16 07:05:19.443131');

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

/*Table structure for table `monitor_allotsub_tb` */

DROP TABLE IF EXISTS `monitor_allotsub_tb`;

CREATE TABLE `monitor_allotsub_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tea_tb` int NOT NULL,
  `date` varchar(20) NOT NULL,
  `sub_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_allotsub_tb_sub_id_id_7177a95c_fk_monitor_subject_tb_id` (`sub_id_id`),
  CONSTRAINT `monitor_allotsub_tb_sub_id_id_7177a95c_fk_monitor_subject_tb_id` FOREIGN KEY (`sub_id_id`) REFERENCES `monitor_subject_tb` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_allotsub_tb` */

/*Table structure for table `monitor_attendance_tb` */

DROP TABLE IF EXISTS `monitor_attendance_tb`;

CREATE TABLE `monitor_attendance_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_attendance_tb` */

/*Table structure for table `monitor_chat_tb` */

DROP TABLE IF EXISTS `monitor_chat_tb`;

CREATE TABLE `monitor_chat_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_id` int NOT NULL,
  `to_id` int NOT NULL,
  `message` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_chat_tb` */

/*Table structure for table `monitor_course_tb` */

DROP TABLE IF EXISTS `monitor_course_tb`;

CREATE TABLE `monitor_course_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(40) NOT NULL,
  `course` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_course_tb` */

insert  into `monitor_course_tb`(`id`,`description`,`course`) values 
(1,'','cs'),
(2,' sfg','ff');

/*Table structure for table `monitor_library_tb` */

DROP TABLE IF EXISTS `monitor_library_tb`;

CREATE TABLE `monitor_library_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_name` varchar(30) NOT NULL,
  `book_number` bigint NOT NULL,
  `author` varchar(20) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_login` */

insert  into `monitor_login`(`id`,`username`,`password`,`type`) values 
(1,'MADARA','12345','ADMIN'),
(2,'murshida','1234','staff'),
(3,'murshida','1234','staff'),
(4,'pottan','kuttan','staff'),
(5,'yup','y','student'),
(6,'oooo','oooo','student');

/*Table structure for table `monitor_staff` */

DROP TABLE IF EXISTS `monitor_staff`;

CREATE TABLE `monitor_staff` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `course` varchar(20) NOT NULL,
  `place` varchar(20) NOT NULL,
  `post` varchar(20) NOT NULL,
  `pin` bigint NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(20) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_staff_lid_id_1efe5dcf_fk_monitor_login_id` (`lid_id`),
  CONSTRAINT `monitor_staff_lid_id_1efe5dcf_fk_monitor_login_id` FOREIGN KEY (`lid_id`) REFERENCES `monitor_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_staff` */

insert  into `monitor_staff`(`id`,`fname`,`mname`,`lname`,`dob`,`gender`,`course`,`place`,`post`,`pin`,`phone`,`email`,`lid_id`) values 
(1,'Fathima','murshida','v','2001-09-04','radiobutton','cs','kavanoor','kavanoor',673639,9539538515,'a@gmail.com',3),
(2,'rihan','m','','2021-10-30','male','ba','palakkad','kozhikod',123455,123345667888,'rihan@gmail.com',4),
(3,'rihan','m','','2021-10-30','radiobutton','bba','kavanoor','kavanoor',673639,123345667888,'rihan@gmail.com',5);

/*Table structure for table `monitor_student_tb` */

DROP TABLE IF EXISTS `monitor_student_tb`;

CREATE TABLE `monitor_student_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `course` varchar(20) NOT NULL,
  `place` varchar(20) NOT NULL,
  `post` varchar(20) NOT NULL,
  `pin` bigint NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(40) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_student_tb_lid_id_ac57c1ee_fk_monitor_login_id` (`lid_id`),
  CONSTRAINT `monitor_student_tb_lid_id_ac57c1ee_fk_monitor_login_id` FOREIGN KEY (`lid_id`) REFERENCES `monitor_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_student_tb` */

insert  into `monitor_student_tb`(`id`,`fname`,`mname`,`lname`,`dob`,`gender`,`course`,`place`,`post`,`pin`,`phone`,`email`,`lid_id`) values 
(1,'abi','.','n','2021-11-30','radiobutton','socio','edavanna','edava',123455,235688,'cd@gmail.com',6);

/*Table structure for table `monitor_studymatirial_tb` */

DROP TABLE IF EXISTS `monitor_studymatirial_tb`;

CREATE TABLE `monitor_studymatirial_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `material` varchar(50) NOT NULL,
  `sub_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_studymatiria_sub_id_id_e16d57fc_fk_monitor_s` (`sub_id_id`),
  CONSTRAINT `monitor_studymatiria_sub_id_id_e16d57fc_fk_monitor_s` FOREIGN KEY (`sub_id_id`) REFERENCES `monitor_subject_tb` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_studymatirial_tb` */

/*Table structure for table `monitor_subject_tb` */

DROP TABLE IF EXISTS `monitor_subject_tb`;

CREATE TABLE `monitor_subject_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subjects` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  `cid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_subject_tb_cid_id_1cb5e6ae_fk_monitor_course_tb_id` (`cid_id`),
  CONSTRAINT `monitor_subject_tb_cid_id_1cb5e6ae_fk_monitor_course_tb_id` FOREIGN KEY (`cid_id`) REFERENCES `monitor_course_tb` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_subject_tb` */

/*Table structure for table `monitor_time_tb` */

DROP TABLE IF EXISTS `monitor_time_tb`;

CREATE TABLE `monitor_time_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `day` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  `sid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_time_tb_sid_id_b0d7c106_fk_monitor_subject_tb_id` (`sid_id`),
  CONSTRAINT `monitor_time_tb_sid_id_b0d7c106_fk_monitor_subject_tb_id` FOREIGN KEY (`sid_id`) REFERENCES `monitor_subject_tb` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_time_tb` */

/*Table structure for table `monitor_video_tb` */

DROP TABLE IF EXISTS `monitor_video_tb`;

CREATE TABLE `monitor_video_tb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `topic` varchar(11) NOT NULL,
  `video` varchar(20) NOT NULL,
  `sub_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_video_tb_sub_id_id_a6976a4a_fk_monitor_subject_tb_id` (`sub_id_id`),
  CONSTRAINT `monitor_video_tb_sub_id_id_a6976a4a_fk_monitor_subject_tb_id` FOREIGN KEY (`sub_id_id`) REFERENCES `monitor_subject_tb` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `monitor_video_tb` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
