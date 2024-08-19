ALTER TABLE IF EXISTS person_discounts ADD CONSTRAINT ch_nn_person_id check (person_id is not null);

ALTER TABLE IF EXISTS person_discounts ADD CONSTRAINT ch_nn_pizzeria_id check (pizzeria_id is not null);

ALTER TABLE IF EXISTS person_discounts ADD CONSTRAINT ch_nn_discount check (discount is not null);

ALTER TABLE IF EXISTS person_discounts ALTER COLUMN discount SET DEFAULT 0;

ALTER TABLE IF EXISTS person_discounts ADD CONSTRAINT ch_range_discount check (discount between 0 and 100);