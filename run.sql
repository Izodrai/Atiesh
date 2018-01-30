USE market;

/* --------------------------------*/
/* ---- TABLES de run symbols ---- */
/* --------------------------------*/

CREATE TABLE `r_symbols` (
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

INSERT INTO r_symbols (id,reference,description,lot_max_size,lot_min_size,current_lot_size,state) VALUES 
(1,'EURAUD','Instrument, which price is based on quotations of Euro to Australian Dollar on the interbank market.',50.000,0.010,0.010,'active')
,(2,'AUDNZD','Instrument, which price is based on quotations of Australian Dollar to New Zealand Dollar on the interbank market.',50.000,0.010,0.010,'inactive')
,(3,'GBPJPY','Instrument, which price is based on quotations of British Pound to Japanese Yen on the interbank market.',50.000,0.010,0.010,'standby')
,(4,'USDSEK','Instrument, which price is based on quotations of American Dollar to Swedish Krona on the interbank market.',50.000,0.010,0.010,'inactive')
,(5,'EURJPY','Instrument, which price is based on quotations of Euro to Japanese Yen on the interbank market.',50.000,0.010,0.010,'standby')
,(6,'CHFPLN','Instrument, which price is based on quotations of Swiss Frank to Polish Zloty on the interbank market.',50.000,0.010,0.010,'inactive')
,(7,'USDJPY','Instrument, which price is based on quotations of American Dollar to Japanese Yen on the interbank market.',50.000,0.010,0.010,'standby')
,(8,'USDMXN','Instrument, which price is based on quotations of American Dollar to Mexican Peso on the interbank market.',50.000,0.010,0.010,'inactive')
,(9,'USDILS','Instrument, which price is based on quotations of American Dollar to Israeli Shekel on the interbank market.',50.000,0.010,0.010,'inactive')
,(10,'AUDJPY','Instrument, which price is based on quotations of Australian Dollar to Japanese Yen on the interbank market.',50.000,0.010,0.010,'standby')
;
INSERT INTO r_symbols (id,reference,description,lot_max_size,lot_min_size,current_lot_size,state) VALUES 
(11,'GBPCAD','Instrument, which price is based on quotations of British Pound to Canadian Dollar on the interbank market.',50.000,0.010,0.010,'inactive')
,(12,'GBPNZD','Instrument, which price is based on quotations of British Pound to New Zealand Dollar on the interbank market.',50.000,0.010,0.010,'inactive')
,(13,'AUDCHF','Instrument, which price is based on quotations of Australian Dollar to Swiss Frank on the interbank market.',50.000,0.010,0.010,'standby')
,(14,'NZDUSD','Instrument, which price is based on quotations of New Zealand Dollar to American Dollar on the interbank market.',50.000,0.010,0.010,'inactive')
,(15,'EURRON','Instrument, which price is based on quotations of Euro to Romanian Leu on the interbank market.',50.000,0.010,0.010,'inactive')
,(16,'USDZAR','Instrument, which price is based on quotations of American Dollar to South African Rand on the interbank market.',50.000,0.010,0.010,'inactive')
,(17,'EURSEK','Instrument, which price is based on quotations of Euro to Swedish Krona on the interbank market.',50.000,0.010,0.010,'inactive')
,(18,'USDCLP','Instrument, which price is based on quotations of American Dollar to Chilean Peso on the interbank market.',50.000,0.010,0.010,'inactive')
,(19,'CHFJPY','Instrument, which price is based on quotations of Swiss Frank to Japanese Yen on the interbank market.',50.000,0.010,0.010,'standby')
,(20,'GBPAUD','Instrument, which price is based on quotations of British Pound to Australian Dollar on the interbank market.',50.000,0.010,0.010,'standby')
;
INSERT INTO r_symbols (id,reference,description,lot_max_size,lot_min_size,current_lot_size,state) VALUES 
(21,'GBPCHF','Instrument, which price is based on quotations of British Pound to Swiss Frank on the interbank market.',50.000,0.010,0.010,'standby')
,(22,'EURNOK','Instrument, which price is based on quotations of Euro to Norwegian Krone on the interbank market.',50.000,0.010,0.010,'inactive')
,(23,'GBPPLN','Instrument, which price is based on quotations of British Pound to Polish Zloty on the interbank market.',50.000,0.010,0.010,'inactive')
,(24,'USDCHF','Instrument, which price is based on quotations of American Dollar to Swiss Frank on the interbank market.',50.000,0.010,0.010,'standby')
,(25,'CADJPY','Instrument, which price is based on quotations of Canadian Dollar to Japanese Yen on the interbank market.',50.000,0.010,0.010,'inactive')
,(26,'USDTRY','Instrument, which price is based on quotations of American Dollar to Turkish Lira on the interbank market.',50.000,0.010,0.010,'inactive')
,(27,'GBPUSD','Instrument, which price is based on quotations of British Pound to American Dollar on the interbank market.',50.000,0.010,0.010,'standby')
,(28,'EURCZK','Instrument, which price is based on quotations of Euro to Czech Koruna on the interbank market.',50.000,0.010,0.010,'inactive')
,(29,'USDNOK','Instrument, which price is based on quotations of American Dollar to Norwegian Krone on the interbank market.',50.000,0.010,0.010,'inactive')
,(30,'EURCHF','Instrument, which price is based on quotations of Euro to Swiss Frank on the interbank market.',50.000,0.010,0.010,'standby')
;
INSERT INTO r_symbols (id,reference,description,lot_max_size,lot_min_size,current_lot_size,state) VALUES 
(31,'USDHUF','Instrument, which price is based on quotations of American Dollar to Hungarian Forint on the interbank market.',50.000,0.010,0.010,'inactive')
,(32,'EURHUF','Instrument, which price is based on quotations of Euro to Hungarian Forint on the interbank market.',50.000,0.010,0.010,'inactive')
,(33,'AUDUSD','Instrument, which price is based on quotations of Australian Dollar to American Dollar on the interbank market.',50.000,0.010,0.010,'standby')
,(34,'USDCZK','Instrument, which price is based on quotations of American Dollar to Czech Koruna on the interbank market.',50.000,0.010,0.010,'inactive')
,(35,'USDPLN','Instrument, which price is based on quotations of American Dollar to Polish Zloty on the interbank market.',50.000,0.010,0.010,'inactive')
,(36,'NZDJPY','Instrument, which price is based on quotations of New Zealand Dollar to Japanese Yen on the interbank market.',50.000,0.010,0.010,'inactive')
,(37,'EURNZD','Instrument, which price is based on quotations of Euro to New Zealand Dollar on the interbank market.',50.000,0.010,0.010,'inactive')
,(38,'EURCAD','Instrument, which price is based on quotations of Euro to Canadian Dollar on the interbank market.',50.000,0.010,0.010,'inactive')
,(39,'EURGBP','Instrument, which price is based on quotations of Euro to British Pound on the interbank market.',50.000,0.010,0.010,'standby')
,(40,'USDRON','Instrument, which price is based on quotations of American Dollar to Romanian Leu on the interbank market.',50.000,0.010,0.010,'inactive')
;
INSERT INTO r_symbols (id,reference,description,lot_max_size,lot_min_size,current_lot_size,state) VALUES 
(41,'EURUSD','Instrument, which price is based on quotations of Euro to American Dollar on the interbank market.',50.000,0.010,0.010,'standby')
,(42,'EURPLN','Instrument, which price is based on quotations of Euro to Polish Zloty on the interbank market.',50.000,0.010,0.010,'inactive')
,(43,'CHFHUF','Instrument, which price is based on quotations of Swiss Frank to Hungarian Forint on the interbank market.',50.000,0.010,0.010,'inactive')
,(44,'CADCHF','Instrument, which price is based on quotations of Canadian Dollar to Swiss Frank on the interbank market.',50.000,0.010,0.010,'inactive')
,(45,'EURTRY','Instrument, which price is based on quotations of Euro to Turkish Lira on the interbank market.',50.000,0.010,0.010,'inactive')
,(46,'AUDCAD','Instrument, which price is based on quotations of Australian Dollar to Canadian Dollar on the interbank market.',50.000,0.010,0.010,'inactive')
,(47,'USDBRL','Instrument, which price is based on quotations of American Dollar to Brazilian Real on the interbank market.',50.000,0.010,0.010,'inactive')
,(48,'USDCAD','Instrument, which price is based on quotations of American Dollar to Canadian Dollar on the interbank market.',50.000,0.010,0.010,'inactive')
,(49,'NZDCAD','Instrument, which price is based on quotations of New Zealand Dollar to Canadian Dollar on the interbank market.',50.000,0.010,0.010,'inactive')
;


/* -------------------------------------*/
/* ---- TABLES de run stock_values ---- */
/* -------------------------------------*/

CREATE TABLE `r_stock_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `symbol_id` tinyint(3) unsigned NOT NULL,
  `bid_at` int(10) unsigned NOT NULL,
  `last_bid` mediumint(8) unsigned NOT NULL,
  `calculations` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `symbol` (`symbol_id`,`bid_at`),
  KEY `bid_at` (`bid_at`),
  CONSTRAINT `stock_values_symbol_types_reference` FOREIGN KEY (`symbol_id`) REFERENCES `r_symbols` (`id`)
);

/* -------------------------------*/
/* ---- TABLES de run trades ---- */
/* -------------------------------*/

CREATE TABLE `r_trades_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`)
);

CREATE TABLE `r_trades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
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
  CONSTRAINT `trades_symbol_types_reference` FOREIGN KEY (`symbol_id`) REFERENCES `r_symbols` (`id`),
  CONSTRAINT `trades_types_reference` FOREIGN KEY (`trade_type_id`) REFERENCES `r_trades_type` (`id`)
);
