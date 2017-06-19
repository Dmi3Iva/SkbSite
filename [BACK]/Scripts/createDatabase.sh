# Скрипт создания базы данных accounts
db="skb"
# Если база данных существует, удаляем её
sudo dropdb -U postgres $db

# Создаём её
sudo createdb -U postgres $db

# Создаём таблицы в базе данных
sudo psql -U postgres --dbname=$db < db.sql
