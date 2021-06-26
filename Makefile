# MAKE

include .envrc

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## confirm: ask before continuing action
.PHONY: confirm
confirm:
	@echo -n 'Are you sure? [y/N] ' && read ans && [ $${ans:-N} = y ]

## init: kicks the process off
.PHONEY: init
init: confirm
	docker-compose build &&
	docker-compose run --rm --service-ports go_dev
