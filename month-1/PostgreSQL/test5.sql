DROP TABLE IF EXISTS shop.orders_demo;
CREATE TABLE shop.orders_demo(
    id serial PRIMARY KEY,
    product_id INTEGER REFERENCES shop.products_v2(id),
    quantity INTEGER check (quantity >0),
    created_at TIMESTAMP DEFAULT now() 
);

SELECT id, name, stock
FROM shop.products_v2
WHERE id = 7561;

BEGIN;

INSERT INTO shop.orders_demo(product_id, quantity)
VALUES (7561, 2);

UPDATE shop.products_v2
SET stock = stock - 2
WHERE id = 7561;

SELECT *
FROM shop.orders_demo;

SELECT id, name, stock
FROM shop.products_v2
WHERE id = 7561;

COMMIT;

SELECT *
FROM shop.orders_demo;

SELECT id, name, stock
FROM shop.products_v2
WHERE id = 7561;


BEGIN;

UPDATE shop.products_v2
SET stock = stock - 5
WHERE id = 7561;

SAVEPOINT before_second_update; 

UPDATE shop.products_v2
SET stock = stock - 10
WHERE id = 6572;

ROLLBACK TO SAVEPOINT before_second_update;

COMMIT;