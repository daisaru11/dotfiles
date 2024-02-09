

all: macos-install

macos-self-install:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

macos-install:
	./macos_install.sh

