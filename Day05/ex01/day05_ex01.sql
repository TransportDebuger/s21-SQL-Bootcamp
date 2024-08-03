SET enable_seqscan TO OFF;

EXPLAIN ANALYZE
SELECT 
	pizza_name,
	pizzeria.name as pizzeria_name
FROM
	pizzeria
	inner join menu on pizzeria.id = menu.pizzeria_id;