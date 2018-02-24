build:
	docker build -t my_docker_cmd_app .
run:
	docker run my_docker_cmd_app
remove-containers:
	docker rm $(docker ps -a -q)
