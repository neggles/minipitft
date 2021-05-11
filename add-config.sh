#!/usr/bin/env bash
set -e
ret=-1
datestamp=`date -I`

# add config.txt
if (grep -q 'added by minipitft-dkms' /boot/config.txt 2>/dev/null); then
    echo "Found existing dtoverlay line in /boot/config.txt, will not edit file"
    ret=1
else
    echo "Backing up /boot/config.txt to /boot/config.txt.minitft"
    sudo cp /boot/config.txt /boot/config.txt.minitft
    echo "Adding lines to /boot/config.txt"
    sudo tee -a /boot/config.txt << "EOF"
# --- added by minipitft-dkms ${datestamp} ---
#hdmi_force_hotplug=1  # required for cases when HDMI is not plugged in!
dtparam=spi=on
dtparam=i2c1=on
dtparam=i2c_arm=on
#dtoverlay=minipitft114,rotate=3,fps=60
#dtoverlay=minipitft13,rotate=3,fps=60
# --- end minipitft-dkms ${datestamp} ---
EOF
    echo "done, uncomment your specific model in /boot/config.txt and enable force_hotplug if you need to"
fi

exit 0

