yay -S fuse2 gtkmm linux-headers ncurses libcanberra pcsclite
yay -S vmware-workstation
sudo systemctl enable --now vmware-networks-configuration.service
sudo systemctl start --now vmware-networks-configuration.service
sudo systemctl enable vmware-networks.service  vmware-usbarbitrator.service
sudo systemctl start vmware-networks.service  vmware-usbarbitrator.service
sudo modprobe -a vmw_vmci vmmon
