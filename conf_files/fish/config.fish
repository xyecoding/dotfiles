set -x PATH ~/go/bin $PATH
set -x PATH /usr/local/luarocks/bin $PATH
set -x PATH /usr/local/texlive/2021/bin/x86_64-linux $PATH

set -x PATH ~/.cargo/bin $PATH
set -x PATH ~/.fnm $PATH
set -x PATH ~/.local/bin $PATH
set -x DISPLAY :0.0
alias nusr "~/dotfiles/shell_scripts/create_new_usr.sh"

fish_vi_key_bindings
alias mvi ~/.config/lvim/mylvim/mvi
alias vi lvim
alias v lvim
alias rm trash-put
# shopt -s direxpand
set de /mnt/c/Users/12197/Desktop
set do /mnt/c/Users/12197/Downloads
alias ctp 'cd ~/temp_try'
alias cvh 'cd ~/.config/lvim/mylvim'
alias csn 'cd ~/.config/lvim/mylvim/snippets/vscode/snippets'
alias cvv 'cd ~/.local/share/lunarvim/lvim/lua/lvim'
alias cbg 'cd ~/myBlog'
alias cpp 'cd ~/mypaper/Understanding'
set -U fish_cursor_insert line
set -U fish_cursor_default block


alias vvc 'vi ~/.config/lvim/config.lua'
alias vvp 'vi ~/.local/share/lunarvim/lvim/lua/lvim/plugins.lua'
alias vvi 'vi ~/.local/share/lunarvim/lvim/init.lua'
alias vfc 'vi ~/dotfiles/conf_files/fish/config.fish'
alias wda 'fish ~/myDiary/create_diary.fish'
alias cda 'cd ~/myDiary'

alias wget '~/dotfiles/shell_scripts/wget'
alias curl '~/dotfiles/shell_scripts/curl'
alias bk '~/dotfiles/shell_scripts/backup_files.fish'
alias gp 'grep -n -H -R'

bind -M insert \cj 'accept-autosuggestion'
set -U FZF_COMPLETE 0
set -U FZF_FIND_FILE_COMMAND "ag -l --hidden --ignore .git . \$dir 2> /dev/null"
# bind -M default cd  '__fzf_cd'
# bind -M insert \ek 'set fish_bind_mode default'
# set -gx Z_SCRIPT_PATH ~/z/z.sh
set -gx EDITOR vi
