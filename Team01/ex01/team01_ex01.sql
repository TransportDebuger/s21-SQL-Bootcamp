insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

select
	coalesce("user"."name", 'not defined') as "name",
	coalesce("user"."lastname", 'not defined') as "lastname",
	a."name" as currency_name,
	coalesce(a.rate_1, a.rate_2) * a.money as currency_in_usd
from 
	(select distinct
		balance.user_id, 
		currency.name,
		balance.money,
		(select rate_to_usd
			from currency 
			where currency.id = currency_id and 
				  currency.updated < balance.updated 
	    	order by currency.updated desc limit 1) as rate_1,
		(select rate_to_usd
			from currency 
			where currency.id = currency_id and 
				  currency.updated > balance.updated 
	    	order by currency.updated limit 1) as rate_2
	from
		balance
	inner join currency on balance.currency_id = currency.id
	) a
	left join "user" on a.user_id = "user"."id"
order by 
    1 desc, 2, 3