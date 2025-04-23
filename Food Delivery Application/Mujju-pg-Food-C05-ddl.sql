/*
Question 1: Create the CUSTOMER Table
Write a DDL SQL statement to create a CUSTOMER table with the following requirements:

customer_id as a primary key with auto-increment functionality.
first_name as a string of maximum length 255 characters, not null.
last_name as a string of maximum length 255 characters, not null.
email as a unique string, not null.
phone_number as a string, not null.
gender as a string, not null.
address as a string of maximum length 500 characters, not null.
created_at as a datetime field, default it to system timestamp, not null.
*/
CREATE TABLE CUSTOMER (
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    address VARCHAR(500) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL
);

/*
Question 2: Create the RESTAURANT Table with Constraints
Create a RESTAURANT table with the following specifications:

restaurant_id as a primary key with auto-increment functionality.
restaurant_name as a string with a maximum length of 255 characters, not null.
location as a string with a maximum length of 255 characters, null.
contact_number as a string, null.
created_at as a datetime field, default it to system timestamp, not null.
*/
CREATE TABLE RESTAURANT (
    restaurant_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    restaurant_name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    contact_number VARCHAR(50),
   created_at TIMESTAMP DEFAULT NOW() NOT NULL
);

/*
Question 3: Create the MENU_ITEM Table
Define a MENU_ITEM table with the following details:

menu_item_id as a primary key with auto-increment functionality.
item_name as a string of maximum length 255 characters, not null.
item_category as a string of maximum length 255 characters, not null.
price as a decimal with precision (10, 2), not null.
restaurant_id as a foreign key referencing the RESTAURANT table, not null.
created_at as a datetime field, default it to system timestamp, not null.
Add a CHECK constraint to ensure that the item_category is in (Desserts, Soup, Drinks, Main Course, Starter).
*/
CREATE TABLE MENU_ITEM (
    menu_item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    item_category VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    restaurant_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id),
    CONSTRAINT chk_item_category CHECK (item_category IN ('Desserts', 'Soup', 'Drinks', 'Main Course', 'Starter'))
);

/*
Question 4: Create the COUPON Table
Write a DDL SQL statement to create a COUPON table:

coupon_id as the primary key with auto-increment functionality.
coupon_code as a string, unique and not null.
coupon_name as a string, unique and not null.
discount_percentage as a decimal (5, 2), not null.
start_date as a date, not null.
end_date as a date, not null.
active_flag as a boolean, default to true, not null.
created_at as a datetime field, default it to system timestamp, not null.
Add a CHECK constraint to ensure that the discount_percentage is between 0 and 100.
*/
CREATE TABLE COUPON (
    coupon_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    coupon_code VARCHAR(255) UNIQUE NOT NULL,
    coupon_name VARCHAR(255) UNIQUE NOT NULL,
    discount_percentage DECIMAL(5,2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    active_flag BOOLEAN DEFAULT TRUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    CHECK (discount_percentage BETWEEN 0 AND 100)
);

/*
Question 5: Create the ORDER Table with a Foreign Key
Define an ORDER table:

order_id as a primary key with auto-increment functionality.
order_date as a timestamp with the default value of the current timestamp.
total_price as a decimal (10, 2), not null.
status as a string (e.g., "Pending", "Delivered", "Cancelled"), not null.
customer_id as a foreign key referencing the CUSTOMER table, not null.
*/
CREATE TABLE "ORDER" (
    order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_date TIMESTAMP DEFAULT NOW() NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);

/*
Question 6: Define the ORDER_ITEM Table
Write the SQL statement to create a many-to-many relationship between orders and menu items. This will require the ORDER_ITEM table, which includes:

order_id as a foreign key referencing the ORDER table.
menu_item_id as a foreign key referencing the MENU_ITEM table, not null.
quantity as an integer, not null.
created_at as a datetime field, default it to system timestamp, not null.
Set up a composite primary key using order_id and menu_item_id.
*/
CREATE TABLE ORDER_ITEM (
    order_id INT NOT NULL,
    menu_item_id INT NOT NULL,
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    PRIMARY KEY (order_id, menu_item_id),
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id),
    FOREIGN KEY (menu_item_id) REFERENCES MENU_ITEM(menu_item_id)
);

/*
Question 7: Define the ORDER_COUPON Table
Write the SQL statement to create a many-to-many relationship between orders and menu items. This will require the ORDER_COUPON table, which includes:

order_id as a foreign key referencing the ORDER table.
coupon_id as a foreign key referencing the COUPON table.
created_at as a datetime field, default it to system timestamp, not null.
*/
CREATE TABLE ORDER_COUPON (
    order_id INT NOT NULL,
    coupon_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
     FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id),
     FOREIGN KEY (coupon_id) REFERENCES COUPON(coupon_id)
);

/*
Question 8: Create the PAYMENT Table
Write a DDL SQL statement to create a PAYMENT table with the following details:

payment_id as the primary key with auto-increment functionality.
payment_date as a timestamp, defaulting to the current timestamp.
amount as a decimal (10, 2), not null.
discount_amount as a decimal (10, 2), null.
payment_method as a string (e.g., "Credit Card", "Cash", "Online"), not null.
order_id as a foreign key referencing the ORDER table, not null.
*/
CREATE TABLE PAYMENT (
    payment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    discount_amount DECIMAL(10,2),
    payment_method VARCHAR(50) NOT NULL,
    order_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id)
);

/*
Question 9: Create the REFUND Table with Constraints
Write a DDL SQL statement to create a REFUND table:

refund_id as a primary key with auto-increment functionality.
refund_amount as a decimal (10, 2), not null.
refund_date as a date field, not null.
order_id as a number, not null.
created_at as a datetime field, default it to system timestamp, not null.
Add a CHECK constraint to ensure the refund_amount is greater than 0.
*/
CREATE TABLE REFUND (
    refund_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    refund_amount DECIMAL(10,2) NOT NULL CHECK (refund_amount > 0),
    refund_date DATE NOT NULL,
    order_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id)
);

/*
Question 10: Create the DELIVERY_AGENT Table
Create a DELIVERY_AGENT table:

agent_id as a primary key with auto-increment functionality.
first_name as a string with a maximum length of 255 characters, not null.
last_name as a string with a maximum length of 255 characters, not null.
phone_number as a string, not null.
email as a string, not null.
vehicle_number as a string with a maximum length of 50 characters, not null.
created_at as a datetime field, default it to system timestamp, not null.
*/
CREATE TABLE DELIVERY_AGENT (
    agent_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    vehicle_number VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL
);

/*
Question 11: Define the DELIVERY Table with Relationships
Write the SQL statement to create a DELIVERY table that includes:

delivery_id as a primary key with auto-increment functionality.
delivery_date as a timestamp with the default value as the current date.
pickup_time as a time, null.
delivered_time as a time, null.
status as a string (e.g., "In Transit", "Delivered"), not null.
agent_id as a foreign key referencing the DELIVERY_AGENT table, not null.
order_id as a foreign key referencing the ORDER table.
created_at as a datetime field, not null.
*/
CREATE TABLE DELIVERY (
    delivery_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    delivery_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pickup_time TIME,
    delivered_time TIME,
    status VARCHAR(50) NOT NULL,
    agent_id INT NOT NULL,
    order_id INT NOT NULL,
   created_at TIMESTAMP DEFAULT NOW() NOT NULL,
     FOREIGN KEY (agent_id) REFERENCES DELIVERY_AGENT(agent_id),
     FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id)
);

/*
Question 12: Create the REVIEW Table
Define a REVIEW table with the following specifications:

review_id as a primary key with auto-increment functionality.
rating as an integer, not null.
review_text as a string of maximum length 500 characters, nullable.
customer_id as a foreign key referencing the CUSTOMER table, not null.
restaurant_id as a foreign key referencing the RESTAURANT table, not null.
created_at as a datetime field, default it to system timestamp, not null.
*/
CREATE TABLE REVIEW (
    review_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text VARCHAR(500),
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
     FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
     FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id)
);

/*
Question 13: Create the AUDIT_LOG Table
Define an AUDIT_LOG table to track changes in the food delivery system:

log_id as a primary key with auto-increment functionality.
log_date as a date field, not null.
action as a string to describe the action performed.
user_id as a foreign key referencing the CUSTOMER table.
*/
CREATE TABLE AUDIT_LOG (
    log_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    log_date DATE NOT NULL,
    action TEXT NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES CUSTOMER(customer_id)
);

/*
Question 14: Create the CUSTOMER_LOGIN Table
Write a DDL SQL statement to create an CUSTOMER_LOGIN table (one-to-one relationship with employee table):

customer_id as a foreign key referencing the CUSTOMER table.
login_id can use alpha numeric login id or email as login id, not null.
password must encrypt the password before storing it in the database table, not null.
active_flag use numeric, 0 or 1, you can lock the customer login when required, not null.
last_login_datetime as a timestamp, last successfull login date for a given employee.
*/
CREATE TABLE CUSTOMER_LOGIN (
    customer_id INT NOT NULL,
    login_id VARCHAR(255) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    active_flag SMALLINT NOT NULL CHECK (active_flag IN (0, 1)),
    last_login_datetime TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);


/*
Question 15: Add a Column to the CUSTOMER Table
Write a SQL statement to add a loyalty_points column of type INT to the CUSTOMER table.
*/
ALTER TABLE CUSTOMER 
ADD COLUMN loyalty_points INT DEFAULT 0;

/*
Question 16: Alter a Column in the COUPON Table
Write a SQL statement to alter the coupon_code column in the COUPON table, increasing its length to 50 characters.
*/
ALTER TABLE COUPON 
ALTER COLUMN coupon_code TYPE VARCHAR(50);

/*
Question 17: Drop a Column from the DELIVERY_AGENT Table
Write a SQL statement to drop the email column from the DELIVERY_AGENT table.
*/
ALTER TABLE DELIVERY_AGENT  
DROP COLUMN email;

/*
Question 18: Rename the AUDIT_LOG Table
Write a SQL statement to rename the AUDIT_LOGS table to FOOD_OUTLET.
*/
ALTER TABLE AUDIT_LOG
RENAME TO FOOD_OUTLET;

/*
Question 19: Drop the CUSTOMER_LOGIN Table
Write a SQL statement to drop the CUSTOMER_LOGIN table.
*/
DROP TABLE CUSTOMER_LOGIN ;

CREATE TABLE CUSTOMER_LOGIN (
    customer_id INT NOT NULL,
    login_id VARCHAR(255) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    active_flag SMALLINT NOT NULL CHECK (active_flag IN (0, 1)),
    last_login_datetime TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);

/*
Question 20: Add a Primary Key on the ORDER_COUPON Table
Set up a composite primary key using order_id and coupon_id.
*/
ALTER TABLE ORDER_COUPON  
ADD CONSTRAINT pk_order_coupon PRIMARY KEY (order_id, coupon_id);

/*
Question 21: Add a Foreign Key column to the ORDER Table
Add a foreign key in the ORDER table to reference the COUPON table.
*/
ALTER TABLE "ORDER"  
ADD COLUMN coupon_id INT,  
ADD CONSTRAINT fk_order_coupon FOREIGN KEY (coupon_id) REFERENCES COUPON(coupon_id);

/*
Question 22: Alter the REFUND Table to Add a Foreign Key
Write a SQL statement to add a order_id foreign key referencing the ORDER table.
*/
ALTER TABLE REFUND
ADD FOREIGN KEY (order_id) REFERENCES "ORDER" (order_id);


/*
Question 23: Alter the CUSTOMER_LOGIN Table to drop a Foreign Key
Write a SQL statement to add a order_id foreign key referencing the CUSTOMER table.
*/
ALTER TABLE CUSTOMER_LOGIN
ADD FOREIGN KEY (customer_id) REFERENCES CUSTOMER (customer_id);

/*
Question 24: Add a CHECK Constraint on the CUSTOMER Table
Write a SQL statement to add a CHECK constraint to the CUSTOMER table ensuring that the gender is either M or F.
*/
ALTER TABLE CUSTOMER  
ADD CONSTRAINT chk_gender CHECK (gender IN ('M', 'F'));

/*
Question 25: Add a CHECK Constraint on the REVIEW Table
Write a SQL statement to add a CHECK constraint to the REVIEW table ensuring that the rating is between 1 and 5.
*/
ALTER TABLE REVIEW  
ADD CONSTRAINT chk_rating CHECK (rating BETWEEN 1 AND 5);

/*
Question 26: Add a CHECK Constraint on the COUPON Table
Write a SQL statement to add a UNIQUE constraint to the COUPON table ensuring that the coupon_code is not repeated.
*/
ALTER TABLE COUPON
ADD UNIQUE (coupon_code);

/*
Question 27: Add a default Constraint on the DELIVERY Table
Write a SQL statement to add a current system timestamp DEFAULT constraint to the DELIVERY table on created_at column.
*/
ALTER TABLE DELIVERY  
ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;

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
