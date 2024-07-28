select 
	missing_date::DATE
from 
	generate_series('2022-01-01', '2022-01-10', interval '1 day') as missing_date
	left join
		(select 
			person_visits.visit_date
		from person_visits
		where person_id = 1 or person_id = 2) sel_visits on missing_date = sel_visits.visit_date
where
	sel_visits.visit_date is null
order by missing_date asc;