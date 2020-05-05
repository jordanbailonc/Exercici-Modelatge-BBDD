-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vueling_avions
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vueling_avions
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vueling_avions` DEFAULT CHARACTER SET utf8 ;
USE `vueling_avions` ;

-- -----------------------------------------------------
-- Table `vueling_avions`.`Taula Avions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vueling_avions`.`Taula Avions` (
  `id_avio` INT NOT NULL AUTO_INCREMENT,
  `capacitat` INT NULL,
  `model_avio` VARCHAR(45) NULL,
  PRIMARY KEY (`id_avio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vueling_avions`.`Taula Seients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vueling_avions`.`Taula Seients` (
  `idTaula Seients` INT NOT NULL AUTO_INCREMENT,
  `Taula Avions_id_avio` INT NOT NULL,
  PRIMARY KEY (`idTaula Seients`, `Taula Avions_id_avio`),
  INDEX `fk_Taula Seients_Taula Avions_idx` (`Taula Avions_id_avio` ASC) VISIBLE,
  CONSTRAINT `fk_Taula Seients_Taula Avions`
    FOREIGN KEY (`Taula Avions_id_avio`)
    REFERENCES `vueling_avions`.`Taula Avions` (`id_avio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
