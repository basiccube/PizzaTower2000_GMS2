if (!global.highperformance)
{
    instance_create((x + 16), y, obj_debris)
    instance_create((x + 16), y, obj_debris)
    instance_create((x + 16), y, obj_debris)
}
instance_create((x + 16), y, obj_debris)
instance_create((x + 16), y, obj_debris)
instance_create(x, y, obj_collect)
tile_layer_delete_at(1, x, y)
if (global.breaksound == 9)
    snd_play(sfx_breakblock)
global.breaksound = 0
