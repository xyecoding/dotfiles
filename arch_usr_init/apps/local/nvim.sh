#bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install-neovim-from-release)
cd ~/.local
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
ln -s ~/.local/nvim-linux64/bin/nvim ~/.local/bin

LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
ln -s ~/dotfiles/conf_files/nvim ~/.config/lvim/mylvim

rm ~/.config/lvim/config.lua

ln -s ~/.config/lvim/mylvim/lua/config.lua ~/.config/lvim/config.lua
sudo pacman -S xsel
pip install neovim-remote
