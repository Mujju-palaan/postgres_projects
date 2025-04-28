-- Stored Procedure for Supplier Management
-- Create a stored procedure to update supplier information for the Supplier Management screen.
-- select * from supplier

create or replace procedure scrop_update_supplier_info(
	IN iparam_supplier_id int
	,IN iparam_supplier_name varchar
)
as $$

BEGIN 
	--update
	update supplier
	set supplier_name = iparam_supplier_name
	where supplier_id = iparam_supplier_id
	;
	
END;
$$ language plpgsql;

-- call scrop_update_supplier_info(1, 'mujjuu');