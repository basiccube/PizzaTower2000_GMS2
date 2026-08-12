if ((place_meeting((x + 1), y, obj_playerOLD) || place_meeting((x - 1), y, obj_playerOLD)) && (obj_playerOLD.state == 81 || obj_playerOLD.state == 15 || obj_playerOLD.state == 9 || (obj_playerOLD.state == 15 && obj_playerOLD.momemtum == 1)))
    instance_destroy()
if (place_meeting(x, (y - 1), obj_playerOLD) && obj_playerOLD.state == 15)
{
    instance_destroy()
    tile_layer_delete_at(1, x, y)
}
if (place_meeting(x, (y - 1), obj_playerOLD) && obj_playerOLD.state == 65 && obj_playerOLD.superslam >= 10)
{
    with (obj_playerOLD)
    {
        snd_play(sfx_groundpound)
        image_index = 0
        state = 68
        jumpAnim = 1
        jumpstop = 0
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = (30 / room_speed)
        }
        ombo = 0
        bounce = 0
        with (instance_create(x, (y + 35), obj_bangeffect))
            image_xscale = obj_playerOLD.xscale
        freefallstart = 0
    }
    instance_destroy()
}
if (place_meeting(x, (y + 40), obj_playerOLD) && obj_playerOLD.state == 54)
    instance_destroy()
