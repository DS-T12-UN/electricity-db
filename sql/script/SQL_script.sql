-- MySQL Script generated by MySQL Workbench
-- sáb 14 may 2022 14:36:44
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema electricity
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `electricity` ;

-- -----------------------------------------------------
-- Schema electricity
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `electricity` DEFAULT CHARACTER SET utf8 ;
USE `electricity` ;

-- -----------------------------------------------------
-- Table `electricity`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`Country` ;

CREATE TABLE IF NOT EXISTS `electricity`.`Country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `iso_code` VARCHAR(3) NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`CountryStatistics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`CountryStatistics` ;

CREATE TABLE IF NOT EXISTS `electricity`.`CountryStatistics` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `gdp` DOUBLE NULL,
  `population` DOUBLE NULL,
  `energy_consumption_change_percent` FLOAT NULL,
  `energy_consumption_change_tw_h` FLOAT NULL,
  `energy_per_gdp` FLOAT NULL,
  `energy_per_capita` FLOAT NULL,
  `electricity_generation` FLOAT NULL,
  `electricity_demand` FLOAT NULL,
  `net_electricity_imports_as_share_demand` FLOAT NULL,
  `net_electricity_imports` FLOAT NULL,
  `per_capita_electricity` FLOAT NULL,
  `carbon_intensity_electricity` FLOAT NULL,
  `greenhouse_gas_emissions` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CountryStatistics_Country_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_CountryStatistics_Country`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`Coal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`Coal` ;

CREATE TABLE IF NOT EXISTS `electricity`.`Coal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `coal_production_change_percent` FLOAT NULL,
  `coal_production_change_tw_h` FLOAT NULL,
  `coal_share_electricity` FLOAT NULL,
  `coal_consumption_change_percent` FLOAT NULL,
  `coal_share_energy` FLOAT NULL,
  `coal_consumption_change_tw_h` FLOAT NULL,
  `coal_consumption` FLOAT NULL,
  `coal_electricity_per_capita` FLOAT NULL,
  `coal_production` FLOAT NULL,
  `coal_production_per_capita` FLOAT NULL,
  `coal_electricity` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Coal_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_Coal_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`Gas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`Gas` ;

CREATE TABLE IF NOT EXISTS `electricity`.`Gas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `gas_production_change_percent` FLOAT NULL,
  `gas_production_change_tw_h` FLOAT NULL,
  `gas_share_electricity` FLOAT NULL,
  `gas_consumption_change_percent` FLOAT NULL,
  `gas_share_energy` FLOAT NULL,
  `gas_consumption_change_tw_h` FLOAT NULL,
  `gas_consumption` FLOAT NULL,
  `gas_electricity_per_capita` FLOAT NULL,
  `gas_production` FLOAT NULL,
  `gas_production_per_capita` FLOAT NULL,
  `gas_electricity` FLOAT NULL,
  `gas_energy_per_capita` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Gas_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_Gas_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`Oil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`Oil` ;

CREATE TABLE IF NOT EXISTS `electricity`.`Oil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `oil_production_change_percent` FLOAT NULL,
  `oil_production_change_tw_h` FLOAT NULL,
  `oil_share_electricity` FLOAT NULL,
  `oil_consumption_change_percent` FLOAT NULL,
  `oil_share_energy` FLOAT NULL,
  `oil_consumption_change_tw_h` FLOAT NULL,
  `oil_consumption` FLOAT NULL,
  `oil_electricity_per_capita` FLOAT NULL,
  `oil_production` FLOAT NULL,
  `oil_production_per_capita` FLOAT NULL,
  `oil_electricity` FLOAT NULL,
  `oil_energy_per_capita` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Oil_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_Oil_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`Hydro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`Hydro` ;

CREATE TABLE IF NOT EXISTS `electricity`.`Hydro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `hydro_share_electricity` FLOAT NULL,
  `hydro_consumption_change_percent` FLOAT NULL,
  `hydro_share_energy` FLOAT NULL,
  `hydro_consumption_change_tw_h` FLOAT NULL,
  `hydro_consumption` FLOAT NULL,
  `hydro_electricity_per_capita` FLOAT NULL,
  `hydro_electricity` FLOAT NULL,
  `hydro_energy_per_capita` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Hydro_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_Hydro_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`Biofuel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`Biofuel` ;

CREATE TABLE IF NOT EXISTS `electricity`.`Biofuel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `biofuel_share_electricity` FLOAT NULL,
  `biofuel_consumption_change_percent` FLOAT NULL,
  `biofuel_share_energy` FLOAT NULL,
  `biofuel_consumption_change_tw_h` FLOAT NULL,
  `biofuel_electricity_per_capita` FLOAT NULL,
  `biofuel_consumption_per_capita` FLOAT NULL,
  `biofuel_electricity` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Biofuel_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_Biofuel_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`Fossil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`Fossil` ;

CREATE TABLE IF NOT EXISTS `electricity`.`Fossil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `fossil_share_electricity` FLOAT NULL,
  `fossil_consumption_change_percent` FLOAT NULL,
  `fossil_share_energy` FLOAT NULL,
  `fossil_consumption_change_tw_h` FLOAT NULL,
  `fossil_fuel_consumption` FLOAT NULL,
  `fossil_consumption_per_capita` FLOAT NULL,
  `fossil_electricity` FLOAT NULL,
  `fossil_energy_per_capita` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Fossil_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_Fossil_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`Solar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`Solar` ;

CREATE TABLE IF NOT EXISTS `electricity`.`Solar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `solar_share_electricity` FLOAT NULL,
  `solar_consumption_change_percent` FLOAT NULL,
  `solar_share_energy` FLOAT NULL,
  `solar_consumption_change_tw_h` FLOAT NULL,
  `solar_consumption` FLOAT NULL,
  `solar_electricity_per_capita` FLOAT NULL,
  `solar_energy_per_capita` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Solar_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_Solar_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`Nuclear`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`Nuclear` ;

CREATE TABLE IF NOT EXISTS `electricity`.`Nuclear` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `nuclear_share_electricity` FLOAT NULL,
  `nuclear_consumption_change_percent` FLOAT NULL,
  `nuclear_share_energy` FLOAT NULL,
  `nuclear_consumption_change_tw_h` FLOAT NULL,
  `nuclear_consumption` FLOAT NULL,
  `nuclear_electricity_per_capita` FLOAT NULL,
  `nuclear_electricity` FLOAT NULL,
  `nuclear_energy_per_capita` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Nuclear_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_Nuclear_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`Wind`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`Wind` ;

CREATE TABLE IF NOT EXISTS `electricity`.`Wind` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `wind_share_electricity` FLOAT NULL,
  `wind_consumption_change_percent` FLOAT NULL,
  `wind_share_energy` FLOAT NULL,
  `wind_consumption_change_tw_h` FLOAT NULL,
  `wind_consumption` FLOAT NULL,
  `wind_electricity_per_capita` FLOAT NULL,
  `wind_energy_per_capita` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Wind_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_Wind_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`Renewables`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`Renewables` ;

CREATE TABLE IF NOT EXISTS `electricity`.`Renewables` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `renewables_share_electricity` FLOAT NULL,
  `renewables_consumption_change_percent` FLOAT NULL,
  `renewables_share_energy` FLOAT NULL,
  `renewables_consumption_change_tw_h` FLOAT NULL,
  `renewables_consumption` FLOAT NULL,
  `renewables_electricity_per_capita` FLOAT NULL,
  `renewables_electricity` FLOAT NULL,
  `renewables_energy_per_capita` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Renewables_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_Renewables_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`LowCarbon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`LowCarbon` ;

CREATE TABLE IF NOT EXISTS `electricity`.`LowCarbon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `low_carbon_share_electricity` FLOAT NULL,
  `low_carbon_consumption_change_percent` FLOAT NULL,
  `low_carbon_share_energy` FLOAT NULL,
  `low_carbon_consumption_change_tw_h` FLOAT NULL,
  `low_carbon_consumption` FLOAT NULL,
  `low_carbon_electricity_per_capita` FLOAT NULL,
  `low_carbon_electricity` FLOAT NULL,
  `low_carbon_energy_per_capita` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_LowCarbon_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_LowCarbon_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `electricity`.`OtherRenewables`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electricity`.`OtherRenewables` ;

CREATE TABLE IF NOT EXISTS `electricity`.`OtherRenewables` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` INT NOT NULL,
  `year` INT NULL,
  `other_renewables_share_electricity` FLOAT NULL,
  `other_renewables_consumption_change_percent` FLOAT NULL,
  `other_renewables_share_energy` FLOAT NULL,
  `other_renewables_consumption_change_tw_h` FLOAT NULL,
  `other_renewable_consumption` FLOAT NULL,
  `other_renewables_electricity_per_capita` FLOAT NULL,
  `other_renewable_electricity` FLOAT NULL,
  `other_renewables_energy_per_capita` FLOAT NULL,
  `other_renewable_excluding_biofuel_electricity` FLOAT NULL,
  `other_renewables_electricity_per_capita_excluding_biofuel` FLOAT NULL,
  `other_renewables_share_electricity_excluding_biofuel` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_OtherRenewables_Country1_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `fk_OtherRenewables_Country1`
    FOREIGN KEY (`country`)
    REFERENCES `electricity`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;