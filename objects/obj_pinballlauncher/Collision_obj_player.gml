with (other)
{
    if (grounded && state != 29 && state != 9 && state != 15 && state != 16)
    {
        state = 29
        movespeed = 14
        xscale = sign(other.image_xscale)
        vsp = 0
        other.image_index = 0
        other.sprite_index = spr_goblinbot_kick
    }
    else if (state == 29)
    {
        movespeed = 14
        xscale = sign(other.image_xscale)
    }
}
