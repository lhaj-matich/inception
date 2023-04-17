FROM debian:11.6

RUN apt update && apt install -y wget php php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-mysql && apt clean
RUN apt install unzip

WORKDIR /tmp
COPY ./tools/docker_entry.sh .
COPY ./conf/wp-config-sample.php .
RUN wget http://wordpress.org/latest.tar.gz
RUN chmod +x docker_entry.sh

EXPOSE 9000
ENTRYPOINT [ "./docker_entry.sh" ]