#! /usr/bin/bash

name="$@"
sudo useradd -m -s /usr/bin/fish $name
echo -e "\033[41;36m $name is created \033[0m"
sudo passwd $name
