-- Stored Procedure for Book Details
-- Write a stored procedure to retrieve all book details, including title, author, and isbn, 
--for the Book Management screen’s data grid.

create or replace function fun_get_book_details()
returns table(
	book_id int
	,title varchar
	,author varchar
	,isbn varchar
)
AS $$

BEGIN
	return query
	
	select 
		a.book_id
		,a.title
		,(b.first_name||' '||b.last_name)::varchar as author
		,a.isbn
	from book a
	inner join book_author aa using(book_id)
	inner join author b using(author_id)
	;

END;
$$ language plpgsql;

-- select * from  fun_get_book_details()