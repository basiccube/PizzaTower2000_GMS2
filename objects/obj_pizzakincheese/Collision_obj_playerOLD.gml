if (obj_playerOLD.state != 64 && global.cheesefollow == 0)
{
    if (global.toppintotal < 5)
        obj_tv.message = (("YOU NEED " + string((5 - global.toppintotal))) + " MORE TOPPINS!")
    if (global.toppintotal == 5)
        obj_tv.message = "YOU HAVE ALL TOPPINS!"
    obj_tv.showtext = 1
    obj_tv.alarm[0] = 150
    global.toppintotal += 1
    global.style += 10
    global.combotime = 60
    snd_play(sfx_collecttoppin)
    global.cheesefollow = 1
    panic = 0
}

