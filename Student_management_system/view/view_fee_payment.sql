-- View Tasks:
-- View for Payment Transaction Screen

-- Create a view that shows payment transaction details from FEE_PAYMENT table.

create or replace view view_fee_payment AS
select * from fee_payment
;

select * from view_fee_payment;

