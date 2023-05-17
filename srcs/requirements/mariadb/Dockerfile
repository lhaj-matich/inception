FROM debian:buster
RUN apt update && apt install -y mariadb-server procps

ARG MARIADB_PASS MARIADB_DBNAME MARIADB_USER
ENV MARIADB_DBNAME=${MARIADB_DBNAME}
ENV MARIADB_PASS=${MARIADB_PASS}
ENV MARIADB_USER=${MARIADB_USER}

COPY ./tools/db_setup.sh .
COPY ./tools/wp_setup.sh .
COPY ./tools/docker_entry.sh .
COPY ./conf/my.cnf /etc/mysql/

RUN chmod +x docker_entry.sh
RUN ./docker_entry.sh

EXPOSE 3306
ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0", "--silent-startup"]