snd_play(sfx_breakblock)
tile_delete(x, y)

repeat (3)
{
	var spr = spr_debris
	if (object_index == obj_destroyable_escape)
		spr = spr_debrisescape
	create_debris(x + 16, y + 16, spr)
}