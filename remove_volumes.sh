#/bin/sh

sudo rm -rf /home/sn4r7/docker/sql/*
sudo rm -rf /home/sn4r7/docker/wordpress/*
sudo docker volume rm src_wpdata src_mariadb inception_wpdata inception_mariadb
