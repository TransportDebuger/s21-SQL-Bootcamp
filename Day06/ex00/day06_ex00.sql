DROP TABLE IF EXISTS person_discounts CASCADE;

CREATE TABLE person_discounts (
    id bigint PRIMARY KEY,
    person_id bigint,
    pizzeria_id bigint,
    discount NUMERIC,
    constraint fk_erson_discounts_person_id foreign key  (person_id) references person(id),
    constraint fk_erson_discounts_pizzeria_id foreign key  (pizzeria_id) references pizzeria(id)
);