if (ds_list_find_index(global.saveroom, id) == -1 && global.panic)
{
    if (!global.highperformance)
    {
        with (instance_create((x + 16), y, obj_debris))
            sprite_index = spr_debrisescape
        with (instance_create((x + 16), y, obj_debris))
            sprite_index = spr_debrisescape
    }
    with (instance_create((x + 16), y, obj_debris))
        sprite_index = spr_debrisescape
    tile_layer_delete_at(1, x, y)
    if (global.breaksound == 10)
        snd_play(sfx_breakblock)
    global.breaksound = 0
    ds_list_add(global.saveroom, id)
}
