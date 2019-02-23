#!/bin/bash

# Setup linux installations after my preference.

# source the os-release so the package manager can be detected
if [[ -f /etc/os-release ]]; then
    source '/etc/os-release'
fi

case "${ID}" in
    *'ubuntu'* | *'debian'*)
        package_manager='apt-get'
        ;;
    *'fedora'*)
        package_manager='dnf'
        ;;
    *)
        # assume zypper as default package manager
        package_manager='zypper'
        ;;
esac

if [[ ! -f /bin/zsh ]]; then
    sudo "${package_manager}" install -y zsh
fi

if [[ ! -f /usr/bin/curl ]]; then
    sudo "${package_manager}" install -y curl
fi

if [[ ! -f /usr/bin/tmux ]]; then
    sudo "${package_manager}" install -y tmux
fi

# Setup Vim and Tmux
git submodule init
git submodule update

# Sleep for a bit.
sleep 2

cp -r .vim .vimrc $HOME/
cp -r .tmux .tmux.conf $HOME/

# Download Golang
wget -O $HOME/Downloads/go.tar.gz \
    https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz

# Sleep for a bit.
sleep 2

# Setup Golang
sudo tar -C /usr/local -xzvf $HOME/Downloads/go.tar.gz
echo '# set Go
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"
' >> $HOME/.profile

# Download Rust
# echo '# set Rust'
# curl https://sh.rustup.rs -sSf | sh

# Download Google App Engine
# wget -O $HOME/Downloads/goappengine.zip https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.48.zip

# Sleep for a bit
# sleep 2

# Setup Google App Engine
# unzip $HOME/Downloads/goappengine.zip -d $HOME/
# echo '# set google app engine for go
# export PATH="$PATH:$HOME/go_appengine"
# ' >> $HOME/.profile

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cp -r .zshrc $HOME/
cp $HOME/.profile $HOME/.zprofile
