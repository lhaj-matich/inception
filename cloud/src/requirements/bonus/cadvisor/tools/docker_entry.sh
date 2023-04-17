#!/bin/sh

#Here i should check again if this directory exists so i dont repeat the setup.
CADPATH=/usr/local/cadvisor/bin

if [ ! -e $CADPATH/cadvisor ]; then
    mkdir -p $CADPATH
    wget -O $CADPATH/cadvisor https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64
    chmod +x $CADPATH/cadvisor
fi
# Here should be always executing.
export PATH=$PATH:$CADPATH
echo "cadvisor is listenning on port 8080"
exec cadvisor
