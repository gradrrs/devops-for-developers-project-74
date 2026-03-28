### Hexlet tests and linter status:
[![Actions Status](https://github.com/gradrrs/devops-for-developers-project-74/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/gradrrs/devops-for-developers-project-74/actions)

![CI/CD Pipeline](https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME/actions/workflows/push.yml/badge.svg)

## Описание
Проект для изучения DevOps практик с использованием Docker, Docker Compose и GitHub Actions.

## Локальный запуск
```bash
# Установка зависимостей
docker compose run --rm app make setup

# Запуск приложения
docker compose up

# Запуск тестов
make docker-test