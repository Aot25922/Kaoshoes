-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 9Food
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `9Food` ;

-- -----------------------------------------------------
-- Schema 9Food
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `9Food` DEFAULT CHARACTER SET utf8 ;
USE `9Food` ;

-- -----------------------------------------------------
-- Table `9Food`.`Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `9Food`.`Order` ;

CREATE TABLE IF NOT EXISTS `9Food`.`Order` (
  `OrderId` INT NOT NULL,
  `CusName` VARCHAR(10) NULL,
  `Manuface` DATE NOT NULL,
  PRIMARY KEY (`OrderId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9Food`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `9Food`.`Category` ;

CREATE TABLE IF NOT EXISTS `9Food`.`Category` (
  `CateId` INT NOT NULL,
  `CateName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CateId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9Food`.`Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `9Food`.`Menu` ;

CREATE TABLE IF NOT EXISTS `9Food`.`Menu` (
  `MenuId` INT NOT NULL,
  `MenuName` VARCHAR(45) NOT NULL,
  `Descript` VARCHAR(45) NOT NULL,
  `Costl` DOUBLE NOT NULL,
  `Price` VARCHAR(45) NOT NULL,
  `Image_Path` VARCHAR(100) NOT NULL,
  `CateId` INT NOT NULL,
  PRIMARY KEY (`MenuId`, `CateId`),
  INDEX `fk_Menu_Category_idx` (`CateId` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_Category`
    FOREIGN KEY (`CateId`)
    REFERENCES `9Food`.`Category` (`CateId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9Food`.`Orderdetail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `9Food`.`Orderdetail` ;

CREATE TABLE IF NOT EXISTS `9Food`.`Orderdetail` (
  `OrderId` INT NOT NULL,
  `MenuId` INT NOT NULL,
  `CateId` INT NOT NULL,
  PRIMARY KEY (`OrderId`, `MenuId`, `CateId`),
  INDEX `fk_Orderdetail_Order1_idx` (`OrderId` ASC) VISIBLE,
  INDEX `fk_Orderdetail_Menu1_idx` (`MenuId` ASC, `CateId` ASC) VISIBLE,
  CONSTRAINT `fk_Orderdetail_Order1`
    FOREIGN KEY (`OrderId`)
    REFERENCES `9Food`.`Order` (`OrderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orderdetail_Menu1`
    FOREIGN KEY (`MenuId` , `CateId`)
    REFERENCES `9Food`.`Menu` (`MenuId` , `CateId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9Food`.`Size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `9Food`.`Size` ;

CREATE TABLE IF NOT EXISTS `9Food`.`Size` (
  `SizeId` INT NOT NULL,
  `Size` CHAR(1) NOT NULL,
  PRIMARY KEY (`SizeId`),
  UNIQUE INDEX `Size_UNIQUE` (`Size` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9Food`.`Menu_has_Size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `9Food`.`Menu_has_Size` ;

CREATE TABLE IF NOT EXISTS `9Food`.`Menu_has_Size` (
  `MenuId` INT NOT NULL,
  `CateId` INT NOT NULL,
  `SizeId` INT NOT NULL,
  PRIMARY KEY (`MenuId`, `CateId`, `SizeId`),
  INDEX `fk_Menu_has_Size_Size1_idx` (`SizeId` ASC) VISIBLE,
  INDEX `fk_Menu_has_Size_Menu1_idx` (`MenuId` ASC, `CateId` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_has_Size_Menu1`
    FOREIGN KEY (`MenuId` , `CateId`)
    REFERENCES `9Food`.`Menu` (`MenuId` , `CateId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menu_has_Size_Size1`
    FOREIGN KEY (`SizeId`)
    REFERENCES `9Food`.`Size` (`SizeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
