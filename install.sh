#!/bin/bash
# Setup Vim and Tmux
git submodule init
git submodule update
# Sleep for a bit.
sleep 2
cp -r .vim .vimrc ~/
cp -r .tmux .tmux.conf ~/

# Setup Golang
wget -O ~/Downloads/go.tar.gz https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz
# Sleep for a bit.
sleep 2
sudo tar -C /usr/local -xzvf ~/Downloads/go.tar.gz
mkdir -p ~/Programming/Go/bin
mkdir -p ~/Programming/Go/pkg
mkdir -p ~/Programming/Go/src
echo "export PATH=\$PATH:/usr/local/go/bin" >> $HOME/.profile
echo "export GOPATH=\$HOME/Programming/Go" >> $HOME/.profile
echo "export PATH=\$PATH:\$GOPATH/bin" >> $HOME/.profile

# Setup Rust
curl -sSf https://static.rust-lang.org/rustup.sh | sh

# Setup Google App Engine
echo "export PATH=\$PATH:\$HOME/go_appengine" >> $HOME/.profile
