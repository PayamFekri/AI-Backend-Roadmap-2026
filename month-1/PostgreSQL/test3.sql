drop table if EXISTS shop.users_v2 cascade; 
create table shop.users_v2(
    id serial primary key,
    username text NOT NULL,
    email text NOT NULL UNIQUE
);

insert into shop.users_v2(username,email) values
('user1', 'user1@example.com'),
('user2', 'user2@example.com'),
('user3', 'user3@example.com'),
('user4', 'user4@example.com'),
('user5', 'user5@example.com');



drop table if EXISTS shop.posts cascade;
create table shop.posts(
    id serial primary key,
    user_id INTEGER REFERENCES shop.users_v2(id) ON DELETE CASCADE,
    title text NOT NULL,
    content TEXT
);

insert into shop.posts(user_id,title,content) values
(1,'Post 1','Content for Post 1'),
(2,'Post 2','Content for Post 2'),
(4,'Post 3','Content for Post 3'),
(4,'Post 4','Content for Post 4'),
(1,'Post 5','Content for Post 5'),
(2,'Post 6','Content for Post 6'),
(2,'Post 7','Content for Post 7'),
(4,'Post 8','Content for Post 8'),
(1,'Post 9','Content for Post 9'),
(2,'Post 10','Content for Post 10'),
(3,'Post 11','Content for Post 11'),
(3,'Post 12','Content for Post 12');

select u.username , p.title , p.user_id from shop.users_v2 as u 
inner join shop.posts as p
on u.id = p.user_id
order by p.id ASC;

select u.username , p.title from shop.users_v2 as u
left join shop.posts as p
on u.id = p.user_id;

select u.username , p.title FROM shop.users_v2 as u
left join shop.posts as p
on u.id = p.user_id
where p.id IS NULL;

select id , title , user_id from shop.posts
where user_id = 1;

select id , title , user_id from shop.posts
where user_id = 2;