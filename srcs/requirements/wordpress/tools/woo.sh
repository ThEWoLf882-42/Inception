#!/bin/sh

wp config create --path=/var/www \
        --allow-root \
        --dbname=${DB_NAME} \
        --dbuser=${DB_USER} \
        --dbpass=${DB_PASS} \
        --dbhost=mariadb

wp core install --path=/var/www --url=agimi.42.fr --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email="${WP_EMAIL}"

wp user create "${WP_USER}" "${WP_UEMAIL}" --path=/var/www --user_pass="${WP_PASS}" --role=editor

wp config set WP_REDIS_HOST redis --path=/var/www --allow-root
wp config set WP_REDIS_PORT 6379 --path=/var/www --allow-root
wp config set WP_REDIS_DATABASE 0 --path=/var/www --allow-root
wp config set WP_CACHE --path=/var/www true --allow-root

wp plugin update --path=/var/www --all --allow-root
wp plugin install redis-cache --path=/var/www --force --activate --allow-root
# wp redis enable --path=/var/www --allow-root

# chown -R www-data:www-data /var/www/
# chmod -R 777 /var/www/

# Start PHP-FPM in the foreground
exec $@