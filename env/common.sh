export PS1="[\[\033[01;31m\]\$(echo \${ADMIN_PASSWD})\[\e[0m\]@\[\033[01;34m\]\$(echo \${IP})\[\e[0m\]] \W\$ "
export GST_DEBUG="*:3"

alias curl-get='curl -k -u "admin:${ADMIN_PASSWD}" --anyauth -X GET'
alias curl-post='curl -k -u "admin:${ADMIN_PASSWD}" --anyauth -X POST'
alias arp='arping -c 1 -i "${NIC}" "${IP}"'
alias nite='curl-get http://"${IP}":"${HTTP_PORT}"/adc-api/RequestToStandby'
alias wol='wakeonlan -i "${IP}" "${MAC}"'
alias capture='tcpdump host "${IP}" -w "$(date +'%Y%0m%0d%0H%0M%0S')".pcap'
alias gst-putaudio='gst-launch-1.0 filesrc location=data/alexa-8k.wav ! wavparse ! audioconvert ! volume volume="${VOLUME:-1}" ! audioresample ! audio/x-raw, rate=8000, channels=1 ! mulawenc ! souphttpclientsink location=http://"${IP}":"${HTTP_PORT}"/adc-api/PutAudioStream retries=3 retry-delay=1 user-id=admin user-pw="${ADMIN_PASSWD:-admin}"'
alias gst-udp='gst-launch-1.0 rtspsrc location=rtsp://admin:"${ADMIN_PASSWD}"@"${IP}"/adc-api/GetStream?streamID="${ID:-1}" name=stream stream. ! rtph264depay ! avdec_h264 ! videoconvert ! videoscale ! video/x-raw,width=640,height=360 ! "${VIDEO_SINK}" stream. ! rtppcmudepay ! mulawdec ! audioconvert ! volume volume="${VOLUME:-5}" ! "${AUDIO_SINK}"'
alias gst-tcp='gst-launch-1.0 rtspsrc tcp-timeout=0 protocols=4 location=rtsp://admin:"${ADMIN_PASSWD}"@"${IP}"/adc-api/GetStream?streamID="${ID:-1}" name=stream stream. ! rtph264depay ! avdec_h264 ! videoconvert ! videoscale ! video/x-raw,width=640,height=360 ! "${VIDEO_SINK}" stream. ! rtppcmudepay ! mulawdec ! audioconvert ! volume volume="${VOLUME:-5}" ! "${AUDIO_SINK}"'
alias gst-tcp-ext='gst-launch-1.0 rtspsrc tcp-timeout=0 protocols=4 location=rtsp://admin:"${ADMIN_PASSWD}"@"${EXT_IP}":"${EXT_RTSP_PORT:-45002}"/adc-api/GetStream?streamID="${ID:-1}" name=stream stream. ! rtph264depay ! avdec_h264 ! videoconvert ! videoscale ! video/x-raw,width=640,height=360 ! "${VIDEO_SINK}" stream. ! rtppcmudepay ! mulawdec ! audioconvert ! volume volume="${VOLUME:-5}" ! "${AUDIO_SINK}"'
alias gst-http='gst-launch-1.0 rtspsrc tcp-timeout=0 protocols=4 location=rtsph://admin:"${ADMIN_PASSWD}"@"${IP}":"${HTTP_PORT}"/adc-api/GetStream?streamID="${ID:-1}" name=stream stream. ! rtph264depay ! avdec_h264 ! videoconvert ! videoscale ! video/x-raw,width=640,height=360 ! "${VIDEO_SINK}" stream. ! rtppcmudepay ! mulawdec ! audioconvert ! volume volume=${VOLUME:-5} ! "${AUDIO_SINK}"'
alias gst-https='gst-launch-1.0 rtspsrc tcp-timeout=0 tls-validation-flags=generic-error protocols=4 location=rtspsh://admin:"${ADMIN_PASSWD}"@"${IP}":"${HTTPS_PORT:-443}"/adc-api/GetStream?streamID="${ID:-1}" name=stream stream. ! rtph264depay ! queue ! h264parse ! avdec_h264 ! videoconvert ! videoscale ! video/x-raw,width=640,height=360 ! "${VIDEO_SINK}" stream. ! rtppcmudepay ! mulawdec ! audioconvert ! volume volume=${VOLUME:-5} ! "${AUDIO_SINK}"'
alias gst-https-ext='gst-launch-1.0 rtspsrc tcp-timeout=0 tls-validation-flags=generic-error protocols=4 location=rtspsh://admin:"${ADMIN_PASSWD}"@"${EXT_IP}":"${EXT_HTTPS_PORT:-45001}"/adc-api/GetStream?streamID="${ID:-1}" name=stream stream. ! rtph264depay ! avdec_h264 ! videoconvert ! videoscale ! video/x-raw,width=640,height=360 ! "${VIDEO_SINK}" stream. ! rtppcmudepay ! mulawdec ! audioconvert ! volume volume=${VOLUME:-5} ! "${AUDIO_SINK}"'
alias gst-fwd='gst-launch-1.0 rtspsrc tcp-timeout=0 tls-validation-flags=generic-error protocols=4 location=rtspsh://admin:"${ADMIN_PASSWD}"@"${IP}":"${HTTPS_PORT:-443}"/adc-api/GetStream?streamID="${ID:-1} latency=0 rtp-blocksize=1360 ! rtph264depay ! tee name=t ! queue max-size-buffers=1 ! rtph264pay config-interval=1 seqnum-offset=0 timestamp-offset=0 ! capsfilter caps="application/x-rtp,media=video" ! udpsink host="${FWD_IP}" port=10212'
alias gst-fwd-ext='gst-launch-1.0 rtspsrc tcp-timeout=0 tls-validation-flags=generic-error protocols=4 location=rtspsh://admin:"${ADMIN_PASSWD}"@"${EXT_IP}":"${EXT_HTTPS_PORT:-45001}"/adc-api/GetStream?streamID="${ID:-1}" latency=0 rtp-blocksize=1360 ! rtph264depay ! tee name=t ! queue max-size-buffers=1 ! rtph264pay config-interval=1 seqnum-offset=0 timestamp-offset=0 ! capsfilter caps="application/x-rtp,media=video" ! udpsink host="${FWD_IP}" port=10212'
alias gst-rcv='gst-launch-1.0 -v udpsrc port=10212 caps="application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! decodebin ! videoconvert ! videoscale ! video/x-raw,width=640,height=360 ! "${VIDEO_SINK}"'

ext-get() {
  curl -k -u "admin:${ADMIN_PASSWD}" --anyauth -X GET "https://${EXT_IP}:${EXT_HTTPS_PORT}/adc-api/${1}"
  echo
}
inr-get() {
  curl -k -u "admin:${ADMIN_PASSWD}" --anyauth -X GET "https://${IP}:${HTTPS_PORT}/adc-api/${1}"
  echo
}
ext-post() {
  curl -k -u "admin:${ADMIN_PASSWD}" --anyauth -X POST -F upload=@${2} "https://${EXT_IP}:${EXT_HTTPS_PORT}/adc-api/${1}"
  echo
}
inr-post() {
  curl -k -u "admin:${ADMIN_PASSWD}" --anyauth -X POST -F upload=@${2} "https://${IP}:${HTTPS_PORT}/adc-api/${1}"
  echo
}

pytest-all() {
  TIMESTAMP="$(date +'%Y%0m%0d%0H%0M%0S')"
  stty -F /dev/ttyUSB0 115200 cs8 -parenb -cstopb -crtscts 
  setsid stdbuf -oL awk '{print strftime("%Y-%m-%d %H:%M:%S"), $0; }' < /dev/ttyUSB0 &> serial-${TIMESTAMP}.txt
  setsid stdbuf -oL tcpdump -i any host ${IP} -w tcpdump-${TIMESTAMP}.pcap &> /dev/null
  COLUMNS=120 stdbuf -oL py.test test*.py &> pytest-${TIMESTAMP}.txt
  echo "py.test test*.py ${TIMESTAMP} going..."
}
pytest-kill() {
  killall py.test tcpdump awk
}

export HTTP_PORT=80
export HTTPS_PORT=443
export PYTHONWARNINGS="ignore:Unverified HTTPS request"

## may need to change according to your environement

export NIC=wlan0
