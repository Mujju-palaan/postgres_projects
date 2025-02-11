-- 7)Stored Procedure for New Room Admits
-- Create a stored procedure to insert room admit details while ensuring that the assigned room is not double-booked. 
--Additionally, automatically generate a billing record based on the room's per-day fee.

create or replace procedure scrop_insert_room_admits_billing_details(
	IN iparam_start_date date,
	IN iparam_end_date date,
	IN iparam_room_id int,
	IN iparam_incharge_nurse_id int,
	IN iparam_admission_id int,
	--- select * from billing
	IN iparam_bill_date date,
	IN iparam_bill_type varchar,
	IN iparam_description text,
	-- IN iparam_total_amount numeric(10,2),
	IN iparam_balance_amount numeric(10,2),
	-- IN iparam_admission int,
	IN iparam_billing_status varchar
)
language plpgsql
as $$

DECLARE room_count int;
		room_charges numeric(10,2);
		last_admit_id int;

BEGIN
	----ensuring that the assigned room is not double-booked  select * from room;
	SELECT COUNT(a.room_id) into room_count
    FROM room a 
	inner join room_admit b using(room_id)
    WHERE (iparam_start_date between b.start_date and b.end_date)
	AND room_id = iparam_room_id;
	
	IF room_count > 0 THEN
        RAISE EXCEPTION 'Room is already booked for this time period';
    END IF;
	
	---insert room admit details   select * from room_admit;
	insert into room_admit(start_date, end_date, room_id, incharge_nurse_id, admission_id)
	values(iparam_start_date, iparam_end_date, iparam_room_id, iparam_incharge_nurse_id, iparam_admission_id)
	returning admit_id into last_admit_id;

	
	---generate a billing record based on the room's per-day fee. select * from billing;
	select ((a.end_date - a.start_date)*(b.daily_rate)) into room_charges
	from room_admit a
	inner join room b using(room_id)
	where admit_id = last_admit_id;
	
	---insert billing details   select * from billing;
	insert into billing(bill_date, bill_type, description, total_amount, balance_amount, admission_id, billing_status)
	values(iparam_bill_date, iparam_bill_type, iparam_description, room_charges, iparam_balance_amount,
			iparam_admission_id, iparam_billing_status);
			
END;
$$;

--call scrop_insert_room_admits_billing_details('2025-02-06','2025-02-11', 9, 2, 2, '2025-02-11', 'Room Charge'
	, 'Room Charges only', 1000, 'Not paid');

-- ---ensuring that the assigned room is not double-booked
-- SELECT COUNT(a.room_id) 
--     FROM room a 
-- 	inner join room_admit b using(room_id)
--     WHERE current_date between b.start_date and b.end_date
-- 	;

-- ---generate a billing record based on the room's per-day fee. select * from billing;
-- 	select ((a.end_date - a.start_date)*(b.daily_rate)) AS room_charges
-- 	from room_admit a
-- 	inner join room b using(room_id)
