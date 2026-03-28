.PHONY: setup test dev ci docker-test docker-up docker-down docker-build docker-push

setup:
	make -C app setup

test:
	make -C app test

dev:
	make -C app dev

ci:
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

docker-test:
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

docker-up:
	docker compose up

docker-down:
	docker compose down

docker-build:
	docker compose -f docker-compose.yml build app

docker-push:
	docker compose -f docker-compose.yml push app