-- View for Customer Informationw
-- Create a view to display customer information from customer table.

create or replace view view_customer_info AS
select * from customer
;


select * from view_customer_info;