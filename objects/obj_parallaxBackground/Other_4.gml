visible = !in_array(room, disabledRooms)
backgroundLayer = layer_get_id("Background")

if !visible
	reset()