FROM	alpine:3.15

LABEL	maintainer="MinBeom Seo <mseo@student.42seoul.kr>"

# apk -U upgrade = apk update && apk upgrade
RUN		apk -U upgrade && \
		apk add --no-cache mariadb mariadb-client

RUN		mkdir -p /scripts
COPY	tools/run.sh scripts/run.sh
RUN		chmod -R 755 /scripts

EXPOSE	3306
ENTRYPOINT [ "sh", "/scripts/run.sh" ]