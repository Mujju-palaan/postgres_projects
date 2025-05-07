-- Function to Calculate Available Books in Branch

-- Write a function to calculate the total number of available copies of a specific book across all branches.
-- drop function fun_available_books
create or replace function fun_available_books(iparam_book_id int)
returns table(
	book_idd int
	,books_available bigint
)
AS $$
BEGIN
	return query
	select 
		book_id
		,count(book_id)*quantity
	from book
	inner join book_inventory using(book_id)
	group by book_id, quantity
	having book_id = iparam_book_id
	order by 1
	;

END;
$$ language plpgsql;

-- select * from fun_available_books(1);