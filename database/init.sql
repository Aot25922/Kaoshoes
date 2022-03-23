-- -----------------------------------------------------
-- Schema int221_kaoshoes
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `int221_kaoshoes` ;

-- -----------------------------------------------------
-- Schema int221_kaoshoes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `int221_kaoshoes` DEFAULT CHARACTER SET utf8 ;
USE `int221_kaoshoes` ;

-- -----------------------------------------------------
-- Table `int221_kaoshoes`.`Brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `int221_kaoshoes`.`Brand` ;

CREATE TABLE IF NOT EXISTS `int221_kaoshoes`.`Brand` (
  `BrandId` INT NOT NULL,
  `BrandName` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`BrandId`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `int221_kaoshoes`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `int221_kaoshoes`.`Product` ;

CREATE TABLE IF NOT EXISTS `int221_kaoshoes`.`Product` (
  `ProductId` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `Descript` VARCHAR(800) NOT NULL,
  `Price` DOUBLE NOT NULL,
  `ImagePath` VARCHAR(100) NOT NULL,
  `ManuDate` DATE NOT NULL,
  `BrandId` INT NOT NULL,
  PRIMARY KEY (`ProductId`, `BrandId`),
  INDEX `fk_Menu_Category_idx` (`BrandId` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_Category`
    FOREIGN KEY (`BrandId`)
    REFERENCES `int221_kaoshoes`.`Brand` (`BrandId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `int221_kaoshoes`.`Size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `int221_kaoshoes`.`Size` ;

CREATE TABLE IF NOT EXISTS `int221_kaoshoes`.`Size` (
  `SizeId` INT NOT NULL,
  `SizeValue` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`SizeId`),
  UNIQUE INDEX `SizeValue_UNIQUE` (`SizeValue` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `int221_kaoshoes`.`Product_has_Size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `int221_kaoshoes`.`Product_has_Size` ;

CREATE TABLE IF NOT EXISTS `int221_kaoshoes`.`Product_has_Size` (
  `ProductId` INT NOT NULL,
  `SizeId` INT NOT NULL,
  PRIMARY KEY (`ProductId`, `SizeId`),
  INDEX `fk_Menu_has_Size_Size1_idx` (`SizeId` ASC) VISIBLE,
  INDEX `fk_Menu_has_Size_Menu1_idx` (`ProductId` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_has_Size_Menu1`
    FOREIGN KEY (`ProductId`)
    REFERENCES `int221_kaoshoes`.`Product` (`ProductId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menu_has_Size_Size1`
    FOREIGN KEY (`SizeId`)
    REFERENCES `int221_kaoshoes`.`Size` (`SizeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
