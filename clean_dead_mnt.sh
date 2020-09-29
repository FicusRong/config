while :
do
    strace df -h 1>/dev/null 2> /tmp/clean_dead_mnt &
    sleep 3
    last_line=`tail -n 1 /tmp/clean_dead_mnt`
    str1=${last_line:0:5}
    str2=${last_line:(-2):2}
    if [ "$str1" == "stat(" ]; then 
        if [ "$str2" == ", " ] || [ "$str2" == '",' ]; then
            str=${last_line:6}
            path=${str%\"*}
            echo $path
            umount -f -l $path
            continue
        fi
    fi
    break
done
