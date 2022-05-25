FROM	alpine:3.15

LABEL	maintainer="MinBeom Seo <mseo@student.42seoul.kr>"

# apk -U upgrade = apk update && apk upgrade
RUN		apk -U upgrade && \
		apk add --no-cache nginx openssl



EXPOSE	443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]