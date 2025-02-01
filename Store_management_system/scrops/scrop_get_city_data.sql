--select * from city;
------------------------get scrop---------------------------------
create or replace procedure scrop_get_city_data(
	 iparam_city_id int
)
language plpgsql
as $$

declare city_rec record;

BEGIN
	for city_rec in select city_name, country_name from city
	where city_id = iparam_city_id
	
	loop
		RAISE NOTICE 'City Name : %, Country Name : %', city_rec.city_name, city_rec.country_name;
	end loop;
END;
$$;

--call scrop_get_city_data(1);



