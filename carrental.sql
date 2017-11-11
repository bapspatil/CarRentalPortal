-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 11, 2017 at 05:56 PM
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
CREATE DEFINER=`bapspatil`@`localhost` PROCEDURE `GetAllUsers` ()  BEGIN
   SELECT *  FROM reg_users;
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
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
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
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `userEmail`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`) VALUES
(4, 'bapoo1998@gmail.com', 2, '23/01/2018', '24/01/2018', 'I want to book a Ciaz.', 1, '2017-11-08 18:42:38'),
(6, 'bapoo1998@gmail.com', 5, '04/09/1997', '06/10/1998', 'i am going out fo station.', 1, '2017-11-09 09:20:31'),
(7, 'harshitha@gmail.com', 4, '23/12/2017', '26/12/2017', 'I want to travel the world in an Elite i20.', 0, '2017-11-11 15:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `BrandName`, `CreationDate`) VALUES
(1, 'Maruti', '2017-11-09 05:04:13'),
(2, 'BMW', '2017-11-09 05:04:26'),
(3, 'Toyota', '2017-06-18 16:25:24'),
(4, 'Hyundai', '2017-11-09 06:40:00'),
(5, 'Honda', '2017-11-09 05:03:38');

--
-- Triggers `brands`
--
DELIMITER $$
CREATE TRIGGER `DeleteVehicle` AFTER DELETE ON `brands` FOR EACH ROW BEGIN
    DELETE FROM vehicles
    WHERE VehiclesBrand = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reg_users`
--

CREATE TABLE `reg_users` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_users`
--

INSERT INTO `reg_users` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `RegDate`) VALUES
(5, 'Bapusaheb Patil', 'bapoo1998@gmail.com', '629050c186a3c29cc31162a699b3eb2d', '7795415514', '2017-11-08 09:47:19'),
(6, 'Abhishek Patil', 'bapspatil@protonmail.com', '629050c186a3c29cc31162a699b3eb2d', '9087514535', '2017-11-08 11:23:02'),
(7, 'Harshitha J', 'harshitha@gmail.com', 'd03308e46a8450d98717c50dce979603', '748564624', '2017-11-11 15:52:42');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
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
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `FuelType`, `ModelYear`, `SeatingCapacity`, `Vimage1`, `Vimage2`, `Vimage3`, `AirConditioner`, `AntiLockBrakingSystem`, `PowerSteering`, `PowerWindows`, `RegDate`) VALUES
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
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reg_users`
--
ALTER TABLE `reg_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reg_users`
--
ALTER TABLE `reg_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
