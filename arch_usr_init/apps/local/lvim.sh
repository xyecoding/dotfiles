#LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
ln -s ~/dotfiles/conf_files/nvim ~/.config/lvim/mylvim

rm ~/.config/lvim/config.lua

ln -s ~/.config/lvim/mylvim/lua/config.lua ~/.config/lvim/config.lua
sudo pacman -S xsel
yay -S unclutter
pip install neovim-remote
