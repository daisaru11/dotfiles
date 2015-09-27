

all: install

self-install:
	brew update
	brew install ansible

install:
	ansible-playbook local.yml -i hosts

export-atom-package:
	apm list -bi > atom_packages
