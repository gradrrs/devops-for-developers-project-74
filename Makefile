.PHONY: setup test dev ci docker-test docker-up docker-down docker-build docker-push help

# Переменные для пользователя
UID := $(shell id -u)
GID := $(shell id -g)

help: ## Show this help
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

setup: ## Install dependencies
	make -C app setup

test: ## Run tests
	make -C app test

dev: ## Run development server
	make -C app dev

ci: ## Run CI tests (with docker-compose)
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

docker-test: ## Run tests in Docker (alias for ci)
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

docker-up: ## Start all services in background
	docker compose up -d

docker-down: ## Stop all services
	docker compose down

docker-build: ## Build app image
	docker compose -f docker-compose.yml build app

docker-push: ## Push app image to registry
	docker compose -f docker-compose.yml push app

docker-logs: ## Show logs from all services
	docker compose logs -f

docker-clean: ## Remove all containers, volumes, and images
	docker compose down -v
	docker system prune -f

db-shell: ## Connect to database shell
	docker exec -it $$(docker compose ps -q db) psql -U $$(grep DATABASE_USERNAME .env | cut -d '=' -f2)

app-shell: ## Open shell in app container
	docker run -it --rm -w /app -v $(PWD)/app:/app -u $(UID):$(GID) node:20.12.2 sh