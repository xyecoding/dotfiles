useradd -m -G wheel -s /bin/bash Eric  #wheel附加组可sudo，以root用户执行命令 -m同时创建用户家目录
pacman -S networkmanager
passwd Eric
