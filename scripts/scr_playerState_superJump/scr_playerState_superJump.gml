function scr_playerState_superJump()
{
	move = keyLeft_held + keyRight_held
	hsp = 0
	vsp--
	
	sprite_index = spr_player_superJump
	image_speed = 0.5
	
	if keyAttack_pressed
	{
		if (move != 0)
			xscale = move
		
		flash = true
		movespeed = 12
		vsp = 0
		
		state.change(PLAYER_MACH3)
	}
	
	if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x - sign(hsp), y, obj_slope))
		state.change(PLAYER_CEILINGHIT)
}

function scr_playerState_superJump_enter()
{
	snd_play(sfx_superjump)
	vsp = -15
}