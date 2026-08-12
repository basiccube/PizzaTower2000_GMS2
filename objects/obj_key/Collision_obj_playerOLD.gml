if (obj_playerOLD.state != 15 && obj_playerOLD.state != 6 && obj_playerOLD.state != 4 && obj_playerOLD.state != 16 && obj_playerOLD.state != 9 && obj_playerOLD.state != 64)
{
    instance_destroy()
    global.key = 1
    obj_playerOLD.alarm[6] = 30
}
if (obj_playerOLD.state != 15 && obj_playerOLD.state != 16 && obj_playerOLD.state != 6 && obj_playerOLD.state != 4 && obj_playerOLD.state != 9)
{
    snd_play(sfx_collecttoppin)
    global.combotime = 60
    obj_playerOLD.state = 47
    obj_playerOLD.image_index = 0
}

