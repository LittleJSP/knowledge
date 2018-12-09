/*
SQLyog Community v13.1.0 (64 bit)
MySQL - 8.0.13 : Database - knowledge
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`knowledge` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `knowledge`;

/*Table structure for table `bookform` */

DROP TABLE IF EXISTS `bookform`;

CREATE TABLE `bookform` (
  `ISBN` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_name` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `book_writer` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `book_publisher` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `book_price` float DEFAULT NULL,
  `book_mess` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `book_pic` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bookform` */

insert  into `bookform`(`ISBN`,`book_name`,`book_writer`,`book_publisher`,`book_price`,`book_mess`,`book_pic`,`id`) values 
('1001','国史大纲','钱穆','商务印书馆',76,'对中国历史的发展大势及各时期的特点的阐述在中国史学界无出其右','1001.JPG',10),
('1002','中国史纲','张荫麟','商务印书馆',42,'本书虽属未完之作，但却广受赞誉','1002.JPG',10),
('101','失乐园','渡边淳一','青岛出版社',45,'渡边淳一代表作，林少华译本','101.JPG',1),
('102','罗生门','芥川龙之介','江苏凤凰文艺出版社',38,'人如果不自私，就无法活下去','102.JPG',1),
('201','文化苦旅','余秋雨','长江文艺出版社',38,'一步步将读者带入历史文化长河','201.JPG',2),
('202','骆驼祥子','老舍','湖南文艺出版社',26,'三起三落，我的泪随之滑落','202.JPG',2),
('301','了不起的盖茨比','菲兹杰拉德','时代文艺出版社',26,'我抹掉过去，只为让爱重来','301.JPG',3),
('302','月亮和六便士','毛姆','时代文艺出版社',27,'多少人只是懦弱的望一眼月亮','302.JPG',3),
('401','做自己人生的CEO','崔璀','中信出版社',48,'人人都需要的管理术,吴晓波作序','401.JPG',4),
('402','宇宙超度指南','李诞','四川文艺出版社',36,'他火起来，你们都要负责人','402.JPG',4),
('501','第一哲学沉思集','笛卡尔','台海出版社',31,'我思故我在，嚯嚯嚯','501.JPG',5),
('502','忏悔录','卢梭','人民文学出版社',46,'我以同样的坦率讲述我的美德与罪过','502.JPG',5),
('601','政府论','洛克','商务印书馆',32,'光荣革命回顾','601.JPG',6),
('602','政治学','亚里士多德','商务印书馆',42,'关于政体研究的专著','602.JPG',6),
('701','孙子兵法','孙武','北京联合出版公司',12,'千古兵学奇书，万世兵家鼻祖!','701.JPG',7),
('702','战争艺术概论','若米尼','华中科技大学出版社',32,'国防是最重要的工作','702.JPG',7),
('801','物种起源','达尔文','新世界出版社',39.8,'推翻了“神创论”和“物种不变论”','801.JPG',8),
('802','自然哲学的数学原理','牛顿','凤凰联动',68,'他在自然力游泳','802.JPG',8),
('901','编程珠玑','乔恩本特利','人民邮电出版社',39,'融深邃思想，实战技术与趣味轶事于一炉的奇书','901.JPG',9),
('902','代码整洁之道','罗伯特马丁','人民邮电出版社',59,'体会代码之美','902.jpg',9);

/*Table structure for table `classify` */

DROP TABLE IF EXISTS `classify`;

CREATE TABLE `classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `classify` */

insert  into `classify`(`id`,`name`) values 
(1,'亚洲文学'),
(2,'国内文学'),
(3,'欧美文学'),
(4,'老火靓汤'),
(5,'哲学'),
(6,'政治'),
(7,'军事'),
(8,'科学读物'),
(9,'计算机科学'),
(10,'历史');

/*Table structure for table `orderform` */

DROP TABLE IF EXISTS `orderform`;

CREATE TABLE `orderform` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `logname` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mess` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sum` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `orderform` */

insert  into `orderform`(`id`,`logname`,`mess`,`sum`) values 
(1,'Andrew','1:(201,文化苦旅,余秋雨,长江文艺出版社,38.0)2:(?101,失乐园,渡边淳一,青岛出版社,45.0)',83),
(2,'Andrew','1:(101,失乐园,渡边淳一,青岛出版社,45.0)',45);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `logname` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `realname` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`logname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*Table structure for table `bookreview` */

DROP TABLE IF EXISTS `bookreview`;

CREATE TABLE `bookreview` (
  `bookName` char(200) DEFAULT NULL,
  `title` char(200) DEFAULT NULL,
  `messages` char(200) DEFAULT NULL,
  PRIMARY KEY (`bookName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

/*Data for the table `bookreview` */

insert  into `user`(`logname`,`password`,`phone`,`address`,`realname`) values 
('Andrew','123','13534572733','240924154@qq.com','小斌');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
