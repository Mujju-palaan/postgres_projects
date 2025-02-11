--View Tasks:
--1) View for Room Information. select * from room;
--Create a view to display room details including room id, room name, daily rate and room type.
create view view_room_details AS
	select room_id, room_number, room_type, daily_rate  
	from room;

--select * from view_room_details;
