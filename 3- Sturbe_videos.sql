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
  `idusuari` INT UNSIGNED NOT NULL,
  `email` TEXT(120) NULL,
  `contrasenya` VARCHAR(45) NULL,
  PRIMARY KEY (`idusuari`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stube`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`videos` (
  `id_video_titol` INT UNSIGNED NOT NULL,
  `usuari_idusuari` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_video_titol`, `usuari_idusuari`),
  INDEX `fk_videos_usuari_idx` (`usuari_idusuari` ASC) VISIBLE,
  CONSTRAINT `fk_videos_usuari`
    FOREIGN KEY (`usuari_idusuari`)
    REFERENCES `stube`.`usuari` (`idusuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stube`.`video_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`video_data` (
  `descripcio` TEXT(90) NULL,
  `video_datacol` VARCHAR(45) NULL,
  `videos_idvideos` INT UNSIGNED NOT NULL,
  `url` VARCHAR(90) NULL,
  `identificador` VARCHAR(45) NULL,
  PRIMARY KEY (`videos_idvideos`),
  INDEX `fk_video_data_videos1_idx` (`videos_idvideos` ASC) VISIBLE,
  CONSTRAINT `fk_video_data_videos1`
    FOREIGN KEY (`videos_idvideos`)
    REFERENCES `stube`.`videos` (`id_video_titol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
