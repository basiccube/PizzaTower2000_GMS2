if (obj_player.state != 15 && obj_player.state != 6 && obj_player.state != 4 && obj_player.state != 16 && obj_player.state != 9 && obj_player.state != 64)
{
    instance_destroy()
    global.key_inv = 1
    obj_player.alarm[6] = 30
}
if (global.keyget == 0 && obj_player.state != 15 && obj_player.state != 16 && obj_player.state != 6 && obj_player.state != 4 && obj_player.state != 9)
{
    snd_play(sfx_collecttoppin)
    global.combotime = 60
    obj_player.state = 47
    obj_player.image_index = 0
    global.keyget = 1
}

