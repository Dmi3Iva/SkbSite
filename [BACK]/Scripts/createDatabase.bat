:: Скрипт создания базы данных сайта СКБ

:: Переменная с именем базы данных
SET db="skb"

:: Если база данных accounts существует, удаляем её
dropdb -U postgres %db%

:: Создаём её
createdb -U postgres %db%

:: Создаём таблицы в базе данных accounts
psql -U postgres --dbname=%db% < db.sql

pause
