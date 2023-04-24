FROM debian:11.6

RUN apt update && apt install -y wget php php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-mysql && apt clean

WORKDIR /tmp

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

COPY ./tools/docker_entry.sh .
RUN chmod +x docker_entry.sh

EXPOSE 9001
ENTRYPOINT [ "./docker_entry.sh" ]