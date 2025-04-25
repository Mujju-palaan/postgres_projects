-- View for Coupon Analysis
-- Create a view to retrieve coupon analysis, including Coupon Name, Calendar Date, Redeem Count, and Redeem Amount. 
--Display Redeem Amount as zero for calendar dates with no redeems. Use a JOIN with the date dimension table.

create or replace view view_coupon_analysis AS
select
	a.coupon_name
	,aa.calendar_date
	,count(b.coupon_id) as redeem_count
	,sum(c.discount_amount)
from coupon a
inner join "ORDER" b using(coupon_id)
inner join payment c using(order_id)		---select * from payment
join date_dim aa ON aa.calendar_date between a.start_date and a.end_date
group by a.coupon_name, extract(month from aa.calendar_date),aa.calendar_date
order by 2
;

select * from view_coupon_analysis;