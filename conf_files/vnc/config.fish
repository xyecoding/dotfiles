mkdir -p ~/.config/systemd/user
ln -s ~/dotfiles/conf_files/vnc/frpc.service ~/.config/systemd/user/
ln -s ~/dotfiles/conf_files/vnc/x0vncserver.service ~/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable x0vncserver.service
systemctl --user start x0vncserver.service
systemctl --user enable frpc.service
systemctl --user start frpc.service
