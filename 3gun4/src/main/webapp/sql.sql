create table members (
id varchar2(100) primary key,
pw varchar2(100) not null,
name varchar2(100) not null,
phonenum varchar2(100) not null,
class_name varchar2(100) not null
);
select * from members order by name;

ALTER TABLE members
ADD CONSTRAINT unique_name
UNIQUE (name);

select * from members;

create table board_posts(
board_num number primary key,
board_title varchar2(1000) not null,
board_content varchar2(1000) not null,
board_photo varchar2(1000),
board_datetime date not null,
category varchar2(100),
id varchar2(100),
constraint id2 foreign key(id) references members(id)
);

drop table board_posts;

CREATE SEQUENCE board_posts_num
start with 1
increment by 1;

drop sequence board_posts_num;

create table board_comments(
com_num number primary key,
board_num number,
com_content varchar2(1000),
com_datetime date not null,
id varchar2(100),
constraint id3 foreign key(id) references members(id),
constraint board_num2 foreign key(board_num) references board_posts(board_num)
);

drop table board_comments;

select * from members;

drop table members;



drop table board_posts;
commit;





select * from board_posts;



delete from board_comments where id

delete from board_comments where board_num=1;
select * from board_posts order by board_num;

CREATE SEQUENCE board_comments_num
start with 1
increment by 1;

drop sequence board_comments_num;

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
CREATE SEQUENCE vote_num_seq
start with 1
increment by 1;

drop sequence vote_num_seq;

select * from BOARD_POSTS;

drop table vote_options; CASCADE CONSTRAINTS;

select * from user_tables;

select * from board_posts;

select * from vote_options;

select * from votes;
create table votes(
vote_num number(5) primary key,
vote_title varchar2(100) not null,
vote_content varchar2(100) not null,
overlap SMALLINT NULL,
anonymity SMALLINT NULL, 
id varchar2(100),
foreign key(id) references members(id)
);
alter table votes drop COLUMN anonymity;
alter table votes modify vote_content varchar2(100) not null;
ALTER TABLE 'votes' AUTO_INCREMENT = 1;

create table vote_options (
vote_num number(5), 
foreign key(vote_num) references votes(vote_num),
vote_cotent varchar2(100),
id varchar2(100)
);

select * from votes order by vote_num;
create table schedules (
schedule_code number(10) primary key,
class_name varchar(100) not null,
start_date varchar(100),
end_date varchar(100),
allday varchar(10)
);


create sequence msg_num_seq
start with 1
increment by 1;


drop sequence msg_num_seq;
select * from msg;

create table msg (
msg_num number primary key,
send_name varchar2(100),
accept_name varchar2(100),
msg_content varchar2(1000),
msg_datetime date not null
);

insert into msg values(msg_num_seq.nextval,'나나나', 'test', '안안농농', sysdate);
select * from msg
drop table msg;
CREATE SEQUENCE schdule_code_num
start with 1
increment by 1;


select * from schedules;

drop table schedules;


delete from schedules;
insert into


ALTER TABLE vote_options RENAME COLUMN vote_cotent TO vote_content;

delete from vote_options;
select * from vote_options;

create table main(
zoom varchar2(1000),
recode varchar2(1000),
longtime varchar2(1000)
);

delete from main;

select * from main;


select count(distinct id) from vote_options;
select * from vote_options;