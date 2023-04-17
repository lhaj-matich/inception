FROM debian:11.6

RUN apt update && apt install redis -y
# Copy the new config file
COPY ./conf/redis.conf /etc/redis/

EXPOSE 6379

CMD ["redis-server --protected-mode no"]