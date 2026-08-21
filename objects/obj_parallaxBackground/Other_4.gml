visible = !(room == rm_rank_room ||
			room == rm_timesup_room ||
			room == rm_tower_outside ||
			room == rm_main_menu ||
			room == rm_initializer)

backgroundLayer = layer_get_id("Background")
if !visible
	reset()