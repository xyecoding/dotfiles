#! /usr/bin/env bash

yay -S openssh
git config --global user.name "xyegithub"
git config --global user.email "xye@bupt.edu.cn"
#git config --global url."https://mirror.ghproxy.com/https://github.com".insteadOf https://github.com
ssh-keygen -t rsa -C "xye@bupt.edu.cn"
cat ~/.ssh/id_rsa.pub
