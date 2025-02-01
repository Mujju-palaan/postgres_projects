------------------------update scrop------------------------------------
create or replace procedure scrop_dml_update_city(
	IN iparam_city_id int,
	IN iparam_city_name varchar
)

language plpgsql
as $$

BEGIN
	update city set city_name = iparam_city_name
	where city_id = iparam_city_id;

END;
$$;

call scrop_dml_update_city()