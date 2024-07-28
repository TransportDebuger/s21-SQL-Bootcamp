with 
    woman_visited as (
	    select
		    pizzeria.name as pizzeria_name
	    from
		    pizzeria
		    inner join person_visits on pizzeria.id = person_visits.pizzeria_id
		    inner join person on person_visits.person_id = person.id
	    where
		    person.gender = 'female'
    ), 
    man_visited as (
	    select
		    pizzeria.name as pizzeria_name
	    from
		    pizzeria
		    inner join person_visits on pizzeria.id = person_visits.pizzeria_id
		    inner join person on person_visits.person_id = person.id
	    where
		    person.gender = 'male'
    )
(
	select pizzeria_name
	from woman_visited
	
	except all

	select pizzeria_name
	from man_visited )

union all

(
	select pizzeria_name
	from man_visited
	
	except all

	select pizzeria_name
	from woman_visited
)
order by 1;