DROP INDEX IF EXISTS idx_person_discounts_unique;

CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts USING btree (person_id, pizzeria_id);

SET enable_seqscan TO OFF;

EXPLAIN ANALYZE
SELECT * FROM person_discounts WHERE person_id = 9 AND pizzeria_id = 6;