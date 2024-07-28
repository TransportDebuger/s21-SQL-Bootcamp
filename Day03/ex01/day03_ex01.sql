with ordered_menu as(
	select distinct
		person_order.menu_id as "id"
	from
		person_order
)
select
	menu.id
from
	menu
where
	menu.id not in (select "id" from ordered_menu);