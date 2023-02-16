set -x PATH ~/go/bin $PATH
set -x PATH /usr/local/luarocks/bin $PATH
# set -x PATH /usr/local/texlive/2021/bin/x86_64-linux $PATH

set -x  LC_ALL "en_US.UTF-8"
set -x WINEARCH "win32"
set -x PATH ~/.cargo/bin $PATH
set -x PATH ~/.fnm $PATH
set -x PATH ~/.local/bin $PATH
set -x PATH ~/.local/bin/bin $PATH
set -x PATH ~/.local/bin/bin/statusbar $PATH

set -x PATH /usr/local/texlive/2022/bin/x86_64-linux/ $PATH
alias nusr "~/dotfiles/shell_scripts/create_new_usr.sh"
fnm env --use-on-cd | source

fish_vi_key_bindings
alias mvi ~/.config/lvim/mylvim/mvi
alias vi lvim
alias tobupt ~/dotfiles/conf_files/openssh/connect_bupt.sh
alias mlt "sudo ~/dotfiles/shell_scripts/change_light_arch.sh"
alias v lvim
alias rm trash-put
alias em "emacs -nw"
# shopt -s direxpand
set de /mnt/c/Users/yexiang//Desktop
set do /mnt/c/Users/yexiang//Downloads
alias ctp 'cd ~/temp_try'
alias cdh 'cd ~/dotfiles'
alias cvh 'cd ~/.local/share/lunarvim/lvim/'
alias cbg 'cd ~/myBlog'
alias cpp 'cd ~/mypaper'
set -U fish_cursor_insert line
set -U fish_cursor_default block


alias uwc '~/dotfiles/shell_scripts/use_curl_wget.fish'
alias nuwc '~/dotfiles/shell_scripts/no_use_curl_wget.fish'

alias vvc 'vi ~/.config/lvim/config.lua'
alias vfc 'vi ~/dotfiles/conf_files/fish/config.fish'
alias wda 'fish ~/myDiary/create_diary.fish'
alias wtp 'fish ~/myDiary/create_topic.fish'
alias cda 'cd ~/myDiary'

if test (grep microsoft /proc/version)
 # set -x http_proxy socks5://127.0.0.1:10808
 # set -x https_proxy socks5://127.0.0.1:10808
    set -x http_proxy socks5://172.23.128.1:10808
    set -x https_proxy socks5://172.23.128.1:10808
    set -x DISPLAY 172.23.128.1:0.0
end

alias bk '~/dotfiles/shell_scripts/backup_files.fish'
alias gp 'grep -n -H -R'

bind -M insert \cj 'accept-autosuggestion'
bind -M insert \cu 'accept-autosuggestion'
set -U FZF_COMPLETE 0
set -U FZF_FIND_FILE_COMMAND "ag -l --hidden --ignore .git . \$dir 2> /dev/null"
# bind -M default cd  '__fzf_cd'
# bind -M insert \ek 'set fish_bind_mode default'
# set -gx Z_SCRIPT_PATH ~/z/z.sh
set -gx EDITOR vi
