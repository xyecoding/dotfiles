#!/usr/bin/expect

spawn sudo openconnect --protocol=gp vpn.bupt.edu.cn -u 2018010095
expect "*eric*"
send "123\r"
expect "Password*"
send "yexiang520.\r"
interact
