-- Mujju-pg-Bank-C07(a)-DQL 

--DQL practice
SELECT CONCAT(UPPER(first_name), ' ', LOWER(last_name)) AS full_name
FROM customer;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
ORDER BY full_name;

--IN
select * from city
SELECT customer_id, first_name ||' '|| last_name, city_name
FROM customer c
join city ci on c.city_id=ci.city_id
WHERE city_name IN ('New York', 'Los Angeles', 'Chicago');

--IN
select * from account
SELECT transaction_id, amount, transaction_date
FROM transaction
WHERE account_id IN (SELECT account_id 
                      FROM account 
                      WHERE balance IN ('1000', '5000'));

--NOT IN
SELECT customer_id, first_name||' '|| last_name as customer_name
FROM customer
WHERE customer_id NOT IN (SELECT customer_id FROM account);

select * from transaction;
SELECT transaction_id, account_id 
FROM transaction
WHERE account_id NOT IN (1, 2, 3);

---IS NULL Operator

SELECT account_id, balance 
FROM account
WHERE balance IS NULL;

SELECT account_id, account_type 
FROM account
WHERE balance IS NOT NULL;

----AND OR
SELECT transaction_id, account_id, transaction_date, amount, transaction_type
FROM transaction
WHERE (transaction_type = 'debit' AND amount > 500)
OR (transaction_type = 'credit' AND transaction_date > '2024-01-01');

SELECT account_type 
FROM account
WHERE account_type LIKE 'c%';


SELECT email 
FROM customer 
WHERE email iLIKE '%@email.com';

SELECT first_name
FROM customer 
WHERE first_name LIKE 'Joh\_%' ESCAPE '\';

SELECT * FROM customer
WHERE first_name NOT LIKE 'john%';  -- Case-sensitive
SELECT * FROM customer
WHERE first_name NOT ILIKE 'john%'; -- Case-insensitive

SELECT * FROM TRANSACTION
SELECT transaction_id, SUM(amount) AS total_spent
FROM transaction
GROUP BY transaction_id
order by 2 desc

SELECT transaction_id, transaction_date, SUM(amount) AS total_spent
FROM transaction
GROUP BY transaction_id, transaction_date;

SELECT transaction_id, SUM(amount) AS total_spent
FROM transaction
GROUP BY transaction_id
HAVING SUM(amount) > 500;

SELECT transaction_id, SUM(amount) AS total_amount
FROM transaction
GROUP BY transaction_id
HAVING SUM(amount) > 400;


SELECT
    transaction_id,
    amount,
    CASE
        WHEN amount > 500 THEN 'Large Transaction'
        ELSE 'Small Transaction'
    END AS transaction_size
FROM transaction;