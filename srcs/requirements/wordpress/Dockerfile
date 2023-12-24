FROM alpine:3.19.0

RUN apk update && apk upgrade && apk add --no-cache \
	php \
	php-fpm \
	php-mysqli \
	php-json \
	php-curl \
	php-dom \
	php-exif \
	php-fileinfo \
	php-mbstring \
	php-openssl \
	php-xml \
	php-zip \
	php-redis \
	php-tokenizer \
	php-ctype \
	php-phar \
	wget \
	unzip && \
	sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" \
	  /etc/php82/php-fpm.d/www.conf && \
	sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
	  /etc/php82/php-fpm.d/www.conf && \
	sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
	  /etc/php82/php-fpm.d/www.conf && \
	rm -f /var/cache/apk/*

WORKDIR /var/www

RUN wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	cp -rf wordpress/* . && \
	rm -rf wordpress latest.zip

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./requirements/wordpress/tools/woo.sh ../woo.sh
RUN chmod +x ../woo.sh

ENTRYPOINT [ "../woo.sh" ]
CMD ["/usr/sbin/php-fpm82", "-F"]