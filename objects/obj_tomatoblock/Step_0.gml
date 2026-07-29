with (obj_player)
{
    if (place_meeting(x, (y + 1), obj_tomatoblock) && state != 46)
    {
        vsp = -11
        other.image_index = 0
        other.image_speed = 0.35
    }
}
