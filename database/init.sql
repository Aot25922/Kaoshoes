-- MySQL Workbench Forward Engineering

GRANT ALL ON *.* to 'int221'@'%' WITH GRANT OPTION;
DROP DATABASE IF EXISTS `kaofood`;
CREATE DATABASE IF NOT EXISTS `kaofood`;
USE `kaofood` ;

-- -----------------------------------------------------
-- Table `9Food`.`Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Order` ;

CREATE TABLE IF NOT EXISTS `Order` (
  `OrderId` INT NOT NULL,
  `CusName` VARCHAR(10) NULL,
  `Manuface` DATE NOT NULL,
  PRIMARY KEY (`OrderId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9Food`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Category` ;

CREATE TABLE IF NOT EXISTS `Category` (
  `CateId` INT NOT NULL,
  `CateName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CateId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9Food`.`Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Menu` ;

CREATE TABLE IF NOT EXISTS `Menu` (
  `MenuId` INT NOT NULL AUTO_INCREMENT,
  `MenuName` VARCHAR(45) NOT NULL,
  `Descript` VARCHAR(500) NOT NULL,
  `Cost` DOUBLE NOT NULL,
  `ImagePath` VARCHAR(100) NOT NULL,
  `CateId` INT NOT NULL,
  PRIMARY KEY (`MenuId`),
  INDEX `fk_Menu_Category_idx` (`CateId` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_Category`
    FOREIGN KEY (`CateId`)
    REFERENCES `Category` (`CateId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9Food`.`Orderdetail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Orderdetail` ;

CREATE TABLE IF NOT EXISTS `Orderdetail` (
  `OrderId` INT NOT NULL,
  `MenuId` INT NOT NULL,
  PRIMARY KEY (`OrderId`, `MenuId`),
  INDEX `fk_Orderdetail_Order1_idx` (`OrderId` ASC) VISIBLE,
  INDEX `fk_Orderdetail_Menu1_idx` (`MenuId` ASC) VISIBLE,
  CONSTRAINT `fk_Orderdetail_Order1`
    FOREIGN KEY (`OrderId`)
    REFERENCES `Order` (`OrderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orderdetail_Menu1`
    FOREIGN KEY (`MenuId`)
    REFERENCES `Menu` (`MenuId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9Food`.`Size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Size` ;

CREATE TABLE IF NOT EXISTS `Size` (
  `SizeId` INT NOT NULL,
  `SizeValue` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`SizeId`),
  UNIQUE INDEX `Size_UNIQUE` (`SizeValue` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `9Food`.`Menu_has_Size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Menu_has_Size` ;

CREATE TABLE IF NOT EXISTS `Menu_has_Size` (
  `MenuId` INT NOT NULL,
  `SizeId` INT NOT NULL,
  `Price`  DOUBLE NOT NULL,
  PRIMARY KEY (`MenuId`, `SizeId`),
  INDEX `fk_Menu_has_Size_Size1_idx` (`SizeId` ASC) VISIBLE,
  INDEX `fk_Menu_has_Size_Menu1_idx` (`MenuId` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_has_Size_Menu1`
    FOREIGN KEY (`MenuId`)
    REFERENCES `Menu` (`MenuId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menu_has_Size_Size1`
    FOREIGN KEY (`SizeId`)
    REFERENCES `Size` (`SizeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;