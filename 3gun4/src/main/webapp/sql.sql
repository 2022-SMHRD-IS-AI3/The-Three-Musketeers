create table members (
id varchar2(100) primary key,
pw varchar2(100) not null,
name varchar2(100) not null,
phonenum varchar2(100) not null,
class_name varchar2(100) not null
);

select * from members;

drop table members;


create table board_posts(
board_num number primary key,
board_title varchar2(100) not null,
board_content varchar2(100) not null,
board_photo varchar2(100),
board_datetime date not null,
category varchar2(100),
id varchar2(100),
constraint id2 foreign key(id) references members(id)
);

select * from board_posts where board_num = 1;

drop table board_posts;
commit;

CREATE SEQUENCE board_posts_num
start with 1
increment by 1;

drop sequence board_posts_num;

select * from board_posts;

create table board_comments(
com_num number primary key,
board_num number,
com_content varchar2(100),
com_datetime date not null,
id varchar2(100),
constraint id3 foreign key(id) references members(id),
constraint board_num2 foreign key(board_num) references board_posts(board_num)
);

CREATE SEQUENCE board_comments_num
start with 1
increment by 1;

select * from BOARD_COMMENTS;












select * from user_tables;


select * from VOTES;

create table votes(
vote_num number(5) primary key,
vote_title varchar2(100) not null,
overlap varchar2(100),
anonymous varchar2(100),
id_vote varchar2(100),
constraint id_vote_fk foreign key(id_vote) references members(id)
);




select * from BOARD_POSTS;

drop table vote_options;

select * from user_tables;

select * from board_posts;

select * from votes;

create table votes (
vote_num number(5) primary key,
vote_title varchar2(100) not null,
sdate DATE NULL DEFAULT NULL,
edate DATE NULL DEFAULT NULL,
wdate DATE NULL DEFAULT NULL,
overlap SMALLINT(6) NULL DEFAULT '1',
actvie SMALLINT(6) NULL DEFAULT '1', 
id varchar2(100),
foreign key(id) references members(id)
);

create table vote_options (
vote_list number(5) not null,
vote_num number(5) NOT NULL DEFAULT '0',, 
foreign key(vote_num) references votes(vote_num),
vote_cotent varchar2(100),
count INT(11) NULL DEFAULT NULL,
);

