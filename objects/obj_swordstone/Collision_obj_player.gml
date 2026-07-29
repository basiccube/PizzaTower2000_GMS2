with (other)
{
    if (grounded && other.image_index == 0 && state == 13)
    {
        momemtum = 0
        hsp = 0
        vsp = 0
        movespeed = 0
        other.image_index = 1
        image_index = 0
        image_speed = 0.35
        sprite_index = spr_knightpep_start
        state = 15
    }
}
