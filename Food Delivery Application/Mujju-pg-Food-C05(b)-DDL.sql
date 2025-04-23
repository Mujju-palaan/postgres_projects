
/*
Question 15: Add a Column to the CUSTOMER Table
Write a SQL statement to add a loyalty_points column of type INT to the CUSTOMER table.
*/

-- ALTER TABLE CUSTOMER 
-- ADD COLUMN loyalty_points INT DEFAULT 0;

/*
Question 16: Alter a Column in the COUPON Table
Write a SQL statement to alter the coupon_code column in the COUPON table, increasing its length to 50 characters.
*/

-- ALTER TABLE COUPON 
-- ALTER COLUMN coupon_code TYPE VARCHAR(50);

/*
Question 17: Drop a Column from the DELIVERY_AGENT Table
Write a SQL statement to drop the email column from the DELIVERY_AGENT table.
*/

-- ALTER TABLE DELIVERY_AGENT  
-- DROP COLUMN email;

/*
Question 18: Rename the AUDIT_LOG Table
Write a SQL statement to rename the AUDIT_LOGS table to FOOD_OUTLET.
*/

-- ALTER TABLE AUDIT_LOG
-- RENAME TO FOOD_OUTLET;

/*
Question 19: Drop the CUSTOMER_LOGIN Table
Write a SQL statement to drop the CUSTOMER_LOGIN table.
*/

-- DROP TABLE CUSTOMER_LOGIN ;

-- CREATE TABLE CUSTOMER_LOGIN (
--     customer_id INT NOT NULL,
--     login_id VARCHAR(255) UNIQUE NOT NULL,
--     password TEXT NOT NULL,
--     active_flag SMALLINT NOT NULL CHECK (active_flag IN (0, 1)),
--     last_login_datetime TIMESTAMP,
--     FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
-- );

/*
Question 20: Add a Primary Key on the ORDER_COUPON Table
Set up a composite primary key using order_id and coupon_id.
*/

-- ALTER TABLE ORDER_COUPON  
-- ADD CONSTRAINT pk_order_coupon PRIMARY KEY (order_id, coupon_id);

/*
Question 21: Add a Foreign Key column to the ORDER Table
Add a foreign key in the ORDER table to reference the COUPON table.
*/

-- ALTER TABLE "ORDER"  
-- ADD COLUMN coupon_id INT,  
-- ADD CONSTRAINT fk_order_coupon FOREIGN KEY (coupon_id) REFERENCES COUPON(coupon_id);

/*
Question 22: Alter the REFUND Table to Add a Foreign Key
Write a SQL statement to add a order_id foreign key referencing the ORDER table.
*/

-- ALTER TABLE REFUND
-- ADD FOREIGN KEY (order_id) REFERENCES "ORDER" (order_id);


/*
Question 23: Alter the CUSTOMER_LOGIN Table to drop a Foreign Key
Write a SQL statement to add a order_id foreign key referencing the CUSTOMER table.
*/

-- ALTER TABLE CUSTOMER_LOGIN
-- ADD FOREIGN KEY (customer_id) REFERENCES CUSTOMER (customer_id);

/*
Question 24: Add a CHECK Constraint on the CUSTOMER Table
Write a SQL statement to add a CHECK constraint to the CUSTOMER table ensuring that the gender is either M or F.
*/

-- ALTER TABLE CUSTOMER  
-- ADD CONSTRAINT chk_gender CHECK (gender IN ('M', 'F'));

/*
Question 25: Add a CHECK Constraint on the REVIEW Table
Write a SQL statement to add a CHECK constraint to the REVIEW table ensuring that the rating is between 1 and 5.
*/

-- ALTER TABLE REVIEW  
-- ADD CONSTRAINT chk_rating CHECK (rating BETWEEN 1 AND 5);

/*
Question 26: Add a CHECK Constraint on the COUPON Table
Write a SQL statement to add a UNIQUE constraint to the COUPON table ensuring that the coupon_code is not repeated.
*/

-- ALTER TABLE COUPON
-- ADD UNIQUE (coupon_code);

/*
Question 27: Add a default Constraint on the DELIVERY Table
Write a SQL statement to add a current system timestamp DEFAULT constraint to the DELIVERY table on created_at column.
*/

-- ALTER TABLE DELIVERY  
-- ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;

/*
Question 28: Add Indexes to the CUSTOMER and RESTAURANT Tables
Write SQL statements to:

Add an index on the last_name column in the CUSTOMER table.
Add an index on the restaurant_name column in the RESTAURANT table.
*/

CREATE INDEX idx_restaurant_name  
ON RESTAURANT (restaurant_name);

/*
Question 29: Drop an Index from the RESTAURANT Table
Write a SQL statement to drop the index on the restaurant_name column in the FOOD_OUTLET table.
*/

DROP INDEX IF EXISTS idx_restaurant_name;

/*
Question 30: Enforce UNIQUE constraints on all applicable tables.
Apply UNIQUE constraints to columns across the entire database wherever duplicate data is not permitted.
*/
ALTER TABLE CUSTOMER
ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE COUPON
ADD CONSTRAINT unique_coupon_code UNIQUE (coupon_code);

ALTER TABLE COUPON
ADD CONSTRAINT unique_coupon_name UNIQUE (coupon_name);

ALTER TABLE RESTAURANT
ADD CONSTRAINT unique_restaurant_name UNIQUE (restaurant_name);

ALTER TABLE CUSTOMER_LOGIN
ADD CONSTRAINT unique_login_id UNIQUE (login_id);
