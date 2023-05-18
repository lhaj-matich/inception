all: dep run 

dep:
	mkdir -p /home/ochoumou/data/sql
	mkdir -p /home/ochoumou/data/wordpress

run: dep
	docker compose -f "./srcs/docker-compose.yml" up

clean: 
	docker compose -f "./srcs/docker-compose.yml" down --rmi all
	docker volume prune -f
	docker network prune -f
	rm -rf /home/ochoumou/data/
	
re:
	run clean