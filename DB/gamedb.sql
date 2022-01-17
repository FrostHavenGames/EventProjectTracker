-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gamedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `gamedb` ;

-- -----------------------------------------------------
-- Schema gamedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gamedb` DEFAULT CHARACTER SET utf8 ;
USE `gamedb` ;

-- -----------------------------------------------------
-- Table `game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game` ;

CREATE TABLE IF NOT EXISTS `game` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `release_date` DATETIME NULL,
  `box_art_url` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform` ;

CREATE TABLE IF NOT EXISTS `platform` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `release_date` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publisher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `publisher` ;

CREATE TABLE IF NOT EXISTS `publisher` (
  `id` INT NOT NULL,
  `title` VARCHAR(255) NULL,
  `description` TEXT NULL,
  `established` DATETIME NULL,
  `country` VARCHAR(45) NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `platform_has_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform_has_game` ;

CREATE TABLE IF NOT EXISTS `platform_has_game` (
  `platform_id` INT NOT NULL,
  `game_id` INT NOT NULL,
  PRIMARY KEY (`platform_id`, `game_id`),
  INDEX `fk_platform_has_game_game1_idx` (`game_id` ASC),
  INDEX `fk_platform_has_game_platform_idx` (`platform_id` ASC),
  CONSTRAINT `fk_platform_has_game_platform`
    FOREIGN KEY (`platform_id`)
    REFERENCES `platform` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_platform_has_game_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_has_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_has_genre` ;

CREATE TABLE IF NOT EXISTS `game_has_genre` (
  `game_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`game_id`, `genre_id`),
  INDEX `fk_game_has_genre_genre1_idx` (`genre_id` ASC),
  INDEX `fk_game_has_genre_game1_idx` (`game_id` ASC),
  CONSTRAINT `fk_game_has_genre_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_genre_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS gameuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'gameuser'@'localhost' IDENTIFIED BY 'gameuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'gameuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `game`
-- -----------------------------------------------------
START TRANSACTION;
USE `gamedb`;
INSERT INTO `game` (`id`, `title`, `description`, `release_date`, `box_art_url`) VALUES (1, 'Chrono Trigger', 'In this turn-based Japanese RPG, young Crono must travel through time through a misfunctioning teleporter to rescue his misfortunate companion and take part in an intricate web of past and present perils. The adventure that ensues soon unveils an evil force set to destroy the world, triggering Crono\'s race against time to change the course of history and bring about a brighter future.', '1995-09-11', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co3plw.png');
INSERT INTO `game` (`id`, `title`, `description`, `release_date`, `box_art_url`) VALUES (2, 'Super Mario RPG: Legend of the Seven Stars', 'A JRPG entry in the Super Mario franchise in which Mario meets many unlikely allies in order to jump and fight his way through the Mushroom Kingdom and collect stars to repair the Star Road, the pathway that grants people\'s wishes, which was destroyed by Smithy, the otherworldly entity that hijacked Bowser\'s castle and threw the Kingdom into disarray.', '1996-03-09', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co3egs.png');
INSERT INTO `game` (`id`, `title`, `description`, `release_date`, `box_art_url`) VALUES (3, 'Paper Mario', 'Paper Mario, a turn-based JRPG entry in the Mario franchise with a paper-based aesthetic and platforming elements, sees the titular character working his way through the Mushroom Kingdom\'s diverse locales and biomes, meeting its inhabitants, fighthing unruly enemies and recruiting an array of companions in order to once again save Princess Peach from the clutches of the evil Koopa King Bowser.', '2000-09-11', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co1qda.png');
INSERT INTO `game` (`id`, `title`, `description`, `release_date`, `box_art_url`) VALUES (4, 'Final Fantasy VII', 'Final Fantasy VII is the seventh main installment in the Final Fantasy series, developed and published by Squaresoft. It was the first title in the series to feature three-dimensional graphics, pre-rendered backgrounds and numerous full motion videos.\n\nThe gameplay is a departure from previous entries in the series in many ways. Though it retains the Active Time Battle pseudo-turn based menu command system, FFVII features three party members rather than four. The Materia system allows the player to customize each party member\'s abilities to their liking, and the Limit system grants them unique combat skills.\n\nThough minigames had been a recurring feature, FFVII introduces numerous new ones, many of them playable in the theme park Gold Saucer varying from racing with Chocobos to snowboarding.', '1997-01-31', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co2kx2.png');
INSERT INTO `game` (`id`, `title`, `description`, `release_date`, `box_art_url`) VALUES (5, 'Final Fantasy IX', 'FINAL FANTASY IX is the ninth main installment in the FINAL FANTASY series, developed and published by Squaresoft. The title is a return to the series\'s roots, with gameplay features and references to the past games featuring throughout, as well as a medieval fantasy setting and cartoonish art style as a break from the sci-fi slant style of FINAL FANTASY VII and FINAL FANTASY VIII.', '2000-07-07', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co2unc.png');

COMMIT;


-- -----------------------------------------------------
-- Data for table `platform`
-- -----------------------------------------------------
START TRANSACTION;
USE `gamedb`;
INSERT INTO `platform` (`id`, `title`, `description`, `release_date`) VALUES (1, 'PlayStation', 'The PlayStation (officially abbreviated as PS and commonly known as the PS1 or its codename PSX) is a home video game console developed and marketed by Sony Computer Entertainment. It was the first of the PlayStation lineup of video game consoles. As a fifth generation console, the PlayStation primarily competed with the Nintendo 64 and the Sega Saturn. The PlayStation was the first \"computer entertainment platform\" to ship over 100 million units, which it had reached nine years after its initial launch.', '1995-09-09');
INSERT INTO `platform` (`id`, `title`, `description`, `release_date`) VALUES (2, 'Super Nintendo Entertainment System (SNES) ', 'The Super Nintendo Entertainment System (officially abbreviated as Super NES and SNES), commonly known as Super Nintendo, is a 16-bit home video game console developed by Nintendo. It is the second video game home console released by Nintendo internationally. The successor to the Nintendo Entertainment System, the Super Nintendo Entertainment System featured enhanced graphics, a brand new controller with additional buttons, superior sound and more features.', '1990-11-21');

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `gamedb`;
INSERT INTO `genre` (`id`, `title`) VALUES (1, 'Adventure');
INSERT INTO `genre` (`id`, `title`) VALUES (2, 'Role-playing');
INSERT INTO `genre` (`id`, `title`) VALUES (3, 'Strategy');
INSERT INTO `genre` (`id`, `title`) VALUES (4, 'First Person Shooter');
INSERT INTO `genre` (`id`, `title`) VALUES (5, 'Multi-Massively Online');

COMMIT;


-- -----------------------------------------------------
-- Data for table `platform_has_game`
-- -----------------------------------------------------
START TRANSACTION;
USE `gamedb`;
INSERT INTO `platform_has_game` (`platform_id`, `game_id`) VALUES (1, 4);
INSERT INTO `platform_has_game` (`platform_id`, `game_id`) VALUES (1, 5);
INSERT INTO `platform_has_game` (`platform_id`, `game_id`) VALUES (2, 1);
INSERT INTO `platform_has_game` (`platform_id`, `game_id`) VALUES (2, 2);

COMMIT;

