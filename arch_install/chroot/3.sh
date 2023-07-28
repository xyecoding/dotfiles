pacstrap /mnt base base-devel linux linux-headers linux-firmware  #base-devel在AUR包的安装是必须的
pacstrap /mnt dhcpcd iwd vim bash-completion tmux  #一个有线所需(iwd也需要dhcpcd) 一个无线所需 一个编辑器 一个补全工具

genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
