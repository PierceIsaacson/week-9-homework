create database if not exists social_app;

use social_app;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;

create table users (
	user_id int(11) not null auto_increment,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	password varchar(20) not null,
	date_created datetime default current_timestamp,
	primary key (user_id)
);

create table posts (
	post_id int(15) not null auto_increment,
	user_id int(11) not null,
	date_created datetime default current_timestamp,
	post varchar(250) not null,
	primary key (post_id),
	foreign key (user_id) references users(user_id)
);

create table comments (
	comment_id int(5) not null auto_increment,
	user_id int(11) not null,
	post_id int(15) not null,
	date_created datetime default current_timestamp,
	comment varchar(250) not null,
	primary key (comment_id),
	foreign key (user_id) references users(user_id),
	foreign key (post_id) references posts(post_id)
);