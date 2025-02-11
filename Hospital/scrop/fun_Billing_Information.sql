-- 5)Stored Procedure for Billing Information 		----function
-- Create a stored procedure to display detailed billing information for a specified patient. 
--The output should include treatment details, patient data, billing data, and payment information. 
--Mark a record as overdue if the total amount remains unpaid for more than 3 days after the bill creation date. 
--If a single bill has multiple payments, present the receipt IDs as a comma-separated list.

-- select * from billing;
-- select * from patient;
-- select * from patient_admission;
-- select * from payment;

-- drop function fun_Billing_Information;

create or replace function fun_Billing_Information(iparam_patient_id int)
 returns table(
	iparam_first_name varchar,
	iparam_last_name varchar,
	iparam_date_of_birth date,
	iparam_email varchar,
	iparam_phone_number bigint,	
	iparam_admit_type varchar,
	iparam_treatment_description varchar,
	iparam_treatment_start_date date,
	iparam_treatment_end_date date,	
	iparam_bill_date date,
	iparam_bill_type varchar,
	iparam_total_amount numeric(10,2),
	iparam_balance_amount numeric(10,2),
	iparam_amount_paid numeric(10,2),
	iparam_payment_date date,
	iparam_bill_status text	
 )
as $$

BEGIN
	return QUERY
	--treatment details, patient data, billing data, and payment information. 
	select a.first_name, a.last_name, a.date_of_birth, a.email, a.phone_number,
			b.admit_type, b.treatment_description, b.treatment_start_date, b.treatment_end_date,
			c.bill_date, c.bill_type, c.total_amount, c.balance_amount,
			d.amount_paid, d.payment_date,
			CASE
                WHEN (c.total_amount - d.amount_paid) >= 0 AND (CURRENT_DATE - c.bill_date) <= 3 OR (CURRENT_DATE - c.bill_date) >= 0
                THEN 'Overdue'
                ELSE 'Paid'
            END AS bill_status
			from patient a
			inner join patient_admission b using(patient_id)
			inner join billing c using(admission_id)
			inner join payment d ON c.billing_id=d.bill_id
			where a.patient_id = iparam_patient_id
	;

END;
$$ language plpgsql;

-- select * from fun_Billing_Information(10);


---