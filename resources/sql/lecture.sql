
USE LifeDB;

CREATE TABLE IF NOT EXISTS lecture (
	l_lectureName VARCHAR(50) NOT NULL,
	l_category VARCHAR(15),
	l_description TEXT,
	l_unitPrice INTEGER,
	l_filename VARCHAR(20),
	l_uploadDate VARCHAR(30),
	PRIMARY KEY (l_lectureName)
) default CHARSET=utf8;

desc lecture;

select * from lecture;

drop table lecture;

delete from lecture where l_lectureName='스쿼트 자세';