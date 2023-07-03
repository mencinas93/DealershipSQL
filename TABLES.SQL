CREATE DATABASE IF NOT EXISTS `DEALERSHIP`;
USE `DEALERSHIP`;

DROP TABLE IF EXISTS `VEHICLE`;
DROP TABLE IF EXISTS `ASSOCIATE`;
DROP TABLE IF EXISTS `CUSTOMER`;
DROP TABLE IF EXISTS `VTRANSACTION`;

CREATE TABLE `VEHICLE` (
  `VID` smallint,
  `Make` varchar(50),
  `Model` varchar(50),
  `Mdate` Date,
  `Color` varchar(50),
  UNIQUE (`VID`),
  PRIMARY KEY (`VID`)
);

CREATE TABLE `ASSOCIATE` (
  `AID` char(10),
  `AName` varchar(100),
  `Position` varchar(25),
  `Salary` DECIMAL(10, 2),
  `SuperAID` varchar(10),
  UNIQUE (`AID`),
  FOREIGN KEY (`SuperAID`) REFERENCES `ASSOCIATE`(`AID`),
  PRIMARY KEY (`AID`)
);

CREATE TABLE `CUSTOMER` (
  `Ssn` varchar(9),
  `CName` varchar(100),
  `Details` varchar(250),
  PRIMARY KEY (`Ssn`)
);

CREATE TABLE `VTRANSACTION` (
  `TID` INT,
  `TTime` DATETIME,
  `VID` smallint,
  `AID` char(10),
  `Ssn` varchar(9),
  `Price` DECIMAL(10, 2),
  FOREIGN KEY (`VID`) REFERENCES `VEHICLE`(`VID`),
  FOREIGN KEY (`AID`) REFERENCES `ASSOCIATE`(`AID`),
  FOREIGN KEY (`Ssn`) REFERENCES `CUSTOMER`(`Ssn`),
  PRIMARY KEY (`TID`)
);

