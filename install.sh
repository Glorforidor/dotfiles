#!/bin/bash

# Install programs

if [ "$ZSH_VERSION" == '' ]; then
    sudo apt install zsh
    chsh -s /bin/zsh
fi

if [ ! -f /usr/bin/curl ]; then
    sudo apt install curl
fi

if [ "$TMUX" == '' ]; then
    sudo apt install tmux
fi

# Setup Vim and Tmux
git submodule init
git submodule update

# Sleep for a bit.
sleep 2

cp -r .vim .vimrc $HOME/
cp -r .tmux .tmux.conf $HOME/

# Download Golang
wget -O $HOME/Downloads/go.tar.gz https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz

# Sleep for a bit.
sleep 2

# Setup Golang
sudo tar -C /usr/local -xzvf $HOME/Downloads/go.tar.gz
mkdir -p $HOME/programming/go/bin
mkdir -p $HOME/programming/go/pkg
mkdir -p $HOME/programming/go/src
echo "# set Go" >> $HOME/.profile
echo "export PATH=\$PATH:/usr/local/go/bin" >> $HOME/.profile
echo "export GOPATH=\$HOME/programming/go" >> $HOME/.profile
echo "export PATH=\$PATH:\$GOPATH/bin" >> $HOME/.profile
echo "" >> $HOME/.profile

# Download Rust
curl https://sh.rustup.rs -sSf | sh

# Setup Rust
echo "# set Rust" >> $HOME/.profile
echo "export RUSTBIN=\$HOME/.cargo/bin" >> $HOME/.profile
echo "export PATH=\$PATH:\$RUSTBIN" >> $HOME/.profile
echo "" >> $HOME/.profile

# Download Google App Engine
wget -O $HOME/Downloads/goappengine.zip https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.48.zip

# Sleep for a bit
sleep 2

# Setup Google App Engine
unzip $HOME/Downloads/goappengine.zip -d $HOME/
echo "# set google app engine for go" >> $HOME/.profile
echo "export PATH=\$PATH:\$HOME/go_appengine" >> $HOME/.profile

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cp -r .zshrc $HOME/

// Exit OhMyZsh to stop install.
exit

echo "Install now finished!"
echo "Relogin to take effect."
