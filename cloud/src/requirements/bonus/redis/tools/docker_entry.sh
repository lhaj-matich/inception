#!/bin/sh

echo redis-server is listenning on port 6379
exec redis-server --protected-mode no --daemonize no > /dev/null
