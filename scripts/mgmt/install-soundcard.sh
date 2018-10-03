# this script is intended to be sourced, as it defines variables and functions

log "Installing soundcard ${target_sndcard}"

case $target_sndcard in
    "audioinjector")
        echo "> execute \"soundcards/install-audioinjector.sh\""
        ./soundcards/install-audioinjector.sh
        ;;
    "hifiberry")
        echo "> execute \"soundcards/install-hifiberry.sh\""
        ./soundcards/install-hifiberry.sh
        ;;
    "raspiaudio")
        echo "> execute \"soundcards/install-raspiaudio.sh\""
        ./soundcards/install-raspiaudio.sh
        ;;
    "usb")
        echo "> execute \"soundcards/install-usb-audio.sh\""
        ./soundcards/install-usb-audio.sh
        ;;
    "none")
        echo "> installing no soundcard"
        ;;
    *) echo "invalid soundcard"
       ;;
esac
