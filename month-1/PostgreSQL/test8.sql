-- Window Functions

select name,price , AVG(price) over() AS avg_price
from shop.products_v2;

select name,price,is_active,
AVG(price) over(partition by is_active) as avg_group_price
from shop.products_v2;

select name,price,
rank() over(order by price Desc) as price_rank
from shop.products_v2
order by price Desc;

select id,name,price,
SUM(price) OVER (ORDER BY id)
from shop.products_v2;

select id,name,price,
LAG(price) over(order by id) AS previous_price,
price - LAG(price) over(order by id) AS price_difference
from shop.products_v2;

select id,name,price,
LEAD(price) OVER(order by id) AS next_price
from shop.products_v2;