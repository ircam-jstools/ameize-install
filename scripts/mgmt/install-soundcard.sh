# this script is intended to be sourced, as it defines variables and functions

log "Installing soundcard ${target_sndcard}"

case $target_sndcard in
    "audioinjector")
        echo "> execute \"soundcards/install-audioinjector.sh\""
        # must be sourced because relies on _globals.sh
        source ./soundcards/install-audioinjector.sh
        ;;
    "hifiberry")
        echo "> execute \"soundcards/install-hifiberry.sh\""
        source ./soundcards/install-hifiberry.sh
        ;;
    "raspiaudio")
        echo "> execute \"soundcards/install-raspiaudio.sh\""
        source ./soundcards/install-raspiaudio.sh
        ;;
    "usb")
        echo "> execute \"soundcards/install-usb-audio.sh\""
        source ./soundcards/install-usb-audio.sh
        ;;
    "none")
        echo "> installing no soundcard"
        ;;
    *) echo "invalid soundcard"
       ;;
esac
