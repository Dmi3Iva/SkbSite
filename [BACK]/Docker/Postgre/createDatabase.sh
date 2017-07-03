# Скрипт создания базы данных accounts
db="skb"
# Если база данных существует, удаляем её
dropdb -U postgres $db

# Создаём её
createdb -U postgres $db

# Создаём таблицы в базе данных
psql -U postgres --dbname=$db < db.sql
