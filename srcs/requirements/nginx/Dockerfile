FROM	alpine:3.15

LABEL	maintainer="MinBeom Seo <mseo@student.42seoul.kr>"

# apk -U upgrade = apk update && apk upgrade
RUN		apk -U upgrade && \
		apk add --no-cache nginx openssl

RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Seo/CN=localhost" \
		-keyout localhost.dev.key -out localhost.dev.crt && \
		mv localhost.dev.crt etc/ssl/certs/ && \
		mv localhost.dev.key etc/ssl/private/ && \
		chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

EXPOSE	443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]