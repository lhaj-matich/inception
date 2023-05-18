all: dep run 

dep:
	sudo mkdir -p /home/ochoumou/data/sql
	sudo mkdir -p /home/ochoumou/data/wordpress

run: dep
	sudo docker compose -f "./srcs/docker-compose.yml" up

clean: 
	sudo docker compose -f "./srcs/docker-compose.yml" down --rmi all
	sudo docker stop $(sudo docker ps -q)
	sudo docker rmi -f $(sudo docker images )
	sudo docker volume rm $(sudo docker volume ls -q)
	sudo docker network rm $(sudo docker network ls -q)
	sudo rm -rf /home/ochoumou/data/
	
re:
	run clean