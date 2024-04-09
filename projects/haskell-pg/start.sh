#! /bin/sh

docker compose up -d
docker exec -it -w /workspace pde-haskell-pg  /bin/zsh
