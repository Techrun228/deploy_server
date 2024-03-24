#!/bin/bash

echo "PREPARE SERVER TO DEPLOY NGINX"

echo "START UPDATE OF REPOSITROY OF THE SYSTEM"

uname -a
apt-get update -y

echo "Add Docker's official GPG key:"
apt-get install -y ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo "ADD THE REPOSITORY TO APT SOURCES"

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | i
  \ tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y 

echo "INSTALL THE DOCKER PACKAGES"
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "DOCKER VERSION is :$(docker version)"


echo "START DOCKER-COMPOSE INSTALLATION"
apt-get update -y
apt-get install  -y docker-compose-plugin

echo "DOCKER-COMPOSE VERSION is : $(docker compose version)"
