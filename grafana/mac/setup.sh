#!/bin/bash

cd ~

# update command line tools (if too old)
softwareupdate --all --install --force

# install golang
# ref: https://go.dev/doc/install
# open pkg file downloaded and install it

# install node
brew install node@16
node -v

# update npm if needed
# sudo npm install -g npm@8.5.5

# install yarn
sudo npm install -g yarn

# update yarn (to match the version in grafana/packages.json if needed)
# corepack enable
# yarn set version stable # e.g. 3.2.0

# yarn config vscode
yarn dlx @yarnpkg/sdks vscode
