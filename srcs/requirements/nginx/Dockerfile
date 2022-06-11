FROM	alpine:3.14

LABEL	maintainer="MinBeom Seo <mseo@student.42seoul.kr>"

# apk -U upgrade = apk update && apk upgrade
RUN		apk -U upgrade && \
		apk add nginx openssl && \
		mkdir -p /etc/nginx/ssl && \
		mkdir -p /etc/ssl/cert && \
		openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
		-out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/private/localhost.key \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Seo/CN=localhost" && \
		chmod 600 /etc/ssl/certs/localhost.crt /etc/ssl/private/localhost.key

COPY	./conf/default ./tmp

EXPOSE	443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
