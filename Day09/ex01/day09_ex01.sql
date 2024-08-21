create or replace function fnc_trg_person_update_audit() returns trigger as $person_audit$
begin
    if (TG_OP = 'UPDATE') then
       insert into person_audit
       select
           current_timestamp,
           'U',
           OLD.id, 
		   OLD.name, 
		   OLD.age, 
		   OLD.gender, 
		   OLD.address;
    end if;
    return null;
end;
$person_audit$ LANGUAGE plpgsql;

create or replace trigger trg_person_update_audit after update
    on person
    for each row execute function fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;