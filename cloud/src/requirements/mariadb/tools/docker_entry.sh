#!/bin/sh

SLEEP_TIME="2"

# Allow execute permissions to these scripts
chmod +x db_setup.sh
chmod +x wp_setup.sh
# Setup the databases for wordpress and mariadb
./db_setup.sh && ./wp_setup.sh
# Stop the execution for a few seconds
sleep ${SLEEP_TIME}
# Stop mariadb service
service mariadb stop
# Start mariadb server in the foreground
mariadbd --bind-address=0.0.0.0 --silent-startup