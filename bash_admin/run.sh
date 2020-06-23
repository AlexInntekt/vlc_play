# export vlc1="398458886"

export states_file="ins.log"

export screen_width="1920"
export screen_height="1080"


export example_filepath="cats.mkv"

init()
{
  echo "" > $states_file
}

play_background()
{
	echo "zone"$1
	export its_path=$(tools/bashjson/bashjson.sh config.json zone$1 media_path) 
	vlc --loop  $its_path &
	sleep 0.5s
	export its_pid=$!
	export s="n"

	export its_window_id=$(xdotool search --all --pid $its_pid --name vlc)
	echo $its_window_id

	export x_position=$((($screen_width/2)*($1-1))) 
	echo "x_position:$x_position"

	xdotool windowsize $its_window_id $(($screen_width/2)) $screen_height
	xdotool windowmove $its_window_id $x_position 0
	
	echo "" >> $states_file
	echo "pid$1<"$its_pid">" >> $states_file
	xdotool getwindowgeometry $its_window_id >> $states_file
}


init
play_background 1
play_background 2 
play_background 3







example_player()
{
	sleep 2s
	vlc media/$filepath &
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

