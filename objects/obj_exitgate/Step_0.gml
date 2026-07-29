if (global.panic == 1)
    image_index = 1
if ((!place_meeting(x, y, obj_player)) && image_index == 1 && global.panic == 0)
    image_index = 0 
if (place_meeting(x, y, obj_player) && obj_player.state != 52 && image_index == 1 && global.panic == 0)
{
    image_index = 0
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    snd_play(sfx_groundpound)
    obj_player.state = 42
    obj_player.image_index = 0
    obj_player.sprite_index = spr_player_timesup
}
