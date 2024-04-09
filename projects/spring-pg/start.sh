#! /bin/sh

docker compose up -d
docker exec -it -w /workspace pde-spring-pg  echo 'Hello!' \
    && echo '1 time setup to install sdks' \
    && echo '  sdk install gradle' \
    && echo '  sdk install scala' \
    && echo '  sdk install java' 
    
docker exec -it -w /workspace pde-spring-pg  /bin/zsh
