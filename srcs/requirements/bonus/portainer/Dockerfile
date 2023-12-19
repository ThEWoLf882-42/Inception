FROM alpine:3.19.0

RUN apk --no-cache add curl

RUN curl -L https://downloads.portainer.io/portainer-ce/portainer-ce_linux_amd64.tar.gz -o portainer.tar.gz \
    && tar -xvf portainer.tar.gz \
    && rm portainer.tar.gz \
    && mv portainer-ce* /portainer

EXPOSE 9443

WORKDIR /portainer

CMD ["./portainer"]