-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbminimarket
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbminimarket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbminimarket` DEFAULT CHARACTER SET utf8 ;
USE `dbminimarket` ;

-- -----------------------------------------------------
-- Table `dbminimarket`.`karyawan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbminimarket`.`karyawan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nip` VARCHAR(45) NOT NULL,
  `nama` VARCHAR(45) NOT NULL,
  `jk` VARCHAR(45) NOT NULL,
  `domisili` VARCHAR(45) NOT NULL,
  `kontak` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nip_UNIQUE` (`nip` ASC),
  UNIQUE INDEX `nama_UNIQUE` (`nama` ASC),
  UNIQUE INDEX `kontak_UNIQUE` (`kontak` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbminimarket`.`pelanggan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbminimarket`.`pelanggan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kode` VARCHAR(45) NOT NULL,
  `nama` VARCHAR(45) NOT NULL,
  `jk` VARCHAR(45) NOT NULL,
  `domisili` VARCHAR(45) NOT NULL,
  `kontak` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `kode_UNIQUE` (`kode` ASC),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nama_UNIQUE` (`nama` ASC),
  UNIQUE INDEX `kontak_UNIQUE` (`kontak` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbminimarket`.`jenis_produk`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbminimarket`.`jenis_produk` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbminimarket`.`produk`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbminimarket`.`produk` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kode` VARCHAR(45) NOT NULL,
  `nama` VARCHAR(45) NOT NULL,
  `harga` DOUBLE NOT NULL,
  `stok` INT NOT NULL,
  `min_stok` INT NOT NULL,
  `jenis_produk_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `kode_UNIQUE` (`kode` ASC),
  CONSTRAINT `jenis_produk_id`
    FOREIGN KEY (`id`)
    REFERENCES `dbminimarket`.`jenis_produk` (`id`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbminimarket`.`diskon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbminimarket`.`diskon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(45) NOT NULL,
  `besar_diskon` DOUBLE NOT NULL,
  `produk_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `produk_id`
    FOREIGN KEY (`id`)
    REFERENCES `dbminimarket`.`produk` (`id`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbminimarket`.`transaksi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbminimarket`.`transaksi` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kode` VARCHAR(45) NOT NULL,
  `tanggal` DATE NOT NULL,
  `total` DOUBLE NOT NULL,
  `pelanggan_id` INT NOT NULL,
  `karyawan_id` INT NOT NULL,
  `diskon_id` INT NOT NULL,
  INDEX `pelanggan_id_idx` (`id` ASC),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `kode_UNIQUE` (`kode` ASC),
  CONSTRAINT `pelanggan_id`
    FOREIGN KEY (`id`)
    REFERENCES `dbminimarket`.`pelanggan` (`id`),
  CONSTRAINT `karyawan_id`
    FOREIGN KEY (`id`)
    REFERENCES `dbminimarket`.`karyawan` (`id`),
  CONSTRAINT `diskon_id`
    FOREIGN KEY (`id`)
    REFERENCES `dbminimarket`.`diskon` (`id`)
    )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
