-- Patch 2
-- Author: Jeremy Privett
-- Date: 06/27/2011

ALTER TABLE commands ADD `command_aliases` VARCHAR(256) NOT NULL DEFAULT '';

INSERT INTO version (`comment`) VALUES ('Adding an aliases column to the commands table.');

