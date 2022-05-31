FROM	alpine:3.15

LABEL	maintainer="MinBeom Seo <mseo@student.42seoul.kr>"

# apk -U upgrade = apk update && apk upgrade
RUN		apk -U upgrade && \
		apk add --no-cache nginx openssl

RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/private/localhost.key \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Seo/CN=localhost" && \
		chmod 600 /etc/ssl/certs/localhost.crt etc/ssl/private/localhost.key

COPY	./conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE	443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]