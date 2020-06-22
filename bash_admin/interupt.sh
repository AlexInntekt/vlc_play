export screen_width="1920"
export screen_height="1080"

vlc media/i2.mkv --play-and-exit & 
export its_pid=$!
echo "its_pid: $its_pid"
sleep 0.5s
export its_window_id=$(xdotool search --all --pid $its_pid --name vlc)
echo $its_window_id
export x_position=$((($screen_width/2)*(2-1)))
echo "x_position:$x_position"

xdotool windowsize $its_window_id $(($screen_width/2)) $screen_height
xdotool windowmove $its_window_id $x_position 0

wait $its_pid
echo "finished!"
