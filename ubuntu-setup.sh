#!/bin/bash

sudo apt-get update
sudo apt-get install -y \
 build-essential \
 libncurses-dev \
 libssl-dev \
 libelf-dev \
 vim \
 zsh \
 make \
 cmake \
 git \
 htop \
 python3 \
 python3-pip \
 rsync

# Docker
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker


mkdir -p ~/.ssh

if [ -z "$SSH_KEY" ]; then
    echo "Environment variable KEY is not defined."
else
    echo "$SSH_KEY" >> ~/.ssh/authorized_keys
    echo "Added KEY to authorized_keys file."
fi
