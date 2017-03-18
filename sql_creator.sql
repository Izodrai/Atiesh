USE market;

CREATE TABLE symbols (
	`id` 			TINYINT 	UNSIGNED NOT NULL AUTO_INCREMENT,
	`reference` 	VARCHAR(10) COLLATE utf8_bin NOT NULL,
	`description`	TEXT,
	`active`		BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (`id`),
	UNIQUE KEY `reference` (`reference`)
);

INSERT INTO `symbols` (`reference`, `description`, `active`)
VALUES 
("EURAUD", "Instrument, which price is based on quotations of Euro to Australian Dollar on the interbank market.", false),
("AUDNZD", "Instrument, which price is based on quotations of Australian Dollar to New Zealand Dollar on the interbank market.", false),
("GBPJPY", "Instrument, which price is based on quotations of British Pound to Japanese Yen on the interbank market.", false),
("USDSEK", "Instrument, which price is based on quotations of American Dollar to Swedish Krona on the interbank market.", false),
("EURJPY", "Instrument, which price is based on quotations of Euro to Japanese Yen on the interbank market.", false),
("CHFPLN", "Instrument, which price is based on quotations of Swiss Frank to Polish Zloty on the interbank market.", false),
("USDJPY", "Instrument, which price is based on quotations of American Dollar to Japanese Yen on the interbank market.", false),
("USDMXN", "Instrument, which price is based on quotations of American Dollar to Mexican Peso on the interbank market.", false),
("USDILS", "Instrument, which price is based on quotations of American Dollar to Israeli Shekel on the interbank market.", false),
("AUDJPY", "Instrument, which price is based on quotations of Australian Dollar to Japanese Yen on the interbank market.", false),
("GBPCAD", "Instrument, which price is based on quotations of British Pound to Canadian Dollar on the interbank market.", false),
("GBPNZD", "Instrument, which price is based on quotations of British Pound to New Zealand Dollar on the interbank market.", false),
("AUDCHF", "Instrument, which price is based on quotations of Australian Dollar to Swiss Frank on the interbank market.", false),
("NZDUSD", "Instrument, which price is based on quotations of New Zealand Dollar to American Dollar on the interbank market.", false),
("EURRON", "Instrument, which price is based on quotations of Euro to Romanian Leu on the interbank market.", false),
("USDZAR", "Instrument, which price is based on quotations of American Dollar to South African Rand on the interbank market.", false),
("EURSEK", "Instrument, which price is based on quotations of Euro to Swedish Krona on the interbank market.", false),
("USDCLP", "Instrument, which price is based on quotations of American Dollar to Chilean Peso on the interbank market.", false),
("CHFJPY", "Instrument, which price is based on quotations of Swiss Frank to Japanese Yen on the interbank market.", false),
("GBPAUD", "Instrument, which price is based on quotations of British Pound to Australian Dollar on the interbank market.", false),
("GBPCHF", "Instrument, which price is based on quotations of British Pound to Swiss Frank on the interbank market.", false),
("EURNOK", "Instrument, which price is based on quotations of Euro to Norwegian Krone on the interbank market.", false),
("GBPPLN", "Instrument, which price is based on quotations of British Pound to Polish Zloty on the interbank market.", false),
("USDCHF", "Instrument, which price is based on quotations of American Dollar to Swiss Frank on the interbank market.", false),
("CADJPY", "Instrument, which price is based on quotations of Canadian Dollar to Japanese Yen on the interbank market.", false),
("USDTRY", "Instrument, which price is based on quotations of American Dollar to Turkish Lira on the interbank market.", false),
("GBPUSD", "Instrument, which price is based on quotations of British Pound to American Dollar on the interbank market.", false),
("EURCZK", "Instrument, which price is based on quotations of Euro to Czech Koruna on the interbank market.", false),
("USDNOK", "Instrument, which price is based on quotations of American Dollar to Norwegian Krone on the interbank market.", false),
("EURCHF", "Instrument, which price is based on quotations of Euro to Swiss Frank on the interbank market.", false),
("USDHUF", "Instrument, which price is based on quotations of American Dollar to Hungarian Forint on the interbank market.", false),
("EURHUF", "Instrument, which price is based on quotations of Euro to Hungarian Forint on the interbank market.", false),
("AUDUSD", "Instrument, which price is based on quotations of Australian Dollar to American Dollar on the interbank market.", false),
("USDCZK", "Instrument, which price is based on quotations of American Dollar to Czech Koruna on the interbank market.", false),
("USDPLN", "Instrument, which price is based on quotations of American Dollar to Polish Zloty on the interbank market.", false),
("NZDJPY", "Instrument, which price is based on quotations of New Zealand Dollar to Japanese Yen on the interbank market.", false),
("EURNZD", "Instrument, which price is based on quotations of Euro to New Zealand Dollar on the interbank market.", false),
("EURCAD", "Instrument, which price is based on quotations of Euro to Canadian Dollar on the interbank market.", false),
("EURGBP", "Instrument, which price is based on quotations of Euro to British Pound on the interbank market.", false),
("USDRON", "Instrument, which price is based on quotations of American Dollar to Romanian Leu on the interbank market.", false),
("EURUSD", "Instrument, which price is based on quotations of Euro to American Dollar on the interbank market.", true),
("EURPLN", "Instrument, which price is based on quotations of Euro to Polish Zloty on the interbank market.", false),
("CHFHUF", "Instrument, which price is based on quotations of Swiss Frank to Hungarian Forint on the interbank market.", false),
("CADCHF", "Instrument, which price is based on quotations of Canadian Dollar to Swiss Frank on the interbank market.", false),
("EURTRY", "Instrument, which price is based on quotations of Euro to Turkish Lira on the interbank market.", false),
("AUDCAD", "Instrument, which price is based on quotations of Australian Dollar to Canadian Dollar on the interbank market.", false),
("USDBRL", "Instrument, which price is based on quotations of American Dollar to Brazilian Real on the interbank market.", false),
("USDCAD", "Instrument, which price is based on quotations of American Dollar to Canadian Dollar on the interbank market.", false),
("NZDCAD", "Instrument, which price is based on quotations of New Zealand Dollar to Canadian Dollar on the interbank market.", false);

CREATE OR REPLACE VIEW `v_activ_symbols`
AS SELECT `s`.`id`, `s`.`reference`, `s`.`description`
FROM `symbols` AS s
WHERE `s`.`active` 
ORDER BY `s`.`id` ASC;

CREATE TABLE `stock_values` (
 	`id`			INT 		UNSIGNED NOT NULL AUTO_INCREMENT,
 	`symbol_id`		TINYINT 	UNSIGNED  NOT NULL,
 	`bid_at`		DATETIME 	NOT NULL,
 	`last_bid`		MEDIUMINT 	UNSIGNED NOT NULL,
 	`created_at`	DATETIME 	NOT NULL,
 	`updated_at`	DATETIME 	NOT NULL,
 	PRIMARY KEY (`id`),
	CONSTRAINT stock_values_symbol_types_reference FOREIGN KEY symbol_id(symbol_id) REFERENCES symbols (id),
 	UNIQUE KEY `symbol` (`symbol_id`,`bid_at`),
 	KEY `bid_at` (`bid_at`)
);

CREATE TABLE `stock_calculation` (
	`stock_value_id`	INT UNSIGNED NOT NULL,
	`calculations`		text        COLLATE utf8_unicode_ci,
 	PRIMARY KEY (`stock_value_id`),
	CONSTRAINT stock_id_reference FOREIGN KEY stock_value_id(stock_value_id) REFERENCES stock_values (id)
);

/*
CREATE TABLE `stock_analyse` (
	`id`						INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`stock_value_id`			INT UNSIGNED NOT NULL,
	`sma_c`						DECIMAL(14,4) NOT NULL,
	`sma_l`						DECIMAL(14,4) NOT NULL,
	`ema_c`						DECIMAL(14,4) NOT NULL,
	`ema_l`						DECIMAL(14,4) NOT NULL,
	`macd_value`				DECIMAL(14,4) NOT NULL,
	`macd_trigger`				DECIMAL(14,4) NOT NULL,
	`macd_signal`				DECIMAL(14,4) NOT NULL,
	`macd_absol_max_signal` 	DECIMAL(14,4) NOT NULL,
	`macd_trigger_percent`		TINYINT UNSIGNED NOT NULL,
	`macd_absol_trigger_signal`	DECIMAL(14,4) NOT NULL,
 	PRIMARY KEY (`id`),
	CONSTRAINT stock_values_id_reference FOREIGN KEY stock_value_id(stock_value_id) REFERENCES stock_values (id)
);

CREATE OR REPLACE VIEW `v_last_5_days_stock_values`
AS SELECT 
`sv`.`id` AS `sv_id`, `sv`.`bid_at`, `sv`.`last_bid`, 
`s`.`id` AS `s_id`, `s`.`reference`, 
`sa`.`id` AS `sa_id`, `sa`.`sma_c`, `sa`.`sma_l`, `sa`.`ema_c`, `sa`.`ema_l`, `sa`.`macd_value`, `sa`.`macd_trigger`, `sa`.`macd_signal`, `sa`.`macd_absol_max_signal`, `sa`.`macd_trigger_percent`, `sa`.`macd_absol_trigger_signal`
FROM `stock_values` AS `sv`
JOIN `symbols` AS `s` ON `s`.`id` = `sv`.`symbol_id`
LEFT  JOIN `stock_analyse` AS `sa` ON `sv`.`id` = `sa`.`stock_value_id`
WHERE `sv`.`bid_at` >= DATE_ADD((SELECT MAX(bid_at) FROM stock_values), INTERVAL -5 DAY);


CREATE OR REPLACE VIEW `v_last_day_stock_values`
AS SELECT 
`sv`.`id` AS `sv_id`, `sv`.`bid_at`, `sv`.`last_bid`, 
`s`.`id` AS `s_id`, `s`.`reference`, 
`sa`.`id` AS `sa_id`, `sa`.`sma_c`, `sa`.`sma_l`, `sa`.`ema_c`, `sa`.`ema_l`, `sa`.`macd_value`, `sa`.`macd_trigger`, `sa`.`macd_signal`, `sa`.`macd_absol_max_signal`, `sa`.`macd_trigger_percent`, `sa`.`macd_absol_trigger_signal`
FROM `stock_values` AS `sv`
JOIN `symbols` AS `s` ON `s`.`id` = `sv`.`symbol_id`
LEFT  JOIN `stock_analyse` AS `sa` ON `sv`.`id` = `sa`.`stock_value_id`
WHERE `sv`.`bid_at` >= DATE_ADD((SELECT MAX(bid_at) FROM stock_values), INTERVAL -1 DAY);



CREATE OR REPLACE VIEW `v_last_10_days_stock_values`
AS SELECT 
`sv`.`id` AS `sv_id`, `sv`.`bid_at`, `sv`.`last_bid`, 
`s`.`id` AS `s_id`, `s`.`reference`, 
`sa`.`id` AS `sa_id`, `sa`.`sma_c`, `sa`.`sma_l`, `sa`.`ema_c`, `sa`.`ema_l`, `sa`.`macd_value`, `sa`.`macd_trigger`, `sa`.`macd_signal`, `sa`.`macd_absol_max_signal`, `sa`.`macd_trigger_percent`, `sa`.`macd_absol_trigger_signal`
FROM `stock_values` AS `sv`
JOIN `symbols` AS `s` ON `s`.`id` = `sv`.`symbol_id`
LEFT  JOIN `stock_analyse` AS `sa` ON `sv`.`id` = `sa`.`stock_value_id`
WHERE `sv`.`bid_at` >= DATE_ADD(NOW(), INTERVAL -10 DAY);

*/

CREATE TABLE `days` (
	`id`	TINYINT UNSIGNED NOT NULL,
	`name`	VARCHAR(10) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `name`(`name`)
);

INSERT INTO `days` (`id`,`name`)
VALUES
(1, "Lundi"),
(2, "Mardi"),
(3, "Mercredi"),
(4, "Jeudi"),
(5, "Vendredi"),
(6, "Samedi"),
(7, "Dimanche");

CREATE TABLE `trading_hours` (
	`id`			SMALLINT	UNSIGNED NOT NULL AUTO_INCREMENT,
	`symbol_id`		TINYINT 	UNSIGNED NOT NULL,
	`day_of_week` 	TINYINT		UNSIGNED NOT NULL,
	`all_day`		BOOLEAN		DEFAULT FALSE,
	`t_start`		TIME		DEFAULT "00:00:00",
	`t_end`			TIME		DEFAULT "23:59:59",
	PRIMARY KEY (`id`),
	CONSTRAINT trading_hours_symbol_types_reference FOREIGN KEY symbol_id(symbol_id) REFERENCES symbols (id),
	CONSTRAINT trading_hours_days_reference FOREIGN KEY day_of_week(day_of_week) REFERENCES days (id),
	UNIQUE KEY `day_symbol` (`symbol_id`,`day_of_week`)
);

CREATE OR REPLACE VIEW `v_trading_hours`
AS SELECT `s`.`reference`, `d`.`name`, `th`.`all_day`, `th`.`t_start`, `th`.`t_end`
FROM `trading_hours` AS th
JOIN days AS d ON `d`.`id` = `th`.`day_of_week`
JOIN symbols AS s ON `s`.`id` = `th`.`symbol_id`;

/*
CREATE TABLE type_users (
	`id`	SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`name`	VARCHAR(15),
	PRIMARY KEY (`id`),
	UNIQUE KEY `type_user_name` (`name`)
);

INSERT INTO type_users (`id`,`name`)
VALUES 
(1, "data retriever");

CREATE TABLE users (
	`id`		SMALLINT		UNSIGNED NOT NULL AUTO_INCREMENT,
	`type_id`	SMALLINT		UNSIGNED NOT NULL,
	`login`		VARCHAR(15)		NOT NULL,
	`local_pwd`	VARCHAR(255) 	NOT NULL,
	`xtb_login`	SMALLINT		NOT NULL,
	`xtb_pwd`	SMALLINT		NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `users_type_name` FOREIGN KEY `type_id`(`type_id`) REFERENCES `type_users` (`id`),
	UNIQUE KEY `user_login` (`login`)
);
*/
