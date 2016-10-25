#!/usr/bin/env bash
set -e -o pipefail

export NVM_DIR="/home/node/.nvm"
. "$NVM_DIR/nvm.sh"

npm install pm2 -g
