USE market;

/* -------------------------------*/
/* ---- VIEWS de run symbols ---- */
/* -------------------------------*/

CREATE OR REPLACE VIEW v_r_symbols_active
AS SELECT *
FROM r_symbols
WHERE state = 'active';

CREATE OR REPLACE VIEW v_r_symbols_inactive
AS SELECT *
FROM r_symbols
WHERE state = 'inactive';

CREATE OR REPLACE VIEW v_r_symbols_standby
AS SELECT *
FROM r_symbols
WHERE state = 'standby';

CREATE OR REPLACE VIEW v_r_symbols_not_inactive
AS SELECT *
FROM r_symbols
WHERE state != 'inactive';

/* -------------------------------------*/
/* ---- TABLES de run stock_values ---- */
/* -------------------------------------*/

CREATE OR REPLACE VIEW v_r_stock_values_time
AS SELECT `id`, `symbol_id`, `bid_at` AS bid_at_unix, FROM_UNIXTIME(`bid_at`) AS bid_at_time, `last_bid`, `calculations`, `created_at`
FROM r_stock_values;

/* -------------------------------*/
/* ---- TABLES de run trades ---- */
/* -------------------------------*/

CREATE OR REPLACE VIEW v_r_trades_opened
AS SELECT *
FROM r_trades
WHERE closed_at IS NULL;

CREATE OR REPLACE VIEW v_r_trades_closed
AS SELECT *
FROM r_trades
WHERE closed_at IS NOT NULL;
