-- Stored Procedure for Review Analysis
-- Create a stored procedure for Review Analysis to retrieve the Month, Restaurant, Rating, and Review Count. 
--Use a temporary table and date dimension table. Ensure that order months are displayed even if there are no reviews for a given month (LEFT JOIN).

create or replace procedure scrop_review_analysis()
AS $$

BEGIN
	---temp (drop table temp_review_analysis) ,  (select * from temp_review_analysis)
	create temp table IF NOT EXISTS temp_review_analysis(
		months int
		,restaurant varchar
		,rating numeric(10,2) check(rating between 1 AND 5)
		,review_count int
	);

	----insert (select * from DATE_DIM),  (select * from review)
	insert into temp_review_analysis(months, restaurant, rating, review_count)
	select
		extract(month from c.calendar_date)::int
		,a.restaurant_name
		,avg(b.rating)
		,count(b.review_id)
	from restaurant a
	inner join review b using(restaurant_id)
	right join DATE_DIM c ON b.created_at = c.calendar_date
	group by a.restaurant_name, extract(month from c.calendar_date)
	order by 1
	;
	
END;
$$ language plpgsql;

-- call scrop_review_analysis();

-- select * from temp_review_analysis;