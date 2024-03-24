#! /bin/sh

docker compose up -d
docker exec -it -w /workspace pde-spring-pg  /bin/zsh
