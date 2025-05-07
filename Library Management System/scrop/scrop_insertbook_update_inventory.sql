-- Stored Procedure for Book Inventory
-- Write a stored procedure to insert new book records into the Book table and update the 
--BOOK_INVENTORY table accordingly.

create or replace procedure scrop_insertbook_update_inventory(
	IN iparam_title varchar
	,IN iparam_publication_year bigint
	,IN iparam_publisher_id int
	,IN iparam_isbn varchar
	,IN iparam_book_category_id int
)
AS $$

DECLARE
BEGIN
	--- insert select * from book
	insert into book(title, publication_year, publisher_id, isbn, book_category_id)
	values(iparam_title, iparam_publication_year, iparam_publisher_id, iparam_isbn,
			iparam_book_category_id)
	;

	-- ---update  select * from book_inventory
	-- update book_inventory
	-- set 

END;
$$ language plpgsql;


-- CALL scrop_insertbook_update_inventory(
-- 	'Mujju'			-- <IN iparam_title character varying>,
-- 	,2025			-- <IN iparam_publication_year  integer>,
-- 	,1			-- <IN iparam_publisher_id  integer>,
-- 	,'7867866'			-- <IN iparam_isbn  character varying>,
-- 	,1			-- <IN iparam_book_category_id  integer>
-- );








