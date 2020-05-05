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
-- Table `stube`.`usuari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`usuari` (
  `id_usuari` INT UNSIGNED NOT NULL,
  `nom` VARCHAR(45) NULL,
  `email` VARCHAR(80) NULL,
  `contrasenya` VARCHAR(30) NULL,
  PRIMARY KEY (`id_usuari`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stube`.`amigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`amigo` (
  `id_amigo` INT UNSIGNED NOT NULL,
  `rao_amigo` VARCHAR(45) NULL,
  `usuari_id_usuari` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_amigo`, `usuari_id_usuari`),
  INDEX `fk_amigo_usuari_idx` (`usuari_id_usuari` ASC) VISIBLE,
  CONSTRAINT `fk_amigo_usuari`
    FOREIGN KEY (`usuari_id_usuari`)
    REFERENCES `stube`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stube`.`foto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`foto` (
  `id_foto` INT NOT NULL,
  `lloc` TEXT(30) NULL,
  `url` VARCHAR(45) NULL,
  `usuari_id_usuari` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_foto`, `usuari_id_usuari`),
  INDEX `fk_foto_usuari1_idx` (`usuari_id_usuari` ASC) VISIBLE,
  CONSTRAINT `fk_foto_usuari1`
    FOREIGN KEY (`usuari_id_usuari`)
    REFERENCES `stube`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
