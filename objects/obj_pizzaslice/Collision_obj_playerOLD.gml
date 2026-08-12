if (obj_playerOLD.state != 46)
{
    snd_play(sfx_collect)
    
    global.collect += 25 * global.multiplier
    with (instance_create(x, y, obj_smallnumber))
        number = 25 * global.multiplier
    global.combotime += 30
        
    with (instance_create(x, y, obj_knightdebris)) 
        sprite_index = spr_healthpickupeaten
    
    ds_list_add(global.saveroom, id)
    instance_destroy()
}
