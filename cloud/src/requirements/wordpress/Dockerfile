FROM debian:11.6

RUN apt update && apt install -y wget php php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-mysql && apt clean
RUN apt install unzip php-redis -y

ARG MARIADB_PASS MARIADB_DBNAME MARIADB_USER MARIADB_HOST
ENV MARIADB_DBNAME=${MARIADB_DBNAME}
ENV MARIADB_PASS=${MARIADB_PASS}
ENV MARIADB_USER=${MARIADB_USER}
ENV MARIADB_HOST=${MARIADB_HOST}

WORKDIR /tmp
COPY ./tools/docker_entry.sh .
COPY ./conf/wp-config-sample.php .
RUN wget http://wordpress.org/latest.tar.gz
RUN wget https://downloads.wordpress.org/plugin/redis-cache.latest-stable.zip
RUN chmod +x docker_entry.sh
RUN ./docker_entry.sh

# .
EXPOSE 9000
ENTRYPOINT ["php-fpm7.4", "-F", "-R"]