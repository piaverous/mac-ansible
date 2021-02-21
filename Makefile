
all: help

## help: Display list of commands
help: Makefile
	@sed -n 's|^##||p' $< | column -t -s ':' | sed -e 's|^| |'

## setup: Setup your laptop to use ansible
setup:
	@./scripts/setup.sh

## run: Run the playbook
run:
	@ansible-playbook -i inventory/hosts.ini playbook.yml

## run: Run the playbook
brew:
	@ansible-playbook -i inventory/hosts.ini playbook.yml --tags brew