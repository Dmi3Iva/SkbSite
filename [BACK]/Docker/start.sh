#!/bin/bash
#Postgrey port settings
p_host=5433
p_inside=5432

docker stop skb-postgres
docker rm skb-postgres
docker build -t postgres ./Postgre
#docker run -d --name skb-postgres -p $p_host:$p_inside postgres
docker run  --name skb-postgres --network=bridge -p $p_host:$p_inside postgres
