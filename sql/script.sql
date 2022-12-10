-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema workshop_springboot
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `workshop_springboot`;
CREATE SCHEMA `workshop_springboot`;

-- -----------------------------------------------------
USE `workshop_springboot` ;

-- -----------------------------------------------------
-- Table `workshop_springboot`.`tb_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workshop_springboot`.`tb_category` ;

CREATE TABLE IF NOT EXISTS `workshop_springboot`.`tb_category` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `workshop_springboot`.`tb_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workshop_springboot`.`tb_user` ;

CREATE TABLE IF NOT EXISTS `workshop_springboot`.`tb_user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `workshop_springboot`.`tb_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workshop_springboot`.`tb_order` ;

CREATE TABLE IF NOT EXISTS `workshop_springboot`.`tb_order` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `client_id` BIGINT NOT NULL,
  `date` DATETIME(6) NOT NULL,
  `order_status` INT NULL DEFAULT NULL,  
  PRIMARY KEY (`id`),
  INDEX `FKi0x0rv7d65vsceuy33km9567n` (`client_id` ASC) VISIBLE,
  CONSTRAINT `FKi0x0rv7d65vsceuy33km9567n`
    FOREIGN KEY (`client_id`)
    REFERENCES `workshop_springboot`.`tb_user` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `workshop_springboot`.`tb_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workshop_springboot`.`tb_product` ;

CREATE TABLE IF NOT EXISTS `workshop_springboot`.`tb_product` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `price` DOUBLE NOT NULL,
  `img_url` VARCHAR(255) NULL DEFAULT NULL,  
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `workshop_springboot`.`tb_order_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workshop_springboot`.`tb_order_item` ;

CREATE TABLE IF NOT EXISTS `workshop_springboot`.`tb_order_item` (
  `product_id` BIGINT NOT NULL,
  `order_id` BIGINT NOT NULL,
  `quantity` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  INDEX `FK4h5xid5qehset7qwe5l9c997x` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FK4h5xid5qehset7qwe5l9c997x`
    FOREIGN KEY (`product_id`)
    REFERENCES `workshop_springboot`.`tb_product` (`id`),
  CONSTRAINT `FKgeobgl2xu916he8vhljktwxnx`
    FOREIGN KEY (`order_id`)
    REFERENCES `workshop_springboot`.`tb_order` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `workshop_springboot`.`tb_payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workshop_springboot`.`tb_payment` ;

CREATE TABLE IF NOT EXISTS `workshop_springboot`.`tb_payment` (
  `order_id` BIGINT NOT NULL,
  `moment` DATETIME(6) NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `FKokaf4il2cwit4h780c25dv04r`
    FOREIGN KEY (`order_id`)
    REFERENCES `workshop_springboot`.`tb_order` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `workshop_springboot`.`tb_product_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workshop_springboot`.`tb_product_category` ;

CREATE TABLE IF NOT EXISTS `workshop_springboot`.`tb_product_category` (
  `product_id` BIGINT NOT NULL,
  `category_id` BIGINT NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`),
  INDEX `FK5r4sbavb4nkd9xpl0f095qs2a` (`category_id` ASC) VISIBLE,
  CONSTRAINT `FK5r4sbavb4nkd9xpl0f095qs2a`
    FOREIGN KEY (`category_id`)
    REFERENCES `workshop_springboot`.`tb_category` (`id`),
  CONSTRAINT `FKgbof0jclmaf8wn2alsoexxq3u`
    FOREIGN KEY (`product_id`)
    REFERENCES `workshop_springboot`.`tb_product` (`id`))
ENGINE = InnoDB;

START TRANSACTION;
INSERT INTO `workshop_springboot`.`tb_category` (`name`)
	VALUES
    ("Eletronics"),
    ("Books"),
    ("Computers");
COMMIT;

START TRANSACTION;
INSERT INTO `workshop_springboot`.`tb_user` (`name`, `email`, `phone`, `password`)
	VALUES
    ("Maria Brown", "maria@gmail.com", "988888888", "123456"),
    ("Alex Green", "alex@gmail.com", "977777777", "123456");
COMMIT;

START TRANSACTION;
INSERT INTO `workshop_springboot`.`tb_product` (`name`, `description`, `price`, `img_url`)
	VALUES
    ("The Lord of the Rings", "Lorem ipsum dolor sit amet, consectetur.", 90.5, ""),
    ("Smart TV", "Nulla eu imperdiet purus. Maecenas ante.", 2190.0, ""),
    ("Macbook Pro", "Nam eleifend maximus tortor, at mollis.", 1250, ""),
    ("PC Gamer", "Donec aliquet odio ac rhoncus cursus.", 1200, ""),
    ("Rails for Dummies", "Cras fringilla convallis sem vel faucibus.", 100.99, "");
COMMIT;

START TRANSACTION;
INSERT INTO `workshop_springboot`.`tb_product_category` (`product_id`, `category_id`)
	VALUES
    (1, 2),
    (2, 1),
    (2, 3),
    (3, 3),
    (4, 3),
    (5, 2);
COMMIT;

START TRANSACTION;
INSERT INTO `workshop_springboot`.`tb_order` (`client_id`, `date`, `order_status`)
	VALUES
    (1, "2019-06-20", 2),
    (2, "2019-07-21", 1),
    (1, "2019-07-22", 1);
COMMIT;

START TRANSACTION;
INSERT INTO `workshop_springboot`.`tb_order_item` (`order_id`, `product_id`, `quantity`, `price`)
	VALUES
    (1, 1, 2, 90.5),
    (1, 3, 1, 1250.0),
    (2, 3, 2, 1250.0),
    (3, 5, 2, 100.99);
COMMIT;

START TRANSACTION;
INSERT INTO `workshop_springboot`.`tb_payment` (`order_id`, `moment`)
	VALUES
    (1, "2019-06-20");
COMMIT;
