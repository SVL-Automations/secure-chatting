-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 18, 2023 at 06:44 PM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u910794608_adnan`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `address` text NOT NULL,
  `pending` double NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_received`
--

CREATE TABLE `payment_received` (
  `id` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `mode` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedby` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_send`
--

CREATE TABLE `payment_send` (
  `id` int(11) NOT NULL,
  `vendorid` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `mode` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedby` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `vendorid` int(11) NOT NULL,
  `date` date NOT NULL,
  `vehicle` varchar(200) NOT NULL,
  `caret_rate` double NOT NULL,
  `box5kg_rate` double NOT NULL,
  `paper_rate` double NOT NULL,
  `tape_rate` double NOT NULL,
  `tawim_rate` double NOT NULL,
  `brbox_rate` double NOT NULL,
  `planetbox_rate` double DEFAULT 0,
  `caret_quantity` double NOT NULL,
  `box5kg_quantity` double NOT NULL,
  `paper_quantity` double NOT NULL,
  `tape_quantity` double NOT NULL,
  `tawim_quantity` double NOT NULL,
  `brbox_quantity` double NOT NULL,
  `planetbox_quantity` double DEFAULT 0,
  `pinkrim_rate` double NOT NULL DEFAULT 0,
  `pinkrim_quantity` double NOT NULL DEFAULT 0,
  `whiterim_quantity` double NOT NULL DEFAULT 0,
  `whiterim_rate` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL,
  `other_charges` decimal(10,0) NOT NULL,
  `total` double NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `lastupdateby` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `date` date NOT NULL,
  `caret_rate` double NOT NULL,
  `box5kg_rate` double NOT NULL,
  `paper_rate` double NOT NULL,
  `tape_rate` double NOT NULL,
  `tawim_rate` double NOT NULL,
  `brbox_rate` double NOT NULL,
  `planetbox_rate` double DEFAULT 0,
  `caret_quantity` double NOT NULL,
  `box5kg_quantity` double NOT NULL,
  `paper_quantity` double NOT NULL,
  `tape_quantity` double NOT NULL,
  `tawim_quantity` double NOT NULL,
  `brbox_quantity` double NOT NULL,
  `planetbox_quantity` double DEFAULT 0,
  `pinkrim_rate` double NOT NULL DEFAULT 0,
  `pinkrim_quantity` double NOT NULL DEFAULT 0,
  `whiterim_quantity` double NOT NULL DEFAULT 0,
  `whiterim_rate` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL,
  `total` double NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `lastupdateby` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `address` text NOT NULL,
  `pending` double NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `payment_received`
--
ALTER TABLE `payment_received`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_send`
--
ALTER TABLE `payment_send`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_received`
--
ALTER TABLE `payment_received`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_send`
--
ALTER TABLE `payment_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
