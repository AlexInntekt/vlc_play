# export vlc1="398458886"

export screen_width="1920"
export screen_height="1080"


export filepath1="cats.mkv"


play_background()
{
	sleep 2s
	vlc media/$filepath$1 &
	sleep 1s
	export its_pid=$!
	export s="n"
	#vlc1=$(xdotool search --onlyvisible --name vlc | sed -n 1p)
	export its_window_id=$(xdotool search --all --pid $its_pid --name vlc)
	echo $its_window_id

	xdotool windowsize $its_window_id 800 500
	#xdotool windowsize $its_window_id $screen_width $screen_height 
	xdotool windowmove $its_window_id 700 250
}


play_background 1
