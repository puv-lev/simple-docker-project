#!/usr/bin/env bash

# Остановка и удаление контейнеров Docker
echo "Stopping and removing Docker containers..."
docker-compose down

# Удаление тома Docker (необязательно, закомментируйте, если не нужно)
echo "Removing Docker volumes..."
docker volume rm simple-docker-project_postgres_data

echo "Cleanup complete!"
