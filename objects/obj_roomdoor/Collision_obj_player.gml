with (other)
{
	var states = [PLAYER_NORMAL, PLAYER_MACH1, PLAYER_MACH2, PLAYER_MACH3]
	if (grounded && keyUp_held && state.is(states) && !instance_exists(obj_transition))
	{
		var str = get_string("Enter room name to go to:", "hub_1")
		var doorstr = get_string("Enter door for starting position:", "A")
		var rm = variable_instance_get(obj_room.id, str)
		
		targetRoom = rm
		targetDoor = doorstr
		
		with (obj_camera)
			chargecamera = 0
		
		image_index = 0
		state.change(PLAYER_NORMAL)
		instance_create(x, y, obj_transition)
	}
}