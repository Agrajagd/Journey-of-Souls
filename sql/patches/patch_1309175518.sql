-- Patch 1
-- Author: Jeremy Privett
-- Date: 06/27/2011

CREATE TABLE `version` (
	`number` INT(10) NOT NULL AUTO_INCREMENT,
	`date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`comment` TEXT NOT NULL DEFAULT '',
	PRIMARY KEY (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO version (`comment`) VALUES ('Initial version of Database.');

