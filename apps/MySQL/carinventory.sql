-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2017 at 10:55 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `carinventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE IF NOT EXISTS `car` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vin` char(17) NOT NULL,
  `make` varchar(25) NOT NULL,
  `model` varchar(25) NOT NULL,
  `color` varchar(25) NOT NULL,
  `makeyear` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vin` (`vin`),
  KEY `makeyear` (`makeyear`),
  KEY `make` (`make`),
  KEY `make_2` (`make`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`id`, `vin`, `make`, `model`, `color`, `makeyear`) VALUES
(1, 'q2q2q24rt56yhgt5r', 'Nissan', 'Murano', 'Black', 2016),
(2, 'K0i98u6yhnd0olpkd', 'Honda', 'Accord', 'White', 2015);

-- --------------------------------------------------------

--
-- Table structure for table `carcustomer`
--

CREATE TABLE IF NOT EXISTS `carcustomer` (
  `carcustomerid` bigint(20) NOT NULL AUTO_INCREMENT,
  `carid` bigint(20) NOT NULL,
  `customerid` bigint(20) NOT NULL,
  `dateofregister` datetime NOT NULL,
  PRIMARY KEY (`carcustomerid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `carcustomer`
--

INSERT INTO `carcustomer` (`carcustomerid`, `carid`, `customerid`, `dateofregister`) VALUES
(1, 1, 1, '2017-01-02 00:00:00'),
(2, 1, 2, '2017-01-02 00:00:00'),
(3, 2, 2, '2017-01-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `firstname`, `lastname`, `phone`, `email`) VALUES
(1, 'sachin', 'verma', '6589541235', 'sachin@xxxx.com'),
(2, 'test', 'user', '1234567890', 'test@user.com');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `servicestartdate` datetime NOT NULL,
  `serviceenddate` datetime NOT NULL,
  `billingdate` datetime NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `servicestartdate`, `serviceenddate`, `billingdate`, `amount`) VALUES
(1, '2017-01-04 00:00:00', '2017-01-05 00:00:00', '2017-01-05 00:00:00', 100),
(2, '2017-01-10 00:00:00', '2017-01-11 00:00:00', '2017-01-11 00:00:00', 50);

-- --------------------------------------------------------

--
-- Table structure for table `invoicecar`
--

CREATE TABLE IF NOT EXISTS `invoicecar` (
  `invoicecarid` bigint(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` bigint(11) NOT NULL,
  `carid` bigint(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`invoicecarid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `invoicecar`
--

INSERT INTO `invoicecar` (`invoicecarid`, `invoiceid`, `carid`, `description`) VALUES
(1, 1, 1, 'Service, oil change and Tyre Rotation '),
(2, 2, 2, 'Break repair');

-- --------------------------------------------------------

--
-- Table structure for table `invoicecaroperation`
--

CREATE TABLE IF NOT EXISTS `invoicecaroperation` (
  `invoicecaroperationid` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoicecarid` bigint(20) NOT NULL,
  `operations` text NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`invoicecaroperationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `invoicecaroperation`
--

INSERT INTO `invoicecaroperation` (`invoicecaroperationid`, `invoicecarid`, `operations`, `amount`) VALUES
(1, 1, 'service', 30),
(2, 1, 'Oil change', 30),
(3, 1, 'Tyre rotation', 40),
(4, 2, 'Break fail repair', 50);

-- --------------------------------------------------------

--
-- Table structure for table `invoicecustomer`
--

CREATE TABLE IF NOT EXISTS `invoicecustomer` (
  `invoicecustomerid` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoiceid` bigint(11) NOT NULL,
  `customerid` bigint(11) NOT NULL,
  PRIMARY KEY (`invoicecustomerid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `invoicecustomer`
--

INSERT INTO `invoicecustomer` (`invoicecustomerid`, `invoiceid`, `customerid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
