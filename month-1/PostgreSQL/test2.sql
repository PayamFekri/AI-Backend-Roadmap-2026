drop table if EXISTS shop.products_v2;
create table shop.products_v2(
    id SERIAL PRIMARY KEY,
    name TEXT not null,
    sku TEXT UNIQUE,
    price numeric(10,2) check (price >= 0),
    stock BIGINT check (stock >= 0),
    discount INTEGER check (discount >= 0 and discount <= 100),
    is_active BOOLEAN DEFAULT true,
    description TEXT,
    created_at TIMESTAMP DEFAULT now()
);


INSERT INTO shop.products_v2(id ,name, sku, price, stock, discount, is_active, description, created_at) values
(7561, '12Product A', 'SKU001', 19.99, 100, 10, true, 'Description for Product A', DEFAULT),
(6572, 'Product B', 'ghSKU002', 29.99, 50, 0, true, 'Description for Product B', DEFAULT),
(3333, 'Product C', 'SKU003', 9.99, 200, 5, false, 'Description for Product C', '2020-08-31 10:21:34.017051'),
(3334, 'pip Product D', 'SKU00445', 49.99, 30, 15, true, 'Description for Product D', DEFAULT),
(5, 'product E', 'SKU005', 14.99, 150, 0, false, 'Description for Product E', '2020-05-12 10:21:34.017051');

CREATE INDEX idx_products_active_price
ON shop.products_v2(is_active, price);

EXPLAIN ANALYZE
SELECT name, price
FROM shop.products_v2
WHERE is_active = true
ORDER BY price;

EXPLAIN ANALYZE
SELECT *
FROM shop.products_v2
WHERE is_active = true
AND price > 20
ORDER BY price;

--products_v2(id ,
-- name, sku, price,
-- stock, discount, is_active,
-- description, created_at)
select 
count(p.id) as total_products,
avg (p.price) as average_price,
min(p.price) as minimum_price,
max(p.price) as maximum_price,
sum(p.stock) as total_stock
from shop.products_v2 as p;

delete from shop.products_v2 
where id = 5
RETURNING id,name,sku,price;

SELECT id,name,price from shop.products_v2;

update shop.products_v2
set price = price * (1 - discount / 100.0),
stock=45
where id = 3333
returning id, name, price, stock;

-- Query 1
select name , price from shop.products_v2
order by price desc
limit 3;

-- Query 2
select name , price from shop.products_v2
order by price desc
limit 2 offset 2; 

select id, name, price, stock
from shop.products_v2
where is_active 
AND price > 15
order by price ASC;

select name,price,stock from shop.products_v2
where name LIKE 'Product%';

select name,price,stock from shop.products_v2
where name iLIKE 'Product%';

select name,price,stock,sku from shop.products_v2
where sku iLIKE 'SKU00_';

select  name,price,stock
from shop.products_v2
where price > 20;

select  name,price,stock
from shop.products_v2
where price > 20 and stock < 100;


select  name,price,stock
from shop.products_v2
where is_active = true and discount = 0;

select id, name ,price as gheymat 
from shop.products_v2;

select name as product_name,
price as gheymat,
stock as mojood
from shop.products_v2 ;

select name , price FROM shop.products_v2
where id = 3 ;