-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 9shoes
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `9shoes` ;

-- -----------------------------------------------------
-- Schema 9shoes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `9shoes` DEFAULT CHARACTER SET utf8 ;
USE `9shoes` ;

-- -----------------------------------------------------
-- Table `9shoes`.`Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `9shoes`.`Order` ;

CREATE TABLE IF NOT EXISTS `9shoes`.`Order` (
  `OrderId` INT NOT NULL,
  `CusName` VARCHAR(10) NULL,
  PRIMARY KEY (`OrderId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9shoes`.`Brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `9shoes`.`Brand` ;

CREATE TABLE IF NOT EXISTS `9shoes`.`Brand` (
  `BrandId` INT NOT NULL,
  `BrandName` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`BrandId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9shoes`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `9shoes`.`Product` ;

CREATE TABLE IF NOT EXISTS `9shoes`.`Product` (
  `ProductId` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `Descript` VARCHAR(500) NOT NULL,
  `Price` DOUBLE NOT NULL,
  `ImagePath` VARCHAR(100) NOT NULL,
  `ManuDate` DATE NOT NULL,
  `BrandId` INT NOT NULL,
  PRIMARY KEY (`ProductId`, `BrandId`),
  INDEX `fk_Menu_Category_idx` (`BrandId` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_Category`
    FOREIGN KEY (`BrandId`)
    REFERENCES `9shoes`.`Brand` (`BrandId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9shoes`.`Orderdetail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `9shoes`.`Orderdetail` ;

CREATE TABLE IF NOT EXISTS `9shoes`.`Orderdetail` (
  `OrdertId` INT NOT NULL,
  `ProductId` INT NOT NULL,
  PRIMARY KEY (`OrdertId`, `ProductId`),
  INDEX `fk_Orderdetail_Order1_idx` (`OrdertId` ASC) VISIBLE,
  INDEX `fk_Orderdetail_Menu1_idx` (`ProductId` ASC) VISIBLE,
  CONSTRAINT `fk_Orderdetail_Order1`
    FOREIGN KEY (`OrdertId`)
    REFERENCES `9shoes`.`Order` (`OrderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orderdetail_Menu1`
    FOREIGN KEY (`ProductId`)
    REFERENCES `9shoes`.`Product` (`ProductId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9shoes`.`Size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `9shoes`.`Size` ;

CREATE TABLE IF NOT EXISTS `9shoes`.`Size` (
  `SizeId` INT NOT NULL,
  `SizeValue` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`SizeId`),
  UNIQUE INDEX `SizeValue_UNIQUE` (`SizeValue` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9shoes`.`Product_has_Size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `9shoes`.`Product_has_Size` ;

CREATE TABLE IF NOT EXISTS `9shoes`.`Product_has_Size` (
  `ProductId` INT NOT NULL,
  `SizeId` INT NOT NULL,
  PRIMARY KEY (`ProductId`, `SizeId`),
  INDEX `fk_Menu_has_Size_Size1_idx` (`SizeId` ASC) VISIBLE,
  INDEX `fk_Menu_has_Size_Menu1_idx` (`ProductId` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_has_Size_Menu1`
    FOREIGN KEY (`ProductId`)
    REFERENCES `9shoes`.`Product` (`ProductId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menu_has_Size_Size1`
    FOREIGN KEY (`SizeId`)
    REFERENCES `9shoes`.`Size` (`SizeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
