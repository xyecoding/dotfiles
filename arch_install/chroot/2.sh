timedatectl set-ntp true    #将系统时间与网络时间进行同步
timedatectl status          #检查服务状态

mkfs.ext4  /dev/sda2            #格式化根目录和home目录的两个分区
mkfs.ext4  /dev/sda3            #格式化根目录和home目录的两个分区
mkfs.vfat  /dev/sda1

mount /dev/sda2  /mnt
mkdir /mnt/efi     #创建efi目录
mount /dev/sda1 /mnt/efi
mkdir /mnt/home    #创建home目录
mount /dev/sda3 /mnt/home


