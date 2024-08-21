--s1
begin transaction isolation level read committed;
--s2
begin transaction isolation level read committed;
--s1
show transaction isolation level;
--s2
show transaction isolation level;
--s1
select sum(rating) from pizzeria;
--s2
insert into pizzeria (id, name, rating) values ('10', 'Kazan Pizza', '5.0');
commit;
--s1
select sum(rating) from pizzeria;
commit;
--s2
select sum(rating) from pizzeria;
--s1
select sum(rating) from pizzeria;