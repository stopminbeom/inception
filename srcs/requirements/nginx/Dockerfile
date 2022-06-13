FROM	alpine:3.15

LABEL	maintainer="MinBeom Seo <mseo@student.42seoul.kr>"

# apk -U upgrade = apk update && apk upgrade
RUN apk update && apk upgrade && \
    apk add --no-cache nginx openssl && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/ssl/certs/localhost.crt \
        -keyout /etc/ssl/localhost.key \
        -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Seo/CN=mseo.42.fr"

RUN mkdir -p /run/nginx

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]