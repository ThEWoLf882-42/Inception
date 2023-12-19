FROM alpine:3.19.0

RUN apk update && apk upgrade && apk add --no-cache \
    wget \
    tar

RUN wget https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz \
    && tar xvzf /portainer-2.19.0-linux-amd64.tar.gz \
    && rm -rf portainer-2.19.0-linux-amd64.tar.gz

EXPOSE 9443

WORKDIR /portainer

CMD ["./portainer"]