# export vlc1="398458886"

export screen_width="1920"
export screen_height="1080"
export filepath="cats.mkv"

vlc media/$filepath &
export its_pid=$!
export s="n"
sleep 2s
#vlc1=$(xdotool search --onlyvisible --name vlc | sed -n 1p)
export its_window_id=$(xdotool search --all --pid $its_pid --name vlc)
echo $its_window_id
echo "hahahahahahah"

xdotool windowsize $its_window_id 100 300
#xdotool windowsize $its_window_id $screen_width $screen_height 
sleep 2s
xdotool windowmove $its_window_id 100 50

