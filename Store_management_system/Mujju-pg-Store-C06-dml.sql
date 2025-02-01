--Store DML(Data Manipulation Language) ASSIGNMENT
--⁠ ⁠Mujju-postgres-Store-Chapter06-dml

--Question 1: Insert Data into all Tables
--Write SQL queries to populate each table created in the Chapter 5 assignment with at least 10 rows of data.
insert into city(country_name,city_name)
values ('USA','New York'),
		('India','Hyderabad'),
		('India','Delhi'),
		('India','Mumbai'),
		('India','Banglore'),
		('UAE','Dubai'),
		('CAN','Toronto'),
		('AUS','Sydney'),
		('Poland','Warsaw'),
		('Pakistan','lahore');
--select * from city

insert into store(store_name,location,phone_number,city_id)
values ('Croma','kukatpally','12345678901',1),
		('Concu','Sainikpuri','12345678902',2),
		('Shadab','Charminar','12345678903',3),
		('Khurana','Begumpet','12345678904',4),
		('Park Hayat','Banjar Hills','12344567890',5),
		('Big Bazar','Abids','12345678905',6),
		('Zudio','IDPL','12345678906',7),
		('Reliance','Kompally','12345678907',8),
		('jio Mart','Kompally','12345678908',9),
		('Wall Mart','Kompally','12345678909',10)
;

--select * from product;
INSERT INTO product(product_name, category,price,description,sku)
values
	('Coca-Cola', 'drinks', 1.49, 'A classic cola soft drink.', 'DRINK-COCA-001'),
    ('Pepsi', 'drinks', 1.49, 'Refreshing cola beverage.', 'DRINK-PEPSI-002'),
    ('Orange Juice', 'drinks', 2.99, 'Freshly squeezed orange juice.', 'DRINK-OJ-003'),
    ('Lemonade', 'drinks', 2.49, 'Refreshing lemon drink.', 'DRINK-LEMON-004'),
    ('Green Tea', 'drinks', 1.99, 'Healthy antioxidant-rich tea.', 'DRINK-GT-005'),
	('Potato Chips', 'snacks', 1.99, 'Crispy salted chips.', 'SNACK-CHIPS-001'),
    ('Popcorn', 'snacks', 2.49, 'Buttery movie-style popcorn.', 'SNACK-POPCORN-002'),
    ('Pretzels', 'snacks', 1.79, 'Crunchy salted pretzels.', 'SNACK-PRETZELS-003'),
    ('Chocolate Bar', 'snacks', 1.49, 'Rich milk chocolate.', 'SNACK-CHOC-004'),
    ('Trail Mix', 'snacks', 3.99, 'Nut and dried fruit mix.', 'SNACK-TRAIL-005'),
	 ('Apple', 'fruits', 0.99, 'Crisp and sweet red apple.', 'FRUIT-APPLE-001'),
    ('Banana', 'fruits', 0.79, 'Fresh and ripe banana.', 'FRUIT-BANANA-002'),
    ('Orange', 'fruits', 0.89, 'Juicy and tangy orange.', 'FRUIT-ORANGE-003'),
    ('Grapes', 'fruits', 2.49, 'Seedless green grapes.', 'FRUIT-GRAPES-004'),
    ('Pineapple', 'fruits', 3.99, 'Tropical and tangy pineapple.', 'FRUIT-PINEAPPLE-005')
;

--select * from supplier;
insert into supplier(supplier_name, contact_number)
values ('Global Supplies Co.', '123-456-7890'),
    ('Fresh Produce Inc.', '234-567-8901'),
    ('Tech Parts Ltd.', '345-678-9012'),
    ('Eco Goods Supplies', '456-789-0123'),
    ('Urban Essentials', '567-890-1234'),
    ('Greenfield Supplies', '678-901-2345'),
    ('QuickFix Distributors', '789-012-3456'),
    ('Summit Industrial Supply', '890-123-4567'),
    ('Apex Wholesale', '901-234-5678'),
    ('BrightPath Logistics', '012-345-6789')
;

--select * from SUPPLIER_PRODUCT;
insert into SUPPLIER_PRODUCT(supplier_id, product_id)
values(1,1),
		(2,2),
		(3,3),
		(4,4),
		(5,5),
		(6,6),
		(7,7),
		(8,8),
		(9,9),
		(10,10)
;

--select * from inventory;
insert into inventory(store_id,product_id,quantity_in_stock,supplier_id)
values(1,1,123444,1),
		(2,2,123,2),
		(3,3,3444,3),
		(4,4,44444,4),
		(5,5,5555,5),
		(6,6,66666,6),
		(7,7,77777,7),
		(8,8,8888,8),
		(9,9,9999,9),
		(10,10,123444,10)
;

--select * from customer;
insert into customer(first_name,last_name,gender,id_type,id_number,email,phone_number,address,city_id)
values('Alice', 'Walker', 'F', 'passport', 'P123456789', 'alice.walker@example.com', '123-456-7890', '45 Maple Lane', 1),
    ('Bob', 'Johnson', 'M', 'driving license', 'DL987654321', 'bob.johnson@example.com', '234-567-8901', '12 Pine Avenue', 2),
    ('Clara', 'Smith', 'F', 'passport', 'P987654321', 'clara.smith@example.com', '345-678-9012', '78 Oak Drive', 3),
    ('David', 'Brown', 'M', 'driving license', 'DL123456789', 'david.brown@example.com', '456-789-0123', '56 Birch Street', 4),
    ('Emma', 'Taylor', 'F', 'passport', 'P112233445', 'emma.taylor@example.com', '567-890-1234', '34 Elm Road', 5),
    ('Frank', 'Williams', 'M', 'driving license', 'DL556677889', 'frank.williams@example.com', '678-901-2345', '90 Cedar Lane', 1),
    ('Grace', 'Martinez', 'F', 'passport', 'P223344556', 'grace.martinez@example.com', '789-012-3456', '12 Spruce Avenue', 2),
    ('Henry', 'Davis', 'M', 'driving license', 'DL667788990', 'henry.davis@example.com', '890-123-4567', '23 Redwood Street', 3),
    ('Isabella', 'Clark', 'F', 'passport', 'P334455667', 'isabella.clark@example.com', '901-234-5678', '78 Willow Lane', 4),
    ('Jack', 'Lee', 'M', 'driving license', 'DL778899001', 'jack.lee@example.com', '012-345-6789', '45 Redwood Avenue', 5)
;

--select * from orders;
alter table store add column quantity_in_stock int;

UPDATE store
SET quantity_in_stock = CASE store_id
WHEN 1 THEN 111
WHEN 2 THEN 222
WHEN 3 THEN 333
WHEN 4 THEN 444
WHEN 5 THEN 555
WHEN 6 THEN 666
WHEN 7 THEN 777
WHEN 8 THEN 888
WHEN 9 THEN 999
WHEN 10 THEN 1011
WHEN 11 THEN 1111
ELSE quantity_in_stock
END
WHERE store_id IN(1,2,3,4,5,6,7,8,9,10,11);

--check (order_status in ('Accepted','Packing','Ready for Delivery','Shipping','Delivered','Paid','Closed'))
insert into orders(order_date, total_amount, delivered_duration, customer_id, store_id, order_status)
values ('2025-01-15', 150.75, '02:00:00', 1, 1, 'Accepted'),
    ('2025-02-20', 85.50, '03:30:00', 2, 2, 'Packing'),
    ('2025-03-10', 230.00, '01:15:00', 3, 3, 'Delivered'),
    ('2025-04-05', 120.99, '12:15:00', 4, 4, 'Ready for Delivery'),
    ('2025-05-25', 95.00, '04:45:00', 5, 5, 'Delivered'),
    ('2025-06-12', 310.40, '02:20:00', 6, 1, 'Shipping'),
    ('2025-07-07', 50.00, '14:45:00', 7, 2, 'Paid'),
    ('2025-08-18', 200.00, '05:50:00', 8, 3, 'Closed'),
    ('2025-09-22', 175.00, '03:10:00', 9, 4, 'Delivered'),
    ('2025-10-30', 65.99, '13:13:00', 10, 5, 'Accepted')
;

--select * from order_product;
insert into order_product(order_id,product_id,units,unit_rate,total_amount)
values (1, 1, 3, 50.00, 150.00),
    (1, 2, 2, 75.00, 150.00),
    (2, 3, 5, 20.00, 100.00),
    (2, 4, 4, 30.00, 120.00),
    (3, 5, 2, 115.00, 230.00),
    (4, 6, 1, 120.99, 120.99),
    (5, 7, 3, 31.67, 95.00),
    (6, 8, 4, 77.60, 310.40),
    (7, 9, 2, 25.00, 50.00),
    (8, 10, 8, 25.00, 200.00)
;

--select * from payment
insert into payment(payment_date, amount_paid, order_id)
values ('2025-01-16', 150.00, 1),
    ('2025-02-21', 100.00, 2),
    ('2025-03-11', 230.00, 3),
    ('2025-04-06', 120.99, 4),
    ('2025-05-26', 95.00, 5),
    ('2025-06-13', 310.40, 6),
    ('2025-07-08', 50.00, 7),
    ('2025-08-19', 200.00, 8),
    ('2025-09-23', 175.00, 9),
    ('2025-10-31', 65.99, 10)
;

--select * from employee;
insert into employee(first_name, last_name, email, hire_date, salary, store_id, phone_number)
values ('John', 'Doe', 'john.doe@example.com', '2025-01-10', 55000.00, 1, '123-456-7890'),
    ('Jane', 'Smith', 'jane.smith@example.com', '2024-11-15', 48000.00, 2, '234-567-8901'),
    ('Emily', 'Johnson', 'emily.johnson@example.com', '2023-08-20', 60000.00, 3, '345-678-9012'),
    ('Michael', 'Brown', 'michael.brown@example.com', '2025-02-05', 47000.00, 4, '456-789-0123'),
    ('Sarah', 'Williams', 'sarah.williams@example.com', '2024-07-30', 52000.00, 5, '567-890-1234'),
    ('David', 'Jones', 'david.jones@example.com', '2025-03-12', 53000.00, 1, '678-901-2345'),
    ('Olivia', 'Miller', 'olivia.miller@example.com', '2024-09-10', 46000.00, 2, '789-012-3456'),
    ('James', 'Davis', 'james.davis@example.com', '2025-01-25', 56000.00, 3, '890-123-4567'),
    ('Sophia', 'Garcia', 'sophia.garcia@example.com', '2024-12-15', 54000.00, 4, '901-234-5678'),
    ('William', 'Martinez', 'william.martinez@example.com', '2025-02-28', 58000.00, 5, '012-345-6789')
;

--select * from employee_login;
insert into employee_login(employee_id, login_id, password, active_flag)
values  (1, 'john.doe123', 'encrypted_password_1', 1),
    (2, 'jane_smith@company.com', 'encrypted_password_2', 1),
    (3, 'emily.johnson@example.com', 'encrypted_password_3', 1),
    (4, 'michael_brown45', 'encrypted_password_4', 0),
    (5, 'sarah_williams2024', 'encrypted_password_5', 1),
    (6, 'david.jones1', 'encrypted_password_6', 1),
    (7, 'olivia.miller@company.com', 'encrypted_password_7', 1),
    (8, 'james_davis89', 'encrypted_password_8', 1),
    (9, 'sophia.garcia@domain.com', 'encrypted_password_9', 0),
    (10, 'william_martinez22', 'encrypted_password_10', 1)
;

--select * from discount
insert into discount(discount_code, discount_percentage)
values ('DISC10', 10),
    ('SUMMER15', 15),
    ('WINTER20', 20),
    ('HOLIDAY5', 15.35),
    ('NEWYEAR25', 25),
    ('EASTER30', 30),
    ('VIP40', 40),
    ('CLEARANCE50', 50),
    ('BACKTOSCHOOL12', 12),
    ('FLASHSALE7', 7.50)
;

--select * from audit_log;
insert into audit_log(log_date, action, employee_id)
values  ('2025-01-15', 'Logged in', 1),
    ('2025-01-16', 'Updated product details', 2),
    ('2025-01-17', 'Processed payment', 3),
    ('2025-01-18', 'Created a new order', 4),
    ('2025-01-19', 'Modified customer information', 5),
    ('2025-01-20', 'Logged out', 6),
    ('2025-01-21', 'Added new discount code', 7),
    ('2025-01-22', 'Changed order status to shipped', 8),
    ('2025-01-23', 'Deleted product from inventory', 9),
    ('2025-01-24', 'Updated employee details', 10);

--select * from return_policy;

--select * from order_discount;
insert into order_discount(order_id, discount_id)
values (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10)
;

--Question 2: Insert a New Product
--Write a DML SQL statement to insert a new product into the PRODUCT table with the following details:

--select * from product;
insert into product(product_name, category, price, description,sku)
values ('Saudi Laban','drinks',5.49,'arab drink','DRINK-LABAN-SAUDI-001');

--Question 3: Insert Multiple Customers
--Insert two new customers into the CUSTOMER table with the following details:
--First customer: first_name: 'Alice', last_name: 'Johnson', email: 'alice.johnson@example.com', phone_number: '1234567890'
--Second customer: first_name: 'Bob', last_name: 'Smith', email: 'bob.smith@example.com', phone_number: '0987654321'
--select * from customer;
insert into customer(first_name, last_name, gender, id_type, id_number, email, phone_number, address, city_id)
values('Alice','Johnson','F','passport','W0607748','alice.johnson@example.com','12345678909','74th street NYC',1),
		('Bob','Smith','M','passport','W0227748','bob.smith@example.com','0987654321','Sharjah media city',2)
;
--Question 4: Insert an Order
--Write a DML SQL statement to insert a new order into the ORDER table:
--order_date: Current date,total_amount: 1499.99,customer_id: 1
--select * from orders;
insert into orders (total_amount, delivered_duration, customer_id, store_id, order_status)
values(1499.99, '04:04:04', 1,2,'Packing');


--Question 5: Update Product Information
--Write a SQL statement to update the price and description for the product with product_id = 1.
--select * from product;
update product set price=5.00, description='Harmful to health' where product_id = 1;

--Question 6: Delete a Customer
--Write a SQL statement to delete a customer where customer_id = 2.
--select * from customer;
delete from customer where customer_id = 2 ;

--Question 7: Insert Data Using Subquery
--Write a SQL statement to insert a new order into the ORDER_PRODUCT table using a subquery 
--to get the order_id and product_id for an order placed by the customer whose email = 'alice.johnson@example.com'.
-- select * from ORDER_PRODUCT;
-- select * from customer;
-- select * from orders;

INSERT INTO ORDER_PRODUCT (order_id, product_id, units, unit_rate, total_amount)
SELECT a.order_id, 11, 4, 45.00, 180.00
FROM orders a
INNER JOIN customer b ON a.customer_id = b.customer_id
WHERE b.email = 'alice.johnson@example.com';

--Question 8: Insert into SUPPLIER Table
--Write a SQL statement to insert a new supplier into the SUPPLIER table:
--supplier_name: 'Tech Supplies Inc.',contact_number: '5551234567',product_id: 1
--select * from SUPPLIER;
insert into SUPPLIER(supplier_name, contact_number)
values('Tech Supplies Inc.','78678378666')
;

--Question 9: Update an Order's Total Amount
--Write a SQL statement to update the total_amount in the ORDER table where order_id = 1, setting it to 1599.99.
--select * from orders;
update orders set total_amount = 1599.99 where order_id = 1;

--Question 10: Delete with JOIN
--Write a SQL statement to delete all orders that include the product with product_name = 'Popcorn' 
--using a JOIN between the PRODUCT and ORDER_PRODUCT tables.
-- select * from PRODUCT
-- select * from ORDER_PRODUCT

delete from PRODUCT 
where product_name in 
(select product_name from product a
inner join ORDER_PRODUCT b ON a.product_id=b.product_id
where product_name = 'Popcorn' );

--Question 11: Insert a New Store
--Write a SQL statement to insert a new store into the STORE table:
--store_name: 'Downtown Electronics',location: 'Main Street',phone_number: '5559876543'
-- select * from store;
insert into store(store_name, location, phone_number, city_id)
values ('Downtown Electronics','Main Street','5559876543',1);

--Question 12: Insert a Payment
--Write a SQL statement to insert a new payment into the PAYMENT table for an order:
--payment_date: Current date,amount_paid: 1599.99,order_id: 1
-- select * from payment;
insert into payment(amount_paid, order_id)
values (1599.99, 1);

--Question 13: Update with Subquery
--Write a SQL statement to update the total_amount of all orders where the customer has the last name 'Johnson'. 
--Use a subquery to find the customer_id.
-- select * from customer;
-- select * from orders;

update orders set total_amount = 999.99 where customer_id in
(select a.customer_id from orders a
inner join customer b ON a.customer_id = b.customer_id
where last_name = 'Johnson');

--Question 14: Insert into INVENTORY Table
--Write a SQL statement to insert a new inventory record into the INVENTORY table:
--store_id: 1,product_id: 1,quantity_in_stock: 30
-- select * from INVENTORY;
insert into INVENTORY(store_id,product_id,quantity_in_stock,supplier_id)
values(1,1,30,1);

--Question 15: Update Store Information
--Write a SQL statement to update the store_name and location of the store with store_id = 1 to 'Tech Superstore' and 'City Center'.
-- select * from store;
update store set store_name = 'Tech Superstore', location ='City Center' where  store_id = 1;

--Question 16: Select Into Backup Table
--Write a SQL statement to create a backup of all rows in the CUSTOMER table into a new table called CUSTOMER_BACKUP.
create table CUSTOMER_BACKUP AS select * from customer;

--Question 17: Add JSON Column to PRODUCT Table
--Write a SQL statement to add a meta_data column of type JSON to the PRODUCT table.
-- select * from product;
alter table product add column meta_data jsonb;

--Question 18: Insert into JSON Column
--Write a SQL statement to insert JSON data into the meta_data column of the PRODUCT table. 
--The JSON should contain keys like "warranty_period", "brand", and "manufacture_date".
insert into product(product_name, category, price, description,sku, meta_data)
values ('Milk','drinks',3.99,'Good for health','DRINK-MILK-11',
'{"warranty_period":"15 days","brand":"Heritage","manufacture_date":"12-01-2025"}')
;
--Question 19: Update JSON Column
--Write a SQL statement to update the meta_data JSONB column of the PRODUCT table by adding or 
--updating the "warranty_period" for a specific product.
-- select * from product;
UPDATE PRODUCT
SET meta_data = jsonb_set(meta_data, '{warranty_period}', '"12 months"', true)
WHERE product_id = 1;

--Question 20: Delete JSON Data
--Write a SQL statement to remove the "manufacture_date" field from the meta_data JSON column for a specific product.
UPDATE PRODUCT
SET meta_data = meta_data - 'policy_number'
WHERE PRODUCT_ID = 17;

--Question 21: Perform an UPSERT on CUSTOMER Table
--Write a SQL statement to insert a new customer or update the email if the customer_id already exists in the CUSTOMER table.
-- select * from customer;
INSERT INTO CUSTOMER (first_name, last_name, gender, id_type, id_number, email, phone_number, address, city_id)
VALUES ('John', 'Doe', 'M', 'passport', 'A12345678', 'john.doe@example.com', '1234567890', '123 Main St', 1)
ON CONFLICT (customer_id) 
DO UPDATE SET email = EXCLUDED.email
;

--Question 22: Delete with INNER JOIN
--Write a SQL statement to delete all products in the PRODUCT table that are referenced in the SUPPLIER table by joining on product_id.
alter table supplier add column product_id int references product(product_id) ON DELETE CASCADE;
-- select * from product;
-- select * from SUPPLIER;

update supplier set product_id = 11 where supplier_id = 1;

UPDATE supplier
SET product_id = CASE supplier_id
WHEN 2 THEN 11
WHEN 3 THEN 11
WHEN 4 THEN 11
WHEN 5 THEN 11
WHEN 6 THEN 11
WHEN 7 THEN 11
WHEN 8 THEN 11
WHEN 9 THEN 11
WHEN 10 THEN 11
WHEN 11 THEN 11
ELSE product_id
END
WHERE supplier_id IN(2,3,4,5,6,7,8,9,10,11);

--select * from product;

delete from PRODUCT where product_id in 	
(select b.product_id from supplier a
inner join product b ON a.product_id=b.product_id);

--Question 23: Update with JOIN
--Write a SQL statement to update the quantity_in_stock in the INVENTORY table for all products in the 
--store with store_name = 'Tech Superstore'. Use a join between the STORE and INVENTORY tables.
-- select * from INVENTORY;
-- select * from store;

update INVENTORY set quantity_in_stock = quantity_in_stock + 111
where store_id in
(select a.store_id from store a 
inner join inventory b ON a.store_id=b.store_id
where store_name = 'Tech Superstore')
;

--Question 24: Insert a New Discount
--Write a SQL statement to insert a new discount into the DISCOUNT table:
--discount_code: 'SUMMER20',discount_percentage: 20.00
-- select * from DISCOUNT
insert into discount(discount_code, discount_percentage)
values ('SUMMER20',20.00);


--Question 25: Truncate the ORDER Table
--Write a SQL statement to truncate the ORDER table, removing all rows without generating individual delete triggers.
-- select * from orders

--Truncate table orders

--Question 26: SUPER Complex INSERT.
--Create a DATE_DIM table with columns: date_id, calendar_date, year, month, day_of_the_month, week_day_number, week_day_name, 
--yearly_week_number, month_start_date_flag, month_end_date_flag, year_start_date_flag, year_end_date_flag, holiday_flag
--The date_id should be populated in the YYYYMM format (e.g., 202401).
--Populate the DATE_DIM table with data for current year and the next year.

-- Create the DATE_DIM table
-- select * from DATE_DIM

Create table DATE_DIM (
    date_id int unique NOT NULL PRIMARY KEY, -- YYYYMM
    calendar_date DATE default current_date NOT NULL,                       
    year INT NOT NULL,
    month INT check(month in (1,2,3,4,5,6,7,8,9,10,11,12)) NOT NULL,
    day_of_the_month INT check(day_of_the_month >= 1 AND day_of_the_month <=31) NOT NULL,                    
    week_day_number INT check(week_day_number >= 1 AND week_day_number <=7) NOT NULL,
    week_day_name VARCHAR(9) 
    check(week_day_name in ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')) NOT NULL,
    yearly_week_number INT check(yearly_week_number >= 1 AND yearly_week_number <=53) NOT NULL,
    month_start_date_flag BOOLEAN NOT NULL,
    month_end_date_flag BOOLEAN NOT NULL,
    year_start_date_flag BOOLEAN NOT NULL,
    year_end_date_flag BOOLEAN NOT NULL,
    holiday_flag BOOLEAN NOT NULL
);

insert into DATE_DIM(date_id, year, month, day_of_the_month, week_day_number, week_day_name, yearly_week_number,
month_start_date_flag, month_end_date_flag, year_start_date_flag, year_end_date_flag, holiday_flag)
values(202403, 2024, 6, 22, 6, 'Sunday', 52, 'false', 'true', 'false', 'true', 'true'); 

insert into DATE_DIM(date_id, calendar_date, year, month, day_of_the_month, week_day_number, week_day_name, yearly_week_number,
month_start_date_flag, month_end_date_flag, year_start_date_flag, year_end_date_flag, holiday_flag)
values(202501, '2025-01-01', 2024, 6, 22, 6, 'Sunday', 52, 'false', 'true', 'false', 'true', 'true'); 

--select * from date_dim;

--GOOD LUCK WITH YOUR ASSIGNMENT!!!











