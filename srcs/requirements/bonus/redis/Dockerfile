FROM alpine:3.19.0

RUN apk update && apk upgrade && \
	apk add --no-cache redis php-redis && \
	sed -i 's|bind 127.0.0.1|bind 0.0.0.0|g' /etc/redis.conf && \
	sed -i "s|protected-mode yes|protected-mode no|g"  /etc/redis.conf && \
	echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

EXPOSE 6379

CMD [ "redis-server" , "/etc/redis.conf" ]