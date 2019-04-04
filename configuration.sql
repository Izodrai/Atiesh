USE market;

/* -------------------------------------------------*/
/* ---- TABLES de configuration users and base ---- */
/* -------------------------------------------------*/


CREATE OR REMPLACE TABLE `c_xtb_users` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `env` ENUM("real","stage"),
  `type` ENUM("data","bid"),
  `login` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
);

INSERT INTO `c_xtb_users` (`id`, `env`, `type`, `login`,`pwd`)
VALUES 
(1,"real","data","1077370","In_t@rt1flette_we_trust");

CREATE TABLE `c_sulfuras_configuration` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `data_retriever_id` tinyint(3) unsigned NOT NULL,
  `log_file` varchar(255) NOT NULL,
  `frostmourne_url` varchar(255) NOT NULL,
  `retrieve_step` varchar(10) NOT NULL,
  `from` varchar(10) NOT NULL,
  `to` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sulfuras_file` (`log_file`),
  CONSTRAINT `xtb_users_login` FOREIGN KEY (`data_retriever_id`) REFERENCES `c_xtb_users` (`id`)
);

INSERT INTO `c_sulfuras_configuration` (`id`, `data_retriever_id`, `log_file`, `frostmourne_url`, `retrieve_step`, `from`, `to`)
VALUES 
(1, 1, "/home/vp/develop/self/go/sulfuras/sulfuras.log", "http://dataapi20171019030453.azurewebsites.net/api/bids/", "2m30s", "2017-07-01", "now");

/* ----------------------------------------------------*/
/* ---- TABLES de configuration retrieve_periodes ---- */
/* ----------------------------------------------------*/

CREATE OR REMPLACE TABLE `c_retrieve_periodes` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `day` varchar(9) NOT NULL,
  `deactivated` boolean DEFAULT false NOT NULL,
  `limited` boolean DEFAULT false NOT NULL,
  `start` time DEFAULT "00:00:00" NOT NULL,
  `end` time DEFAULT "00:00:00" NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `day` (`day`)
);

INSERT INTO `c_retrieve_periodes` (`id`, `day`, `deactivated`,`limited`,`start`, `end`)
VALUES 
(1,"Monday",false,false,"00:00:00","00:00:00"),
(2,"Tuesday",false,false,"00:00:00","00:00:00"),
(3,"Wednesday",false,false,"00:00:00","00:00:00"),
(4,"Thursday",false,false,"00:00:00","00:00:00"),
(5,"Friday",false,true,"00:00:00","22:00:00"),
(6,"Saturday",true,false,"00:00:00","00:00:00"),
(7,"Sunday",false,true,"22:00:00","23:59:59");

CREATE OR REMPLACE TABLE `c_sulfuras_configuration_retrieve_periodes` (
  `sulfuras_configuration_id` tinyint(3) unsigned NOT NULL,
  `retrieve_periode_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`sulfuras_configuration_id`,`retrieve_periode_id`),
  CONSTRAINT `configuration_reference` FOREIGN KEY (`sulfuras_configuration_id`) REFERENCES `c_sulfuras_configuration` (`id`),
  CONSTRAINT `retrieve_periodes_reference` FOREIGN KEY (`retrieve_periode_id`) REFERENCES `c_retrieve_periodes` (`id`)
);

INSERT INTO `c_sulfuras_configuration_retrieve_periodes` (`sulfuras_configuration_id`, `retrieve_periode_id`)
VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7);

/* -----------------------------------------------*/
/* ---- TABLES de configuration calculations ---- */
/* -----------------------------------------------*/

CREATE OR REMPLACE TABLE `c_calculations_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `active` boolean NOT NULL DEFAULT false,
  
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`)
);

INSERT INTO `c_calculations_type` (`id`, `reference`,`active`)
VALUES 
(1, "ama", true),
(2, "ema", true),
(3, "pma", true),
(4, "macd", true),
(5, "epma", false);

CREATE OR REMPLACE TABLE `c_calculations` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(3) unsigned NOT NULL,
  `reference` text NOT NULL,
  `reference` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  PRIMARY KEY (`id`),
  CONSTRAINT `calculation_type` FOREIGN KEY (`type_id`) REFERENCES `c_calculations_type` (`id`)
);

INSERT INTO `c_calculations` (`id`, `type_id`, `reference`)
VALUES 
(1, 1, " "),
(2, 2, " "),
(3, 3, " "),
(4, 4, " ");

CREATE OR REMPLACE TABLE `c_sulfuras_configuration_calculations` (
  `sulfuras_configuration_id` tinyint(3) unsigned NOT NULL,
  `calculation_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`sulfuras_configuration_id`,`calculation_id`),
  CONSTRAINT `configuration_reference_cc` FOREIGN KEY (`sulfuras_configuration_id`) REFERENCES `c_sulfuras_configuration` (`id`),
  CONSTRAINT `configuration_calculations_reference` FOREIGN KEY (`calculation_id`) REFERENCES `c_calculations` (`id`)
);

INSERT INTO `c_sulfuras_configuration_calculations` (`sulfuras_configuration_id`, `calculation_id`)
VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4);

