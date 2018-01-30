USE market;


/* -------------------------------------*/
/* ---- TABLES de run stock_values ---- */
/* -------------------------------------*/

CREATE TABLE `r_stock_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `symbol_id` tinyint(3) unsigned NOT NULL,
  `bid_at` datetime NOT NULL,
  `last_bid` mediumint(8) unsigned NOT NULL,
  `calculations` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `symbol` (`symbol_id`,`bid_at`),
  KEY `bid_at` (`bid_at`),
  CONSTRAINT `stock_values_symbol_types_reference` FOREIGN KEY (`symbol_id`) REFERENCES `r_symbols` (`id`)
);

INSERT IGNORE INTO r_stock_values (id, symbol_id, bid_at, last_bid, calculations, created_at)  
SELECT id, symbol_id, bid_at, last_bid, calculations, created_at
FROM market_dev.stock_values
LIMIT 10;


INSERT IGNORE INTO r_stock_values (id, symbol_id, bid_at, last_bid, calculations, created_at)  
SELECT id, symbol_id, bid_at, last_bid, calculations, created_at
FROM market_dev.stock_values
LIMIT 50000;
