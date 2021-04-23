#!/bin/bash

#Install mysql-workbench
apt install mysql-workbench

#Deploy the stack and start the nodes
echo "Deploying the infrastructure..."
docker-compose up -d
echo "ImmaBe cluster successfully deployed!"


#Show the deployment summary
dirname=${PWD##*/}
replace=""
net_prefix=$(echo $dirname | sed -e "s/[-_.]/${replace}/g")

echo "================================="
echo "Orcherstration Summary"
echo "================================="
echo "Docker images used in the infrastructure:"
docker images
echo "Containers running on the network:"
docker ps
echo "For a detailed view of the deployed infrastructure, run:"
echo "docker network inspect ${net_prefix}_dev_net"


#Instruction to ssh
tool_cid=$(docker ps -aqf "name=tool-node")
reg_cid=$(docker ps -aqf "name=reg-node")
db_cid=$(docker ps -aqf "name=database")
echo "To ssh to :"
echo " - the tool node, run: docker exec -it ${tool_cid} bash"
echo " - the regisration node, run: docker exec -it ${reg_cid} bash"
echo " - the database, run: docker exec -it ${db_cid} bash"
echo "Volumes can be found at: /var/lib/docker/volumes/${net_prefix}_***"

