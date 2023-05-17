all: dep run 

dep:
	mkdir -p /home/ochoumou/data/sql
	mkdir -p /home/ochoumou/data/wordpress

run: dep
	docker compose -f "./src/docker-compose.yml" up

clean: 
	docker compose -f "./src/docker-compose.yml" down --rmi all
	docker volume prune -f
	rm -rf /home/ochoumou/data/
	
re:
	run clean