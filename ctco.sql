/*
SQLyog Professional v12.5.1 (64 bit)
MySQL - 10.4.18-MariaDB : Database - ctco
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ctco` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ctco`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `tglorder` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Cart',
  PRIMARY KEY (`idcart`),
  UNIQUE KEY `orderid` (`orderid`),
  KEY `orderid_2` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `cart` */

insert  into `cart`(`idcart`,`orderid`,`userid`,`tglorder`,`status`) values 
(10,'15wKVT0nej25Y',2,'2020-03-16 19:10:42','Selesai'),
(11,'15Swf8Ye0Fm.M',2,'2020-03-16 19:17:34','Payment'),
(12,'15PzF03ejd8W2',1,'2020-05-13 09:40:48','Selesai'),
(13,'16MsfJl6jiadM',1,'2021-05-27 01:58:54','Selesai'),
(14,'16AicNAa9CWmk',3,'2021-05-27 10:11:02','Selesai'),
(15,'16d8X2dHBlkl2',3,'2021-05-27 12:09:31','Confirmed');

/*Table structure for table `detailorder` */

DROP TABLE IF EXISTS `detailorder`;

CREATE TABLE `detailorder` (
  `detailid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`detailid`),
  KEY `orderid` (`orderid`),
  KEY `idproduk` (`idproduk`),
  CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `cart` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

/*Data for the table `detailorder` */

insert  into `detailorder`(`detailid`,`orderid`,`idproduk`,`qty`) values 
(13,'15wKVT0nej25Y',1,100),
(14,'15PzF03ejd8W2',2,1),
(15,'16MsfJl6jiadM',3,1),
(17,'16AicNAa9CWmk',3,1),
(18,'16d8X2dHBlkl2',2,1),
(19,'15Swf8Ye0Fm.M',2,1);

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL AUTO_INCREMENT,
  `namakategori` varchar(20) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idkategori`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `kategori` */

insert  into `kategori`(`idkategori`,`namakategori`,`tgldibuat`) values 
(1,'Service cepat','2019-12-20 14:28:34'),
(2,'Build PC dan service','2019-12-20 14:34:17'),
(3,'Service hemat','2020-03-16 19:15:40');

/*Table structure for table `konfirmasi` */

DROP TABLE IF EXISTS `konfirmasi`;

CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `namarekening` varchar(25) NOT NULL,
  `tglbayar` date NOT NULL,
  `tglsubmit` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idkonfirmasi`),
  KEY `userid` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `konfirmasi` */

insert  into `konfirmasi`(`idkonfirmasi`,`orderid`,`userid`,`payment`,`namarekening`,`tglbayar`,`tglsubmit`) values 
(3,'16d8X2dHBlkl2',3,'Bank Mandi','diki','2021-05-31','2021-05-27 12:15:04');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgljoin` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(7) NOT NULL DEFAULT 'Member',
  `lastlogin` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `login` */

insert  into `login`(`userid`,`namalengkap`,`email`,`password`,`notelp`,`alamat`,`tgljoin`,`role`,`lastlogin`) values 
(1,'Admin','admin','$2y$10$GJVGd4ji3QE8ikTBzNyA0uLQhiGd6MirZeSJV1O6nUpjSVp1eaKzS','01234567890','Indonesia','2020-03-16 18:31:17','Admin',NULL),
(2,'Guest','guest','$2y$10$xXEMgj5pMT9EE0QAx3QW8uEn155Je.FHH5SuIATxVheOt0Z4rhK6K','01234567890','Indonesia','2020-03-16 18:30:40','Member',NULL),
(3,'Mamang racing','mamang@gmail.com','$2y$10$dsF7DFfQw2MVFyRqhjWkdOnc59GAtb9gwAPRWF2Sd7IAUsIsoMw1q','08929183818','Bekasi','2021-05-26 23:40:09','Member',NULL);

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `metode` varchar(25) NOT NULL,
  `norek` varchar(25) NOT NULL,
  `logo` text DEFAULT NULL,
  `an` varchar(20) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pembayaran` */

insert  into `pembayaran`(`no`,`metode`,`norek`,`logo`,`an`) values 
(1,'Bank BCA','13131231231','images/bca.jpg','CTCo'),
(2,'Bank Mandiri','943248844843','images/mandiri.jpg','CTCo'),
(3,'DANA','0882313132123','images/dana.png','CTCo');

/*Table structure for table `produk` */

DROP TABLE IF EXISTS `produk`;

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL AUTO_INCREMENT,
  `idkategori` int(11) NOT NULL,
  `namaproduk` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `rate` int(11) NOT NULL,
  `hargabefore` int(11) NOT NULL,
  `hargaafter` int(11) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idproduk`),
  KEY `idkategori` (`idkategori`),
  CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `produk` */

insert  into `produk`(`idproduk`,`idkategori`,`namaproduk`,`gambar`,`deskripsi`,`rate`,`hargabefore`,`hargaafter`,`tgldibuat`) values 
(1,1,'Rumah Komputer','produk/rk.png','Alamat JL.A Desa Semanggi. kami dapat melayani service baik software maupun hardware seperti instalasi windows 7/8/10, ganti separe part laptop/pc, upgrade laptop/pc',5,100000,70000,'2019-12-20 16:10:26'),
(2,2,'Solusi Tekno','produk/st.png','Alamat Jl.B Desa Hango. Kami dapat melayani service laptop/pc serta bulid pc sultan, untuk service bisa ditunggu sesuai permasalahan, untuk build pc bisa request spesifikasi nanti kita antar setelah j',4,120000,80000,'2019-12-20 16:24:13'),
(3,3,'Warung Komputer','produk/wk.png','Alamat Jl.C Desa Nuri. Kami dapat melayani service laptop ataupun pc dengan biaya terjangkau dan bergaransi, serta dapat upgrade dengan harga komponent yang terjangkau',5,80000,50000,'2020-03-16 19:16:53');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
