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
-- Table `stube`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`autor` (
  `id_autor` INT NOT NULL,
  `direccio` VARCHAR(90) NULL,
  `llibres_escrits` VARCHAR(45) NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stube`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`stock` (
  `id_llibre` INT NOT NULL,
  `preu` DECIMAL NULL,
  `stock` INT(4) NULL,
  `autor_idautor` INT NOT NULL,
  PRIMARY KEY (`id_llibre`, `autor_idautor`),
  INDEX `fk_stock_autor_idx` (`autor_idautor` ASC) VISIBLE,
  CONSTRAINT `fk_stock_autor`
    FOREIGN KEY (`autor_idautor`)
    REFERENCES `stube`.`autor` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stube`.`usuari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`usuari` (
  `id_nickname` INT NOT NULL,
  `email` VARCHAR(90) NULL,
  `contrasenya` VARCHAR(30) NULL,
  PRIMARY KEY (`id_nickname`),
  UNIQUE INDEX `id_nickname_UNIQUE` (`id_nickname` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stube`.`compra online`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`compra online` (
  `id_compra` INT NOT NULL,
  `preu` VARCHAR(45) NULL,
  `stock_id_llibre` INT NOT NULL,
  `stock_autor_idautor` INT NOT NULL,
  `usuari_id_nickname` INT NOT NULL,
  PRIMARY KEY (`id_compra`, `stock_id_llibre`, `stock_autor_idautor`, `usuari_id_nickname`),
  INDEX `fk_compra online_stock1_idx` (`stock_id_llibre` ASC, `stock_autor_idautor` ASC) VISIBLE,
  INDEX `fk_compra online_usuari1_idx` (`usuari_id_nickname` ASC) VISIBLE,
  CONSTRAINT `fk_compra online_stock1`
    FOREIGN KEY (`stock_id_llibre` , `stock_autor_idautor`)
    REFERENCES `stube`.`stock` (`id_llibre` , `autor_idautor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra online_usuari1`
    FOREIGN KEY (`usuari_id_nickname`)
    REFERENCES `stube`.`usuari` (`id_nickname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
