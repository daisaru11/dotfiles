

all: macos-install

macos-self-install:
	brew update
	brew install ansible

macos-install:
	cd macos && ansible-playbook local.yml -i hosts

