fnm env --use-on-cd | source
fish_vi_key_bindings
if test "$TERM" = "st-256color"
    tmux
end
source ~/dotfiles/conf_files/fish/fzf_open.fish
source ~/dotfiles/conf_files/fish/alias.fish
source ~/dotfiles/conf_files/fish/env.fish

