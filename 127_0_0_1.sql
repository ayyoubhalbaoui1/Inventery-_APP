-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 06, 2020 at 12:18 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--
CREATE DATABASE IF NOT EXISTS `db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db`;

-- --------------------------------------------------------

--
-- Table structure for table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `Frs_id` int(11) NOT NULL AUTO_INCREMENT,
  `Frs_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Société` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tel` int(10) NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Frs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fournisseurs`
--

INSERT INTO `fournisseurs` (`Frs_id`, `Frs_name`, `Société`, `Address`, `Tel`, `Email`) VALUES
(1, 'peter', 'comp1', 'bloc 1', 0, 'peter@support.com'),
(2, 'venom', 'comp2', 'bloc 2', 0, 'venom@support.com');

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `produit_id` int(11) NOT NULL AUTO_INCREMENT,
  `produit_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` decimal(10,0) DEFAULT NULL,
  `Quantité` int(11) NOT NULL,
  `Frs_id` int(11) NOT NULL,
  `Rayon_id` int(11) NOT NULL,
  PRIMARY KEY (`produit_id`),
  KEY `produits_ibfk_1` (`Frs_id`),
  KEY `produits_ibfk_2` (`Rayon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`produit_id`, `produit_name`, `prix`, `Quantité`, `Frs_id`, `Rayon_id`) VALUES
(1, 'bimou', '100000', 1000, 1, 1),
(2, 'lbeldi', '200000', 100, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rayons`
--

DROP TABLE IF EXISTS `rayons`;
CREATE TABLE IF NOT EXISTS `rayons` (
  `Rayon_id` int(11) NOT NULL AUTO_INCREMENT,
  `Rayon_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Rayon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rayons`
--

INSERT INTO `rayons` (`Rayon_id`, `Rayon_name`) VALUES
(1, 'bloc 22');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`Frs_id`) REFERENCES `fournisseurs` (`Frs_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produits_ibfk_2` FOREIGN KEY (`Rayon_id`) REFERENCES `rayons` (`Rayon_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
