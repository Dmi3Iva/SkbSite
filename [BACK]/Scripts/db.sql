---------------------------------------
--Скрипт создания структуры базы данных
---------------------------------------

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(255) DEFAULT NULL,
	password VARCHAR(255) DEFAULT NULL
);

DROP TABLE IF EXISTS news CASCADE;
CREATE TABLE news (
	id SERIAL NOT NULL PRIMARY KEY,
	authorId INT NOT NULL REFERENCES users(id),
	name VARCHAR(255) DEFAULT NULL,
	article TEXT DEFAULT NULL,
	dateOfCreation DATE NOT NULL
);