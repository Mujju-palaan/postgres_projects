-- Stored Procedure for Collection Analysis
-- Create a stored procedure for Collection Analysis to retrieve data for the collections data grid, including Date, 
--Weekday Name, Order Count, Customer Count, Total Amount, Discount Amount, and Discount Percent.

create or replace procedure scrop_collection_analysis()
AS $$

BEGIN
	----temp
	create temp table IF NOT EXISTS temp_collection_analysis(
		collection_date date
		,weekday_name varchar
		,order_count int
		,customer_count int
		,total_amount numeric(10,2)
		,discount_amount numeric(10,2)
		,discount_percentage numeric(10,2)
	);

	--insert 
	insert into temp_collection_analysis(collection_date, weekday_name, order_count, customer_count, total_amount, discount_amount, discount_percentage)
	select
		aa.calendar_date
		,aa.week_day_name
		,count(b.order_id)
		,count(a.customer_id)
		,c.amount
		,c.discount_amount
		,d.discount_percentage
	from customer a
	inner join "ORDER" b using(customer_id)		---(select * from "ORDER")
	inner join payment c using(order_id)			---(select * from payment)
	inner join coupon d using(coupon_id)
	inner join date_dim aa ON aa.calendar_date = b.order_date 		---(select * from date_dim)
	group by aa.calendar_date, aa.week_day_name, c.amount, c.discount_amount, d.discount_percentage
	order by 1
	;
	
END;
$$ language plpgsql;

-- call scrop_collection_analysis();

-- select * from temp_collection_analysis;