-- Question 1: Create the CUSTOMER Table
-- Write a DDL SQL statement to create a CUSTOMER table with the following requirements:

CREATE TABLE CUSTOMER (
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    address VARCHAR(500) NOT NULL,
	loyalty_points int, 
    created_at TIMESTAMP DEFAULT current_TIMESTAMP NOT NULL
);


-- Question 2: Create the RESTAURANT Table with Constraints
-- Create a RESTAURANT table with the following specifications:

CREATE TABLE RESTAURANT (
    restaurant_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    restaurant_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    contact_number VARCHAR(50),
   created_at TIMESTAMP DEFAULT current_TIMESTAMP NOT NULL
);


-- Question 3: Create the MENU_ITEM Table
-- Define a MENU_ITEM table with the following details:

CREATE TABLE MENU_ITEM (
    menu_item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    item_category VARCHAR(255) CHECK (item_category IN ('Desserts', 'Soup', 'Drinks', 'Main Course', 'Starter')) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    restaurant_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT current_TIMESTAMP NOT NULL,
    FOREIGN KEY(restaurant_id) REFERENCES RESTAURANT(restaurant_id)
);


-- Question 4: Create the COUPON Table
-- Write a DDL SQL statement to create a COUPON table:

CREATE TABLE COUPON (
    coupon_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    coupon_code VARCHAR(255) UNIQUE NOT NULL,
    coupon_name VARCHAR(255) UNIQUE NOT NULL,
    discount_percentage DECIMAL(5,2) CHECK (discount_percentage BETWEEN 0 AND 100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    active_flag BOOLEAN DEFAULT TRUE NOT NULL,
    created_at TIMESTAMP DEFAULT current_TIMESTAMP NOT NULL  
);


-- Question 5: Create the ORDER Table with a Foreign Key
-- Define an ORDER table:

CREATE TABLE "ORDER" (
    order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_date TIMESTAMP DEFAULT current_TIMESTAMP NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) check (status in ('Pending','Delivered','Cancelled')) NOT NULL,
    customer_id INT,
	coupon_id int ,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
	FOREIGN KEY (coupon_id) REFERENCES coupon(coupon_id)
);
-- insert into  "ORDER"(order_date, total_price, status, customer_id, coupon_id)
-- values(current_date, 5, 'Pending', 1, NULL);

-- Question 6: Define the ORDER_ITEM Table
-- Write the SQL statement to create a many-to-many relationship between orders and menu items. This will require the ORDER_ITEM table, which includes:

CREATE TABLE ORDER_ITEM (
    order_id INT NOT NULL,
    menu_item_id INT NOT NULL,
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT current_timestamp NOT NULL,
    PRIMARY KEY (order_id, menu_item_id),
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id),
    FOREIGN KEY (menu_item_id) REFERENCES MENU_ITEM(menu_item_id)
);


-- Question 7: Define the ORDER_COUPON Table
-- Write the SQL statement to create a many-to-many relationship between orders and menu items. This will require the ORDER_COUPON table, which includes:

CREATE TABLE ORDER_COUPON (
    order_id INT NOT NULL,
    coupon_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT current_timestamp NOT NULL,
     FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id),
     FOREIGN KEY (coupon_id) REFERENCES COUPON(coupon_id)
);


-- Question 8: Create the PAYMENT Table
-- Write a DDL SQL statement to create a PAYMENT table with the following details:

CREATE TABLE PAYMENT (
    payment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    discount_amount DECIMAL(10,2),
    payment_method VARCHAR(50) Check (payment_method in ('Credit Card', 'Cash', 'Online')) NOT NULL,
    order_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id)
);


-- Question 9: Create the REFUND Table with Constraints
-- Write a DDL SQL statement to create a REFUND table:

CREATE TABLE REFUND (
    refund_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    refund_amount DECIMAL(10,2) CHECK (refund_amount > 0) NOT NULL,
    refund_date DATE NOT NULL,
    order_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT current_timestamp NOT NULL,
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id)
);


-- Question 10: Create the DELIVERY_AGENT Table
-- Create a DELIVERY_AGENT table:

CREATE TABLE DELIVERY_AGENT (
    agent_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    vehicle_number VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT current_timestamp NOT NULL
);


-- Question 11: Define the DELIVERY Table with Relationships
-- Write the SQL statement to create a DELIVERY table that includes:

	CREATE TABLE DELIVERY (
    delivery_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    delivery_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pickup_time TIME,
    delivered_time TIME,
    status VARCHAR(50) check(status in ('In Transit','Delivered')) NOT NULL,
    agent_id INT NOT NULL,
    order_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    FOREIGN KEY (agent_id) REFERENCES DELIVERY_AGENT(agent_id),
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id)
);


-- Question 12: Create the REVIEW Table
-- Define a REVIEW table with the following specifications:

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


-- Question 13: Create the AUDIT_LOG Table
-- Define an AUDIT_LOG table to track changes in the food delivery system:

	CREATE TABLE AUDIT_LOG (
    log_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    log_date DATE NOT NULL,
    action TEXT NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES CUSTOMER(customer_id)
);


-- Question 14: Create the CUSTOMER_LOGIN Table
-- Write a DDL SQL statement to create an CUSTOMER_LOGIN table (one-to-one relationship with employee table):

CREATE TABLE CUSTOMER_LOGIN (
    customer_id INT NOT NULL,
    login_id VARCHAR(255) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    active_flag SMALLINT NOT NULL CHECK (active_flag IN (0, 1)),
    last_login_datetime TIMESTAMP default current_timestamp,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);

