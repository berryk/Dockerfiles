#!/bin/bash

id=$(docker ps | grep homeseer | cut -b 1-12)

echo $id

docker commit $id berryk/homeseer:latest

docker login -u berryk -p He*UPIi1oB037

docker push berryk/homeseer:latest
