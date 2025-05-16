CREATE TABLE IF NOT EXISTS wishlist (
    user_id VARCHAR(20) NOT NULL,
    lecture_name VARCHAR(50) NOT NULL,
    category VARCHAR(15) NOT NULL,
    PRIMARY KEY (user_id, lecture_name)
) default CHARSET=utf8;

select * from wishlist;

drop table wishlist;