#!/bin/bash

cd ~

# install make
sudo apt update && sudo apt upgrade
sudo apt install make

# install golang
# ref: https://go.dev/doc/install
wget https://go.dev/dl/go1.17.8.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.8.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
. ~/.profile
go version

# install nvm
# ref: https://github.com/nvm-sh/nvm#install--update-script
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> ~/.profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.profile
. ~/.profile
nvm -v
nvm version # none due to no node installed yet

# install node
nvm install 16
nvm version # v16.14.0

# install yarn
npm install -g yarn

# update yarn (to match the version in grafana/packages.json)
corepack enable
yarn set version stable # e.g. 3.2.0

# yarn config vscode
yarn dlx @yarnpkg/sdks vscode
