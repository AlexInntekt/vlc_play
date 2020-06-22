export screen_width="1920"
export screen_height="1080"

export filepath=""

#check if user provided the first argument (number of zone)
if [ -z "$1" ]
then 
   echo "You did not provide the first argument: the number of zone (an integer)"
   exit
fi

#check if user provided path for media file. if not, then use default media file.
if [ -z "$2" ]
then
  filepath="media/i2.mkv"
else
  filepath=$2
fi

#check if media file exists
if [ -f "$filepath" ]; then
   echo ""
else
   echo "There is not media file with path "$filepath
   exit
fi

#get pid of background vlc instance that plays on the zone of the interupt player
export its_background_player=$(echo $(grep "pid$1" ins.log) | cut -d "<" -f2 | cut -d ">" -f1)

kill -STOP $its_background_player

#start vlc instance
vlc $filepath --play-and-exit & 
export its_pid=$!
echo "its_pid: $its_pid"
sleep 0.5s
export its_window_id=$(xdotool search --all --pid $its_pid --name vlc)
echo $its_window_id
export x_position=$((($screen_width/2)*($1-1)))
echo "x_position:$x_position"

xdotool windowsize $its_window_id $(($screen_width/2)) $screen_height
xdotool windowmove $its_window_id $x_position 0

echo "zone{$1}pid<$its_pid>windowid($its_window_id)" >> ips.log

#after the interupt player finishes / dies, play again the background player
wait $its_pid
echo "finished!" ; kill -CONT $its_background_player ; export line_to_delete=$(grep -n "pid<$its_pid>" ips.log | cut -d : -f1)"d"; sed $line_to_delete ips.log -i 



# argument mandatory: $1   zone number
# argument optional:  $2   path of media file
