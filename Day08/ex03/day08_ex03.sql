--s1
begin transaction isolation level read committed;
--s2
begin transaction isolation level read committed;
--s1
select * from pizzeria where name = 'Pizza Hut';
--s2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
--s1
select * from pizzeria where name = 'Pizza Hut';
--s2
commit;
--s1
commit;
--s1
select * from pizzeria where name = 'Pizza Hut';
--s2
select * from pizzeria where name = 'Pizza Hut';