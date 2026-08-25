snd_play(sfx_breakmetal)
camera_shake(20, 40)
tile_delete_area(x, y, 32)

repeat (4)
{
	var spr = spr_metalblockdebris
	if (object_index == obj_metalblock_escape)
		spr = spr_metalblockdebrisescape
	
	with (create_debris(x + 32, y + 32, spr))
	{
		hsp = random_range(-4, 4)
		vsp = random_range(-4, 0)
	}
}