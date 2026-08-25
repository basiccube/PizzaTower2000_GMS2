snd_play(sfx_breakblock)
tile_delete_area(x, y, 32)

repeat (6)
{
	var spr = spr_bigdebris
	if (object_index == obj_destroyable3_escape)
		spr = spr_bigdebrisescape
	create_debris(x + 32, y + 32, spr)
}