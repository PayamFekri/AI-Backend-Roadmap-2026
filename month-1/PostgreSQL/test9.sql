-- Functions
DROP FUNCTION IF EXISTS multiply_numbers(INTEGER,INTEGER);
create function multiply_numbers(a integer , b integer)
returns integer
LANGUAGE SQL
AS $$
    select a*b;
$$;
SELECT multiply_numbers(5, 6);

DROP FUNCTION IF EXISTS get_product_name(INTEGER);
create function get_product_name(product_id integer)
returns Text
LANGUAGE SQL
AS $$
    select name FROM shop.products_v2
    WHERE id = product_id;
$$;
SELECT get_product_name(8);


DROP FUNCTION IF EXISTS calculate_final_price(NUMERIC, NUMERIC);
create function calculate_final_price(price_in NUMERIC , discount_in NUMERIC)
returns NUMERIC
LANGUAGE SQL
AS $$
select  price_in - (price_in * discount_in / 100) AS final_price
$$;
SELECT calculate_final_price(77.99, 20.01);

SELECT
    name,
    price,
    discount,
    calculate_final_price(price, discount) AS final_price
FROM shop.products_v2;


DROP FUNCTION IF EXISTS get_product_price(INTEGER);
CREATE FUNCTION get_product_price(product_id INTEGER)
RETURNS NUMERIC
LANGUAGE SQL
AS $$
    SELECT price
    FROM shop.products_v2
    WHERE id = product_id;
$$;
SELECT get_product_price(8);


DROP FUNCTION IF EXISTS get_product(INTEGER);
CREATE FUNCTION get_product(
    product_id INTEGER
)
RETURNS TABLE (
    name TEXT,
    price NUMERIC
)
LANGUAGE SQL
AS $$
    SELECT name, price
    FROM shop.products_v2
    WHERE id = product_id;
$$;
SELECT *
FROM get_product(8);

DROP FUNCTION IF EXISTS get_stock_status(INTEGER,INTEGER);
CREATE FUNCTION get_stock_status(
    product_id INTEGER
)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    product_stock BIGINT;
BEGIN

    SELECT stock
    INTO product_stock
    FROM shop.products_v2
    WHERE id = product_id;

    IF product_stock > 0 THEN
        RETURN 'Available';
    ELSE
        RETURN 'Out of Stock';
    END IF;

END;
$$;
SELECT get_stock_status(8);

DROP FUNCTION IF EXISTS calculate_discounted_price(NUMERIC, NUMERIC);
create function calculate_discounted_price(
    price NUMERIC,
    discount NUMERIC
)
RETURNS  NUMERIC
LANGUAGE plpgsql
AS $$
Declare
    final_price NUMERIC;
Begin
    final_price := price - (price * discount / 100);
    RETURN final_price;
End;
$$;
SELECT calculate_discounted_price(200.87,12.93);

DROP FUNCTION IF EXISTS check_stock(INTEGER);
create function check_stock(
    product_id INTEGER
)
returns TEXT 
Language plpgsql
AS $$
DECLARE 
    stock_catches integer;
begin
    select stock into stock_catches 
    from shop.products_v2
    where id = product_id;

    if stock_catches > 0 then 
        return 'Available';
    else 
        return 'Out of Stock';
    end if;
end;
$$;
select check_stock(8);