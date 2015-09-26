

all: install

self-install:
	brew update
	brew install ansible

install:
	ansible-playbook local.yml -i hosts
