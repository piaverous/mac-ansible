
all: help

## help: Display list of commands
help: Makefile
	@sed -n 's|^##||p' $< | column -t -s ':' | sed -e 's|^| |'

## setup: Setup your laptop to use ansible
setup:
	@./scripts/setup.sh

## run: Run the whole playbook
run:
	@ansible-playbook -i inventory/hosts.ini playbook.yml

## brew: Run only homebrew install tasks 
brew:
	@ansible-playbook -i inventory/hosts.ini playbook.yml --tags brew
