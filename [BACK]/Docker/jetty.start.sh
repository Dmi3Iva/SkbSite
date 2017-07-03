#!/bin/bash
#jetty port settings
j_host=8081
j_inside=8080

docker stop skb-jetty
docker rm skb-jetty
docker build -t jetty ./Jetty
docker run -d --name skb-jetty -p $j_host:$j_inside jetty
#docker run -d --name skb-jetty --network=bridge  -p $j_host:$j_inside jetty
