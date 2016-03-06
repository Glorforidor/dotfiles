#!/bin/bash
git submodule init
git submodule update
#Sleep for a bit.
sleep 2
cp -r .vim .vimrc ~/
cp -r .tmux .tmux.conf ~/
wget -O ~/Downloads/go.tar.gz https://storage.googleapis.com/golang/go1.6.0.linux-amd64.tar.gz
#Sleep for a bit.
sleep 2
sudo tar -C /usr/local -xzvf ~/Downloads/go.tar.gz
mkdir -p ~/Programming/Go/bin
mkdir -p ~/Programming/Go/pkg
mkdir -p ~/Programming/Go/src
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
echo "export GOPATH=\$HOME/Programming/Go" >> ~/.profile

