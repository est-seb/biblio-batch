-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''TRADITIONAL, ALLOW_INVALID_DATES'';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema books
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `books`;

-- -----------------------------------------------------
-- Schema books
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `books` DEFAULT CHARACTER SET utf8;
USE `books`;

-- -----------------------------------------------------
-- Table `books`.`book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`book`;

CREATE TABLE IF NOT EXISTS `books`.`book` (
  `idbook` INT (11
) NOT NULL,
  `title` VARCHAR (200
) NOT NULL,
  ` CONTENT ` BLOB NULL DEFAULT NULL,
PRIMARY KEY (`idbook`
)
)
  ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = ''contient L\''ensemble des livres'';




-- -----------------------------------------------------
-- Table `books`.`index`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`index` ;

CREATE TABLE IF NOT EXISTS `books`.`index` (
  `idindex`
INT(11) NOT NULL,
  `word` VARCHAR(
100) NULL DEFAULT NULL,
  `occurence` INT NULL,
PRIMARY KEY (`
idindex
`))
  ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = ''contient L\''ensemble des mots avec LE nombre d\''occurence par mot'';

-- -----------------------------------------------------
-- Table `books`.`sentence`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`sentence` ;

CREATE TABLE IF NOT EXISTS `books`.`sentence` (
  `idsentence` INT NOT NULL AUTO_INCREMENT,
  `sentence` VARCHAR(
500) NULL,
  `book_idbook` INT(
11) NOT NULL,
PRIMARY KEY (`idsentence
`),
INDEX `fk_sentence_book_idx` (`book_idbook`
ASC),
CONSTRAINT `fk_sentence_book`
FOREIGN KEY (`book_idbook`
)
REFERENCES `books`.`book` (`idbook`
)
ON DELETE NO ACTION
ON UPDATE NO ACTION
)
  ENGINE = InnoDB
COMMENT = ''Contient L\''ensemble des phrases des livres'';


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
