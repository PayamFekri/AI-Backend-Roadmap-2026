-- CTE
WITH each_products AS (
    SELECT name, price
    FROM shop.products_v2
    WHERE price > (SELECT AVG(price) FROM shop.products_v2)
)
SELECT * FROM each_products;

with 
active_products AS (select name , price 
                    from shop.products_v2 
                    where is_active = true), 
price_higher_than_20 AS(select name , price 
                        from active_products 
                        where price > 20)
select name , price from price_higher_than_20
ORDER BY price DESC;

WITH active_products AS (
    SELECT name, price
    FROM shop.products_v2
    WHERE is_active = true
),

avg_active_products AS (
    SELECT AVG(price) AS avg_price
    FROM active_products
)

SELECT
    p.name,
    p.price,
    a.avg_price
FROM active_products AS p
CROSS JOIN avg_active_products AS a
WHERE p.price > a.avg_price;

