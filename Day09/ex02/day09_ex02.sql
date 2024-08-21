create or replace function fnc_trg_person_delete_audit() returns trigger as $person_audit$
begin
    if (TG_OP = 'DELETE') then
       insert into person_audit
       select
           current_timestamp,
           'D',
           OLD.id, 
		   OLD.name, 
		   OLD.age, 
		   OLD.gender, 
		   OLD.address;
    end if;
    return null;
end;
$person_audit$ LANGUAGE plpgsql;

create or replace trigger trg_person_delete_audit after delete
    on person
    for each row execute function fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;