import vlc

filepath = "cats.mkv"

def f1():
    media = vlc.MediaPlayer(filepath)
    media.play()



def run():
    f1()


run()


