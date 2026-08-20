with (obj_player)
{
	var states = [PLAYER_NOCLIP, PLAYER_MACH1, PLAYER_MACH2, PLAYER_MACH3]
	if (place_meeting(x, y, other) && keyUp_held && grounded && state.is(states) && !instance_exists(obj_transition))
	{
		if (other.sprite_index == spr_doorvisited)
		{
			with (obj_camera)
				chargecamera = 0
			
			targetDoor = other.targetDoor
			targetRoom = other.targetRoom
			
			state.change(PLAYER_ENTERDOOR)
			instance_create(x, y, obj_transition)
		}
		else if global.key
		{
			snd_play(sfx_bump)
			state.change(PLAYER_VICTORY)
			
			with (other)
			{
				sprite_index = spr_doorkeyopen
				image_index = 0
				image_speed = 0.35
			}
			
			instanceManager.addDoor(other.id)
			global.key = false
		}
	}
	
	if (state.is(PLAYER_VICTORY) && LAST_FRAME)
	{
		targetDoor = other.targetDoor
		targetRoom = other.targetRoom
		
		if !instance_exists(obj_transition)
			instance_create(x, y, obj_transition)
	}
}

if (sprite_index == spr_doorkeyopen && LAST_FRAME)
	image_speed = 0

get_targetdoor()