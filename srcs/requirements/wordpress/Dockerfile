FROM	alpine:3.15

LABEL	maintainer="MinBeom Seo <mseo@student.42seoul.kr>"

# apk -U upgrade = apk update && apk upgrade
RUN		apk -U upgrade && \
		apk add --no-cache \
		wget tar \
		php7-common php7-session php7-iconv php7-json \
		php7-gd php7-curl php7-xml php7-mysqli php7-imap \
		php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
		php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml

RUN		adduser -D -g 'nginx' nginx && \
		mkdir -p /scripts
COPY	./tools/run.sh /scripts/run.sh
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp-cli

WORKDIR	/var/www/html/wordpress

EXPOSE	9000
ENTRYPOINT [ "sh", "/scripts/run.sh" ]