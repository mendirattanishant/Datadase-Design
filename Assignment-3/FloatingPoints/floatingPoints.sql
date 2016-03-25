-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 02, 2016 at 05:33 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `floatingPoints`
--

-- --------------------------------------------------------

--
-- Table structure for table `AREA`
--

CREATE TABLE `AREA` (
  `area_id` int(11) NOT NULL,
  `state` varchar(11) NOT NULL,
  `zip_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AREA`
--

INSERT INTO `AREA` (`area_id`, `state`, `zip_code`) VALUES
(1, 'CA', 95112),
(2, 'CA', 94070),
(3, 'CA', 95192),
(4, 'AZ', 33323);

-- --------------------------------------------------------

--
-- Table structure for table `Company`
--

CREATE TABLE `Company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Company`
--

INSERT INTO `Company` (`company_id`, `company_name`) VALUES
(1, 'Navy FCU'),
(2, 'Bank of America'),
(3, 'HSBC'),
(4, 'Goldman Sachs Bank Usa'),
(5, 'TransUnion'),
(6, 'WellsFargo');

-- --------------------------------------------------------

--
-- Table structure for table `Complaints`
--

CREATE TABLE `Complaints` (
  `complaint_id` int(11) NOT NULL,
  `narative` varchar(100) NOT NULL,
  `STATUS` varchar(30) NOT NULL,
  `date_received` date NOT NULL,
  `date_sentTo` date NOT NULL,
  `sub_issue_id` int(11) NOT NULL,
  `sub_product_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `consumer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Complaints`
--

INSERT INTO `Complaints` (`complaint_id`, `narative`, `STATUS`, `date_received`, `date_sentTo`, `sub_issue_id`, `sub_product_id`, `area_id`, `consumer_id`) VALUES
(1, '', 'Resolved', '2016-03-01', '2016-03-01', 2, 3, 1, 1),
(2, '', 'Not Resolved', '2016-03-01', '2016-03-01', 3, 3, 2, 2),
(3, '', 'Resolved', '2016-02-23', '2016-03-01', 2, 3, 3, 3),
(4, '', 'Resolved', '2016-02-10', '2016-02-22', 3, 2, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Consumer`
--

CREATE TABLE `Consumer` (
  `consumer_id` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact_number` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Consumer`
--

INSERT INTO `Consumer` (`consumer_id`, `NAME`, `email`, `date_of_birth`, `contact_number`, `address`) VALUES
(1, 'Nupoor Kotasthane', 'nupoor292k@gmail.com', '1992-06-02', '6783136104', '101 E. San Fernando'),
(2, 'Tanvi Deo', 'tanvi.deo@sjsu.edu', '1991-11-02', '1231231', '101 E. San Fernando'),
(3, 'Nishant Mendiratta', 'nishant.mendiratta89@gmail.com', '1989-11-06', '9526490237', '380 E. San Salvador St.'),
(4, 'Akshay Bhasme', 'akshay.bhasme@sjsu.edu', '1990-01-01', '1234123412', '101 E. San Fernando');

-- --------------------------------------------------------

--
-- Table structure for table `Consumer_Response`
--

CREATE TABLE `Consumer_Response` (
  `consumer_response_id` int(11) NOT NULL,
  `response` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Consumer_Response`
--

INSERT INTO `Consumer_Response` (`consumer_response_id`, `response`) VALUES
(1, 'In Progress'),
(2, 'Closed with Exploitation'),
(3, 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `Issue`
--

CREATE TABLE `Issue` (
  `issue_id` int(11) NOT NULL,
  `TYPE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Issue`
--

INSERT INTO `Issue` (`issue_id`, `TYPE`) VALUES
(1, 'Late fee'),
(2, 'Pay off process'),
(3, 'Low funds');

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `product_id` int(11) NOT NULL,
  `NAME` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`product_id`, `NAME`) VALUES
(1, 'Credit Card'),
(2, 'Bank Account or Service'),
(3, 'Mortgage'),
(4, 'Vehicle Loan');

-- --------------------------------------------------------

--
-- Table structure for table `Public_Response`
--

CREATE TABLE `Public_Response` (
  `public_response_id` int(11) NOT NULL,
  `response` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Public_Response`
--

INSERT INTO `Public_Response` (`public_response_id`, `response`) VALUES
(1, 'Company chooses not to provide a public response'),
(2, 'Company believes it acted appropriately as authorized by contract or law');

-- --------------------------------------------------------

--
-- Table structure for table `Response`
--

CREATE TABLE `Response` (
  `response_id` int(11) NOT NULL,
  `timely_response` varchar(3) NOT NULL,
  `public_response_id` int(11) NOT NULL,
  `consumer_response_id` int(11) NOT NULL,
  `complaint_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Response`
--

INSERT INTO `Response` (`response_id`, `timely_response`, `public_response_id`, `consumer_response_id`, `complaint_id`, `company_id`) VALUES
(1, 'Yes', 1, 1, 1, 2),
(2, 'No', 2, 3, 2, 3),
(3, 'Yes', 2, 2, 3, 5),
(4, 'No', 2, 2, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Sub_Issue`
--

CREATE TABLE `Sub_Issue` (
  `id` int(11) NOT NULL,
  `sub_issue_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sub_Issue`
--

INSERT INTO `Sub_Issue` (`id`, `sub_issue_id`, `issue_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Sub_Issue_Details`
--

CREATE TABLE `Sub_Issue_Details` (
  `sub_issue_id` int(11) NOT NULL,
  `TYPE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sub_Issue_Details`
--

INSERT INTO `Sub_Issue_Details` (`sub_issue_id`, `TYPE`) VALUES
(1, 'Other'),
(2, 'Late Fee'),
(3, 'Payment not provided');

-- --------------------------------------------------------

--
-- Table structure for table `sub_product`
--

CREATE TABLE `sub_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sub_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_product`
--

INSERT INTO `sub_product` (`id`, `product_id`, `sub_product_id`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 3, 2),
(4, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Sub_Product_Detail`
--

CREATE TABLE `Sub_Product_Detail` (
  `sub_product_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sub_Product_Detail`
--

INSERT INTO `Sub_Product_Detail` (`sub_product_id`, `name`) VALUES
(1, 'Checking Account'),
(2, 'Conventional Fixed Mortgage'),
(3, 'Credit Card'),
(4, 'Other(phone, health, club, etc)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AREA`
--
ALTER TABLE `AREA`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `Company`
--
ALTER TABLE `Company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `Complaints`
--
ALTER TABLE `Complaints`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `sub_issue_id` (`sub_issue_id`),
  ADD KEY `sub_product_id` (`sub_product_id`),
  ADD KEY `area_id` (`area_id`),
  ADD KEY `consumer_id` (`consumer_id`);

--
-- Indexes for table `Consumer`
--
ALTER TABLE `Consumer`
  ADD PRIMARY KEY (`consumer_id`);

--
-- Indexes for table `Consumer_Response`
--
ALTER TABLE `Consumer_Response`
  ADD PRIMARY KEY (`consumer_response_id`);

--
-- Indexes for table `Issue`
--
ALTER TABLE `Issue`
  ADD PRIMARY KEY (`issue_id`),
  ADD UNIQUE KEY `issue_id` (`issue_id`),
  ADD UNIQUE KEY `issue_id_2` (`issue_id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `Public_Response`
--
ALTER TABLE `Public_Response`
  ADD PRIMARY KEY (`public_response_id`);

--
-- Indexes for table `Response`
--
ALTER TABLE `Response`
  ADD PRIMARY KEY (`response_id`),
  ADD KEY `public_response_id` (`public_response_id`),
  ADD KEY `consumer_response_id` (`consumer_response_id`),
  ADD KEY `complaint_id` (`complaint_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `Sub_Issue`
--
ALTER TABLE `Sub_Issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_issue_id` (`sub_issue_id`),
  ADD KEY `issue_id` (`issue_id`);

--
-- Indexes for table `Sub_Issue_Details`
--
ALTER TABLE `Sub_Issue_Details`
  ADD PRIMARY KEY (`sub_issue_id`);

--
-- Indexes for table `sub_product`
--
ALTER TABLE `sub_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `sub_product_id` (`sub_product_id`);

--
-- Indexes for table `Sub_Product_Detail`
--
ALTER TABLE `Sub_Product_Detail`
  ADD PRIMARY KEY (`sub_product_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Complaints`
--
ALTER TABLE `Complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`sub_issue_id`) REFERENCES `Sub_Issue_Details` (`sub_issue_id`),
  ADD CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`sub_product_id`) REFERENCES `Sub_Product_Detail` (`sub_product_id`),
  ADD CONSTRAINT `complaints_ibfk_3` FOREIGN KEY (`area_id`) REFERENCES `AREA` (`area_id`),
  ADD CONSTRAINT `complaints_ibfk_4` FOREIGN KEY (`consumer_id`) REFERENCES `Consumer` (`consumer_id`);

--
-- Constraints for table `Response`
--
ALTER TABLE `Response`
  ADD CONSTRAINT `response_ibfk_1` FOREIGN KEY (`public_response_id`) REFERENCES `Public_Response` (`public_response_id`),
  ADD CONSTRAINT `response_ibfk_2` FOREIGN KEY (`consumer_response_id`) REFERENCES `Consumer_Response` (`consumer_response_id`),
  ADD CONSTRAINT `response_ibfk_3` FOREIGN KEY (`complaint_id`) REFERENCES `Complaints` (`complaint_id`),
  ADD CONSTRAINT `response_ibfk_4` FOREIGN KEY (`company_id`) REFERENCES `Company` (`company_id`);

--
-- Constraints for table `Sub_Issue`
--
ALTER TABLE `Sub_Issue`
  ADD CONSTRAINT `sub_issue_ibfk_1` FOREIGN KEY (`sub_issue_id`) REFERENCES `Sub_Issue_Details` (`sub_issue_id`),
  ADD CONSTRAINT `sub_issue_ibfk_2` FOREIGN KEY (`issue_id`) REFERENCES `Issue` (`issue_id`);

--
-- Constraints for table `sub_product`
--
ALTER TABLE `sub_product`
  ADD CONSTRAINT `sub_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`),
  ADD CONSTRAINT `sub_product_ibfk_2` FOREIGN KEY (`sub_product_id`) REFERENCES `Sub_Product_Detail` (`sub_product_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
