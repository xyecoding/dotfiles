if not test -e ~/myDiary/diary/$(date +"%Y-%m-%d").md
    set old_file (ls -l ~/myDiary/diary/ | awk '{print $9}' | sort | tail -n -1)
    if test $old_file
        cp ~/myDiary/diary/$old_file ~/myDiary/diary/$(date +"%Y-%m-%d").md
    end
end
vi ~/myDiary/diary/$(date +"%Y-%m-%d").md
