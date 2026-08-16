if (global.panic)
{
    if (!global.highperformance)
    {
        with (instance_create((x + 32), (y + 32), obj_debris))
            sprite_index = spr_bigdebrisescape
        with (instance_create((x + 32), (y + 32), obj_debris))
            sprite_index = spr_bigdebrisescape
        with (instance_create((x + 32), (y + 32), obj_debris))
            sprite_index = spr_bigdebrisescape
    }
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigdebrisescape
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigdebrisescape
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigdebrisescape
    instance_create((x + 32), (y + 32), obj_bigcollect)
    tile_layer_delete_at(1, x, y)
    tile_layer_delete_at(1, (x + 32), y)
    tile_layer_delete_at(1, (x + 32), (y + 32))
    tile_layer_delete_at(1, x, (y + 32))
    snd_play(sfx_breakblock)
}
