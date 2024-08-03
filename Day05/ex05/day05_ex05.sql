DROP INDEX IF EXISTS idx_person_order_order_date;

CREATE UNIQUE INDEX idx_person_order_order_date ON person_order USING btree (person_id, menu_id) WHERE order_date = '2022-01-01';

SET enable_seqscan TO OFF;

EXPLAIN ANALYZE
SELECT 
    *
FROM
    person_order
WHERE person_id = 2 and menu_id = 9 and order_date = '2022-01-01';