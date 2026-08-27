instance_destroy(oneway)
snd_stop_play(sfx_breakblock)
tile_delete_area(x, y, 32)

repeat (6)
	create_debris(x + (image_xscale * 16), y + 32, spr_bigdebris)
