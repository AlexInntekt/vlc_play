import vlc

filepath = "cats.mkv"

def f1():
    media = vlc.MediaPlayer(filepath)
    media.play()
    
    while True:
        pass


def f2():
    vlc_options = 'fullscreen'
    vlc_instance = vlc.Instance(vlc_options)
    # vlc.Instance.url = filepath
    
    player = vlc.MediaPlayer(vlc_instance)
    player.url = filepath
    player.play()

    while True:
        pass

def f3():
    vlc_options = "--no-audio -f" 
    vlc_instance = vlc.Instance(vlc_options)
    # vlc.Instance.url = filepath
    
    player = vlc_instance.media_player_new() 
    player.set_mrl(filepath)
    player.play()

    while True:
        pass




def run():
    f3()


run()


