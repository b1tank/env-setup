#!/bin/bash

# set up dev resources (data sources and dashboards)
# ref: https://github.com/grafana/grafana/blob/main/contribute/developer-guide.md#add-data-sources
cd devenv
./setup.sh

# backend: build and start
make run

# frontend: install packages
yarn install --immutable

# frontend: start
yarn start
