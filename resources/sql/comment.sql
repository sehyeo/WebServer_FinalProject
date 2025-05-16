
USE LifeDB;

CREATE TABLE IF NOT EXISTS comment(
	c_id VARCHAR(10) NOT NULL,
	c_index INTEGER,
	c_postId VARCHAR(20),
	c_commenterId VARCHAR(10),
	c_comments TEXT,
	c_releaseDate VARCHAR(20),
	c_quantity LONG,
	PRIMARY KEY (c_id)
) default CHARSET=utf8;

desc comment;

drop table comment;

SELECT * FROM comment;
SELECT * FROM comment WHERE c_id=?;
