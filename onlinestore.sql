-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 07, 2018 at 12:58 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_ID` int(11) NOT NULL,
  `Status` varchar(255) NOT NULL,
  PRIMARY KEY (`order_ID`),
  KEY `User_FK` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
CREATE TABLE IF NOT EXISTS `order_products` (
  `order_ID` int(11) NOT NULL,
  `P_ID` int(11) NOT NULL,
  `Sup_ID` int(11) NOT NULL,
  PRIMARY KEY (`order_ID`,`P_ID`,`Sup_ID`),
  KEY `Product_fk` (`P_ID`),
  KEY `Sup_fk` (`Sup_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `P_img` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `Name`, `P_img`) VALUES
(12649785, 'Rice', 'images\\rice'),
(115484877, 'Mango Nougat', 'images/mangonougat.jpg'),
(164988532, 'KitKat', 'images\\kitkat.png'),
(271104058, 'Snickers', 'images\\snickers.png'),
(1144848442, 'Dried Banana', 'images\\driedbanana'),
(1164848442, 'Twix', 'images\\twix.jpg'),
(1164848784, 'Cheddar Cheese', 'images\\cheddar.jpg'),
(1849451326, 'Japanese Rice', 'images\\japanrice');

-- --------------------------------------------------------

--
-- Table structure for table `product_supplier`
--

DROP TABLE IF EXISTS `product_supplier`;
CREATE TABLE IF NOT EXISTS `product_supplier` (
  `P_ID` int(11) NOT NULL,
  `Sup_ID` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Availability` tinyint(1) NOT NULL,
  PRIMARY KEY (`P_ID`,`Sup_ID`),
  KEY `Ps_fk_sup` (`Sup_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Logo` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SUP_UN` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`ID`, `Name`, `Location`, `Logo`) VALUES
(134, 'خير زمان', 'Saudi Arabia, Riyadh', 'images/5eer zaman.png'),
(139, 'Panda', 'Saudi Arabia, Jeddah', 'images\\Panda.png'),
(142, 'Carrefour', 'France, Paris', 'images\\carrefour.png'),
(462, 'Souq', 'Egypt, Cairo', 'images\\souq.com.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(11) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Password` varchar(35) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `User_FK` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `Order_fk` FOREIGN KEY (`order_ID`) REFERENCES `orders` (`order_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Product_fk` FOREIGN KEY (`P_ID`) REFERENCES `product` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Sup_fk` FOREIGN KEY (`Sup_ID`) REFERENCES `supplier` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD CONSTRAINT `Ps_fk_product` FOREIGN KEY (`P_ID`) REFERENCES `product` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Ps_fk_sup` FOREIGN KEY (`Sup_ID`) REFERENCES `supplier` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
