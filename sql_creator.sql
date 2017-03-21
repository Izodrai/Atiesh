USE market;

CREATE TABLE symbols (
	`id` 			TINYINT 	UNSIGNED NOT NULL AUTO_INCREMENT,
	`reference` 	VARCHAR(10) COLLATE utf8_bin NOT NULL,
	`description`	TEXT,
	`state`		    enum('inactive','standby','simulation', 'active') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
	PRIMARY KEY (`id`),
	UNIQUE KEY `reference` (`reference`)
);

INSERT INTO `symbols` (`reference`, `description`)
VALUES 
("EURAUD", "Instrument, which price is based on quotations of Euro to Australian Dollar on the interbank market."),
("AUDNZD", "Instrument, which price is based on quotations of Australian Dollar to New Zealand Dollar on the interbank market."),
("GBPJPY", "Instrument, which price is based on quotations of British Pound to Japanese Yen on the interbank market."),
("USDSEK", "Instrument, which price is based on quotations of American Dollar to Swedish Krona on the interbank market."),
("EURJPY", "Instrument, which price is based on quotations of Euro to Japanese Yen on the interbank market."),
("CHFPLN", "Instrument, which price is based on quotations of Swiss Frank to Polish Zloty on the interbank market."),
("USDJPY", "Instrument, which price is based on quotations of American Dollar to Japanese Yen on the interbank market."),
("USDMXN", "Instrument, which price is based on quotations of American Dollar to Mexican Peso on the interbank market."),
("USDILS", "Instrument, which price is based on quotations of American Dollar to Israeli Shekel on the interbank market."),
("AUDJPY", "Instrument, which price is based on quotations of Australian Dollar to Japanese Yen on the interbank market."),
("GBPCAD", "Instrument, which price is based on quotations of British Pound to Canadian Dollar on the interbank market."),
("GBPNZD", "Instrument, which price is based on quotations of British Pound to New Zealand Dollar on the interbank market."),
("AUDCHF", "Instrument, which price is based on quotations of Australian Dollar to Swiss Frank on the interbank market."),
("NZDUSD", "Instrument, which price is based on quotations of New Zealand Dollar to American Dollar on the interbank market."),
("EURRON", "Instrument, which price is based on quotations of Euro to Romanian Leu on the interbank market."),
("USDZAR", "Instrument, which price is based on quotations of American Dollar to South African Rand on the interbank market."),
("EURSEK", "Instrument, which price is based on quotations of Euro to Swedish Krona on the interbank market."),
("USDCLP", "Instrument, which price is based on quotations of American Dollar to Chilean Peso on the interbank market."),
("CHFJPY", "Instrument, which price is based on quotations of Swiss Frank to Japanese Yen on the interbank market."),
("GBPAUD", "Instrument, which price is based on quotations of British Pound to Australian Dollar on the interbank market."),
("GBPCHF", "Instrument, which price is based on quotations of British Pound to Swiss Frank on the interbank market."),
("EURNOK", "Instrument, which price is based on quotations of Euro to Norwegian Krone on the interbank market."),
("GBPPLN", "Instrument, which price is based on quotations of British Pound to Polish Zloty on the interbank market."),
("USDCHF", "Instrument, which price is based on quotations of American Dollar to Swiss Frank on the interbank market."),
("CADJPY", "Instrument, which price is based on quotations of Canadian Dollar to Japanese Yen on the interbank market."),
("USDTRY", "Instrument, which price is based on quotations of American Dollar to Turkish Lira on the interbank market."),
("GBPUSD", "Instrument, which price is based on quotations of British Pound to American Dollar on the interbank market."),
("EURCZK", "Instrument, which price is based on quotations of Euro to Czech Koruna on the interbank market."),
("USDNOK", "Instrument, which price is based on quotations of American Dollar to Norwegian Krone on the interbank market."),
("EURCHF", "Instrument, which price is based on quotations of Euro to Swiss Frank on the interbank market."),
("USDHUF", "Instrument, which price is based on quotations of American Dollar to Hungarian Forint on the interbank market."),
("EURHUF", "Instrument, which price is based on quotations of Euro to Hungarian Forint on the interbank market."),
("AUDUSD", "Instrument, which price is based on quotations of Australian Dollar to American Dollar on the interbank market."),
("USDCZK", "Instrument, which price is based on quotations of American Dollar to Czech Koruna on the interbank market."),
("USDPLN", "Instrument, which price is based on quotations of American Dollar to Polish Zloty on the interbank market."),
("NZDJPY", "Instrument, which price is based on quotations of New Zealand Dollar to Japanese Yen on the interbank market."),
("EURNZD", "Instrument, which price is based on quotations of Euro to New Zealand Dollar on the interbank market."),
("EURCAD", "Instrument, which price is based on quotations of Euro to Canadian Dollar on the interbank market."),
("EURGBP", "Instrument, which price is based on quotations of Euro to British Pound on the interbank market."),
("USDRON", "Instrument, which price is based on quotations of American Dollar to Romanian Leu on the interbank market."),
("EURUSD", "Instrument, which price is based on quotations of Euro to American Dollar on the interbank market."),
("EURPLN", "Instrument, which price is based on quotations of Euro to Polish Zloty on the interbank market."),
("CHFHUF", "Instrument, which price is based on quotations of Swiss Frank to Hungarian Forint on the interbank market."),
("CADCHF", "Instrument, which price is based on quotations of Canadian Dollar to Swiss Frank on the interbank market."),
("EURTRY", "Instrument, which price is based on quotations of Euro to Turkish Lira on the interbank market."),
("AUDCAD", "Instrument, which price is based on quotations of Australian Dollar to Canadian Dollar on the interbank market."),
("USDBRL", "Instrument, which price is based on quotations of American Dollar to Brazilian Real on the interbank market."),
("USDCAD", "Instrument, which price is based on quotations of American Dollar to Canadian Dollar on the interbank market."),
("NZDCAD", "Instrument, which price is based on quotations of New Zealand Dollar to Canadian Dollar on the interbank market.");

CREATE OR REPLACE VIEW `v_symbols_active`
AS SELECT `s`.`id`, `s`.`reference`, `s`.`description`
FROM `symbols` AS s
WHERE `s`.`state` = "active"
ORDER BY `s`.`id` ASC;

CREATE OR REPLACE VIEW `v_symbols_inactive`
AS SELECT `s`.`id`, `s`.`reference`, `s`.`description`
FROM `symbols` AS s
WHERE `s`.`state` = "inactive"
ORDER BY `s`.`id` ASC;

CREATE OR REPLACE VIEW `v_symbols_standby`
AS SELECT `s`.`id`, `s`.`reference`, `s`.`description`
FROM `symbols` AS s
WHERE `s`.`state` = "standby"
ORDER BY `s`.`id` ASC;

CREATE OR REPLACE VIEW `v_symbols_simulation`
AS SELECT `s`.`id`, `s`.`reference`, `s`.`description`
FROM `symbols` AS s
WHERE `s`.`state` = "simulation"
ORDER BY `s`.`id` ASC;

CREATE OR REPLACE VIEW `v_symbols_not_inactive`
AS SELECT `s`.`id`, `s`.`reference`, `s`.`description`
FROM `symbols` AS s
WHERE `s`.`state` != "inactive"
ORDER BY `s`.`id` ASC;

CREATE TABLE `stock_values` (
 	`id`			INT 		UNSIGNED NOT NULL AUTO_INCREMENT,
 	`symbol_id`		TINYINT 	UNSIGNED  NOT NULL,
 	`bid_at`		DATETIME 	NOT NULL,
 	`last_bid`		MEDIUMINT 	UNSIGNED NOT NULL,
	`created_at`    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 	PRIMARY KEY (`id`),
	CONSTRAINT stock_values_symbol_types_reference FOREIGN KEY symbol_id(symbol_id) REFERENCES symbols (id),
 	UNIQUE KEY `symbol` (`symbol_id`,`bid_at`),
 	KEY `bid_at` (`bid_at`)
);

CREATE TABLE `stock_calculation` (
	`stock_value_id`	INT UNSIGNED NOT NULL,
	`calculations`		text        COLLATE utf8_unicode_ci,
	`created_at`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
