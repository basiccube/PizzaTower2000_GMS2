if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (!global.highperformance)
    {
        with (instance_create((x + 32), (y + 32), obj_debris))
            sprite_index = spr_bigdebris
        with (instance_create((x + 32), (y + 32), obj_debris))
            sprite_index = spr_bigdebris
        with (instance_create((x + 32), (y + 32), obj_debris))
            sprite_index = spr_bigdebris
    }
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigdebris
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigdebris
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigdebris
    instance_create((x + 32), (y + 32), obj_bigcollect)
    tile_layer_delete_at(1, x, y)
    tile_layer_delete_at(1, (x + 32), y)
    tile_layer_delete_at(1, (x + 32), (y + 32))
    tile_layer_delete_at(1, x, (y + 32))
    snd_play(sfx_breakblock)
    ds_list_add(global.saveroom, id)
}
