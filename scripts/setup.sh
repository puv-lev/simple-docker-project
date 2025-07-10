#!/usr/bin/env bash

# Проверка, установлены ли Docker и Docker Compose.
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed. Please install Docker first."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "Error: Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Проверка, существует ли файл .env.example, и создание если его нет.
if [ ! -f .env.example ]; then
    echo "Error: .env.example file not found. Please create it first."
    exit 1
fi

if [ ! -f .env ]; then
    echo "Creating .env file from .env.example..."
    cp .env.example .env
fi

# Создание html директории и файла index.html, если они не существуют.
if [ ! -d html ]; then
    echo "Creating html directory..."
    mkdir html
fi

if [ ! -f html/index.html ]; then
    echo "Creating sample index.html..."
    echo "<!DOCTYPE html><html><head><title>My Docker App</title></head><body><h1>Hello from Nginx!</h1><p>This is a simple web page served by Nginx in a Docker container.</p></body></html>" > html/index.html
fi

# Запуск Docker Compose
echo "Starting Docker containers..."
if ! docker-compose up -d; then
    echo "Error: Failed to start Docker containers. Check docker-compose.yml and logs."
    exit 1
fi

# Проверка запустились ли контейнеры
echo "Checking container status..."
if ! docker-compose ps | grep -q "Up"; then
    echo "Warning: Some containers may not be running. Check logs with 'docker-compose logs'."
fi

# Вывод информации
echo "--------------------------------"
echo "Setup complete!"
echo "Visit http://localhost:8080 to see the Nginx page."
echo "PostgreSQL is running on localhost:5432 (use credentials from .env)."
echo "--------------------------------"
