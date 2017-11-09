-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 09, 2017 at 02:26 PM
-- Server version: 5.7.20-log
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrental`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`bapspatil`@`localhost` PROCEDURE `GetAllSubscribers` ()  BEGIN
   SELECT *  FROM tblsubscribers;
   END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'bapoo1998@gmail.com', '629050c186a3c29cc31162a699b3eb2d', '2017-11-08 11:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `FromDate` varchar(20) DEFAULT NULL,
  `ToDate` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`id`, `userEmail`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`) VALUES
(4, 'bapoo1998@gmail.com', 2, '23/01/2018', '24/01/2018', 'I want to book a Ciaz.', 1, '2017-11-08 18:42:38'),
(6, 'bapoo1998@gmail.com', 5, '04/09/1997', '06/10/1998', 'i am going out fo station.', 0, '2017-11-09 09:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `tblbrands`
--

CREATE TABLE `tblbrands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbrands`
--

INSERT INTO `tblbrands` (`id`, `BrandName`, `CreationDate`) VALUES
(1, 'Maruti', '2017-11-09 05:04:13'),
(2, 'BMW', '2017-11-09 05:04:26'),
(3, 'Toyota', '2017-06-18 16:25:24'),
(4, 'Hyundai', '2017-11-09 06:40:00'),
(5, 'Honda', '2017-11-09 05:03:38');

--
-- Triggers `tblbrands`
--
DELIMITER $$
CREATE TRIGGER `DeleteVehicle` AFTER DELETE ON `tblbrands` FOR EACH ROW BEGIN
    DELETE FROM tblvehicles
    WHERE VehiclesBrand = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, '102 Baps Office Plex, Site No 4,\r\n2nd Main, Harshi Layout, Mallathahalli, Bangalore - 560056.', 'bapoo1998@gmail.com', '7795425524');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(2, 'Anoop', 'anooppatil2000@gmail.com', '5967546394', 'Hi, how and when can I book the nearest car?', '2017-11-08 12:41:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(3, 'About Us', 'aboutus', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">We are a car rental portal based in Bangalore.<br/><br/> \r\nOur CEO, Mr. Bapusaheb Patil, the dude in the above picture, is a 19-year-old Android enthusiast and UX/UI designer.<br/>\r\nHe loves making apps and memes, although not specifically in that order.\r\n<br/><br/>\r\nOur COO, Miss Harshitha J, the lady in the above picture, is a 20-year-old web developer and an exceptional back-end developer.<br/>\r\nShe is a continuous chatterbox who loves chatting and taking selfies everywhere she goes.<br/><br/>\r\nWe wanted to build an easy-to-use and economic car rental portal, that people can use everyday to rent a car and go about their day to day life, without having to worry about the troubles of getting around the city.</span>'),
(11, 'FAQs', 'faqs', '																														<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Q. Is this website cool?<br/>Yes, yes, it is.<br/><br/>Q. How can I register then?<br/>You can register by clicking on the LOGIN/REGISTER button at the top.<br/><br/></span>');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscribers`
--

CREATE TABLE `tblsubscribers` (
  `id` int(11) NOT NULL,
  `SubscriberEmail` varchar(120) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubscribers`
--

INSERT INTO `tblsubscribers` (`id`, `SubscriberEmail`, `PostingDate`) VALUES
(4, 'meghana.srinath@gmail.com', '2017-11-09 07:11:21'),
(5, 'harshitha@gmail.com', '2017-11-09 08:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbltestimonial`
--

CREATE TABLE `tbltestimonial` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Testimonial` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltestimonial`
--

INSERT INTO `tbltestimonial` (`id`, `UserEmail`, `Testimonial`, `PostingDate`, `status`) VALUES
(1, 'bapoo1998@gmail.com', 'This site is amazing!', '2017-11-08 10:40:20', 1),
(2, 'bapspatil@protonmail.com', 'Booking cars has never been easier, great job, Bapusaheb Patil!', '2017-11-08 11:47:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `City`, `Country`, `RegDate`, `UpdationDate`) VALUES
(5, 'Bapusaheb Patil', 'bapoo1998@gmail.com', '629050c186a3c29cc31162a699b3eb2d', '7795415514', '24/01/1998', '302 Om Residency, Site No 24\r\n2nd Main, ITI Layout, Mallathahalli', 'Bangalore', 'India', '2017-11-08 09:47:19', '2017-11-08 18:51:38'),
(6, 'Abhishek Patil', 'bapspatil@protonmail.com', '629050c186a3c29cc31162a699b3eb2d', '9087514535', NULL, NULL, NULL, NULL, '2017-11-08 11:23:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvehicles`
--

CREATE TABLE `tblvehicles` (
  `id` int(11) NOT NULL,
  `VehiclesTitle` varchar(150) DEFAULT NULL,
  `VehiclesBrand` int(11) DEFAULT NULL,
  `VehiclesOverview` longtext,
  `PricePerDay` int(11) DEFAULT NULL,
  `FuelType` varchar(100) DEFAULT NULL,
  `ModelYear` int(6) DEFAULT NULL,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `Vimage1` varchar(120) DEFAULT NULL,
  `Vimage2` varchar(120) DEFAULT NULL,
  `Vimage3` varchar(120) DEFAULT NULL,
  `AirConditioner` int(11) DEFAULT NULL,
  `AntiLockBrakingSystem` int(11) DEFAULT NULL,
  `PowerSteering` int(11) DEFAULT NULL,
  `PowerWindows` int(11) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvehicles`
--

INSERT INTO `tblvehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `FuelType`, `ModelYear`, `SeatingCapacity`, `Vimage1`, `Vimage2`, `Vimage3`, `AirConditioner`, `AntiLockBrakingSystem`, `PowerSteering`, `PowerWindows`, `RegDate`) VALUES
(1, 'M5 E39', 2, 'The E39 M5 is probably the best M5 ever. It has a naturally aspirated 4.9 liter V8 that produces 400 hp and combine that with 4 doors, a Getrag 6 speed manual, and a rear wheel drive shaft, you’ll have a perfect car for both daily driving and track days.', 3800, 'Petrol', 2003, 5, 'BMW-E39-M5-By-Vorsteiner-Image-35-750x500.jpg', 'e39-m5-drift.jpg', 'maxresdefault.jpg', 1, 1, 0, 1, '2017-06-19 11:46:23'),
(2, 'Ciaz', 1, 'The Ciaz is loaded with features to make it truly a space where you can relax. The interiors are intuitively designed keeping in mind comfort and utility.', 1900, 'Diesel', 2015, 6, 'img-7.jpg', 'img-4.jpg', 'img-3.jpg', 1, 1, 1, NULL, '2017-06-19 16:16:17'),
(3, 'Etios', 3, 'It isn’t found in a lap time. Or a 0–100 number. Or even on a price tag. It’s built on an obsession to detail. And a radical belief that a real supercar delivers performance in real-world conditions. Anywhere. Anytime. So refined, anyone can drive it. Yet so capable, in the right hands it can turn the automotive world on its ear. The Ford Etios. Its history speaks of world-beating performance, but the pursuit will always be of pure exhilaration.', 2700, 'CNG', 2012, 5, 'New-Toyota-Etios-front-quarter-launched-in-Brazil.jpg', '20160920123111_DSP_9248.jpg', 'IMG20160921WA0000.jpg', 1, 1, 1, 1, '2017-06-19 16:18:20'),
(4, 'Elite i20', 4, 'The 1.4 CRDi engine is technologically advanced engine in the Hyundai diesel ... The petrol variants of Elite i20 offer light weight and a robust 5-speed manual.', 2400, 'Diesel', 2014, 5, 'hyundai-elite-i20-marina-blue.png', 'Hyundai-Elite-i20-Right-Front-Three-Quarter-94070.jpg', 'in_ext_ib_fl_front_viewa.png', NULL, 0, NULL, NULL, '2017-11-09 06:41:24'),
(5, 'City', 5, 'Honda City, a car with classy & luxury look, is available in diesel & petrol versions. Enjoy comfort and safety along with impressive power & best in class mileage.', 3400, 'Petrol', 2007, 6, 'honda-city-white-orchid-pearl.png', 'Honda-City-Right-Front-Three-Quarter-90680.jpg', 'Honda-City-Left-Side-View-102403.jpg', 0, NULL, 0, 0, '2017-11-09 05:08:56'),
(6, 'Innova', 3, 'Toyota Dual Variable Valve Timing with Intelligence (Dual VVT-i) ensures a more ... Provide a warm welcome every time you approach the Innova Crystal.', 1800, 'Petrol', 2011, 7, 'toyota-innova-crysta-grey.png', 'c_h_2.jpg', 'TI-5.jpg', NULL, 0, NULL, NULL, '2017-11-09 05:39:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrands`
--
ALTER TABLE `tblbrands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblbrands`
--
ALTER TABLE `tblbrands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
