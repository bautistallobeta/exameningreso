-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cinedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cinedb` ;

-- -----------------------------------------------------
-- Schema cinedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cinedb` DEFAULT CHARACTER SET utf8 ;
USE `cinedb` ;

-- -----------------------------------------------------
-- Table `Salas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Salas` ;

CREATE TABLE IF NOT EXISTS `Salas` (
  `IdSala` SMALLINT NOT NULL,
  `Sala` VARCHAR(60) NOT NULL,
  `TipoSala` CHAR(1) NOT NULL,
  `Direccion` VARCHAR(50) NOT NULL,
  `Estado` CHAR(1) NOT NULL,
  `Observaciones` VARCHAR(255) NULL,
  PRIMARY KEY (`IdSala`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `ak_Sala` ON `Salas` (`Sala` ASC) INVISIBLE;


-- -----------------------------------------------------
-- Table `Generos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Generos` ;

CREATE TABLE IF NOT EXISTS `Generos` (
  `IdGenero` SMALLINT NOT NULL,
  `Genero` VARCHAR(50) NOT NULL,
  `Estado` CHAR(1) NOT NULL,
  PRIMARY KEY (`IdGenero`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `ak_Genero` ON `Generos` (`Genero` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Peliculas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Peliculas` ;

CREATE TABLE IF NOT EXISTS `Peliculas` (
  `IdPelicula` INT NOT NULL,
  `IdGenero` SMALLINT NOT NULL,
  `Pelicula` VARCHAR(100) NOT NULL,
  `Sinopsis` TEXT NOT NULL,
  `Duracion` SMALLINT NOT NULL,
  `Actores` TEXT NOT NULL,
  `Estado` CHAR(1) NOT NULL,
  `Observaciones` VARCHAR(255) NULL,
  PRIMARY KEY (`IdPelicula`),
  CONSTRAINT `fk_Peliculas_Generos`
    FOREIGN KEY (`IdGenero`)
    REFERENCES `Generos` (`IdGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Peliculas_Generos_idx` ON `Peliculas` (`IdGenero` ASC) VISIBLE;

CREATE UNIQUE INDEX `ak_Pelicula` ON `Peliculas` (`Pelicula` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Butacas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Butacas` ;

CREATE TABLE IF NOT EXISTS `Butacas` (
  `IdButaca` INT NOT NULL,
  `IdSala` SMALLINT NOT NULL,
  `NroButaca` SMALLINT NOT NULL,
  `Fila` SMALLINT NOT NULL,
  `Columna` SMALLINT NOT NULL,
  `Estado` CHAR(1) NOT NULL,
  `Observaciones` VARCHAR(255) NULL,
  PRIMARY KEY (`IdButaca`, `IdSala`),
  CONSTRAINT `fk_Butacas_Salas1`
    FOREIGN KEY (`IdSala`)
    REFERENCES `Salas` (`IdSala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Butacas_Salas1_idx` ON `Butacas` (`IdSala` ASC) VISIBLE;

CREATE UNIQUE INDEX `ak_IdButaca` ON `Butacas` (`IdButaca` ASC) VISIBLE;

CREATE UNIQUE INDEX `ak_IdSala_NroButaca` ON `Butacas` (`NroButaca` ASC, `IdSala` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Funciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Funciones` ;

CREATE TABLE IF NOT EXISTS `Funciones` (
  `IdFuncion` INT NOT NULL AUTO_INCREMENT,
  `IdPelicula` INT NOT NULL,
  `IdSala` SMALLINT NOT NULL,
  `FechaProbableInicio` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaProbableFin` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaInicio` DATETIME NULL,
  `FechaFin` DATETIME NULL,
  `Precio` DECIMAL(12,2) NOT NULL DEFAULT 1000,
  `Estado` CHAR(1) NOT NULL,
  `Observaciones` VARCHAR(255) NULL,
  PRIMARY KEY (`IdFuncion`, `IdPelicula`, `IdSala`),
  CONSTRAINT `fk_Funciones_Peliculas1`
    FOREIGN KEY (`IdPelicula`)
    REFERENCES `Peliculas` (`IdPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funciones_Salas1`
    FOREIGN KEY (`IdSala`)
    REFERENCES `Salas` (`IdSala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Funciones_Peliculas1_idx` ON `Funciones` (`IdPelicula` ASC) VISIBLE;

CREATE INDEX `fk_Funciones_Salas1_idx` ON `Funciones` (`IdSala` ASC) VISIBLE;

CREATE UNIQUE INDEX `ak_IdFuncion` ON `Funciones` (`IdFuncion` ASC) INVISIBLE;


-- -----------------------------------------------------
-- Table `Reservas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Reservas` ;

CREATE TABLE IF NOT EXISTS `Reservas` (
  `idReserva` BIGINT NOT NULL AUTO_INCREMENT,
  `IdFuncion` INT NOT NULL,
  `IdPelicula` INT NOT NULL,
  `IdSala` SMALLINT NOT NULL,
  `IdButaca` INT NOT NULL,
  `DNI` VARCHAR(11) NOT NULL,
  `FechaAlta` DATETIME NOT NULL,
  `FechaBaja` DATETIME NULL,
  `EstaPagada` CHAR(1) NOT NULL,
  `Observaciones` VARCHAR(255) NULL,
  PRIMARY KEY (`idReserva`, `IdFuncion`, `IdPelicula`, `IdSala`, `IdButaca`),
  CONSTRAINT `fk_Reservas_Funciones1`
    FOREIGN KEY (`IdFuncion` , `IdPelicula` , `IdSala`)
    REFERENCES `Funciones` (`IdFuncion` , `IdPelicula` , `IdSala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservas_Butacas1`
    FOREIGN KEY (`IdButaca`)
    REFERENCES `Butacas` (`IdButaca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Reservas_Funciones1_idx` ON `Reservas` (`IdFuncion` ASC, `IdPelicula` ASC, `IdSala` ASC) VISIBLE;

CREATE INDEX `fk_Reservas_Butacas1_idx` ON `Reservas` (`IdButaca` ASC) VISIBLE;

CREATE UNIQUE INDEX `ak_IdReserva` ON `Reservas` (`idReserva` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
