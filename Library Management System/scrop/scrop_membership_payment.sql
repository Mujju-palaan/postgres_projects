-- Stored Procedure for Membership Payments
-- Write a stored procedure to handle inserts and updates for membership payment management. 
--The procedure should insert a record into the MEMBERSHIP_PAYMENT table and update the 
--membership_expiry_date in the MEMBERSHIP table.

create or replace procedure scrop_membership_payment(
	IN iparam_membership_type_id int
	,IN iparam_amount_paid numeric(10,2)
	,IN iparam_member_id int
)
AS $$

DECLARE d_member_id int;
		d_payment_date date;
BEGIN
	--- insert a record into the MEMBERSHIP_PAYMENT	(select * from MEMBERSHIP_PAYMENT)
	insert into MEMBERSHIP_PAYMENT(membership_type_id, amount_paid, payment_date, member_id)
	values(iparam_membership_type_id, iparam_amount_paid, current_date, iparam_member_id)
	returning payment_date, member_id into d_payment_date, d_member_id
	;
	
	---  update the membership_expiry_date in the MEMBERSHIP  (select * from members)
	update members
	set membership_expiry_date = d_payment_date + interval '1 month'
	where member_id = d_member_id
	;
	
END;
$$ language plpgsql;


-- CALL public.scrop_membership_payment(
-- 	1				-- <IN iparam_membership_type_id integer>,
-- 	,15				-- <IN iparam_amount_paid  numeric>,
-- 	,2				-- <IN iparam_member_id  integer>
-- );




