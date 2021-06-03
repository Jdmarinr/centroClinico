-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema clinica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clinica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clinica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `clinica` ;

-- -----------------------------------------------------
-- Table `clinica`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`usuario` (
  `idUsuario` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `registro` DATE NULL DEFAULT NULL,
  `id_usuario` BIGINT NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`administrador` (
  `idAdministrador` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido1` VARCHAR(45) NOT NULL,
  `apellido2` VARCHAR(45) NULL DEFAULT NULL,
  `idUsuario` INT NULL DEFAULT NULL,
  `edad` DATE NULL DEFAULT NULL,
  `id_administrador` BIGINT NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  INDEX `idUsuarioFk_idx` (`idUsuario` ASC) INVISIBLE,
  CONSTRAINT `idUsuarioFk`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `clinica`.`usuario` (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica`.`enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`enfermero` (
  `idEnfermero` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido1` VARCHAR(45) NULL DEFAULT NULL,
  `apellido2` VARCHAR(45) NULL DEFAULT NULL,
  `numPruebas` INT NULL DEFAULT NULL,
  `idAdministrador` INT NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `edad` DATE NULL DEFAULT NULL,
  `codPostal` VARCHAR(45) NULL DEFAULT NULL,
  `id_paciente` BIGINT NOT NULL,
  `cod_postal` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `num_pruebas` INT NOT NULL,
  PRIMARY KEY (`idEnfermero`),
  INDEX `idAdministradorFk_idx` (`idAdministrador` ASC) INVISIBLE,
  CONSTRAINT `idAdministradorFk`
    FOREIGN KEY (`idAdministrador`)
    REFERENCES `clinica`.`administrador` (`idAdministrador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`paciente` (
  `idPaciente` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido1` VARCHAR(45) NOT NULL,
  `apellido2` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `numSegSocial` VARCHAR(45) NULL DEFAULT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `idEnfermero` INT NOT NULL,
  `edad` DATE NULL DEFAULT NULL,
  `estaVacunado` TINYINT NULL DEFAULT NULL,
  `estaConfinado` TINYINT NULL DEFAULT NULL,
  `idAdministradorFk` INT NULL DEFAULT NULL,
  `codPostal` VARCHAR(45) NULL DEFAULT NULL,
  `generoPaciente` VARCHAR(45) NULL DEFAULT NULL,
  `id_paciente` BIGINT NOT NULL,
  `cod_postal` VARCHAR(255) NULL DEFAULT NULL,
  `esta_confinado` BIT(1) NOT NULL,
  `esta_vacunado` BIT(1) NOT NULL,
  `genero_paciente` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `num_seg_social` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`dni`),
  INDEX `idEnfermeroFk_idx` (`idEnfermero` ASC) INVISIBLE,
  INDEX `idAdministradorFk_idx` (`idAdministradorFk` ASC) INVISIBLE,
  INDEX `dni_idx` (`dni` ASC) INVISIBLE,
  CONSTRAINT `idAdministrador`
    FOREIGN KEY (`idAdministradorFk`)
    REFERENCES `clinica`.`administrador` (`idAdministrador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idEnfermeroFk`
    FOREIGN KEY (`idEnfermero`)
    REFERENCES `clinica`.`enfermero` (`idEnfermero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica`.`tecnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`tecnico` (
  `idTecnico` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido1` VARCHAR(45) NULL DEFAULT NULL,
  `apellido2` VARCHAR(45) NULL DEFAULT NULL,
  `numPruebas` INT NULL DEFAULT NULL,
  `idAdministrador` INT NULL DEFAULT NULL,
  `id_tecnico` BIGINT NOT NULL,
  `num_pruebas` INT NOT NULL,
  PRIMARY KEY (`idTecnico`),
  INDEX `idAdministradorFk_idx` (`idAdministrador` ASC) INVISIBLE,
  CONSTRAINT `idAdministrador_fk`
    FOREIGN KEY (`idAdministrador`)
    REFERENCES `clinica`.`administrador` (`idAdministrador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica`.`historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`historial` (
  `idHistorial` INT NOT NULL,
  `dniPaciente` VARCHAR(45) NULL DEFAULT NULL,
  `idEnfermero` INT NULL DEFAULT NULL,
  `idTecnico` INT NULL DEFAULT NULL,
  `id_historial` BIGINT NOT NULL,
  PRIMARY KEY (`idHistorial`),
  INDEX `dniPacienteFk_idx` (`dniPaciente` ASC) INVISIBLE,
  INDEX `idEnfermeroFk_idx` (`idEnfermero` ASC) INVISIBLE,
  INDEX `idTecnicoFk_idx` (`idTecnico` ASC) INVISIBLE,
  CONSTRAINT `dniPacientefgk`
    FOREIGN KEY (`dniPaciente`)
    REFERENCES `clinica`.`paciente` (`dni`),
  CONSTRAINT `idEnfermero_fgk`
    FOREIGN KEY (`idEnfermero`)
    REFERENCES `clinica`.`enfermero` (`idEnfermero`),
  CONSTRAINT `idTecnico_fgk`
    FOREIGN KEY (`idTecnico`)
    REFERENCES `clinica`.`tecnico` (`idTecnico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica`.`prueba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`prueba` (
  `idPrueba` INT NOT NULL,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` VARCHAR(45) NULL DEFAULT NULL,
  `resultado` INT NULL DEFAULT NULL,
  `dniPaciente` VARCHAR(45) NULL DEFAULT NULL,
  `idEnfermero` INT NULL DEFAULT NULL,
  `idTecnico` INT NULL DEFAULT NULL,
  `id_prueba` BIGINT NOT NULL,
  PRIMARY KEY (`idPrueba`),
  INDEX `idEnfermero_fgk` (`idEnfermero` ASC) INVISIBLE,
  INDEX `idTecnicoFk_idx` (`idTecnico` ASC) INVISIBLE,
  INDEX `dniPacienteFk_idx` (`dniPaciente` ASC) INVISIBLE,
  CONSTRAINT `dni`
    FOREIGN KEY (`dniPaciente`)
    REFERENCES `clinica`.`paciente` (`dni`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idEnfermerofgk`
    FOREIGN KEY (`idEnfermero`)
    REFERENCES `clinica`.`enfermero` (`idEnfermero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idTecnicoFk`
    FOREIGN KEY (`idTecnico`)
    REFERENCES `clinica`.`tecnico` (`idTecnico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica`.`vacuna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`vacuna` (
  `idVacuna` INT NOT NULL,
  `nombreVacuna` VARCHAR(45) NULL DEFAULT NULL,
  `fechaVacuna` DATE NULL DEFAULT NULL,
  `dniPaciente` VARCHAR(45) NULL DEFAULT NULL,
  `stock` INT NULL DEFAULT NULL,
  `id_vacuna` BIGINT NOT NULL,
  `fecha_vacuna` DATETIME(6) NULL DEFAULT NULL,
  `nombre_vacuna` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idVacuna`),
  INDEX `dniPacienteFk_idx` (`dniPaciente` ASC) INVISIBLE,
  CONSTRAINT `dniPacienteFk`
    FOREIGN KEY (`dniPaciente`)
    REFERENCES `clinica`.`paciente` (`dni`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
