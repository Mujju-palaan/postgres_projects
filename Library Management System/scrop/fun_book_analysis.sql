-- Stored Procedure for Book Returns

-- Write a stored procedure to retrieve a popular book analysis, 
--including branch, book title, author, number of times loaned, female borrower count,
--male borrower count, inventory count, and the number of idle days the book spent in the library.

create or replace function fun_book_analysis(iparam_book_id int)
returns table(
	book_id int
	,branch_id int
	,title varchar
	,author text
	,no_of_time_loaned int
	,f_borrow_count int
	,m_borrow_count int
	,inventory_count int
	,idle_days_in_library text
)
as $$

DECLARE d_male int;
		d_female int;
BEGIN
	select count(gender)
	into d_male
	from members
	where gender = 'M'
	;
	
	select count(gender)
	into d_female
	from members
	where gender = 'F'
	;

	----------------
	return query
	select 
		a.book_id
		,c.branch_id
		,a.title
		,b.first_name||' '||b.last_name
		,(count(d.loan_id))::int
		,d_female
		,d_male
		,c.quantity as inventory_count
		,(c.created_at - d.loan_date)::text
	
	from book a
	inner join book_author aa using(book_id)
	inner join author b using(author_id)
	inner join book_inventory c using(book_id)
	inner join loan d using(book_id)
		where a.book_id = iparam_book_id
	group by a.book_id
		,c.branch_id
		,a.title
		,b.first_name||' '||b.last_name
		,c.quantity
		,(c.created_at - d.loan_date)
	;

END;
$$ language plpgsql;

-- select * from fun_book_analysis(1);