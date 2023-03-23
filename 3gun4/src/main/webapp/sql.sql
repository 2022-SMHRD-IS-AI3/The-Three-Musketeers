create table members (
id varchar2(100) primary key,
pw varchar2(100) not null,
name varchar2(100) not null,
phonenum varchar2(100) not null,
class_name varchar2(100) not null
);

select * from members;

drop table members;
