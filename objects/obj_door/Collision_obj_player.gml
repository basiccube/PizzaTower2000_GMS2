with (other)
{
	var states = [PLAYER_NORMAL, PLAYER_MACH1, PLAYER_MACH2, PLAYER_MACH3]
	if (keyUp_held && grounded && vsp > 0 && state.is(states) && !instance_exists(obj_transition))
	{
		with (obj_camera)
			chargecamera = 0
			
		targetDoor = other.targetDoor
		targetRoom = other.targetRoom
		
		state.change(PLAYER_ENTERDOOR)
		instance_create(x, y, obj_transition)
	}
}