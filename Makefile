#/bin/make

SPRINGER_FREE_BOOKS_ROOT ?= ${PWD}
SPRINGER_FREE_BOOKS_NAME ?= "Springer Free Books"
SPRINGER_FREE_BOOKS_VERSION ?= "v0.1.0"
SPRINGER_FREE_BOOKS_DESCRIPTION ?= "Python script to download all Springer books released for free during the 2020 COVID-19 quarantine."

.DEFAULT_GOAL := help
.PHONY: help #: List all commands.
help:
	@cd ${SPRINGER_FREE_BOOKS_ROOT} && awk 'BEGIN {FS = " ?#?: "; print ""${SPRINGER_FREE_BOOKS_NAME}" "${SPRINGER_FREE_BOOKS_VERSION}"\n"${SPRINGER_FREE_BOOKS_DESCRIPTION}"\n\nUsage: make \033[36m<command>\033[0m\n\nCommands:"} /^.PHONY: ?[a-zA-Z_-]/ { printf "  \033[36m%-10s\033[0m %s\n", $$2, $$3 }' $(MAKEFILE_LIST)

.PHONY: init #: Download dependencies.
init:
	@cd ${SPRINGER_FREE_BOOKS_ROOT} && \
	[[ -d .venv ]] || poetry install

.PHONY: run #: Download all files.
run: init
	@cd ${SPRINGER_FREE_BOOKS_ROOT} && \
	poetry run python3 main.py

.PHONY: release #: Generate traditional setup.py and requirements.txt.
release:
	@cd ${SPRINGER_FREE_BOOKS_ROOT} && \
	poetry export -f requirements.txt --without-hashes > requirements.txt && \
	poetry run dephell deps convert

