--4) View for Patient Discharge Billing Information
--Create a view to display treatment billing information, including treatment description, bill date, bill amount, 
--paid amount, pay receipt id, and balance amount. If multiple payments have been made for a single bill, display the 
--receipt IDs as a comma-separated list. There shall be one record per bill, repeating treatment information is ok.
create view view_patient_discharge_billing_info AS
	select a.bill_date, a.total_amount as bill_amount, --billing
			b.amount_paid,  ---payment
			COALESCE(STRING_AGG(b.payment_id::TEXT, ', '), 'No Payment') AS receipt_ids,			
			a.balance_amount --billing
			from billing a
			inner join payment b ON a.billing_id=b.bill_id
			group by b.amount_paid, b.payment_id,a.bill_date, a.total_amount,balance_amount
	;

--select * from view_patient_discharge_billing_info;

