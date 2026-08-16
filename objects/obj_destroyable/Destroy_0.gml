if (!global.highperformance)
{
    instance_create((x + 16), y, obj_debris)
    instance_create((x + 16), y, obj_debris)
}
instance_create((x + 16), y, obj_debris)
tile_layer_delete_at(1, x, y)
if (global.breaksound == 10)
    snd_play(sfx_breakblock)
global.breaksound = 0
