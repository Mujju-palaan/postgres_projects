-- Stored Procedure for Receivable Payment Insertion
-- Write a stored procedure to insert new payment information for an invoice into receivable transaction table, 
--also update invoice status in invoice table as paid.

create or replace procedure scrop_receivable_payment(
	IN iparam_contract_invoice_id int
	,IN iparam_amount numeric(10,2)
)
AS $$

DECLARE d_description varchar;
		d_amount_due numeric(10,2);
BEGIN

	d_description = 'payment for Invoice #' ||  iparam_contract_invoice_id;

	select amount_due 
	into d_amount_due
	from invoice
	where invoice_id = iparam_contract_invoice_id
	;
	
	IF iparam_amount > d_amount_due
	THEN
		RAISE EXCEPTION 'You are paying more amount';
	END IF;
	
	--- select * from RECEIVABLE_TRANSACTION;  (select * from RECEIVABLE_TRANSACTION)
	insert into RECEIVABLE_TRANSACTION(description, amount, payment_date, contract_invoice_id)
	select
		d_description
		,iparam_amount
		,current_date
		,iparam_contract_invoice_id
	;

	---  update invoice status in invoice table as paid.(select * from invoice)
	update invoice
	set amount_due = amount_due - iparam_amount , status = 'paid'
	where invoice_id = iparam_contract_invoice_id
	;
	
END;
$$ language plpgsql;


-- CALL public.scrop_receivable_payment(
-- 	2					-- <IN iparam_contract_invoice_id integer>,
-- 	,200					-- <IN iparam_amount  numeric>
-- );




