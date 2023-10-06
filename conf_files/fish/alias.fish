alias nusr "~/dotfiles/shell_scripts/create_new_usr.sh"
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
alias cda 'cd ~/myDiary'
alias gd   'goldendict'
alias cpp 'cd ~/mypaper'

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
function ssh_connect
  sshpass -p $argv[1] ssh -p $argv[2] $argv[3]@$argv[4] -o StrictHostKeyChecking=no
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
  host3090_lbh "lbh buptb4lab223"\
  host3090_yexiang "yexiang 123"\

function remove_dir_end
  if test (string sub -s -1 $argv[1] = /)
    set -l argv[1] (string sub -e -1 $argv[1])
  end 
  echo $argv[1]
end

function cpfrom
  set -l argv[5] (remove_dir_end $argv[5])
  set -l argv[6] (remove_dir_end $argv[6])
  echo $argv[5]
  echo $argv[6]
  # sshpass -p $argv[1] scp -o StrictHostKeyChecking=no -r -P $argv[2] $argv[3]@$argv[4]:$argv[5] $argv[6] 
  sshpass -p $argv[1] rsync --info=progress2 -a --include="$argv[7]" --exclude="$argv[8]" -e "ssh -p $argv[2] -o StrictHostKeyChecking=no" $argv[3]@$argv[4]:$argv[5] $argv[6]
end

function cpto
  set -l argv[5] (remove_dir_end $argv[5])
  set -l argv[6] (remove_dir_end $argv[6])
  echo $argv[5]
  echo $argv[6]
  # sshpass -p $argv[1] rsync --info=progress2  -a -e "ssh -p $argv[2] -o StrictHostKeyChecking=no" $argv[6] $argv[3]@$argv[4]:$argv[5] 
  # set -l ssh_command "ssh -p $argv[2] -o StrictHostKeyChecking=no"
  # sshpass -p $argv[1] rsync --info=progress2  -a --include="$argv[7]" --exclude="$argv[8]" -e "$ssh_command" $argv[6] $argv[3]@$argv[4]:$argv[5] 
  sshpass -p $argv[1] rsync --info=progress2  -a --include="$argv[7]" --exclude="$argv[8]" -e "ssh -p $argv[2] -o StrictHostKeyChecking=no" $argv[6] $argv[3]@$argv[4]:$argv[5] 
  # sshpass -p $argv[1] scp -o StrictHostKeyChecking=no -r -P $argv[2] $argv[6] $argv[3]@$argv[4]:$argv[5] 
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
# alias wda 'fish ~/myDiary/create_diary.fish'
alias wda 'vi ~/myDiary/Dairy/ThingsToDo.md'
alias wtp 'fish ~/myDiary/create_topic.fish'
alias unmute 'amixer set Speaker unmute; amixer set Master unmute; amixer set Headphone unmute'
alias mute 'amixer set Speaker mute; amixer set Master mute; amixer set Headphone mute'
alias ra 'ranger'
alias bk '~/dotfiles/shell_scripts/backup_files.fish'
alias gp 'grep -n -H -R'
alias cpth 'pwd | xsel -i -b'
