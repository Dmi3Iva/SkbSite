---------------------------------------
--Скрипт создания структуры базы данных
---------------------------------------

DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles (
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(50) DEFAULT NULL
);

INSERT INTO roles (name) VALUES ('ROLE_MEMBER');
INSERT INTO roles (name) VALUES ('ROLE_CUSTOMER');
INSERT INTO roles (name) VALUES ('ROLE_CAPTAIN');
INSERT INTO roles (name) VALUES ('ROLE_ADMIN');

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
	id SERIAL NOT NULL PRIMARY KEY,
	lastname VARCHAR(255) DEFAULT NULL,
	firstname VARCHAR(255) DEFAULT NULL,
	middlename VARCHAR(255) DEFAULT NULL,
	date_of_birth DATE DEFAULT NULL,
	username VARCHAR(255) DEFAULT NULL,
	email VARCHAR(255) DEFAULT NULL,
	organization VARCHAR(255) DEFAULT NULL,
	password VARCHAR(255) DEFAULT NULL,
	photo_path VARCHAR(255) DEFAULT NULL,
	github VARCHAR(255) DEFAULT NULL,
	contact_details VARCHAR(255),
	about TEXT DEFAULT NULL
);

DROP TABLE IF EXISTS users_roles;
CREATE TABLE users_roles (
	user_id INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	role_id INT NOT NULL REFERENCES roles ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (user_id, role_id)
);

DROP TABLE IF EXISTS news CASCADE;
CREATE TABLE news (
	id SERIAL NOT NULL PRIMARY KEY,
	author_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	name VARCHAR(255) DEFAULT NULL,
	content TEXT DEFAULT NULL,
	date_of_creation DATE NOT NULL
);

DROP TABLE IF EXISTS comments CASCADE;
CREATE TABLE comments (
	id SERIAL NOT NULL PRIMARY KEY,
	news_id INT NOT NULL REFERENCES news(id) ON DELETE CASCADE ON UPDATE CASCADE,
	author_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	date_of_creation DATE NOT NULL,
	content TEXT NOT NULL
);