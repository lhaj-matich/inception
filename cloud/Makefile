all: dep run 

dep:
	mkdir -p /home/ochoumou/data/sql
	mkdir -p /home/ochoumou/data/wordpress

run:
	docker compose -p inception up

clean: 
	docker compose -p inception down --rmi all
	docker volume rm inception_wpdata inception_mariadb
	rm -rf /home/ochoumou/data/sql/*
	rm -rf /home/ochoumou/data/wordpress/*

re:
	run clean