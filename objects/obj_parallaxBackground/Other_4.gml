visible = !(room == rank_room ||
			room == timesuproom ||
			room == Titlescreen ||
			room == Realtitlescreen ||
			room == rm_initializer)
			
if !visible
	reset()