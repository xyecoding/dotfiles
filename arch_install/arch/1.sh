echo "Section \"InputClass\"
Identifier \"touchpad catchall\"
Driver \"libinput\"
Option \"Tapping\" \"on\"
EndSection" > /etc/X11/xorg.conf.d/30-touchpad.conf

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
