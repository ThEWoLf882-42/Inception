chmod -R 755 /var/www/html
echo Installing wordpress
cd /var/www/html
ls /var/www/html | grep wp-config.php
if [ $? -eq 0 ]
then
    echo "Found Wordpress, skipping"
else
    rm -rf *
    wp core install --url=agimi.42.fr --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_PASS} --admin_email=${WP_EMAIL}
    wp plugin is-installed redis-cache --allow-root
    if [ $? -eq 1 ]
    then
        echo "redis-cache plugin is not installed, installing..."
        wp plugin install redis-cache --force --activate --allow-root
        echo "Redis-cache has been installed successfully"
    else
        echo "redis-cache is already installed"
    fi
fi
exec $@