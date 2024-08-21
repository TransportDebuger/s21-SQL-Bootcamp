drop table if exists person_audit;

create table person_audit (
    created timestamp with time zone DEFAULT current_timestamp NOT NULL,
    type_event CHAR(1) DEFAULT 'I' NOT NULL,
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar
);

alter table person_audit add constraint ch_type_event check (type_event in ('I', 'U', 'D'));

create or replace function fnc_trg_person_insert_audit() returns trigger as $person_audit$
begin
    if (TG_OP = 'INSERT') then
       insert into person_audit
       select
           current_timestamp,
           'I',
           new.id, 
		   new.name, 
		   new.age, 
		   new.gender, 
		   new.address;
    end if;
    return null;
end;
$person_audit$ LANGUAGE plpgsql;

create trigger trg_person_insert_audit after insert
    on person
    for each row execute function fnc_trg_person_insert_audit();

insert into person(id, name, age, gender, address)
values (10,'Damir', 22, 'male', 'Irkutsk');