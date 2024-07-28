insert into person_order
select
	(select count(*) from person t2 where t2.id <= t1.id) + (select max(id) from person_order) as "id",
	t1.id as person_id,
	(select menu.id from menu where pizza_name = 'greek pizza') as menu_id,
	'2022-02-25' as order_id
from
	person t1;