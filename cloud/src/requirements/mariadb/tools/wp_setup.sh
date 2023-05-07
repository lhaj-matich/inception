#!/bin/sh

#! biden1234 will be just a placeholder for 

# check if the mariadb service down, start it
RESULT=`ps ax | grep [m]ysql | wc -l`
if [ $RESULT -eq 0 ]; then
  service mysql start
fi

# Create a new wordpress database.
# ! I should check if the database exists first.
mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DBNAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
# Create a new user called raptor
# mariadb -e "GRANT ALL ON wordpress.* TO 'raptor'@'%' IDENTIFIED BY 'biden_1234';"
# Create a new user called wp_user.
# mariadb -e "GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'biden_1234';"
mysql -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER ON wordpress.* TO '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASS}';"
# Commit the changes.
mysql -e "FLUSH PRIVILEGES;"
