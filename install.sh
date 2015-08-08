#!/bin/bash
git submodule init
git submodule update
#Sleep for a bit.
sleep 2
cp -r .vim .vimrc ~/
wget -O ~/Downloads/go.tar.gz https://storage.googleapis.com/golang/go1.5rc1.linux-amd64.tar.gz
#Sleep for a bit.
sleep 2
sudo tar -C /usr/local -xzvf ~/Downloads/go.tar.gz
mkdir -p ~/Programming/Go/bin
mkdir -p ~/Programming/Go/pkg
mkdir -p ~/Programming/Go/src
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
echo "export GOPATH=~/Programming/Go" >> ~/.profile

