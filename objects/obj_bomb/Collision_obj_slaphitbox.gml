if (!obj_player.hurted && obj_player.state == 13 && !obj_player.cutscene)
{
    instance_create(x, y, obj_bumpeffect)
    with (other)
        instance_destroy()
    instance_destroy()
    
    with (obj_player)
    {
        bombpeptimer = 100
        state = 18
        image_index = 0
        sprite_index = spr_bombpep_intro
    }    
}
