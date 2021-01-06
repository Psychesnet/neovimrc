export CCNAME=openwrt
export USER=root
export PASSWD=admin
export IP=172.31.5.204
export HTTP_PORT=80
export HTTPS_PORT=443
export PYTHONWARNINGS="ignore:Unverified HTTPS request"

export PS1="[\[\033[01;31m\]\$(echo \${CCNAME})\[\e[0m\]@\[\033[01;34m\]\$(echo \${IP})\[\e[0m\]] \W\$ "
export GST_DEBUG="*:3"

get() {
  [ ! $# -eq 1 ] && echo usage: get cgi && return
  curl -k -u "${USER}:${PASSWD}" --anyauth -X GET "https://${IP}:${HTTPS_PORT}/adc-api/${1}"
  echo
}

post() {
  [ ! $# -eq 2 ] && echo usage: post file cgi && return
  curl -k -u "${USER}:${PASSWD}" --anyauth -X POST -F upload=@${2} "https://${IP}:${HTTPS_PORT}/adc-api/${1}"
  echo
}
