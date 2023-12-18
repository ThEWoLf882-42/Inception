FROM alpine:3.19.0

RUN	apk update && apk upgrade && apk add --no-cache nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]