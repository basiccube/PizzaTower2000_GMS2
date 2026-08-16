function scr_playerState_wallClimb()
{
	move = keyLeft_held + keyRight_held
	vsp = -movespeed
	
	if (windingAnim < 2000)
		windingAnim++
	
	if (move == xscale && movespeed > 0 && movespeed < 24)
		movespeed += 0.1
	
	sprite_index = spr_player_wallClimb
	image_speed = 0.6
	
	if (!keyAttack_held || movespeed <= 0)
	{
		sprite_index = spr_player_fall
		state.change(PLAYER_JUMP)
	}
	
	if !scr_solid(x + xscale, y)
	{
		if state.prev_is(PLAYER_MACH3)
		{
			if (movespeed < 12)
				movespeed = 12
			state.change(PLAYER_MACH3)
		}
		else
		{
			movespeed = 10
			state.change(PLAYER_MACH2)
		}
		
		vsp = 0
		instance_create(x, y, obj_jumpdust)
	}
	
	if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x - sign(hsp), y, obj_slope))
		state.change(PLAYER_CEILINGHIT)
	
	if (keyJump_pressed && keyAttack_held)
	{
		sprite_index = spr_player_machJump
		image_index = 0
		
		movespeed = 10
		vsp = -9
		xscale *= -1
		
		state.change(PLAYER_MACH2)
		instance_create(x, y, obj_jumpdust)
	}

	if !instance_exists(obj_cloudeffect)
		instance_create(x, y + 43, obj_cloudeffect)
}