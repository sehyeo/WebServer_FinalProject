
USE LifeDB;

CREATE TABLE IF NOT EXISTS post(
	p_id VARCHAR(10) NOT NULL,
	p_title VARCHAR(50),
	p_author VARCHAR(20),
	p_contents TEXT,
	p_category VARCHAR(15),
	p_hit LONG,
	p_releaseDate VARCHAR(20),
	p_comments LONG,
	p_quantity LONG,
	p_hashtag VARCHAR(15),
	p_reference VARCHAR(20),
	PRIMARY KEY (p_id)
) default CHARSET=utf8;

desc post;

drop table post;

SELECT * FROM post;
SELECT * FROM post WHERE p_id=?;
