NAME = inception
SRC = srcs/docker-compose.yml

all: $(NAME)

$(NAME):
	mkdir -p /home/mseo/data/wordpress
	mkdir -p /home/mseo/data/mysql
	sudo docker-compose -f $(SRC) up -d

clean:
	sudo docker-compose -f $(SRC) stop --rmi all

fclean:
	sudo sh cleanup.sh

re:
	fclean all

.PHONY: re clean fclean