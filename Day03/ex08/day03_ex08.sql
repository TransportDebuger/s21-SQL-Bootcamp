insert into menu (
	"id", 
	pizzeria_id, 
	pizza_name,
	price
) values (
	(select max(menu.id)+1 from menu),
	(select pizzeria.id from pizzeria where pizzeria.name = 'Dominos'),
	'sicilian pizza',
	900
);