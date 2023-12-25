#!/bin/sh

wp core install --path=/var/www --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email="${WP_EMAIL}"

wp user create "${WP_USER}" "${WP_UEMAIL}" --path=/var/www --user_pass="${WP_PASS}" --role=editor --allow-root

wp plugin update --path=/var/www --all --allow-root
wp plugin install redis-cache --path=/var/www --force --activate --allow-root
wp redis enable --path=/var/www --allow-root

exec $@
