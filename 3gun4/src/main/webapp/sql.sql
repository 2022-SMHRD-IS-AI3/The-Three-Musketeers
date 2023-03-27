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

drop table board_posts;
commit;

CREATE SEQUENCE board_posts_num
start with 1
increment by 1;

drop sequence board_posts_num;

select * from user_tables;

select * from board_posts;

select * from VOTES;

create table votes(
vote_num number(5) primary key,
vote_title varchar2(100) not null,
overlap varchar2(100),
anonymous varchar2(100),
id_vote varchar2(100),
constraint id_vote_fk foreign key(id_vote) references members(id)
);


insert into board_posts values(116,'1','1','1',sysdate,'1','admin');
insert into board_posts values(2156,'2','2','2',sysdate,'2','admin');
insert into board_posts values(3116,'3','3','3',sysdate,'3','admin');
insert into board_posts values(4126,'4','4','4',sysdate,'4','admin');
insert into board_posts values(156,'5','5','5',sysdate,'5','admin');
insert into board_posts values(6156,'6','6','6',sysdate,'6','admin');
insert into board_posts values(17156,'7','7','7',sysdate,'7','admin');

select * from BOARD_POSTS;

drop table board_posts;

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
