mkdir ~/.local/share/fonts
ln -s ~/dotfiles/conf_files/nerd_font/nerd-fonts ~/.local/share/fonts/nerd-fonts
fc-cache && mkfontscale && mkfontdir
