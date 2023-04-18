set -x PATH ~/go/bin $PATH
set -x PATH /usr/local/luarocks/bin $PATH
# set -x PATH /usr/local/texlive/2021/bin/x86_64-linux $PATH

set -x  LC_ALL "en_US.UTF-8"
# set -x WINEARCH "win32"
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
alias ctp 'cd ~/temp_try'
alias cdh 'cd ~/dotfiles'
alias cdd 'cd ~/Downloads'
alias cvh 'cd ~/.local/share/lunarvim/lvim/'
alias cbg 'cd ~/myBlog'
alias gd   'goldendict'
alias cpp 'cd ~/mypaper'
set -U fish_cursor_insert line
set -U fish_cursor_default block

function dict_keys -d "Print keys from a key/value paired list"
    for idx in (seq 1 2 (count $argv))
        echo $argv[$idx]
    end
end

function dict_values -d "Print values from a key/value paired list"
    for idx in (seq 2 2 (count $argv))
        echo $argv[$idx]
    end
end

function dict_get -a key -d "Get the value associated with a key in a k/v paired list"
    test (count $argv) -gt 2 || return 1
    set -l keyseq (seq 2 2 (count $argv))
    # we can't simply use `contains` because it won't distinguish keys from values
    for idx in $keyseq
        if test $key = $argv[$idx]
            echo $argv[(math $idx + 1)]
            return
        end
    end
    return 1
end

if test $TERM = "st-256color"
    tmux
end

function ssh_connect
  sshpass -p $argv[1] ssh -p $argv[2] $argv[3]@$argv[4]
end 

set -l host_inf \
  host1 "10.112.36.190  666" \
  host2 "10.112.119.117 666" \
  host3 "10.112.218.126 666" \
  host3090 "10.112.75.66 22"\


# the key must be host name + "_" + user name
set -l user_inf \
  host1_zjf "zhaojiafeng SPGhaha12315" \
  host1_yx "yexiang go4light!" \
  host2_lfn "lfn lab223@b49OK"\
  host3_zjf "zhaojiafeng SPGhaha12315" \
  host3_yx "yexiang go4light!"\
  host3090_zjf "zjf SPGhaha12315"\

function cpfrom
  sshpass -p $argv[1] scp -r -P $argv[2] $argv[3]@$argv[4]:$argv[5] $argv[6]
end

function cpto
  sshpass -p $argv[1] scp -r -P $argv[2] $argv[6] $argv[3]@$argv[4]:$argv[5]
end

for user_name in (dict_keys $user_inf)
  set -l temp_host (echo $user_name | awk -F "_" '{print $1}')
  set -l temp_host (echo (dict_get $temp_host $host_inf) | awk '{print $1; print $2}')
  set -l user (echo (dict_get $user_name $user_inf ) | awk '{print $1; print $2}')
  alias to$user_name "ssh_connect $user[2] $temp_host[2] $user[1] $temp_host[1]"
  alias cpfrom$user_name  "cpfrom $user[2] $temp_host[2] $user[1] $temp_host[1]"
  alias cpto$user_name  "cpto $user[2] $temp_host[2] $user[1] $temp_host[1]"
end

alias uwc '~/dotfiles/shell_scripts/use_curl_wget.fish'
alias nuwc '~/dotfiles/shell_scripts/no_use_curl_wget.fish'
alias vvc 'vi ~/.config/lvim/config.lua'
alias vfc 'vi ~/dotfiles/conf_files/fish/config.fish'
alias wda 'fish ~/myDiary/create_diary.fish'
alias wtp 'fish ~/myDiary/create_topic.fish'
alias unmute 'amixer set Speaker unmute; amixer set Master unmute; amixer set Headphone unmute'
alias mute 'amixer set Speaker mute; amixer set Master mute; amixer set Headphone mute'

if test (grep microsoft /proc/version)
 # set -x http_proxy socks5://127.0.0.1:10808
 # set -x https_proxy socks5://127.0.0.1:10808
    set de /mnt/c/Users/yexiang//Desktop
    set do /mnt/c/Users/yexiang//Downloads
    set ip (cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
    set -x http_proxy socks5://$ip:10808
    set -x https_proxy socks5://$ip:10808
    set -x DISPLAY $ip:0.0
else
# Start X at login
    if status --is-login
        if test -z "$DISPLAY" -a $XDG_VTNR = 1
            exec startx -- -keeptty
        end
    end
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
