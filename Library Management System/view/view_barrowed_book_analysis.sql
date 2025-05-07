-- View for Barrowed Books Analysis

-- Create a view to retrieve information about loaned books, including Customer Name, 
--Book Title, Pickup Date, Due Date, Return Date, Fine, and Status.


create or replace view view_barrowed_book_analysis AS
select 
	c.first_name||' '||c.last_name
	,a.title
	,b.loan_date
	,b.due_date
	,b.return_date
	,d.fine_amount
	,case
		WHEN current_date < c.membership_expiry_date THEN 'active'
		ELSE 'deactived'
	END
from book a
inner join loan b using(book_id)
inner join members c using(member_id)
inner join fine d using(loan_id)
inner join membership_payment e using(member_id)
;


-- select * from view_barrowed_book_analysis;