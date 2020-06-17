vlc media/3.mkv & 
export pid=$! 
sleep 1s  
export windowid=$(xdotool search --all --pid $pid --name vlc)

echo $pid
echo "pid:"$pid
echo "window id: "$windowid
