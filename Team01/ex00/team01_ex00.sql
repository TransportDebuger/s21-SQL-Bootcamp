with 
	cur_max_updated as (
		select
			currency."id",
			MAX(currency.updated) as max_updated
		from
			currency
		group by
			currency.id
	),
	cur_last_rate AS (
		select
			currency."id",
			currency."name",
			rate_to_usd
		from
			currency
			inner join cur_max_updated on 
				currency."id" = cur_max_updated."id" and 
				currency.updated = cur_max_updated.max_updated)
select
	COALESCE("user"."name", 'not defined') as "name",
	COALESCE("user".lastname, 'not defined') as "lastname",
	balance.type,
	SUM(balance.money) as volume,
	COALESCE(cur_last_rate.name, 'not defined') as currency_name,
	COALESCE(cur_last_rate.rate_to_usd, 1) as last_rate_to_usd,
	SUM(balance.money) * COALESCE(rate_to_usd, 1) AS total_volume_in_usd
from
	"user"
	FULL JOIN balance ON "user"."id" = balance.user_id
	LEFT JOIN cur_last_rate ON balance.currency_id = cur_last_rate.id
GROUP BY
	balance.type, "user".id, "user".name, "user".lastname, cur_last_rate.name, cur_last_rate.rate_to_usd
ORDER BY
	1 desc, 2, 3