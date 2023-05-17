#!/bin/sh

#! biden1234 will be just a placeholder for 

# check if the mariadb service down, start it
RESULT=`ps ax | grep [m]ysql | wc -l`
if [ $RESULT -eq 0 ]; then
  service mysql start
fi

# Create a new wordpress database.
mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DBNAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
# Create a new user and grant only necessary permissions for wordpress to run.
mysql -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER ON wordpress.* TO '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASS}';"
# Commit the changes.
mysql -e "FLUSH PRIVILEGES;"
