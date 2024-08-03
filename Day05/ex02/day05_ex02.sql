DROP INDEX IF EXISTS idx_person_name;

CREATE INDEX IF NOT EXISTS idx_person_name ON person USING btree (UPPER(name));

SET enable_seqscan TO OFF;

EXPLAIN ANALYZE
SELECT * FROM person WHERE UPPER(name) = 'ANDREY';