-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 30, 2024 at 07:45 PM
-- Server version: 10.4.28-MariaDB-log
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacyDb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Medicine`
--

CREATE TABLE `Medicine` (
  `MedicineID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Medicine`
--

INSERT INTO `Medicine` (`MedicineID`, `Name`, `Description`, `Quantity`, `Price`, `ExpiryDate`) VALUES
(1, 'Aspirin', 'Pain reliever', 100, 5.99, '2025-12-31'),
(2, 'Ibuprofen', 'Anti-inflammatory', 200, 8.99, '2024-10-01'),
(3, 'Paracetamol', 'Fever reducer', 150, 3.99, '2023-11-30'),
(4, 'Amoxicillin', 'Antibiotic', 250, 12.50, '2024-08-15'),
(5, 'Omeprazole', 'Acid reducer', 250, 15.49, '2024-11-20'),
(6, 'Prednisone', 'Steroid', 110, 9.99, '2024-08-22');

-- --------------------------------------------------------

--
-- Table structure for table `OrderDetails`
--

CREATE TABLE `OrderDetails` (
  `OrderDetailsID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `MedicineID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `OrderDetails`
--

INSERT INTO `OrderDetails` (`OrderDetailsID`, `Quantity`, `Price`, `OrderID`, `MedicineID`) VALUES
(1, 50, 5.99, 1, 1),
(2, 100, 8.99, 2, 2),
(3, 200, 3.99, 3, 3),
(4, 150, 12.50, 4, 4),
(5, 120, 6.49, 5, 5),
(6, 200, 9.99, 6, 6),
(7, 150, 9.99, 7, 6),
(8, 190, 3.99, 8, 3),
(9, 100, 3.99, 9, 3),
(10, 140, 5.99, 10, 1),
(11, 300, 6.49, 11, 5),
(12, 191, 12.50, 12, 4),
(13, 113, 8.99, 13, 2),
(14, 141, 8.99, 14, 2),
(15, 120, 6.49, 15, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `SupplierID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OrderID`, `OrderDate`, `TotalAmount`, `SupplierID`) VALUES
(1, '2024-04-15', NULL, 1),
(2, '2024-04-18', NULL, 2),
(3, '2024-04-20', NULL, 2),
(4, '2024-05-02', NULL, 3),
(5, '2024-05-05', NULL, 1),
(6, '2024-05-06', NULL, 2),
(7, '2024-05-07', NULL, 2),
(8, '2024-05-08', NULL, 1),
(9, '2024-05-09', NULL, 1),
(10, '2024-05-10', NULL, 2),
(11, '2024-05-11', NULL, 2),
(12, '2024-05-12', NULL, 1),
(13, '2024-05-13', NULL, 3),
(14, '2024-05-14', NULL, 3),
(15, '2024-05-15', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Pharmacist`
--

CREATE TABLE `Pharmacist` (
  `PharmacistID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `ContactInformation` varchar(100) DEFAULT NULL,
  `LicenseNumber` varchar(50) DEFAULT NULL,
  `PharmacyID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Pharmacist`
--

INSERT INTO `Pharmacist` (`PharmacistID`, `Name`, `ContactInformation`, `LicenseNumber`, `PharmacyID`) VALUES
(1, 'Tazmeen', 'tazmeen@example.com', '11111', 1),
(2, 'Ali Tooba', 'ali.tooba@example.com', '22222', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Pharmacy`
--

CREATE TABLE `Pharmacy` (
  `PharmacyID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `ContactInformation` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Pharmacy`
--

INSERT INTO `Pharmacy` (`PharmacyID`, `Name`, `Location`, `ContactInformation`) VALUES
(1, 'HealthPlus Pharmacy', '123 Wellness Blvd', '123-456-7890'),
(2, 'CareWell Pharmacy', '456 Healthy Way', '987-654-3210'),
(3, 'Wellness Pharmacy', '789 Health St', '456-789-0123'),
(4, 'Healthy Life Pharmacy', '321 Wellness Lane', '321-654-9870'),
(5, 'PharmaCare', '147 Cure Ave', '741-852-9630');

-- --------------------------------------------------------

--
-- Table structure for table `PharmacyMedicine`
--

CREATE TABLE `PharmacyMedicine` (
  `PharmacyID` int(11) NOT NULL,
  `MedicineID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PharmacyMedicine`
--

INSERT INTO `PharmacyMedicine` (`PharmacyID`, `MedicineID`) VALUES
(1, 2),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 5),
(2, 6),
(3, 1),
(3, 6),
(4, 3),
(4, 6),
(5, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PharmacySupplier`
--

CREATE TABLE `PharmacySupplier` (
  `PharmacyID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PharmacySupplier`
--

INSERT INTO `PharmacySupplier` (`PharmacyID`, `SupplierID`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 2),
(4, 3),
(5, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Prescription`
--

CREATE TABLE `Prescription` (
  `PrescriptionID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `PatientName` varchar(100) DEFAULT NULL,
  `DoctorName` varchar(50) DEFAULT NULL,
  `ContactInformation` varchar(100) DEFAULT NULL,
  `PharmacyID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Prescription`
--

INSERT INTO `Prescription` (`PrescriptionID`, `Date`, `PatientName`, `DoctorName`, `ContactInformation`, `PharmacyID`) VALUES
(1, '2024-05-20', 'Alice Johnson', 'Dr. Emily Brown', 'alice.johnson@gmail.com', 1),
(2, '2024-05-22', 'Bob Williams', 'Dr. David Smith', 'bob.williams@gmail.com', 2),
(3, '2024-05-25', 'Charlie Davis', 'Dr. Susan Clark', 'charlie.davis@gmail.com', 3),
(4, '2024-05-27', 'Diana Evans', 'Dr. John White', 'diana.evans@gmail.com', 4),
(5, '2024-05-30', 'Edward Green', 'Dr. Nancy Taylor', 'edward.green@gmail.com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `PrescriptionMedicine`
--

CREATE TABLE `PrescriptionMedicine` (
  `MedicineID` int(11) NOT NULL,
  `PrescriptionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PrescriptionMedicine`
--

INSERT INTO `PrescriptionMedicine` (`MedicineID`, `PrescriptionID`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 2),
(4, 3),
(5, 3),
(5, 5),
(6, 2),
(6, 4),
(6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Supplier`
--

CREATE TABLE `Supplier` (
  `SupplierID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `ContactInformation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Supplier`
--

INSERT INTO `Supplier` (`SupplierID`, `Name`, `ContactInformation`) VALUES
(1, 'MedSupply Co.', 'contact@medsupply.com'),
(2, 'HealthDistributor Inc.', ' info@healthdistributor.com'),
(3, ' GlobalMed Supplies.', ' support@globalmedsupplies.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Medicine`
--
ALTER TABLE `Medicine`
  ADD PRIMARY KEY (`MedicineID`);

--
-- Indexes for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD PRIMARY KEY (`OrderDetailsID`),
  ADD KEY `fk_medicine` (`MedicineID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `fk_supplier` (`SupplierID`);

--
-- Indexes for table `Pharmacist`
--
ALTER TABLE `Pharmacist`
  ADD PRIMARY KEY (`PharmacistID`),
  ADD KEY `fk_Pharmacist_Pharmacy` (`PharmacyID`);

--
-- Indexes for table `Pharmacy`
--
ALTER TABLE `Pharmacy`
  ADD PRIMARY KEY (`PharmacyID`);

--
-- Indexes for table `PharmacyMedicine`
--
ALTER TABLE `PharmacyMedicine`
  ADD PRIMARY KEY (`PharmacyID`,`MedicineID`),
  ADD KEY `fk_PharmacyMedicine_Medicine` (`MedicineID`);

--
-- Indexes for table `PharmacySupplier`
--
ALTER TABLE `PharmacySupplier`
  ADD PRIMARY KEY (`PharmacyID`,`SupplierID`),
  ADD KEY `fk_PharmacySupplier_Supplier` (`SupplierID`);

--
-- Indexes for table `Prescription`
--
ALTER TABLE `Prescription`
  ADD PRIMARY KEY (`PrescriptionID`),
  ADD KEY `fk_Pharmacist_Pharrmacy` (`PharmacyID`);

--
-- Indexes for table `PrescriptionMedicine`
--
ALTER TABLE `PrescriptionMedicine`
  ADD PRIMARY KEY (`MedicineID`,`PrescriptionID`),
  ADD KEY `fk_PharmacyPrescription_Prescription` (`PrescriptionID`);

--
-- Indexes for table `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD CONSTRAINT `fk_medicine` FOREIGN KEY (`MedicineID`) REFERENCES `Medicine` (`MedicineID`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `fk_supplier` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`);

--
-- Constraints for table `Pharmacist`
--
ALTER TABLE `Pharmacist`
  ADD CONSTRAINT `fk_Pharmacist_Pharmacy` FOREIGN KEY (`PharmacyID`) REFERENCES `Pharmacy` (`PharmacyID`);

--
-- Constraints for table `PharmacyMedicine`
--
ALTER TABLE `PharmacyMedicine`
  ADD CONSTRAINT `fk_PharmacyMedicine_Medicine` FOREIGN KEY (`MedicineID`) REFERENCES `Medicine` (`MedicineID`),
  ADD CONSTRAINT `fk_PharmacyMedicine_Pharmacy` FOREIGN KEY (`PharmacyID`) REFERENCES `Pharmacy` (`PharmacyID`);

--
-- Constraints for table `PharmacySupplier`
--
ALTER TABLE `PharmacySupplier`
  ADD CONSTRAINT `fk_PharmacySupplier_Pharmacy` FOREIGN KEY (`PharmacyID`) REFERENCES `Pharmacy` (`PharmacyID`),
  ADD CONSTRAINT `fk_PharmacySupplier_Supplier` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`);

--
-- Constraints for table `Prescription`
--
ALTER TABLE `Prescription`
  ADD CONSTRAINT `fk_Pharmacist_Pharrmacy` FOREIGN KEY (`PharmacyID`) REFERENCES `Pharmacy` (`PharmacyID`);

--
-- Constraints for table `PrescriptionMedicine`
--
ALTER TABLE `PrescriptionMedicine`
  ADD CONSTRAINT `fk_PharmacyPrescription_Medicine` FOREIGN KEY (`MedicineID`) REFERENCES `Medicine` (`MedicineID`),
  ADD CONSTRAINT `fk_PharmacyPrescription_Prescription` FOREIGN KEY (`PrescriptionID`) REFERENCES `Prescription` (`PrescriptionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
