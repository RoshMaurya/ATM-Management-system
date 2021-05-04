-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2019 at 03:35 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atm`
--

-- --------------------------------------------------------

--
-- Table structure for table `accout`
--

CREATE TABLE `accout` (
  `ACC_NO` int(15) NOT NULL,
  `ACC_TYPE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accout`
--

INSERT INTO `accout` (`ACC_NO`, `ACC_TYPE`) VALUES
(45689, 'DEEMAT'),
(123456, 'SAVING'),
(1123455, 'CURRENT');

-- --------------------------------------------------------

--
-- Table structure for table `acc_is`
--

CREATE TABLE `acc_is` (
  `ACC_NO` int(15) NOT NULL,
  `CURRENT` text NOT NULL,
  `SAVING` text NOT NULL,
  `DEEMAT` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `amount`
--

CREATE TABLE `amount` (
  `BALANCE` int(30) NOT NULL,
  `TRANS_ID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `amount`
--

INSERT INTO `amount` (`BALANCE`, `TRANS_ID`) VALUES
(630000, 'DEP20023'),
(185000, 'WID2001');

-- --------------------------------------------------------

--
-- Table structure for table `atm_cards`
--

CREATE TABLE `atm_cards` (
  `CARD_NO` int(15) NOT NULL,
  `BANK_NAME` text NOT NULL,
  `CARD_CVV` int(4) NOT NULL,
  `EXP_DATE` date NOT NULL,
  `CARD_TYPE` varchar(15) NOT NULL,
  `BANK_ID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `atm_cards`
--

INSERT INTO `atm_cards` (`CARD_NO`, `BANK_NAME`, `CARD_CVV`, `EXP_DATE`, `CARD_TYPE`, `BANK_ID`) VALUES
(201, 'UNION', 208, '2024-03-03', 'RUPAY', 103),
(202, 'HDFC', 219, '2024-03-03', 'VISA', 102);

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `BANK_ID` int(15) NOT NULL,
  `IFSC_CODE` varchar(15) NOT NULL,
  `BANK_ADD` varchar(20) NOT NULL,
  `BANK_NAME` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`BANK_ID`, `IFSC_CODE`, `BANK_ADD`, `BANK_NAME`) VALUES
(101, 'SBI101', 'MUMBAI', 'SBI'),
(102, 'HDFC201', 'THANE', 'HDFC'),
(103, 'UNI103', 'PUNE', 'UNION'),
(104, 'BOI103', 'NASHIK', 'BOI');

-- --------------------------------------------------------

--
-- Stand-in structure for view `bank_information`
-- (See below for the actual view)
--
CREATE TABLE `bank_information` (
`bank_id` int(15)
,`ifsc_code` varchar(15)
,`bank_name` text
,`branch_id` int(15)
,`branch_name` text
);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BRANCH_ID` int(15) NOT NULL,
  `BRANCH_NAME` text NOT NULL,
  `BRANCH_LOCATION` text NOT NULL,
  `BANK_ID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BRANCH_ID`, `BRANCH_NAME`, `BRANCH_LOCATION`, `BANK_ID`) VALUES
(1, 'KANJURMARG', 'SHASTRI', 101),
(2, 'BHANDUP', 'DREAMS', 102),
(3, 'NAHUR', 'SHIVAJI NAGAR', 103),
(4, 'MULUND', 'CROMPTON', 104),
(1002, 'THANE', 'TALAOPALI', 102);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `C_ID` int(15) NOT NULL,
  `F_NAME` text NOT NULL,
  `M_NAME` text NOT NULL,
  `L_NAME` text NOT NULL,
  `C_ADD` varchar(15) NOT NULL,
  `CARD_NO` int(15) NOT NULL,
  `GENDER` varchar(8) NOT NULL,
  `EMAIL` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`C_ID`, `F_NAME`, `M_NAME`, `L_NAME`, `C_ADD`, `CARD_NO`, `GENDER`, `EMAIL`) VALUES
(1002, 'BHUSHAN', 'KRISHNA', 'TANDALE', 'DOMBIVALI', 201, 'MALE', 'bhushantandale@gmail.com'),
(10001, 'VIKRANT', 'NANDKUMAR', 'NALAWADE', 'THANE', 202, 'MALE', 'vickynalawade@gmail.com');

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_balance`
-- (See below for the actual view)
--
CREATE TABLE `customer_balance` (
`CARD_NO` int(15)
,`F_NAME` text
,`L_NAME` text
,`balance` int(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_info`
-- (See below for the actual view)
--
CREATE TABLE `customer_info` (
`c_id` int(15)
,`card_no` int(15)
,`f_name` text
,`m_name` text
,`l_name` text
,`c_add` varchar(15)
,`c_phone` int(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `customer_phone`
--

CREATE TABLE `customer_phone` (
  `C_PHONE` int(10) NOT NULL,
  `C_ID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_phone`
--

INSERT INTO `customer_phone` (`C_PHONE`, `C_ID`) VALUES
(87723312, 1002),
(99548123, 10001),
(877452234, 10001);

-- --------------------------------------------------------

--
-- Table structure for table `dba`
--

CREATE TABLE `dba` (
  `id` int(10) NOT NULL,
  `usr` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dba`
--

INSERT INTO `dba` (`id`, `usr`, `pass`) VALUES
(1, 'bank', 'bank');

-- --------------------------------------------------------

--
-- Table structure for table `holds`
--

CREATE TABLE `holds` (
  `C_ID` int(15) NOT NULL,
  `ACC_NO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `holds`
--

INSERT INTO `holds` (`C_ID`, `ACC_NO`) VALUES
(1002, 1123455),
(10001, 123456);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TRANS_ID` varchar(15) NOT NULL,
  `CARD_NO` int(15) NOT NULL,
  `TRANS_STATUS` varchar(15) NOT NULL,
  `TRANS_TYPE` text NOT NULL,
  `TRANS_TIME` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TRANS_ID`, `CARD_NO`, `TRANS_STATUS`, `TRANS_TYPE`, `TRANS_TIME`) VALUES
('DEP20023', 201, 'SUCCESFULL', 'DEPOSIT', '20:13:10'),
('DEPT20003', 201, 'SUCCESFULL', 'DEPOSIT', '10:30:11'),
('WID2001', 202, 'SUCCESFULL', 'WITHDRAW', '10:18:03');

-- --------------------------------------------------------

--
-- Structure for view `bank_information`
--
DROP TABLE IF EXISTS `bank_information`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bank_information`  AS  select `b`.`BANK_ID` AS `bank_id`,`b`.`IFSC_CODE` AS `ifsc_code`,`b`.`BANK_NAME` AS `bank_name`,`brh`.`BRANCH_ID` AS `branch_id`,`brh`.`BRANCH_NAME` AS `branch_name` from (`bank` `b` join `branch` `brh` on(`b`.`BANK_ID` = `brh`.`BANK_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `customer_balance`
--
DROP TABLE IF EXISTS `customer_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_balance`  AS  select `c`.`CARD_NO` AS `CARD_NO`,`c`.`F_NAME` AS `F_NAME`,`c`.`L_NAME` AS `L_NAME`,`a`.`BALANCE` AS `balance` from ((`customer` `c` join `transaction` `t`) join `amount` `a`) where `c`.`CARD_NO` = `t`.`CARD_NO` and `t`.`TRANS_ID` = `a`.`TRANS_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `customer_info`
--
DROP TABLE IF EXISTS `customer_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_info`  AS  select `c`.`C_ID` AS `c_id`,`c`.`CARD_NO` AS `card_no`,`c`.`F_NAME` AS `f_name`,`c`.`M_NAME` AS `m_name`,`c`.`L_NAME` AS `l_name`,`c`.`C_ADD` AS `c_add`,`p`.`C_PHONE` AS `c_phone` from (`customer` `c` join `customer_phone` `p`) where `c`.`C_ID` = `p`.`C_ID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accout`
--
ALTER TABLE `accout`
  ADD PRIMARY KEY (`ACC_NO`);

--
-- Indexes for table `acc_is`
--
ALTER TABLE `acc_is`
  ADD PRIMARY KEY (`ACC_NO`);

--
-- Indexes for table `amount`
--
ALTER TABLE `amount`
  ADD KEY `TRANS_ID` (`TRANS_ID`);

--
-- Indexes for table `atm_cards`
--
ALTER TABLE `atm_cards`
  ADD PRIMARY KEY (`CARD_NO`),
  ADD UNIQUE KEY `CARD_CVV` (`CARD_CVV`),
  ADD KEY `BANK_ID` (`BANK_ID`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`BANK_ID`),
  ADD UNIQUE KEY `IFSC_CODE` (`IFSC_CODE`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BRANCH_ID`),
  ADD KEY `BANK_ID` (`BANK_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`C_ID`),
  ADD UNIQUE KEY `CARD_NO` (`CARD_NO`);

--
-- Indexes for table `customer_phone`
--
ALTER TABLE `customer_phone`
  ADD PRIMARY KEY (`C_PHONE`),
  ADD KEY `C_ID` (`C_ID`);

--
-- Indexes for table `dba`
--
ALTER TABLE `dba`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usr` (`usr`);

--
-- Indexes for table `holds`
--
ALTER TABLE `holds`
  ADD PRIMARY KEY (`C_ID`,`ACC_NO`),
  ADD KEY `ACC_NO` (`ACC_NO`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TRANS_ID`),
  ADD KEY `CARD_NO` (`CARD_NO`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amount`
--
ALTER TABLE `amount`
  ADD CONSTRAINT `amount_ibfk_1` FOREIGN KEY (`TRANS_ID`) REFERENCES `transaction` (`TRANS_ID`);

--
-- Constraints for table `atm_cards`
--
ALTER TABLE `atm_cards`
  ADD CONSTRAINT `atm_cards_ibfk_1` FOREIGN KEY (`BANK_ID`) REFERENCES `bank` (`Bank_id`);

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`BANK_ID`) REFERENCES `bank` (`Bank_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`CARD_NO`) REFERENCES `atm_cards` (`CARD_NO`);

--
-- Constraints for table `customer_phone`
--
ALTER TABLE `customer_phone`
  ADD CONSTRAINT `customer_phone_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`);

--
-- Constraints for table `holds`
--
ALTER TABLE `holds`
  ADD CONSTRAINT `holds_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`),
  ADD CONSTRAINT `holds_ibfk_2` FOREIGN KEY (`ACC_NO`) REFERENCES `accout` (`ACC_NO`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`CARD_NO`) REFERENCES `atm_cards` (`CARD_NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
