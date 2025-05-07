-- Stored Procedure for Book Returns
-- Write a stored procedure to update the book return information.

create or replace procedure scrop_book_return(
	IN iparam_loan_id int
)
AS $$

DECLARE d_loan_date date;
BEGIN
	select loan_date 
	into d_loan_date
	from loan
	where loan_id = iparam_loan_id
	;

	--- update  select * from loan
	update loan
	set return_date = d_loan_date + interval '1 month'
	where loan_id = iparam_loan_id
	;
	
END;
$$ language plpgsql;

-- call scrop_book_return(1);