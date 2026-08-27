snd_stop_play(sfx_breakblock)
tile_delete(x, y)

instance_create(x, y, obj_collect)
repeat (5)
{
	var spr = spr_debris
	if (object_index == obj_destroyable2_escape)
		spr = spr_debrisescape
	create_debris(x + 16, y + 16, spr)
}