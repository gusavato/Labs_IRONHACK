-- MySQL Workbench Forward Engineering

/*
Planteamiento del problema a la hora de establecer relaciones
- Una única factura puede tener asociados varios coches. Relación 1 to many
- Un único comprador puede estar a nombre de una factura. Pero un caomprador puede tener varias facturas Relación 1 to many
- Un único vendedor puede estar asociado a una factura. Entendemos que un vendedor tiene una cartera de clientes. Relación 1 to 1
*/


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CARS_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CARS_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CARS_DB` DEFAULT CHARACTER SET utf8 ;
USE `CARS_DB` ;

-- -----------------------------------------------------
-- Table `CARS_DB`.`Salesman`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CARS_DB`.`Salesman` (
  `Id_Sales` INT NOT NULL AUTO_INCREMENT,
  `Salesman_ID` VARCHAR(5) NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Store` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Sales`),
  UNIQUE INDEX `Id_Sales_UNIQUE` (`Id_Sales` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CARS_DB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CARS_DB`.`Customers` (
  `Id_Customers` INT NOT NULL AUTO_INCREMENT,
  `Customer_ID` VARCHAR(5) NOT NULL,
  `Name` VARCHAR(60) NOT NULL,
  `Phone` VARCHAR(20) NOT NULL,
  `City` VARCHAR(30) NULL,
  `Province` VARCHAR(30) NULL,
  `Country` VARCHAR(30) NULL,
  `Postal Code` INT NULL,
  `Email` VARCHAR(45) NULL,
  `Adress` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Customers`),
  UNIQUE INDEX `Id_Customers_UNIQUE` (`Id_Customers` ASC) VISIBLE,
  UNIQUE INDEX `Customer_ID_UNIQUE` (`Customer_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CARS_DB`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CARS_DB`.`Invoices` (
  `Id_Invoices` INT NOT NULL AUTO_INCREMENT,
  `Number` INT NOT NULL,
  `Date` DATE NULL,
  `Id_Sales` INT NOT NULL,
  `Id_Customers` INT NOT NULL,
  PRIMARY KEY (`Id_Invoices`, `Id_Sales`, `Id_Customers`),
  UNIQUE INDEX `id_Invoices_UNIQUE` (`Id_Invoices` ASC) VISIBLE,
  UNIQUE INDEX `Invoice_ID_UNIQUE` (`Number` ASC) VISIBLE,
  INDEX `fk_Invoices_Salesman1_idx` (`Id_Sales` ASC) VISIBLE,
  INDEX `fk_Invoices_Customers1_idx` (`Id_Customers` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Salesman1`
    FOREIGN KEY (`Id_Sales`)
    REFERENCES `CARS_DB`.`Salesman` (`Id_Sales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Id_Customers`)
    REFERENCES `CARS_DB`.`Customers` (`Id_Customers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CARS_DB`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CARS_DB`.`Cars` (
  `Id_Cars` INT NOT NULL AUTO_INCREMENT,
  `VIN` CHAR(17) NULL,
  `Manufacturer` VARCHAR(30) NOT NULL,
  `Model` VARCHAR(30) NULL,
  `Year` YEAR NULL,
  `Color` VARCHAR(20) NULL,
  `Id_Invoices` INT NOT NULL,
  PRIMARY KEY (`Id_Cars`, `Id_Invoices`),
  UNIQUE INDEX `Id_Cars_UNIQUE` (`Id_Cars` ASC) VISIBLE,
  UNIQUE INDEX `VIN_UNIQUE` (`VIN` ASC) VISIBLE,
  INDEX `fk_Cars_Invoices_idx` (`Id_Invoices` ASC) VISIBLE,
  CONSTRAINT `fk_Cars_Invoices`
    FOREIGN KEY (`Id_Invoices`)
    REFERENCES `CARS_DB`.`Invoices` (`Id_Invoices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
