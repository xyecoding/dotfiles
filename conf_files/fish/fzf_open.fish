bind -M insert \cj 'accept-autosuggestion'
set -U FZF_COMPLETE 0
# bind -M default cd  '__fzf_cd'
# bind -M insert \ek 'set fish_bind_mode default'
# set -gx Z_SCRIPT_PATH ~/z/z.sh

function __fzf_run -d "Open files and directories."
    function __fzf_open_get_open_cmd -d "Find appropriate open command."
        if type -q rifle
            echo "rifle"
        end
    end

    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    if not type -q argparse
        set created_argparse
        function argparse
            functions -e argparse # deletes itself
        end
        if contains -- --editor $argv; or contains -- -e $argv
            set _flag_editor "yes"
        end
        if contains -- --preview $argv; or contains -- -p $argv
            set _flag_preview "yes"
        end
    end

    set -l options "e/editor" "p/preview=?"
    argparse $options -- $argv

    set -l preview_cmd
    if set -q FZF_ENABLE_OPEN_PREVIEW
        set preview_cmd "--preview-window=right:wrap --preview='fish -c \"__fzf_complete_preview {}\"'"
    end

    # set -q FZF_OPEN_COMMAND
    # or set -l FZF_OPEN_COMMAND "
    set -l FZF_OPEN_COMMAND "
    command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 's@^\./@@'"

    set -l select (eval "$FZF_OPEN_COMMAND | "(__fzfcmd) $preview_cmd "-m $FZF_DEFAULT_OPTS $FZF_OPEN_OPTS --query \"$fzf_query\"" | string escape)

    # set how to open
    set -l open_cmd
    if set -q _flag_editor
        set open_cmd "$EDITOR"
    else
        set open_cmd (__fzf_open_get_open_cmd)
        if test -z "$open_cmd"
            echo "Couldn't find appropriate open command to use. Do you have 'xdg-open' or 'open' installed?"; and return 1
        end
    end

    set -l open_status 0
    if not test -z "$select"
        if test -d $select
          commandline "cd $select"; and commandline -f execute
        else
          eval "$open_cmd -l $select"
          set_color red; echo "Chose on program to open the file: "
          set_color red; echo "[default=2]:"
          # trap 'kill %self' INT
          # trap 'kill %self' INT
          function ctrl_c_handler --on-event INT
              set -g number break
          end
          trap 'ctrl_c_handler' INT
          set a (read -l -P "" number)

          if test $number != "break"
            if test -z "$number"
                set number 2
            end
            eval "$open_cmd -p $number $select"
          end
        end
        set open_status $status
    end

    commandline -f repaint
    return $open_status
end

function __fzf_open -d "Open files and directories."
    function __fzf_open_get_open_cmd -d "Find appropriate open command."
        if type -q rifle
            echo "rifle"
        else if type -q open
            echo "open"
        end
    end

    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    if not type -q argparse
        set created_argparse
        function argparse
            functions -e argparse # deletes itself
        end
        if contains -- --editor $argv; or contains -- -e $argv
            set _flag_editor "yes"
        end
        if contains -- --preview $argv; or contains -- -p $argv
            set _flag_preview "yes"
        end
    end

    set -l options "e/editor" "p/preview=?"
    argparse $options -- $argv

    set -l preview_cmd
    if set -q FZF_ENABLE_OPEN_PREVIEW
        set preview_cmd "--preview-window=right:wrap --preview='fish -c \"__fzf_complete_preview {}\"'"
    end

    # set -q FZF_OPEN_COMMAND
    # or set -l FZF_OPEN_COMMAND "
    set -l FZF_OPEN_COMMAND "
    command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 's@^\./@@'"

    set -l select (eval "$FZF_OPEN_COMMAND | "(__fzfcmd) $preview_cmd "-m $FZF_DEFAULT_OPTS $FZF_OPEN_OPTS --query \"$fzf_query\"" | string escape)

    # set how to open
    set -l open_cmd
    if set -q _flag_editor
        set open_cmd "$EDITOR"
    else
        set open_cmd (__fzf_open_get_open_cmd)
        if test -z "$open_cmd"
            echo "Couldn't find appropriate open command to use. Do you have 'xdg-open' or 'open' installed?"; and return 1
        end
    end

    set -l open_status 0
    if not test -z "$select"
        if test -d $select
          commandline "cd $select"; and commandline -f execute
        else
          commandline "$open_cmd $select"; and commandline -f execute
        end
        set open_status $status
    end

    commandline -f repaint
    return $open_status
end

bind -M insert \co '__fzf_open'
bind -M insert \cp '__fzf_run'
bind -M insert \cu '__fzf_cd --hidden'
# bind -M insert \ci '__fzf_reverse_isearch'
set -U FZF_FIND_FILE_COMMAND "ag -l --hidden --ignore .git . \$dir 2> /dev/null"
# set -U FZF_OPEN_COMMAND "ag -l --hidden --ignore .git . \$dir 2> /dev/null"
# set -U FZF_OPEN_COMMAND ""
