alias wgets='wget --no-check-certificate'
alias pi='picocom -b 1500000 /dev/tty.usbserial-FT2SRPNZ'
alias vimdiff='nvim -d'
alias grep='grep --color --exclude=tags'
alias pi='picocom -b 115200 /dev/tty.usbmodemE00710091'

# log ssl key
export SSLKEYLOGFILE=~/.ssl-key.log

# gstreamer pkg
export PATH=$PATH:/Library/Frameworks/GStreamer.framework/Versions/1.0/bin

# ext2fuse
export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
export PATH="/usr/local/opt/e2fsprogs/sbin:$PATH"

# python 2.7.10
export PATH="/usr/local/bin:$PATH"

function ntfs() {
    sudo umount /Volumes/$2
    sudo mkdir /Volumes/$2
    sudo mount -o rw,auto,nobrowse -t ntfs /dev/$1 /Volumes/$2
}

function ext4() {
	[ "$1" = "" ] && echo "ext4 disk3s1" && exit
	sudo umount /Volumes/Transcend
	sudo mkdir /Volumes/Transcend
	sudo ext4fuse /dev/$1 /Volumes/Transcend -o allow_other
}

function dirdiff() {
    nvim -c "DirDiff $1 $2"
}


# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
