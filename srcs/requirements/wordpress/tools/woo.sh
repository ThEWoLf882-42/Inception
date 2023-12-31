#!/bin/sh

rm -rf /var/www/wp-config.php

wp config create --path=/var/www \
				--allow-root \
				--dbname="${DB_NAME}" \
				--dbuser="${DB_USER}" \
				--dbpass="${DB_PASS}" \
				--dbhost="mariadb"

wp core install --path=/var/www --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email="${WP_EMAIL}"

wp user create "${WP_USER}" "${WP_UEMAIL}" --path=/var/www --user_pass="${WP_PASS}" --role=editor --allow-root

wp config set FS_METHOD direct --type=constant --path=/var/www --allow-root
wp config set WP_MEMORY_LIMIT 256M --type=constant --path=/var/www --allow-root
wp config set WP_CACHE true --raw --type=constant --path=/var/www --allow-root
wp config set WP_REDIS_PORT 6379 --path=/var/www --allow-root
wp config set WP_REDIS_HOST redis --type=constant --path=/var/www --allow-root
wp config set WP_REDIS_DATABASE 0 --type=constant --path=/var/www --allow-root
wp config set WP_REDIS_TIMEOUT 1 --type=constant --path=/var/www --allow-root
wp config set WP_REDIS_READ_TIMEOUT 1 --type=constant --path=/var/www --allow-root
wp config set WP_REDIS_PLUGIN_PATH /var/www/wp-content/plugins/redis-cache --type=constant --path=/var/www --allow-root

wp plugin update --path=/var/www --all --allow-root
wp plugin install redis-cache --path=/var/www --force --activate --allow-root
wp redis enable --path=/var/www --allow-root

exec $@