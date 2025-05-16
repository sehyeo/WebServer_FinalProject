USE LifeDB;

CREATE TABLE IF NOT EXISTS cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_id VARCHAR(255),
    user_id VARCHAR(20),
    lectureName VARCHAR(50) NOT NULL,
    category VARCHAR(15),
    description TEXT,
    filename VARCHAR(20),
    unitPrice INT,
    quantity INT,
    uploadDate VARCHAR(30),
    FOREIGN KEY (lectureName) REFERENCES lecture(l_lectureName),
    FOREIGN KEY (user_id) REFERENCES member(id)
) default CHARSET=utf8;


select * from cart;

drop table cart;

