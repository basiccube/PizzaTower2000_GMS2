function scr_playerState_freefallPrep()
{
	move = keyLeft_held + keyRight_held
	hsp = move * movespeed
	
	if scr_solid(x + hsp, y)
		movespeed = 0
	
	var maxspd = 6
	if (move != 0 && movespeed < maxspd)
		movespeed += 0.25
	if (movespeed > maxspd)
		movespeed -= 0.05
	
	if (dir != xscale)
	{
		movespeed = 0
		dir = xscale
	}
	
	if (move == -xscale)
		movespeed = 0
	
	if (move != 0)
		xscale = move
	
	sprite_index = spr_player_freefallPrep
	image_speed = 0.5
	
	if LAST_FRAME
	{
		vsp += 14
		state.change(PLAYER_FREEFALL)
	}
}

function scr_playerState_freefallPrep_enter()
{
	sprite_index = spr_player_freefallPrep
	image_index = 0
	vsp = -5
}