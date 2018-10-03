#!/bin/bash

# first, disable integrated audio (mini-jack and HDMI)
sudo sed -i 's/^\s*dtparam=audio/#dtparam=audio/' '/boot/config.txt'

# Change USB priority to be able to get index 0
# (otherwise it would be index 1, even without any device as index 0)
sudo sed -i -E 's/(options\W+snd-usb-audio\W+index\W?)=.+/\1=0/g'  '/lib/modprobe.d/aliases.conf'

echo"
######################################################################################
#  You should plug your USB soundcard now.                                           #
#  After the boot, check that it is unmuted, and that the output volume is correct.  #
#  You can use the command 'alsamixer'.                                              #
#  Then 'sudo alsactl store' to save the settings.                                   #
######################################################################################
"


# first, disable automatic gain
for control in 'Auto Gain Control' 'AGC' ; do
    executeOnNextBoot "amixer -c 0 set ${control} mute"
done

# then, set master volume and unmute
for control in 'Master' 'Main' 'Speaker' 'Headphones' 'PCM' ; do
    executeOnNextBoot "amixer -c 0 set ${control} 0dB unmute"
done

# finally, store settings for them to persist after shut-down
executeOnNextBoot "sudo alsactl store"
