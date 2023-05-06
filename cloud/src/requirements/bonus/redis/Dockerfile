FROM debian:buster

RUN apt update && apt install redis -y
WORKDIR /tmp
# Copy the new config file
COPY ./conf/redis.conf /etc/redis/
COPY ./tools/docker_entry.sh .

RUN chmod +x ./docker_entry.sh

EXPOSE 6379

ENTRYPOINT [ "./docker_entry.sh" ]