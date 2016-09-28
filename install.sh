#!/bin/bash
# Setup Vim and Tmux
git submodule init
git submodule update
# Sleep for a bit.
sleep 2
cp -r .vim .vimrc $HOME/
cp -r .tmux .tmux.conf $HOME/

# Setup Golang
wget -O $HOME/Downloads/go.tar.gz https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz
# Sleep for a bit.
sleep 2
sudo tar -C /usr/local -xzvf $HOME/Downloads/go.tar.gz
mkdir -p $HOME/Programming/Go/bin
mkdir -p $HOME/Programming/Go/pkg
mkdir -p $HOME/Programming/Go/src
echo "export PATH=\$PATH:/usr/local/go/bin" >> $HOME/.profile
echo "export GOPATH=\$HOME/Programming/Go" >> $HOME/.profile
echo "export PATH=\$PATH:\$GOPATH/bin" >> $HOME/.profile

# Setup Rust
curl -sSf https://static.rust-lang.org/rustup.sh | sh
echo "export RUSTBIN=\$HOME/.cargo/bin" >> $HOME/.profile
echo "export PATH=\$PATH:\$RUSTBIN" >> $HOME/.profile

# Setup Google App Engine
wget -O $HOME/Downloads/goappengine.zip https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.40.zip
# Sleep for a bit
sleep 2
unzip $HOME/Downloads/goappengine.zip -d $HOME/
echo "export PATH=\$PATH:\$HOME/go_appengine" >> $HOME/.profile
