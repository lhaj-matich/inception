FROM alpine:3.17.2

RUN apk add --no-cache wget
WORKDIR /tmp

RUN wget -O cadvisor https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64

COPY ./tools/docker_entry.sh .
RUN chmod +x docker_entry.sh

EXPOSE 8080
# ENTRYPOINT [ "./docker_entry.sh" ]

# RUN mkdir -p $GOPATH/src/github.com/google \
#     && cd $GOPATH/src/github.com/google \
#     && git clone https://github.com/google/cadvisor.git \
#     && cd cadvisor \
#     && git checkout v0.38.7
