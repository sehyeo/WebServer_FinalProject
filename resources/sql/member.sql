create table member ( 
    id varchar(20) not null,
    password varchar(20) not null,
    name varchar(10) not null,
    gender varchar(4),
    birth  varchar(20),
    mail  varchar(30),
    phone varchar(20),
    timestamp varchar(50),    
    primary key(id) 
) default CHARSET=utf8;

drop table member;

select * from member;