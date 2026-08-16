with (other)
{
	if !instance_exists(obj_transition)
	{
		targetDoor = other.targetDoor
		targetRoom = other.targetRoom
		
		hallway = true
		hallwayDirection = other.dir
		
		if state.is(PLAYER_MACHSLIDE)
			state.change(PLAYER_NORMAL)
		
		instance_create(x, y, obj_transition)
	}
}