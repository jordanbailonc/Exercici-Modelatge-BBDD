-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema stube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema stube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `stube` DEFAULT CHARACTER SET utf8 ;
USE `stube` ;

-- -----------------------------------------------------
-- Table `stube`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`Stock` (
  `id_quadre` INT NULL AUTO_INCREMENT,
  `preu` INT NULL,
  `autor` VARCHAR(60) NULL,
  PRIMARY KEY (`id_quadre`),
  UNIQUE INDEX `id_quadre_UNIQUE` (`id_quadre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stube`.`comprador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`comprador` (
  `idcomprador` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `dni` VARCHAR(10) NULL,
  PRIMARY KEY (`idcomprador`),
  UNIQUE INDEX `idcomprador_UNIQUE` (`idcomprador` ASC) VISIBLE,
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stube`.`ventes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`ventes` (
  `id_ventes` INT NOT NULL,
  `Stock_id_quadre` INT NOT NULL,
  `comprador_idcomprador` INT NOT NULL,
  PRIMARY KEY (`id_ventes`, `Stock_id_quadre`, `comprador_idcomprador`),
  UNIQUE INDEX `id_ventes_UNIQUE` (`id_ventes` ASC) VISIBLE,
  INDEX `fk_ventes_Stock1_idx` (`Stock_id_quadre` ASC) VISIBLE,
  INDEX `fk_ventes_comprador1_idx` (`comprador_idcomprador` ASC) VISIBLE,
  CONSTRAINT `fk_ventes_Stock1`
    FOREIGN KEY (`Stock_id_quadre`)
    REFERENCES `stube`.`Stock` (`id_quadre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventes_comprador1`
    FOREIGN KEY (`comprador_idcomprador`)
    REFERENCES `stube`.`comprador` (`idcomprador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
