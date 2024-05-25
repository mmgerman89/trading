#!/bin/bash
dockerFile="../docker-compose.yml"

# Verificar si el parámetro -b fue pasado
if [[ "$1" == "-b" ]]; then
    docker compose down
    docker compose -f "$dockerfile" build
fi
docker compose -f "$dockerfile" up