DROP INDEX IF EXISTS idx_menu_unique;

CREATE UNIQUE INDEX idx_menu_unique ON menu USING btree (pizzeria_id, pizza_name);

SET enable_seqscan TO OFF;

EXPLAIN ANALYZE
SELECT
    pizzeria_id,
    pizza_name
FROM
    menu
WHERE pizzeria_id = 5 AND pizza_name = 'pepperoni pizza';