all: dep run 

dep:
	sudo mkdir -p /home/ochoumou/data/sql
	sudo mkdir -p /home/ochoumou/data/wordpress

run: dep
	sudo docker compose -f "./srcs/docker-compose.yml" up

clean: 
	sudo docker compose -f "./srcs/docker-compose.yml" down --rmi all
	sudo docker volume prune -f
	sudo docker network prune -f
	sudo rm -rf /home/ochoumou/data/
	
re:
	run clean