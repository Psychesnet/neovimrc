#!/bin/sh

if [ "$(uname)" = "Darwin" ]; then
    echo "This is mac os x, maybe need to run xcode-select --install first"
    brew install coreutils
    brew install neovim node
    brew install the_silver_searcher
    brew install dbus ctags git
    brew install lua
    brew services start dbus
    brew install cmake screen python3 curl ffmpeg wget
    # py3
    pip3 install neovim pyvim pynvim
    # node.js
    npm install -g yarn
    npm install -g neovim
    npm install -g ungit
    # ruby
    sudo gem install neovim
    sudo gem environment
else
    echo "This maybe be Linux"
    sudo apt-get install software-properties-common
    # neovim
    sudo add-apt-repository ppa:neovim-ppa/unstable
    # python3.8
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt-get update
    sudo apt-get install neovim curl screen tig exuberant-ctags \
        net-tools git openssh-server cmake trace-cmd silversearcher-ag kernelshark python3.8 python3-pip \
	    nodejs ruby ruby-dev lua neovim universal-ctags
fi

ln -sf $(pwd)/.xvimrc ~/.xvimrc
ln -sf $(pwd)/.inputrc ~/.inputrc
ln -sf $(pwd)/.bash_profile ~/.bash_profile
ln -sf $(pwd)/.kermrc ~/.kermrc
ln -sf $(pwd)/.gitconfig ~/.gitconfig
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.env ~/.env
# for screen
ln -sf $(pwd)/.screenrc ~/.screenrc
ln -s ~/.bash_profile ~/.bashrc
# folder
rm -rf ~/.vim && ln -sf $(pwd)/.vim ~/.vim
rm -rf ~/.ssh && ln -sf $(pwd)/.ssh ~/.ssh
rm -rf ~/.config && ln -sf $(pwd)/.config ~/.config
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall
