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
set -x _Z_SRC /usr/share/z/z.sh
set -x PATH /usr/local/texlive/2022/bin/x86_64-linux/ $PATH
set -U fish_cursor_insert line
set -U fish_cursor_default block
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
set -gx EDITOR "lvim"
set -gx VISUAL "lvim"
