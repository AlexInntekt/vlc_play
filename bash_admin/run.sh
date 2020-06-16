export vlc1="398458886"

export screen_width="1920"
export screen_height="1080"
export filepath="cats.mkv"

echo $vlc1

vlc media/$filepath &

sleep(2)

xdotool windowsize $vlc1 100 1080
#xdotool windowsize $vlc1 $screen_width $screen_height 

xdotool windowmove $vlc1 1920 0

xdotool search --onlyvisible --name vlc