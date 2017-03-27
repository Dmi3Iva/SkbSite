:: Скрипт создания базы данных accounts

:: Если база данных существует, удаляем её
dropdb -U postgres accounts

:: Создаём её
createdb -U postgres accounts

:: Создаём таблицы в базе данных
psql -U postgres --dbname=accounts < db.sql
