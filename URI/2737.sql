select l.name, l.customers_number
from lawyers l
where l.customers_number = (select max(l.customers_number) as valor from lawyers l )

union 

select l.name, l.customers_number
from lawyers l
where l.customers_number = (select min(l.customers_number) as valor from lawyers l )

union

select 'Average' as name,  cast(avg(l.customers_number) as int)
from lawyers l



select r.name, 
	r.customers_number 
from (
select l.name, l.customers_number, 1 as filter
from lawyers l
where l.customers_number = (select max(l.customers_number) as valor from lawyers l )
or l.customers_number = (select min(l.customers_number) as valor from lawyers l )

union all

select 'Average' as name,  cast(avg(l.customers_number) as int), 2 as filter
from lawyers l) as r
order by r.filter, r.name