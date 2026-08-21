visible = !(room == rank_room ||
			room == timesuproom ||
			room == Titlescreen ||
			room == Realtitlescreen ||
			room == rm_initializer)

backgroundLayer = layer_get_id("Background")
if !visible
	reset()