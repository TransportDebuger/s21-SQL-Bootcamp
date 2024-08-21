-- s1
show transaction isolation level;

-- s2
SHOW TRANSACTION ISOLATION LEVEL;

-- s1
BEGIN;
select * from pizzeria where name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- s2
BEGIN;
select * from pizzeria where name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- s1
COMMIT;

-- s2
COMMIT;

-- s1
select * from pizzeria where name = 'Pizza Hut';

--s2
select * from pizzeria where name = 'Pizza Hut';