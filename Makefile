

all: macos-install

macos-self-install:
	brew update
	brew install ansible

macos-install:
	cd macos && ansible-playbook local.yml -i hosts

macos-export-atom-package:
	apm list -bi > atom_packages

macos-install-atom-package:
	apm install --packages-file atom_packages
