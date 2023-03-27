create table members (
id varchar2(100) primary key,
pw varchar2(100) not null,
name varchar2(100) not null,
phonenum varchar2(100) not null,
class_name varchar2(100) not null
);

select * from members;

drop table members;

select * from user_tables;

select * from board_posts;

select * from vote_options;

create table votes (
vote_num number(5) primary key,
vote_title varchar2(100) not null,
overlap varchar2(100),
anonymous varchar2(100),
id varchar2(100),
foreign key(id) references members(id)
);

create table vote_options (
vote_num number(5), 
foreign key(vote_num) references votes(vote_num),
vote_cotent varchar2(100),
id varchar2(100) not null,
result varchar2(100) not null
);