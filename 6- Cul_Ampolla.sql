-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cul_ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cul_ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cul_ampolla` DEFAULT CHARACTER SET utf8 ;
USE `cul_ampolla` ;

-- -----------------------------------------------------
-- Table `cul_ampolla`.`Proveidors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`Proveidors` (
  `id_Proveidors` INT UNSIGNED NOT NULL,
  `carrer` TEXT(80) NULL,
  `numero` INT NULL,
  `pis` INT NULL,
  `porta` INT NULL,
  `ciutat` VARCHAR(45) NULL,
  `cp` BIGINT(5) NULL,
  `pais` VARCHAR(90) NULL,
  `telefono` VARCHAR(14) NULL,
  `fax` VARCHAR(45) NULL,
  `nif` VARCHAR(12) NULL,
  PRIMARY KEY (`id_Proveidors`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cul_ampolla`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`ulleres` (
  `id_model_ulleres` INT NOT NULL,
  `marca` TEXT(40) NULL,
  `graduacio v1` INT NULL,
  `graduacio v2` INT NULL,
  `tipus_montura` VARCHAR(45) NULL,
  `color_montura` TEXT(40) NULL,
  `color v1` TEXT(40) NULL,
  `color v2` TEXT(40) NULL,
  `preu` INT NULL,
  `Proveidors_id_Proveidors` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_model_ulleres`, `Proveidors_id_Proveidors`),
  INDEX `fk_ulleres_Proveidors1_idx` (`Proveidors_id_Proveidors` ASC) VISIBLE,
  CONSTRAINT `fk_ulleres_Proveidors1`
    FOREIGN KEY (`Proveidors_id_Proveidors`)
    REFERENCES `cul_ampolla`.`Proveidors` (`id_Proveidors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cul_ampolla`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`clients` (
  `id_clients` INT UNSIGNED NOT NULL,
  `nom` TEXT(25) NULL,
  `adreça` VARCHAR(80) NULL,
  `telefon` VARCHAR(13) NULL,
  `correu electronic` VARCHAR(80) NULL,
  `data_registre` DATE NULL,
  `recomenat` TINYINT NULL,
  PRIMARY KEY (`id_clients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cul_ampolla`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`venta` (
  `id_venta` INT UNSIGNED NOT NULL,
  `empleat` VARCHAR(45) NULL,
  `ulleres_id_model_ulleres` INT NOT NULL,
  `clients_id_clients` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_venta`, `ulleres_id_model_ulleres`, `clients_id_clients`),
  INDEX `fk_venta_ulleres_idx` (`ulleres_id_model_ulleres` ASC) VISIBLE,
  INDEX `fk_venta_clients1_idx` (`clients_id_clients` ASC) VISIBLE,
  CONSTRAINT `fk_venta_ulleres`
    FOREIGN KEY (`ulleres_id_model_ulleres`)
    REFERENCES `cul_ampolla`.`ulleres` (`id_model_ulleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_clients1`
    FOREIGN KEY (`clients_id_clients`)
    REFERENCES `cul_ampolla`.`clients` (`id_clients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
