#!/usr/bin/env bash
set -ue -o pipefail

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

MONGO_REPO="deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse"
SOURCE_LIST="/etc/apt/sources.list.d/mongodb-org-3.2.list"
if [ ! -f "$SOURCE_LIST" ]; then
    echo "$MONGO_REPO" | sudo tee "$SOURCE_LIST"
fi

apt-get update
apt-get install -y mongodb-org
service mongod restart
