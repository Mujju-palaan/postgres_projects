-- View for Publisher Inventory

-- Create a view to retrieve publisher inventory, including Publisher, Book Category, Title, and Book Count.

create view view_publisher AS
select 
	a.publisher_id
	,a.publisher_name
	,c.quantity
	,d.category_name
	,b.title
	,count(c.book_id) as book_count
from publisher a
inner join book b using(publisher_id)
inner join book_inventory c using(book_id)
inner join book_category d using(book_category_id)
group by a.publisher_id
	,a.publisher_name
	,c.quantity
	,d.category_name
	,b.title
;

-- select * from view_publisher;
