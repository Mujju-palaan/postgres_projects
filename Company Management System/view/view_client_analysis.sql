
-- View for Client Analysis
-- Create a view to analyze client business deals for a specific year. The view should display the following information: 
-- client name, calendar year, calendar month, project count, contract count, and project amount. 
-- Ensure that all months are displayed, even if there are no business transactions with the client. 
-- To achieve this, use the date dimension table as main table and apply the LEFT JOIN technique on other tables.
select * from date_dim;
select * from project;

create or replace view view_client_analysis AS
select 
	a.client_name
	,d.year as calendar_year
	,d.month as calendar_month
	,count(project_id) as project_count
	,count(contract_id) as contract_count
	,b.amount as project_amount
from client a
inner join contract b using(client_id)
inner join project c using(project_id)
right join date_dim d ON d.calendar_date between c.start_date and c.end_date
group by a.client_name, d.year, d.month, b.amount
order by 1,2,3,4,5
;

-- select * from view_client_analysis;