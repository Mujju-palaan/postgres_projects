
-- Stored Procedure for Daily Operations

-- Write a stored procedure to retrieve daily operations information by listing all calendar dates 
--for a given month. For each date, include the total number of books borrowed, total books returned, 
--total membership amount collected, total fines paid, new member signups, and the count of new books purchased. 
--Ensure all calendar dates are included, even if no data exists for a given date, by using the 
--Dim Date table with a LEFT JOIN. You will have to use temporary table concept to complete this store procedure.

create or replace procedure scrop_daily_oprations()
AS $$

DECLARE
BEGIN
	---	temp
	create temp table IF NOT EXISTS scrop_daily_oprations(
		months text
		,books_borrowed bigint
		,books_returned bigint
		,total_membership_amount numeric
		,total_fine_paid numeric
		,new_member bigint
		,new_book_purchased bigint
	);

	---insert
	insert into scrop_daily_oprations(months, books_borrowed, books_returned, total_membership_amount,
				total_fine_paid, new_member, new_book_purchased)
	select
		TO_CHAR(a.calendar_date, 'Month YYYY')
		,count(b.book_id)
		,count(b.return_date)
		,sum(c.amount_paid)
		,sum(d.fine_amount)
		,count(c.member_id)
		,count(b.loan_id)
	from date_dim a
	left join loan b ON calendar_date between loan_date and return_date
	left join membership_payment c using(member_id)
	left join fine d using(loan_id)
	group by TO_CHAR(calendar_date, 'Month YYYY')
	order by 2 desc
	;

END;
$$ language plpgsql;

-- call scrop_daily_oprations();

-- select * from scrop_daily_oprations;