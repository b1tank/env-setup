#!/bin/bash

# backend: build and start
make run

# frontend: install packages
yarn install --immutable

# frontend: start
yarn start
