FROM debian:11.6

WORKDIR /tmp

RUN apt update && apt install -y wget php php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-mysql unzip php-redis && apt clean
RUN wget http://wordpress.org/latest.tar.gz
RUN wget https://downloads.wordpress.org/plugin/redis-cache.latest-stable.zip

ARG MARIADB_PASS MARIADB_DBNAME MARIADB_USER MARIADB_HOST WP_USER WP_PASS
ENV MARIADB_DBNAME=${MARIADB_DBNAME}
ENV MARIADB_PASS=${MARIADB_PASS}
ENV MARIADB_USER=${MARIADB_USER}
ENV MARIADB_HOST=${MARIADB_HOST}
ENV WP_USER=${WP_USER}
ENV WP_PASS=${WP_PASS}

COPY ./tools/test.sh .
RUN chmod +x test.sh
RUN ./test.sh

# .
EXPOSE 9000
ENTRYPOINT ["php-fpm7.4", "-F", "-R"]