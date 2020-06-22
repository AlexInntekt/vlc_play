export screen_width="1920"
export screen_height="1080"

export its_background_player=$(echo $(grep "pid$1" ins.log) | cut -d "<" -f2 | cut -d ">" -f1)

kill -STOP $its_background_player

vlc media/i2.mkv --play-and-exit & 
export its_pid=$!
echo "its_pid: $its_pid"
sleep 0.5s
export its_window_id=$(xdotool search --all --pid $its_pid --name vlc)
echo $its_window_id
export x_position=$((($screen_width/2)*($1-1)))
echo "x_position:$x_position"

xdotool windowsize $its_window_id $(($screen_width/2)) $screen_height
xdotool windowmove $its_window_id $x_position 0

wait $its_pid
echo "finished!" ; kill -CONT $its_background_player 
