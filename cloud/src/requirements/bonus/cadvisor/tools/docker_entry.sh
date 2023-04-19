#!/bin/sh

# #Here i should check again if this directory exists so i dont repeat the setup.
CADPATH=/usr/local/cadvisor/bin

if [ ! -e $CADPATH/cadvisor ]; then
    mkdir -p $CADPATH
    mv /tmp/cadvisor $CADPATH/cadvisor
    chmod +x $CADPATH/cadvisor
    export PATH=$PATH:$CADPATH
fi
# # Here should be always executing.
echo "cadvisor is listenning on port 8080"
exec cadvisor
