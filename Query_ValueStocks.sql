select 
	company as valuestocks
	
from
(
	select 
		company,
		sum(CASE 
		   when leads = 10001 then 1
		   else 0
		   end) as continuous
	
	from 
	(
		select 
			company,
			fiscal_year,
			fiscal_year- lag(fiscal_year,1) over( partition by company) as leads

		from dividend
	) as difference

	group by company
) as required_table

where continuous >1;


