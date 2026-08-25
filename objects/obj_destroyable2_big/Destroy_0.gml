snd_play(sfx_breakblock)
tile_delete_area(x, y, 32)

instance_create(x + 32, y + 32, obj_bigcollect)
repeat (6)
{
	var spr = spr_bigdebris
	if (object_index == obj_destroyable2_big_escape)
		spr = spr_bigdebrisescape
	create_debris(x + 32, y + 32, spr)
}