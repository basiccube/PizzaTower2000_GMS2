repeat (4)
{
	if (object_index == obj_metalblock_escape)
	{
		with (instance_create(x + 32, y + 32, obj_metaldebris))
			sprite_index = spr_metalblockdebrisescape
	}
	else
		instance_create(x + 32, y + 32, obj_metaldebris)
}

tile_layer_delete_at(1, x, y)
tile_layer_delete_at(1, x + 32, y)
tile_layer_delete_at(1, x + 32, y + 32)
tile_layer_delete_at(1, x, y + 32)

camera_shake(20, 40)
snd_play(sfx_breakmetal)