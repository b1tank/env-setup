#!/bin/bash

cd ~

# install make
sudo apt update && sudo apt upgrade
sudo apt install build-essential

# install golang
# ref: https://go.dev/doc/install
GOVERSION=1.18
wget https://go.dev/dl/go$GOVERSION.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go$GOVERSION.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
. ~/.profile
go version

# install nvm
# ref: https://github.com/nvm-sh/nvm#install--update-script
NVMVERSION=0.39.1
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVMVERSION/install.sh | bash
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> ~/.profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.profile
. ~/.profile
nvm -v
nvm version # none due to no node installed yet

# install node
NODEVERSION=16
nvm install $NODEVERSION 
nvm version # v16.14.0

# install yarn
npm install -g yarn

# update yarn (to match the version in grafana/packages.json)
corepack enable
yarn set version stable # e.g. 3.2.0

# yarn config vscode
yarn dlx @yarnpkg/sdks vscode
