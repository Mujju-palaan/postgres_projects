-- Function to Calculate Total Fines per Member

-- Write a function that calculates the total fines owed by a member.

create or replace function fun_fine_per_member(iparam_member_id int)
returns table(
	member_id int
	,total_fine numeric
)
AS $$

BEGIN
	return query
	select 
		a.member_id
		,sum(c.fine_amount)
	from members a
	inner join loan b using(member_id)
	inner join fine c using(loan_id)
	group by a.member_id
	having a.member_id = iparam_member_id
	order by 1
	;

END;
$$ language plpgsql;


-- select * from fun_fine_per_member(1);
