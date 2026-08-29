with (obj_tv)
{
	message = other.name
	showtext = true
	alarm[0] = 2
}

with (other)
{
	var states = [PLAYER_NORMAL, PLAYER_MACH1, PLAYER_MACH2, PLAYER_MACH3]
	if (keyUp_held && grounded && state.is(states) && !instance_exists(obj_transition))
	{
		with (obj_camera)
			chargecamera = 0
		state.change(PLAYER_VICTORY)
	}
	
	if (state.is(PLAYER_VICTORY) && LAST_FRAME)
	{
		targetDoor = other.targetDoor
		targetRoom = other.targetRoom
		global.leveltosave = other.level
		
		if !instance_exists(obj_transition)
		{
			var path = "levels/" + other.level + ".pli"
			if file_exists(path)
			{
				ini_open(path)
				level_set_srank(ini_read_real("Level", "SRank", 0))
				ini_close()
			}
			
			instance_create(x, y, obj_transition)
		}
	}
}