if (!obj_playerOLD.hurted && obj_playerOLD.state == 13 && !obj_playerOLD.cutscene)
{
    instance_create(x, y, obj_bumpeffect)
    with (other)
        instance_destroy()
    instance_destroy()
    
    with (obj_playerOLD)
    {
        bombpeptimer = 100
        state = 18
        image_index = 0
        sprite_index = spr_bombpep_intro
    }    
}
