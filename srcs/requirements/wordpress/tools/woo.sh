chmod -R 755 /var/www/html
echo Installing wordpress
cd /var/www/html
ls /var/www/html | grep wp-config.php
if [ $? -eq 0 ]
then
    echo "Found Wordpress, skipping"
else
    wp core install --url=agimi.42.fr --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_PASS} --admin_email=${WP_EMAIL} --allow-root
fi
exec $@