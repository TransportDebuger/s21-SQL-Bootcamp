CREATE SEQUENCE IF NOT EXISTS seq_person_discounts
    INCREMENT 1
    START 1;

ALTER TABLE IF EXISTS person_discounts ALTER COLUMN "id" SET DEFAULT nextval('seq_person_discounts');

ALTER SEQUENCE seq_person_discounts OWNED BY person_discounts.id;

SELECT setval(pg_get_serial_sequence('person_discounts', 'id'), coalesce(max(id),0) + 1, false) FROM person_discounts;