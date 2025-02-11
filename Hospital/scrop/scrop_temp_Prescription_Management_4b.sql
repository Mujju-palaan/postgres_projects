
create or replace procedure scrop_temp_Prescription_Management_4b(
	IN iparam_prescription_ids JSON
)
language plpgsql
as $$

DECLARE last_prescription_ids int;
BEGIN
	---temp tbl select * from temp_Prescription_Management_4b , drop table temp_Prescription_Management_4b
	create temp table temp_Prescription_Management_4b(
		prescription_id int, 
		prescription_date date,
		medication_name varchar,
		medication_type varchar,
		dosage varchar,
		medicine_time varchar,
		created_at date default current_date not null
		);

	insert into temp_Prescription_Management_4b(prescription_id)
	--select
	-- SELECT ARRAY(SELECT CAST(value AS INTEGER) 
 --                 FROM jsonb_array_elements_text('["1","2","3"]'))
 --    returning prescription_id INTO last_prescription_ids;
	---CTE
	-- WITH RECURSIVE numbers AS (
 --                                SELECT 0 AS n
 --                                UNION ALL
 --                                SELECT n + 1 FROM numbers WHERE n + 1 < JSON_LENGTH(iparam_Prescription_ids)
 --                                )
 --    SELECT CAST(JSON_UNQUOTE(JSON_EXTRACT(iparam_Prescription_ids, CONCAT('$[', numbers.n, ']'))) AS UNSIGNED) AS Prescription_id
 --    FROM numbers;
 
	SELECT CAST(value AS INTEGER) AS prescription_id FROM jsonb_array_elements_text(iparam_prescription_ids::jsonb);
	-- returning prescription_id into last_prescription_ids;

	-- CTE	
	with cte AS (
		SELECT 
		    a.prescription_id, a.prescription_date, b.medication_name, b.medication_type, b.dosage,
		    CASE 
		        WHEN a.morning_flag = true THEN 'Morning'
				Else 'No Medicine'
		    END AS "medicine_time"
		FROM prescription a
		inner join medication b using(medication_id)
		where a.prescription_id = last_prescription_ids
		
		UNION ALL
		
		SELECT 
		    a.prescription_id, a.prescription_date, b.medication_name, b.medication_type, b.dosage,
		    CASE 
		        WHEN noon_flag = true THEN 'Afternoon'
				Else 'No Medicine'
		    END AS "medicine_time"
		FROM prescription a
		inner join medication b using(medication_id)
		where a.prescription_id = last_prescription_ids
		
		UNION ALL
		
		SELECT 
		    a.prescription_id, a.prescription_date, b.medication_name, b.medication_type, b.dosage,
		    CASE 
		        WHEN evening_flag = true THEN 'Evening'
				Else 'No Medicine'
		    END AS "medicine_time"
		FROM prescription a
		inner join medication b using(medication_id)
		where a.prescription_id = last_prescription_ids
	)

	-- update temp table
	-- UPDATE temp_Prescription_Management_4b aa
	-- JOIN cte bb ON aa.prescription_id = bb.prescription_id
	-- SET 
	--     aa.prescription_date = bb.prescription_date,
	--     aa.medication_name = bb.medication_name,
	--     aa.medication_type = bb.medication_type,
	--     aa.dosage = bb.dosage,
	--     aa.medicine_time = bb.medicine_time;
		



END;
$$;

call scrop_temp_Prescription_Management_4b('["1","2"]');

-------------------------------------------------------------
with cte AS (
SELECT 
    a.prescription_id, a.prescription_date, b.medication_name, b.medication_type, b.dosage,
    CASE 
        WHEN a.morning_flag = true THEN 'Morning'
		Else 'No Medicine'
    END AS "medicine_time"
FROM prescription a
inner join medication b using(medication_id)
where a.prescription_id = 2

UNION ALL

SELECT 
    a.prescription_id, a.prescription_date, b.medication_name, b.medication_type, b.dosage,
    CASE 
        WHEN noon_flag = true THEN 'Afternoon'
		Else 'No Medicine'
    END AS "medicine_time"
FROM prescription a
inner join medication b using(medication_id)
where a.prescription_id = 2

UNION ALL

SELECT 
    a.prescription_id, a.prescription_date, b.medication_name, b.medication_type, b.dosage,
    CASE 
        WHEN evening_flag = true THEN 'Evening'
		Else 'No Medicine'
    END AS "medicine_time"
FROM prescription a
inner join medication b using(medication_id)
where a.prescription_id = 2
)

-------------------------------------------
drop table rough;
create table rough(id int);

WITH RECURSIVE numbers AS (
    SELECT 1 AS n  -- Start from 1
    UNION ALL
    SELECT n + 1 FROM numbers 
    WHERE n + 1 <= (3) -- Ensure it runs up to the total count
)
INSERT INTO rough(id)
SELECT n FROM numbers;

select * from rough;






