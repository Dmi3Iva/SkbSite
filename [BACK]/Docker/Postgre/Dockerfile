FROM postgres:9.6

ADD db.sql /docker-entrypoint-initdb.d/
ADD createDatabase.sh /docker-entrypoint-initdb.d/

EXPOSE 5432
