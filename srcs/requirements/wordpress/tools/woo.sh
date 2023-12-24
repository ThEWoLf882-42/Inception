#!/bin/sh

# Check if wp-config.php exists, if not create it.
if [ ! -f /var/www/wp-config.php ]; then
    wp config create --path=/var/www \
            --allow-root \
            --dbname="${DB_NAME}" \
            --dbuser="${DB_USER}" \
            --dbpass="${DB_PASS}" \
            --dbhost="mariadb"
fi

wp core install --path=/var/www --url="agimi.42.fr" --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email="${WP_EMAIL}"

# Check if a Wordpress user exists, if not create it.
wp user create "${WP_USER}" "${WP_UEMAIL}" --path=/var/www --user_pass="${WP_PASS}" --role=editor --allow-root

# Setup Redis configurations.
wp config set WP_CACHE true --raw --type=constant --path=/var/www --allow-root
wp config set WP_REDIS_PORT "6379" --type=constant --path=/var/www --allow-root
wp config set WP_REDIS_HOST "redis" --type=constant --path=/var/www --allow-root
wp config set WP_REDIS_DATABASE "0" --type=constant --path=/var/www --allow-root

# Install and activate the Redis plugin if not already active.
if ! $(wp plugin is-installed redis-cache --allow-root); then
    wp plugin install redis-cache --force --activate --allow-root
    wp redis enable --allow-root
fi

# Set proper permissions for Wordpress files.
chown -R www-data:www-data /var/www/
find /var/www/ -type d -exec chmod 755 {} \;
find /var/www/ -type f -exec chmod 644 {} \;

exec $@
