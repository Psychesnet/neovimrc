export LANG=zh_TW.UTF-8
alias wgets='wget --no-check-certificate'
alias pi='picocom -b 1500000 /dev/tty.usbserial-FT2SRPNZ'
alias vimdiff='nvim -d'

# log ssl key
export SSLKEYLOGFILE=~/.ssl-key.log

function ntfs() {
    sudo umount /Volumes/$2
    sudo mkdir /Volumes/$2
    sudo mount -o rw,auto,nobrowse -t ntfs /dev/$1 /Volumes/$2
}

function dirdiff() {
    nvim -c "DirDiff $1 $2"
}
