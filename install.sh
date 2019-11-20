#!/bin/sh

if [ "$(uname)" = "Darwin" ]; then
    echo "This is mac os x, maybe need to run xcode-select --install first"
    brew install neovim node
    pip3 install neovim pynvim
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
rm -rf ~/.vim && ln -sf $(pwd)/.vim ~/.vim
rm -rf ~/.ssh && ln -sf $(pwd)/.ssh ~/.ssh
rm -rf ~/.config && ln -sf $(pwd)/.config ~/.config
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall
