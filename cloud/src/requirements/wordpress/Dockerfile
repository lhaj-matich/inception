FROM debian:11.6

WORKDIR /tmp

RUN apt update && apt install -y wget php php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-mysql unzip php-redis && apt clean

ARG MARIADB_PASS MARIADB_DBNAME MARIADB_USER MARIADB_HOST WP_USER WP_PASS
ENV MARIADB_DBNAME=${MARIADB_DBNAME}
ENV MARIADB_PASS=${MARIADB_PASS}
ENV MARIADB_USER=${MARIADB_USER}
ENV MARIADB_HOST=${MARIADB_HOST}
ENV WP_USER=${WP_USER}
ENV WP_PASS=${WP_PASS}

COPY ./conf/wp-config-sample.php .
COPY ./tools/setup_wp.sh .
COPY ./tools/docker_entry.sh .
RUN chmod +x setup_wp.sh
RUN chmod +x docker_entry.sh
RUN ./setup_wp.sh

EXPOSE 9000
ENTRYPOINT [ "./docker_entry.sh" ]