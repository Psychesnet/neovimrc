export LANG=zh_TW.UTF-8
alias ls='ls -w'
alias wgets='wget --no-check-certificate'
alias pi='picocom -b 1500000 /dev/tty.usbserial-FT2SRPNZ'

export NVM_DIR="$HOME/.nvm"
export NODE_PATH=~/.nvm/versions/node/v8.9.0/lib/node_modules/npm/node_modules/
. "/usr/local/opt/nvm/nvm.sh"

function ntfs() {
    sudo umount /Volumes/$2
    sudo mkdir /Volumes/$2
    sudo mount -o rw,auto,nobrowse -t ntfs /dev/$1 /Volumes/$2
}
