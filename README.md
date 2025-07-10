Простое веб-приложение Docker

Это простой проект Docker Compose, демонстрирующий веб-приложение с:
Nginx: обслуживает статическую HTML-страницу
PostgreSQL: база данных с постоянным хранилищем

Этот проект предназначен для демонстрации базовых навыков DevOps, включая Docker, Docker Compose и написания скриптов Bash

Предварительные требования:
Docker
Docker Compose

Настройка:
1.Клонируйте репозиторий:
git clone https://github.com/your-username/simple-docker-project.git
cd simple-docker-project

2.Скопируйте .env.example в .env и при необходимости обновите переменные:
cp .env.example .env

3.Запустите скрипт установки:
chmod +x scripts/setup.sh
./scripts/setup.sh

4.Доступ к приложению:
Nginx: http://localhost:8080
PostgreSQL: localhost:5432 (используйте учетные данные из .env)

5.Запустите скрипт для остановки и удаления контейнеров:
chmod +x scripts/cleanup.sh
./scripts/cleanup.sh

Структура проекта:
 - html/: Статические файлы для Nginx
 - scripts/: Скрипты Bash для настройки и очистки
 - docker-compose.yml: Определяет службы Nginx и PostgreSQL
 - .env.example: Шаблон для переменных окружения

Примечания:
Убедитесь, что порты 8080 и 5432 свободны
Используйте надёжные пароли в .env

Лицензия:
MIT License (разрешено использование в различных/любых проектах, предоставлена свобода действий)
