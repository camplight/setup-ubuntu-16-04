#!/usr/bin/env bash
set -eu -o pipefail

USER="node"

if ! id "$USER" &>/dev/null; then
    useradd -d "/home/$USER" -m "$USER" -s /bin/bash
    passwd "$USER"
    adduser "$USER" "sudo"
else
    echo "User $USER already exists"
fi

apt-get update
apt-get -y upgrade
apt-get -y install git-core g++ curl libssl-dev apache2-utils make
