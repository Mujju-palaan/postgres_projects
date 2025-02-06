---Interview Questions


select to_char(current_date, 'Day') AS DAY

select EXTRACT(year from now())

--- age
select age (now(),'1997-11-03') as my_age;
--- 1 to 50 number
select generate_series(1,50);

---1 to 50 number by 5number spacing
select generate_series(1,50,5);

-----show 50% of data
select * from doctor
order by doctor_id
limit  (select count(*)/2 from doctor);


---even number
select * from doctor
where mod(doctor_id, 2)=0;

---odd number
select * from doctor
where mod(doctor_id, 2)<>0
order by doctor_id;
