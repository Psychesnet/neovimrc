alias wgets='wget --no-check-certificate'
alias vimdiff='nvim -d'
alias vi=nvim
alias grep='grep --color --exclude=tags'
alias pcl_viewer='/usr/local/Cellar/pcl/1.11.1_5/pcl_viewer.app/Contents/MacOS/pcl_viewer'

# log ssl key
export SSLKEYLOGFILE=~/.ssl-key.log

# gstreamer pkg
export PATH=$PATH:/Library/Frameworks/GStreamer.framework/Versions/1.0/bin

# ext2fuse
export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
export PATH="/usr/local/opt/e2fsprogs/sbin:$PATH"

# python 2.7.10
export PATH="/usr/local/bin:$PATH"

# eng env
export LC_ALL=en_US.UTF-8

function ntfs() {
    sudo umount /Volumes/$2
    sudo mkdir /Volumes/$2
    sudo mount -o rw,auto,nobrowse -t ntfs /dev/$1 /Volumes/$2
}

function apfs() {
    sudo mount -t hfsplus -o remount,force,rw $1
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

function pi() {
    [ -c "/dev/tty.usbmodemE00710091" ] && alias pi='picocom -b 115200 /dev/tty.usbmodemE00710091'
    [ -c "/dev/ttyACM0" ] && alias sf='picocom -b 115200 /dev/ttyACM0'
    [ -c "/dev/ttyUSB0" ] && alias s6lm='picocom -b 115200 /dev/ttyUSB0'
}

