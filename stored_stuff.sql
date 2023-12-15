SELECT * from payment

-- let's go ahead and make a procedure!

CREATE PROCEDURE pw136_late_fee ()

-- python example:
-- def pw136_late_fee():

CREATE OR REPLACE PROCEDURE pw136_late_fee (
    pay_id INTEGER,
    late_fee_amount NUMERIC(5,2)
)
LANGUAGE plpgsql -- Programming Language PostgreSQL
AS $$
BEGIN
    -- this is our code block
    UPDATE payment
    SET amount = amount + late_fee_amount
    WHERE payment_id = pay_id;

    COMMIT;

END
$$;

CREATE OR REPLACE PROCEDURE -- ALSO completely valid, will re-define it it exists

SELECT * from payment

-- SYNTAX:
CALL pw136_late_fee(<payment_id>, <amount>)


CALL pw136_late_fee(18499, 16.58)

SELECT *
from payment
where payment_id=18499

SELECT * from actor
ORDER BY actor_id DESC

-- Now time to create a stored function!

-- syntax
CREATE OR REPLACE FUNCTION pw136_add_actor()

CREATE OR REPLACE FUNCTION pw136_add_actor(
    a_id INTEGER,
    f_n VARCHAR(50),
    l_n VARCHAR(50)
)
RETURNS VOID
LANGUAGE plpgsql
AS 
$MAIN$
BEGIN
    INSERT INTO actor(actor_id, first_name, last_name, last_update)
    VALUES (a_id, f_n, l_n, NOW()::TIMESTAMP);

END
$MAIN$;



SELECT * from actor
ORDER BY actor_id DESC

SELECT pw136_add_actor(1450, 'Chadwick', 'Boseman')

DROP FUNCTION pw136_add_actor();

DROP PROCEDURE pw136_late_fee();