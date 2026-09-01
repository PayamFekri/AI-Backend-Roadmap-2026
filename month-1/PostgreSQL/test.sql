drop SCHEMA if exists blog;
create schema if not exists blog;

drop SCHEMA if exists blog2;
create schema if not exists blog2;
drop SCHEMA if exists blog2;

SHOW search_path;

drop SCHEMA if exists analytics;
create schema if not exists analytics;

drop table if exists shop.customers_null_test;
create Table shop.customers_null_test(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    phone bigint,
    age integer

);

insert into shop.customers_null_test(name, email, phone, age) values
('John Doe', 'john.doe@example.com', 1234567890,NULL),
('Jane Smith', 'jane.smith@example.com',null, 25),
('Alice Johnson', 'alice.johnson@example.com', 5551234567, 35),
('Bob Brown', 'bob.brown@example.com',null, 40),
('Charlie Davis', 'charlie.davis@example.com', 5554321098, 45);


select name ,id 
from shop.customers_null_test
where phone is null;


SELECT name ,id
FROM shop.customers_null_test
WHERE phone IS NOT NULL;

SELECT name ,id
FROM shop.customers_null_test
WHERE age IS NULL;

SELECT name ,id
FROM shop.customers_null_test
WHERE age IS NOT NULL;