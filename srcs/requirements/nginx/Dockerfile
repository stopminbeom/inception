FROM	debian:buster

LABEL	MAINTAINER="mseo@student.42seoul.kr"

RUN		apt-get update && apt-get upgrade -y
RUN		apt-get install -y \
		nginx

# COPY	#파일 추가할 것을 써둬야함.

EXPOSE	443

CMD 	[ "nginx", "-g", "daemon off;" ]
# 컨테이너에서 실행할 명령을 입력