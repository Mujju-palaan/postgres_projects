
------------------------delete scrop------------------------------------
create or replace procedure scrop_dml_delete_city_data(
	in iparam_city_id int
)
language plpgsql
as $$

BEGIN
	----delete data
	delete from city where city_id =  iparam_city_id;

END;
$$;

--call scrop_dml_delete_city_data(14);
