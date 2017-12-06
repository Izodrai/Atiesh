USE market;

/* ---- TABLES de run ---- */

CREATE TABLE `symbols` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text,
  `lot_max_size` decimal(6,3) unsigned DEFAULT NULL,
  `lot_min_size` decimal(6,3) unsigned DEFAULT NULL,
  `current_lot_size` decimal(6,3) unsigned DEFAULT NULL,
  `state` enum('inactive','standby','active') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`)
);

INSERT INTO `symbols` (`id`,`reference`, `description`,`lot_max_size`,`lot_min_size`, `current_lot_size`,`state`)
VALUES 
(1, "EURAUD", "Instrument, which price is based on quotations of Euro to Australian Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(2, "AUDNZD", "Instrument, which price is based on quotations of Australian Dollar to New Zealand Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(3, "GBPJPY", "Instrument, which price is based on quotations of British Pound to Japanese Yen on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(4, "USDSEK", "Instrument, which price is based on quotations of American Dollar to Swedish Krona on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(5, "EURJPY", "Instrument, which price is based on quotations of Euro to Japanese Yen on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(6, "CHFPLN", "Instrument, which price is based on quotations of Swiss Frank to Polish Zloty on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(7, "USDJPY", "Instrument, which price is based on quotations of American Dollar to Japanese Yen on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(8, "USDMXN", "Instrument, which price is based on quotations of American Dollar to Mexican Peso on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(9, "USDILS", "Instrument, which price is based on quotations of American Dollar to Israeli Shekel on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(10, "AUDJPY", "Instrument, which price is based on quotations of Australian Dollar to Japanese Yen on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(11, "GBPCAD", "Instrument, which price is based on quotations of British Pound to Canadian Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(12, "GBPNZD", "Instrument, which price is based on quotations of British Pound to New Zealand Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(13, "AUDCHF", "Instrument, which price is based on quotations of Australian Dollar to Swiss Frank on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(14, "NZDUSD", "Instrument, which price is based on quotations of New Zealand Dollar to American Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(15, "EURRON", "Instrument, which price is based on quotations of Euro to Romanian Leu on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(16, "USDZAR", "Instrument, which price is based on quotations of American Dollar to South African Rand on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(17, "EURSEK", "Instrument, which price is based on quotations of Euro to Swedish Krona on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(18, "USDCLP", "Instrument, which price is based on quotations of American Dollar to Chilean Peso on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(19, "CHFJPY", "Instrument, which price is based on quotations of Swiss Frank to Japanese Yen on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(20, "GBPAUD", "Instrument, which price is based on quotations of British Pound to Australian Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(21, "GBPCHF", "Instrument, which price is based on quotations of British Pound to Swiss Frank on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(22, "EURNOK", "Instrument, which price is based on quotations of Euro to Norwegian Krone on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(23, "GBPPLN", "Instrument, which price is based on quotations of British Pound to Polish Zloty on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(24, "USDCHF", "Instrument, which price is based on quotations of American Dollar to Swiss Frank on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(25, "CADJPY", "Instrument, which price is based on quotations of Canadian Dollar to Japanese Yen on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(26, "USDTRY", "Instrument, which price is based on quotations of American Dollar to Turkish Lira on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(27, "GBPUSD", "Instrument, which price is based on quotations of British Pound to American Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(28, "EURCZK", "Instrument, which price is based on quotations of Euro to Czech Koruna on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(29, "USDNOK", "Instrument, which price is based on quotations of American Dollar to Norwegian Krone on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(30, "EURCHF", "Instrument, which price is based on quotations of Euro to Swiss Frank on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(31, "USDHUF", "Instrument, which price is based on quotations of American Dollar to Hungarian Forint on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(32, "EURHUF", "Instrument, which price is based on quotations of Euro to Hungarian Forint on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(33, "AUDUSD", "Instrument, which price is based on quotations of Australian Dollar to American Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(34, "USDCZK", "Instrument, which price is based on quotations of American Dollar to Czech Koruna on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(35, "USDPLN", "Instrument, which price is based on quotations of American Dollar to Polish Zloty on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(36, "NZDJPY", "Instrument, which price is based on quotations of New Zealand Dollar to Japanese Yen on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(37, "EURNZD", "Instrument, which price is based on quotations of Euro to New Zealand Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(38, "EURCAD", "Instrument, which price is based on quotations of Euro to Canadian Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(39, "EURGBP", "Instrument, which price is based on quotations of Euro to British Pound on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(40, "USDRON", "Instrument, which price is based on quotations of American Dollar to Romanian Leu on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(41, "EURUSD", "Instrument, which price is based on quotations of Euro to American Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(42, "EURPLN", "Instrument, which price is based on quotations of Euro to Polish Zloty on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(43, "CHFHUF", "Instrument, which price is based on quotations of Swiss Frank to Hungarian Forint on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(44, "CADCHF", "Instrument, which price is based on quotations of Canadian Dollar to Swiss Frank on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(45, "EURTRY", "Instrument, which price is based on quotations of Euro to Turkish Lira on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(46, "AUDCAD", "Instrument, which price is based on quotations of Australian Dollar to Canadian Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(47, "USDBRL", "Instrument, which price is based on quotations of American Dollar to Brazilian Real on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(48, "USDCAD", "Instrument, which price is based on quotations of American Dollar to Canadian Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive"),
(49, "NZDCAD", "Instrument, which price is based on quotations of New Zealand Dollar to Canadian Dollar on the interbank market.", 50.000, 0.010, 0.010, "inactive");

CREATE TABLE `stock_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `symbol_id` tinyint(3) unsigned NOT NULL,
  `bid_at` datetime NOT NULL,
  `last_bid` mediumint(8) unsigned NOT NULL,
  `calculations` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `symbol` (`symbol_id`,`bid_at`),
  KEY `bid_at` (`bid_at`),
  CONSTRAINT `stock_values_symbol_types_reference` FOREIGN KEY (`symbol_id`) REFERENCES `symbols` (`id`)
);

CREATE TABLE `trades_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`)
);

CREATE TABLE `trades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `symbol_id` tinyint(3) unsigned NOT NULL,
  `trade_type_id` tinyint(3) unsigned NOT NULL,
  `xtb_order_id_1` int(10) unsigned NOT NULL,
  `xtb_order_id_2` int(10) unsigned NOT NULL,
  `opened_at` datetime NOT NULL,
  `closed_at` datetime DEFAULT NULL,
  `opened_value` mediumint(8) unsigned NOT NULL,
  `closed_value` mediumint(8) unsigned DEFAULT NULL,
  `digits` tinyint(3) unsigned NOT NULL,
  `opened_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `closed_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `stop_loss_value` mediumint(8) unsigned DEFAULT NULL,
  `volume` decimal(6,3) unsigned DEFAULT NULL,
  `profit` decimal(8,4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `xtb_order_id` (`xtb_order_id_2`),
  KEY `trades_symbol_types_reference` (`symbol_id`),
  KEY `trades_types_reference` (`trade_type_id`),
  KEY `opened_at` (`opened_at`),
  KEY `closed_at` (`closed_at`),
  KEY `profit` (`profit`),
  CONSTRAINT `trades_symbol_types_reference` FOREIGN KEY (`symbol_id`) REFERENCES `symbols` (`id`),
  CONSTRAINT `trades_types_reference` FOREIGN KEY (`trade_type_id`) REFERENCES `trades_type` (`id`)
);



/* ---- TABLES de configuration ---- */


CREATE TABLE `c_configuration` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `env` ENUM("dev","stage","run"),
  `sulfuras_log_file` varchar(50) NOT NULL,
  `valanyr_log_file` varchar(50) NOT NULL,
  `frostmourne_url` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `sulfuras_step_retrieve` varchar(10) NOT NULL,
  `valanyr_step_retrieve` varchar(10) NOT NULL,
  `from` varchar(10) NOT NULL,
  `to` varchar(10) NOT NULL,
  `sulfuras_tmpl` varchar(50) NOT NULL,
  `valanyr_tmpl` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sulfuras_file` (`sulfuras_log_file`),
  UNIQUE KEY `valanyr_log_file` (`valanyr_log_file`)
);

INSERT INTO `c_configuration` (`id`, `env`, `sulfuras_log_file`, `valanyr_log_file`, `frostmourne_url`, `token`, `sulfuras_step_retrieve`, `valanyr_step_retrieve`, `from`, `to`, `sulfuras_tmpl`, `valanyr_tmpl`)
VALUES 
(1, "dev", "/home/vp/develop/self/go/sulfuras/sulfuras.log", "/home/vp/develop/self/go/valanyr/valanyr.log", "http://dataapi20171019030453.azurewebsites.net/api/bids/", "test_token", "2m30s", "2m30s", "2017-07-01", "now", "/home/vp/market/lib/web/tmpl/", "");



CREATE TABLE `c_retrieve_periodes` (
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
(6,"Saturday",true,false,"","00:00:00"),
(7,"Sunday",false,true,"22:00:00","23:59:59");

CREATE TABLE `c_configuration_retrieve_periodes` (
  `configuration_id` tinyint(3) unsigned NOT NULL,
  `retrieve_periode_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`configuration_id`,`retrieve_periode_id`),
  CONSTRAINT `configuration_reference` FOREIGN KEY (`configuration_id`) REFERENCES `c_configuration` (`id`),
  CONSTRAINT `retrieve_periodes_reference` FOREIGN KEY (`retrieve_periode_id`) REFERENCES `c_retrieve_periodes` (`id`)
);

INSERT INTO `c_configuration_retrieve_periodes` (`configuration_id`, `retrieve_periode_id`)
VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7);

CREATE TABLE `c_calculations_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `active` boolean NOT NULL DEFAULT false,
  
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`)
);

INSERT INTO `c_calculations_type` (`id`, `reference`,`active`)
VALUES 
(1, "sma", true),
(2, "ema", false);

CREATE TABLE `c_calculations` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(3) unsigned NOT NULL,
  `reference` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  
  PRIMARY KEY (`id`),
  CONSTRAINT `calculation_type` FOREIGN KEY (`type_id`) REFERENCES `c_calculations_type` (`id`)
);

INSERT INTO `c_calculations` (`id`, `type_id`, `reference`)
VALUES 
(1, 1, "6"),
(2, 1, "12"),
(3, 1, "24"),
(4, 1, "48"),
(5, 2, "6"),
(6, 2, "12"),
(7, 2, "24"),
(8, 2, "48");

CREATE TABLE `c_configuration_calculations` (
  `configuration_id` tinyint(3) unsigned NOT NULL,
  `calculation_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`configuration_id`,`calculation_id`),
  CONSTRAINT `configuration_reference_cc` FOREIGN KEY (`configuration_id`) REFERENCES `c_configuration` (`id`),
  CONSTRAINT `configuration_calculations_reference` FOREIGN KEY (`calculation_id`) REFERENCES `c_calculations` (`id`)
);

INSERT INTO `c_configuration_calculations` (`configuration_id`, `calculation_id`)
VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8);
