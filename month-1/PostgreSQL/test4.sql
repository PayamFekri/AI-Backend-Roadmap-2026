DROP TABLE IF EXISTS shop.post_tags;
DROP TABLE IF EXISTS shop.tags;
DROP TABLE IF EXISTS shop.posts;

CREATE TABLE shop.posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE shop.tags (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE shop.post_tags (
    post_id INTEGER REFERENCES shop.posts(id) ON DELETE CASCADE,
    tag_id INTEGER REFERENCES shop.tags(id) ON DELETE CASCADE,
    PRIMARY KEY (post_id, tag_id)
);

INSERT INTO shop.posts(title) VALUES
('Learning Python'),
('PostgreSQL Basics'),
('Building APIs'),
('Backend Development');

INSERT INTO shop.tags(name) VALUES
('Python'),
('PostgreSQL'),
('APIs'),
('Backend');

INSERT INTO shop.post_tags(post_id, tag_id) VALUES
(1, 1),  -- Python -> Python
(1, 2),  -- Python -> PostgreSQL
(2, 2),  -- PostgreSQL -> PostgreSQL
(2, 3),  -- PostgreSQL -> APIs
(2, 4),  -- PostgreSQL -> Backend
(3, 1),  -- APIs -> Python
(3, 3),  -- APIs -> APIs
(4, 4);  -- Backend -> Backend

DROP TABLE IF EXISTS shop.users_v2 CASCADE; 
CREATE TABLE shop.users_v2(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

INSERT INTO shop.users_v2(username, email) VALUES
('user1', 'user1@example.com'),
('user2', 'user2@example.com'),
('user3', 'user3@example.com'),
('user4', 'user4@example.com'),
('user5', 'user5@example.com');

SELECT pt.post_id, COUNT(*) AS tag_count
FROM shop.post_tags AS pt
GROUP BY pt.post_id
ORDER BY pt.post_id;

SELECT pt.post_id, COUNT(*) AS tag_count
FROM shop.post_tags AS pt
GROUP BY pt.post_id
HAVING COUNT(*) > 2
ORDER BY pt.post_id;

/*
products_v2(id ,name, sku,
 price, stock, discount,
 is_active, description,
 created_at)
*/
SELECT name , price from shop.products_v2
WHERE price > (SELECT avg(price) from shop.products_v2);

select p.title as post_title ,
t.name as tag_name
from shop.posts as p
inner join shop.post_tags as pt 
on p.id = pt.post_id
inner join shop.tags as t
on pt.tag_id = t.id
ORDER BY p.id ASC;

select p.title as post_title ,
COUNT(pt.tag_id) as tag_count
from shop.posts as p
left join shop.post_tags as pt 
on p.id = pt.post_id
left join shop.tags as t
on pt.tag_id = t.id
group BY p.id;

select p.title ,t.name from shop.posts as p
inner join shop.post_tags as pt
on p.id = pt.post_id
inner join shop.tags as t
on pt.tag_id = t.id
order by p.id ASC;
