#!usr/bin/env bash

# Проверьте, установлены ли Docker и Docker Compose.
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed. Please install Docker first."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "Error: Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Проверьте, существует ли файл .env, если нет, создайте его из .env.example.
if [ ! -f .env ]; then
    echo "Creating .env file from .env.example..."
    cp .env.example .env
fi

# Создайте html директорию и файл index.html в ней, если они не существуют.
if [ ! -d html ]; then
    echo "Creating html directory and sample index.html..."
    mkdir html
    echo "<!DOCTYPE html><html><head><title>My Docker App</title></head><body><h1>Hello from Nginx!</h1><p>This is a simple web page served by Nginx in a Docker container.</p></body></html>" > html/index.html
fi

# Запустите Docker Compose
echo "Starting Docker containers..."
docker-compose up -d

# Проверьте запустились ли контейнеры
echo "Checking container status..."
docker-compose ps

# Посмотрите отображение информации о доступе
echo "Setup complete!"
echo "Visit http://localhost:8080 to see the Nginx page."
echo "PostgreSQL is running on localhost:5432 (use credentials from .env)."
