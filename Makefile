# Arduino build config
DEBUG=JEKYLL_GITHUB_TOKEN=blank PAGES_API_URL=http://0.0.0.0

# CLI COLORS
COLOR_RESET    = \033[0m
COLOR_RED      = \033[31m
COLOR_GREEN    = \033[32m
COLOR_ORANGE   = \033[33m
COLOR_BLUE     = \033[34m

.PHONY: default all clean update build run

default: help

all: clean update build run

###
# Help: Show a basic help message and list all public available commands.
###
help:                                                                           # Show Help
	@echo "$(COLOR_ORANGE)Usage:$(COLOR_RESET)\n  make [target] [arg="val"...]"
	@echo "";
	@echo "$(COLOR_ORANGE)Targets:$(COLOR_RESET)"
	@echo "  $(COLOR_GREEN)all$(COLOR_RESET)           Run clean, deps, update, build and run"
	@echo "  $(COLOR_GREEN)build$(COLOR_RESET)         Build static site using jekyll"
	@echo "  $(COLOR_GREEN)run$(COLOR_RESET)           Serve the site locally"
	@echo "";
	@echo "$(COLOR_ORANGE)Dev:$(COLOR_RESET)"
	@echo "  $(COLOR_GREEN)clean$(COLOR_RESET)         Clean (cached) files"
	@echo "  $(COLOR_GREEN)update$(COLOR_RESET)        Update bundle libraries"
	@echo "  $(COLOR_GREEN)deps$(COLOR_RESET)          Install dependencies using gem/bundle"
	@echo "";


# Clean cached files.
clean:
	bundle exec jekyll clean

# Build static website using jekyll
build:
	@${DEBUG} bundle exec jekyll build --profile --config _config.yml,.debug.yml

# Run the site locally
run: build
	@${DEBUG} bundle exec jekyll server --livereload --config _config.yml,.debug.yml

# Install dependencies using gem / bundle
deps:
	gem install jekyll bundler
	bundle install

# Update libraries
update:
	bundle update
