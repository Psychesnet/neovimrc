#!/bin/sh

if [ "$(uname)" = "Darwin" ]; then
    echo "This is mac os x"
    brew install neovim node
    pip3 install neovim
    npm install -g yarn
else
    echo "This maybe be Linux"
    sudo apt-get install build-essentail vim \
        net-tools git openssh-server cmake trace-cmd silversearcher-ag kernelshark
fi

ln -sf $(pwd)/init.vim ~/.vimrc
ln -sf $(pwd)/.inputrc ~/.inputrc
ln -sf $(pwd)/.bash_profile ~/.bash_profile
ln -sf $(pwd)/.kermrc ~/.kermrc
ln -sf $(pwd)/.gitconfig ~/.gitconfig
# folder
ln -sf $(pwd)/.vim ~/
ln -sf $(pwd)/.ssh ~/
ln -sf $(pwd)/.config ~/
vim -u ~/.vimrc +BundleInstall! +BundleClean +qall
