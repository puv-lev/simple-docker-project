#!/usr/bin/env bash

# Остановка и удаление контейнеров Docker и сети
echo "Stopping and removing Docker containers and network..."
docker-compose down --remove-orphans

# Удаление всех остановленных контейнеров (по желанию можно раскомментировать)
# echo "Removing stopped containers..."
# docker container prune -f

# Удаление тома Docker, если он существует
echo "Removing Docker volume docker-lab_postgres_data if exists..."
docker volume inspect docker-lab_postgres_data >/dev/null 2>&1 && docker volume rm docker-lab_postgres_data >/dev/null 2>&1

# Удаление всех неиспользуемых томов (по желанию можно раскомментировать)
# echo "Removing unused volumes..."
# docker volume prune -f
