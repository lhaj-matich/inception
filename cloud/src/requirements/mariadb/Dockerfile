FROM debian:11.6
RUN apt update && apt install -y mariadb-server

COPY ./tools/db_setup.sh .
COPY ./tools/wp_setup.sh .
COPY ./tools/docker_entry.sh .
COPY ./conf/my.cnf /etc/mysql/

RUN chmod +x docker_entry.sh
RUN ./docker_entry.sh

EXPOSE 3306
ENTRYPOINT ["mariadbd", "--bind-address=0.0.0.0", "--silent-startup"]