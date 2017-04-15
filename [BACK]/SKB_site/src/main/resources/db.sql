-- Database structure for db 'SKB'

----------------*-------------------
-- Table structure for table 'roles'
-----------------------------------
DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles (
  id SERIAL NOT NULL,
  name VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (id)
);

-- id ролей начинается с 2
ALTER SEQUENCE roles_id_seq RESTART WITH 2;

--------------------------------
-- Dumping data for table 'role'
--------------------------------
--LOCK TABLES role WRITE;
INSERT INTO roles VALUES (1, 'ROLE_USER');
--UNLOCK TABLES;

-----------------------------------
-- Table structure for table 'users'
-----------------------------------
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id SERIAL NOT NULL,
  username varchar(255) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  photopath varchar(300) DEFAULT NULL,
  PRIMARY KEY (id)
);

-- id пользователей начинается с 2
ALTER SEQUENCE users_id_seq RESTART WITH 1;

----------------------------------------
-- Table structure for table 'user_role'
----------------------------------------
DROP TABLE IF EXISTS users_roles CASCADE;
CREATE TABLE users_roles (
  user_id INT NOT NULL REFERENCES users, --ON DELETE CASCADE ON UPDATE CASCADE,
  role_id INT NOT NULL REFERENCES roles, --ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (user_id, role_id)
  --KEY 'fk_user_role_roleid_idx' ('role_id'),
  --CONSTRAINT 'fk_user_role_roleid' FOREIGN KEY ('role_id') REFERENCES 'role' ('id') ON DELETE CASCADE ON UPDATE CASCADE,
  --CONSTRAINT 'fk_user_role_userid' FOREIGN KEY ('user_id') REFERENCES  ON DELETE CASCADE ON UPDATE CASCADE
);

----------------------------------------
-- Table structure for table 'news'
----------------------------------------
DROP TABLE IF EXISTS news CASCADE;
CREATE TABLE news (
  id SERIAL NOT NULL,
  author_id INT NOT NULL REFERENCES users(id), --ON DELETE CASCADE ON UPDATE CASCADE,
  level_of_publicity_id INT REFERENCES users(id),
  name varchar(100),
  data timestamp,
  article text
  --KEY 'fk_user_role_roleid_idx' ('role_id'),
  --CONSTRAINT 'fk_user_role_roleid' FOREIGN KEY ('role_id') REFERENCES 'role' ('id') ON DELETE CASCADE ON UPDATE CASCADE,
  --CONSTRAINT 'fk_user_role_userid' FOREIGN KEY ('user_id') REFERENCES  ON DELETE CASCADE ON UPDATE CASCADE
);

