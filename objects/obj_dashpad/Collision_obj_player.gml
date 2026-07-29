with (obj_player)
{
    if (grounded)
    {
        xscale = other.image_xscale
        mach2 = 100 
        machhitAnim = 0
        state = 81
        flash = 1
        sprite_index = spr_player_mach3
        instance_create(x, y, obj_jumpdust)
        instance_create(x, y, obj_mach3effect)
        movespeed = 12
    }
}
