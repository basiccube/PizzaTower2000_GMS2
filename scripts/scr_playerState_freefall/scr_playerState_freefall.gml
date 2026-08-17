function scr_playerState_freefall()
{
	move = keyLeft_held + keyRight_held
	hsp = move * movespeed
	
	sprite_index = spr_player_freefallSlam
	landAnim = true
	
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
	
	freefallSlam++
	if (freefallSlam > 10 && !instance_exists(obj_superslameffect))
		instance_create(x, y, obj_superslameffect)
		
	if (grounded && !place_meeting(x, y + 5, obj_destructibles))
		scr_player_doFreefallLand()

	image_speed = 0.35
}

function scr_playerState_freefall_leave()
{ freefallSlam = 0; }