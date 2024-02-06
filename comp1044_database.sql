-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2023 at 02:23 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comp1044_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_ID` int(11) NOT NULL,
  `car_Type` varchar(255) NOT NULL,
  `car_Model` varchar(50) NOT NULL,
  `car_Colour` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_ID`, `car_Type`, `car_Model`, `car_Colour`, `price`, `img`) VALUES
(1, 'Luxurious', 'Rolls Royce Phantom', 'Blue', '9800.00', 'carimgs\\Rolls Royce Phantom (Blue) .png'),
(2, 'Luxurious', 'Bentley Continental Flying Spur', 'White', '4800.00', 'carimgs\\Bentley Continental Flying Spur (White).png'),
(3, 'Luxurious', 'Mercedes Benz CLS 350', 'Silver', '1350.00', 'carimgs\\Mercedes Benz CLS 350 (Silver).png'),
(4, 'Luxurious', 'Jaguar S Type', 'Champagne', '1350.00', 'carimgs\\Jaguar S Type (Champagne).png'),
(5, 'Sports', 'Ferrari F430 Scuderia', 'Red', '6000.00', 'carimgs\\Ferrari F430 Scuderia (Red).png'),
(6, 'Sports', 'Lamborghini Murcielago LP640', 'Matte Black', '7000.00', 'carimgs\\Lamborghini Murcielago LP640 (Matte Black).png'),
(7, 'Sports', 'Porsche Boxster', 'White', '2800.00', 'carimgs\\Porsche Boxster (White).png'),
(8, 'Sports', 'Lexus SC430', 'Black', '1600.00', 'carimgs\\Lexus SC430 (Black).png'),
(9, 'Classics', 'Jaguar MK 2', 'White', '2200.00', 'carimgs\\Jaguar S Type (Champagne).png'),
(10, 'Classics', 'Rolls Royce Silver Spirit Limousine ', 'Georgian Silver', '3200.00', 'carimgs\\Rolls Royce Silver Spirit Limousine (Georgian Silver) .png'),
(11, 'Classics', 'MG TD', 'Red', '2500.00', '\\carimgs\\MG TD (Red).png');

-- --------------------------------------------------------

--
-- Table structure for table `customer_detail`
--

CREATE TABLE `customer_detail` (
  `customer_Name` varchar(55) NOT NULL,
  `customer_ID` varchar(55) NOT NULL,
  `phone` varchar(55) NOT NULL,
  `email` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_No` varchar(20) NOT NULL,
  `car_ID` int(11) NOT NULL,
  `customer_ID` varchar(55) NOT NULL,
  `staff_username` varchar(255) NOT NULL,
  `starting_Date` date NOT NULL,
  `finishing_Date` date NOT NULL,
  `total_rate` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_activity`
--

CREATE TABLE `staff_activity` (
  `recorded_time` time NOT NULL,
  `recorded_date` date NOT NULL,
  `staff_username` varchar(255) NOT NULL,
  `action` varchar(10) NOT NULL,
  `reservation_No` varchar(20) NOT NULL,
  `customer_ID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_detail`
--

CREATE TABLE `staff_detail` (
  `staff_name` varchar(255) NOT NULL,
  `staff_username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_detail`
--

INSERT INTO `staff_detail` (`staff_name`, `staff_username`, `password`) VALUES
('admin', 'admin1', '1234'),
('Anshali Manoharan', 'hcyam5', 'ashlian');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_ID`);

--
-- Indexes for table `customer_detail`
--
ALTER TABLE `customer_detail`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_No`),
  ADD KEY `car_ID` (`car_ID`),
  ADD KEY `customer_ID` (`customer_ID`),
  ADD KEY `customer_ID_2` (`customer_ID`),
  ADD KEY `constraint` (`staff_username`);

--
-- Indexes for table `staff_detail`
--
ALTER TABLE `staff_detail`
  ADD PRIMARY KEY (`staff_username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `constraint` FOREIGN KEY (`staff_username`) REFERENCES `staff_detail` (`staff_username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer_detail` (`customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`car_ID`) REFERENCES `car` (`car_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
