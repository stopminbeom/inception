#!/bin/sh

docker rm $(docker ps -qa);
docker rmi -f $(docker ps -qa);
docker rmi `sudo docker images -a`;
docker volume rm $(docker volume ls -q);
