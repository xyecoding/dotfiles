#!/bin/bash
crm &
st &
birdtray &
vmware &
# netease-cloud-music %U --no-sandbox &
xrandr --output HDMI-1-1 --auto --right-of eDP-1-1
unclutter -idle 1 -jitter 2 -root &
nutstore &
x0vncserver  -rfbauth ~/.vnc/passwd  -SecurityTypes VncAuth &
counter=0
while [ $counter -lt 10 ]; do
    # 后台运行程序a
    ~/frp/frpc -c ~/frp/frpc.toml &
    # 获取程序a的进程ID
    pid=$!
    # 等待一段时间以便检查程序是否成功启动
    sleep 1
    # 检查程序是否在后台成功运行
    if ps -p $pid > /dev/null; then
       break
    else
        ((counter++))
    fi
done



