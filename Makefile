
VCS_REF=$(shell git rev-parse --short HEAD)
BUILD_DATE=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
VERSION:=$(shell cat VERSION)

.PHONY: version

all:	help

help:
	@echo ""
	@echo "Usage: make <command>"
	@echo "Commands:"
	@echo "   build    Build container"
	@echo "   pull     Pull latest containers"
	@echo "   up       Create and start containers"
	@echo "   down     Stop and remove containers"
	@echo "   clean    Remove stopped containers"
	@echo "   version  Show docker and alerta versions  "
	@echo ""

build:
	docker-compose -f docker-compose.yml build \
	--build-arg VCS_REF=$(VCS_REF) \
	--build-arg VERSION=$(VERSION)

pull:
	docker-compose -f docker-compose.yml pull

up:
	docker-compose -f docker-compose.yml up

down:
	docker-compose -f docker-compose.yml down

clean:
	docker-compose -f docker-compose.yml rm

version:
	@docker-compose version
	@echo "alerta version $(VERSION)"
