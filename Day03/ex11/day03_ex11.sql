update 
	menu
set 
	price = price * 0.9
where 
	"id" in (select "id" from menu where pizza_name = 'greek pizza');