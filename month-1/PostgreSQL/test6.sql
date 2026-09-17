create index idx_products_price
on shop.products_v2(price);

EXPLAIN ANALYZE
SELECT *
FROM shop.products_v2
WHERE price = 49.99;

-- composite index
create index idx_products_price_category
on shop.products_v2(price, category);

EXPLAIN
SELECT *
FROM shop.products_v2
WHERE is_active = true;

EXPLAIN
SELECT *
FROM shop.products_v2
WHERE is_active = true
AND price > 20;