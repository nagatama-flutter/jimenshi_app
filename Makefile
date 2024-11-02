.DEFAULT_GOAL := help

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z0-9_/-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# General
.PHONY: setup
setup: ## Run the setup script for the project
	./script/setup.sh

.PHONY: bootstrap
bootstrap: ## Install dependencies and bootstrap the project using Melos
	fvm dart pub get & fvm dart run melos bootstrap

# App
.PHONY: clean
clean: ## Clean the project using Melos
	fvm dart run melos clean

.PHONY: analyze
analyze: ## Analyze the project using Melos
	fvm dart run melos analyze

.PHONY: build_runner
build_runner: ## Run the build_runner tool
	fvm dart run melos build_runner

.PHONY: generate_barrel_files
generate_barrel_files: ## Generate barrel files using Melos
	fvm dart run melos generate_barrel_files

.PHONY: build/web/dev
build/web/dev: ## Build the web app for development
	fvm dart run melos run build/web/dev

# Server
.PHONY: serverpod/generate
serverpod/generate: ## Generate code using Serverpod CLI
	cd app_server && fvm dart run serverpod_cli generate

.PHONY: create-migration
create-migration: ## Create a new migration using Serverpod CLI
	cd app_server && fvm dart run serverpod_cli create-migration

.PHONY: run/server
run/server: ## Build and run the server using Docker, and apply migrations
	cd app_server && docker compose up --build -d && fvm dart bin/main.dart --apply-migrations

.PHONY: stop/server
stop/server: ## Stop the server and remove Docker containers
	cd app_server && docker compose down
