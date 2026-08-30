drop table if exists shop.users;
CREATE TABLE shop.users(
    id serial PRIMARY KEY,
    id_secret uuid default gen_random_uuid() UNIQUE,
    username TEXT not null,
    email TEXT unique ,
    age INTEGER
);

drop table if exists shop.products;
create table shop.products(
    id serial PRIMARY KEY,
    name TEXT not null,
    price NUMERIC(10,2) not null,
    stock INTEGER not null,
    is_active BOOLEAN default true,
    created_at TIMESTAMP default now(),
    updated_at TIMESTAMP default now(),
    preferences JSONB
);

drop table if EXISTS shop.customers;
create table shop.customers(
    id serial PRIMARY KEY,
    username varchar(50) not null UNIQUE,
    email TEXT unique not null,
    age INTEGER constraint age_check check (age >= 18),
    balance BIGINT default 0,
    is_active BOOLEAN default true,
    created_at TIMESTAMP default now()
);



drop table if exists shop.product_types;
create table shop.product_types(
    id serial PRIMARY KEY,
    name TEXT UNIQUE,
    description TEXT,
    price numeric(10,2),
    stock BIGINT,
    is_available BOOLEAN default true,
    created_at TIMESTAMP default now(),
    metadata jsonb
);

insert into shop.product_types(name, description, price, stock, is_available, metadata) values
('Electronics', 'Devices and gadgets', 0.00, 1000, true, '{"category": "tech", "warranty": "1 year"}'),
('Clothing', 'Apparel and accessories', 0.00, 500, true, '{"category": "fashion", "return_policy": "30 days"}'),
('Books', 'Printed and digital books', 0.00, 2000, true, '{"category": "literature", "format": "digital"}');


CREATE EXTENSION IF NOT EXISTS pgcrypto;
create table shop.user_profiles (
    id uuid PRIMARY KEY default gen_random_uuid(),
    user_id uuid UNIQUE,
    bio TEXT,
    birth_year INTEGER,
    is_verified BOOLEAN default false,
    created_at TIMESTAMP default now(),
    preferences JSONB
);


insert into shop.user_profiles(user_id, bio, birth_year, is_verified, preferences) values
(gen_random_uuid(), 'I love shopping!', 1990, true, '{"theme": "dark", "notifications": true}'),
(gen_random_uuid(), 'Fashion enthusiast.', 1985, false, '{"theme": "light", "notifications": false}'),
(gen_random_uuid(), 'Tech geek.', 1995, true, '{"theme": "dark", "notifications": true}'),
(gen_random_uuid(), 'Bookworm.', 2000, false, '{"theme": "light", "notifications": true}'),
(gen_random_uuid(), 'Fitness lover.', 1988, true, '{"theme": "dark", "notifications": false}');
SELECT *
FROM shop.user_profiles;

/* 
comments:
1. The users table has a unique id_secret column that generates a random UUID for each user
2. The products table has a unique name column
3. The customers table has a unique username column
4. The product_types table has a unique name column
*/