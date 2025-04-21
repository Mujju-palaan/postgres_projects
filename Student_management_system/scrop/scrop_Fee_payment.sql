-- Stored Procedure for Fee Payment

-- Develop a stored procedure to insert data into the FEE_PAYMENT table. 
-- The procedure should update the paid_amount and due_amount fields in the ENROLLMENT table, 
-- distributing the total paid amount across the enrolled courses. Partial payments for individual courses are allowed. 
-- Ensure that overpayment is not allowed. You will have to use stored procedure's temporary table technique.

create or replace procedure scrop_Fee_payment(
	---FEE_PAYMENT
	IN iparam_student_id int
	,IN iparam_amount_paid numeric
	-- ,IN iparam_balance_amount numeric
)
AS $$

DECLARE 
		-- d_amount_paid numeric;
		d_balance_amount numeric;
		d_before_balance numeric;
BEGIN 

	select balance_amount 
	into d_before_balance
	from FEE_PAYMENT
	where student_id = iparam_student_id 
	and payment_id = (select payment_id from FEE_PAYMENT
						order by payment_id desc limit 1 )
	;
	
	---conflict
	IF iparam_amount_paid > d_before_balance
	THEN 
		RAISE EXCEPTION 'overpayment is not allowed';
	END IF;

	----  insert data into the FEE_PAYMENT table.
	insert into FEE_PAYMENT(student_id, amount_paid, balance_amount)
	values(iparam_student_id, iparam_amount_paid, (d_before_balance - iparam_amount_paid))
	returning balance_amount into d_balance_amount
	;

	--- The procedure should update the paid_amount and due_amount fields in the ENROLLMENT table, 
	update ENROLLMENT 
	set amount_paid = iparam_amount_paid , amount_due = d_balance_amount
	where student_id = iparam_student_id
	;
	
END;
$$ language plpgsql;

-- call scrop_Fee_payment(11, 300.00);

-- select * from FEE_PAYMENT;
-- select * from ENROLLMENT;




