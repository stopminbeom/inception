#!/bin/sh

chown nginx:nginx .
while ! mariadb -h$WORDPRESS_DB_HOST -u$WORDPRESS_DB_USER -p$WORDPRESS_DB_PWD &>/dev/null; do
	echo "waiting for $WORDPRESS_DB_HOST ..."
	sleep 2
done

if [ ! -f "/var/www/html/wordpress/index.php" ]; then
	su nginx -c sh -c '\
	wp-cli core download && \
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PWD --dbhost=$WORDPRESS_DB_HOST --dbcharset='utf8mb4' && \
	wp core install --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_email=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PWD --skip-email && \
	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PWD && \
	wp plugin update --all'
fi

exec php-fpm7 -F