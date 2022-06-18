NAME = inception
SRC = srcs/docker-compose.yml

all: $(NAME)

$(NAME):
	mkdir -p /home/mseo/data/wordpress
	mkdir -p /home/mseo/data/mysql
	sudo docker-compose -f $(SRC) up -d

clean: stop
	sudo docker-compose -f $(SRC) down --rmi all

fclean:
	sudo sh cleanup.sh

stop:
	sudo docker-compose -f $(SRC) stop

re: clean all

logs:
	sudo docker-compose -f $(SRC) logs

.PHONY: re clean fclean logs stop