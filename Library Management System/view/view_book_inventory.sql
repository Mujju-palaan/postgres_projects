-- View for Book Inventory

-- Create a view to fetch book inventory details, including Branch, Title, Category, 
--Available Count, and Loaned Count.

create or replace view view_book_inventory AS
select
	b.branch_id
	,a.title
	,a.book_category_id
	,count(book_id) as book_count
	,count(loan_id)
from book a
inner join book_inventory b using(book_id)
inner join loan c using(book_id)
group by b.branch_id
	,a.title
	,a.book_category_id
;

-- select * from view_book_inventory;