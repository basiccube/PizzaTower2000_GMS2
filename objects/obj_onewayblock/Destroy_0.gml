with (instance_create((x + (image_xscale * 16)), (y + 32), obj_debris))
    sprite_index = spr_bigdebris
with (instance_create((x + (image_xscale * 16)), (y + 32), obj_debris))
    sprite_index = spr_bigdebris
with (instance_create((x + (image_xscale * 16)), (y + 32), obj_debris))
    sprite_index = spr_bigdebris
with (instance_create((x + (image_xscale * 16)), (y + 32), obj_debris))
    sprite_index = spr_bigdebris
with (instance_create((x + (image_xscale * 16)), (y + 32), obj_debris))
    sprite_index = spr_bigdebris
with (instance_create((x + (image_xscale * 16)), (y + 32), obj_debris))
    sprite_index = spr_bigdebris
tile_layer_delete_at(1, x, y)
tile_layer_delete_at(1, (x + 32), y)
tile_layer_delete_at(1, (x + 32), (y + 32))
tile_layer_delete_at(1, x, (y + 32))
snd_play(sfx_breakblock)

with (oneway)
    instance_destroy()
