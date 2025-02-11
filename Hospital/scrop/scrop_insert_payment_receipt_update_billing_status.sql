-- 8)Stored Procedure for Payment Receipts
-- Create a stored procedure to insert payment receipt details and automatically update the associated bill 
--status to indicate whether it is fully paid or partially paid.
alter table billing add column billing_status varchar(50);
-- select * from payment;
-- select * from billing;
create or replace procedure scrop_insert_payment_receipt_update_billing_status(
	IN iparam_billing_id int,
	IN iparam_patient_id int,
	IN iparam_amount_paid numeric(10,2),
	IN iparam_payment_date date
)
language plpgsql
as $$
DECLARE d_total_amount numeric(10,2);
		d_total_paid numeric(10,2);
		last_billing_id int;
		
BEGIN

	----- Get the total amount of the bill
	SELECT total_amount into d_total_amount
	from billing
	where billing_id = iparam_billing_id;
	
	-- If no bill exists with the given ID, raise an error
    if d_total_amount is null then
	RAISE EXCEPTION 'BILL WITH ID % not found', iparam_billing_id;
	end if;
	
	--insert in payment
	insert into payment(bill_id, patient_id, amount_paid, payment_date)
	values(iparam_billing_id, iparam_patient_id, iparam_amount_paid, iparam_payment_date)
	returning bill_id into last_billing_id;

	--Get the total amount paid so far for the bill
	select coalesce(sum(amount_paid),0) into d_total_paid
	from payment
	where bill_id = last_billing_id;
	
	--update the associated bill status to indicate whether it is fully paid or partially paid.
	if d_total_paid >= d_total_amount then
	update billing set billing_status = 'fully_paid'
	where billing_id = last_billing_id;
	
	elsif d_total_paid > 0 then
	update billing set billing_status ='partially_paid'
	where billing_id = last_billing_id;
	
	ELSE UPDATE billing
	set billing_status = 'unpaid'
	where billing_id = last_billing_id;
	end if;

END;
$$;

--call scrop_insert_payment_receipt_update_billing_status(1,1,500,current_date);
