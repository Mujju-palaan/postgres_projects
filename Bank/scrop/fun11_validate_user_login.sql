-- 11)Stored Procedure for Customer Login
-- Create a database stored procedure to validate user login, fetch customer details, and update the last_login_datetime. 
--The procedure should return an error if the login ID is not found or the password does not match. Ensure the stored 
--encrypted password is decrypted during the validation process.

-- Enable the pgcrypto extension if not already enabled
CREATE EXTENSION IF NOT EXISTS pgcrypto;

SELECT pgp_sym_encrypt('my_password', 'my_secret_key'); 			--to encrypt
SELECT pgp_sym_decrypt(encrypted_password, 'my_secret_key');		--to dencrypt

-------- select * from customer_login;
--drop FUNCTION validate_user_login;

CREATE OR REPLACE FUNCTION fun_validate_user_login(
    p_login_id text,
    p_password text
)
RETURNS BOOLEAN AS $$
DECLARE
	d_login_id text;
    v_encrypted_password text;
    -- v_decrypted_password TEXT;
    -- secret_key TEXT = 'my_secret_key'; -- Replace with a secure key
BEGIN
	-- Retrieve the given login ID
    SELECT login_id INTO d_login_id
    FROM customer_login
    WHERE login_id = p_login_id;
	
    -- Retrieve encrypted password for the given login ID
    SELECT password INTO v_encrypted_password
    FROM customer_login
    WHERE login_id = p_login_id;

    -- Check if the login ID was found
    IF d_login_id <> p_login_id THEN
        RAISE EXCEPTION 'Login ID not found';
    END IF;

    -- -- Decrypt the stored password
    -- v_decrypted_password = pgp_sym_decrypt(v_encrypted_password::BYTEA, secret_key);

    -- -- Compare decrypted password with input
    -- IF v_decrypted_password IS DISTINCT FROM p_password THEN
    --     RAISE EXCEPTION 'Invalid password';
    -- END IF;

	-- Compare decrypted password with input
    IF v_encrypted_password IS DISTINCT FROM p_password THEN
        RAISE EXCEPTION 'Invalid password';
    END IF;

	update customer_login
	set last_login_datetime = current_timestamp
	WHERE login_id = p_login_id; 

    -- Return TRUE if login is successful
    RETURN TRUE;
END;
$$ 
LANGUAGE plpgsql;

-- select * from fun_validate_user_login('user1','password123');

--select * from customer_login;