-- Trigger on Order Status Change
-- Create a trigger on the ORDER table that logs any changes to the status field into the AUDIT_LOG table. 
--Capture the order_id, old_status, new_status, and log_date.
-- drop table orders_log

---tbl
create table IF NOT EXISTS orders_log(
	log_id int generated always as identity primary key
	,log_date timestamp default current_timestamp
	,order_id int
	,old_status varchar
	,new_status varchar
	,foreign key(order_id) references "ORDER"(order_id)
);

---fun
create or replace function trg_fun_order_status()
returns trigger
AS $$
BEGIN
	----
	IF OLD.status is distinct from NEW.status
	THEN
	insert into orders_log( order_id, old_status, new_status)
	values(OLD.order_id, OLD.status, NEW.status);
	END IF;
	return NEW;

END;
$$ language plpgsql;

---trigger
create or replace trigger trg_order_status
after update on "ORDER"
for each row
WHEN(OLD.status is distinct from NEW.status)
execute function trg_fun_order_status();

---update (select * from "ORDER")
update "ORDER"
set status = 'Delivered'
where order_id = 2
;

-- select * from orders_log;