-- View Tasks:
-- View for Member Overview
-- Create a view to display ALL valid calendar dates for membership type of a given member.

create view view_member_overview AS
select
	membership_type_id
	,membership_type
	,validity_days
from membership_type
;


select * from view_member_overview;