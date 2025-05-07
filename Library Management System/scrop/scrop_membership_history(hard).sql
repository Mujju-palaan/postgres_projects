-- Stored Procedure to retrieve Membership History

-- Write a stored procedure to retrieve membership history, including the member's name,
--current membership status (if any), number of books borrowed, late return count, 
--on-time return count, total fine paid, number of times the membership was renewed, 
--total amount paid to date, and the current membership status (expired or valid for X days)..
-- drop function fun_membership_history

create or replace function fun_membership_history(iparam_member_id int)
returns table(
	member_name text
	,membership_status text
	,no_of_books_borrowed bigint
	,late_return_count bigint
	,ontime_return_count bigint
	,total_fine_paid numeric(10,2)
	,membership_renewed_count bigint
	,paid_date text[]
	,valid_till text
)
AS $$

DECLARE d_return_date bigint;
		d_ontime_date bigint;
BEGIN
	select count(return_date)
	into d_return_date
	from loan
	where return_date > due_date AND member_id = iparam_member_id
	;

	select count(return_date)
	into d_ontime_date
	from loan
	where return_date <= due_date AND member_id = iparam_member_id
	;
	
	return query

	
	---
	select
		a.first_name||' '||a.last_name as member_name
		,case
			WHEN a.membership_expiry_date > b.payment_date THEN 'true'
			ELSE 'false'
		END
		,count(c.book_id)
		,d_return_date 
		,d_ontime_date 
		-- ,(select count(return_date)	from loan where return_date > due_date)
		-- ,(select count(return_date) from loan where return_date <= due_date)
		,sum(d.fine_amount)
		,count(e.payment_id)
		,array_agg(e.payment_date::text)
		,(a.membership_expiry_date - e.payment_date)::text
	from members a
	inner join membership_payment b using(member_id)
	inner join loan c using(member_id)
	inner join fine d using(loan_id)
	inner join membership_payment e ON a.member_id = e.member_id 
	where a.member_id = 1
	group by a.first_name||' '||a.last_name
		,case
			WHEN a.membership_expiry_date > b.payment_date THEN 'true'
			ELSE 'false'
		END
		,(a.membership_expiry_date - e.payment_date)
	;

END;
$$ language plpgsql;

-- select * from fun_membership_history(1);