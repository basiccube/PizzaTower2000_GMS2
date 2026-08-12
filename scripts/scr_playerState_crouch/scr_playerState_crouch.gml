function scr_playerState_crouch()
{
	move = keyLeft_held + keyRight_held
	hsp = move * movespeed
	scr_player_railspeed()
	
	if (move != 0 && movespeed < 4)
		movespeed += 0.5
	else if (move == 0)
		movespeed = 0
	
	var canStand = (!scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	if (grounded && !keyDown_held && !keyJump_pressed && canStand)
	{
		movespeed = 0
		state.change(PLAYER_NORMAL)
	}
	
	if (grounded && keyJump_pressed && canStand)
	{
		snd_play(sfx_jump)
		vsp = -8
		
		jumpAnim = true
		sprite_index = spr_player_crouchJump
		image_index = 0
	}
	
	var inAir = (sprite_index == spr_player_crouchFall || sprite_index == spr_player_crouchJump)
	if (!grounded && !keyJump_pressed && !inAir)
		jumpAnim = false
	
	if grounded
	{
		if (inAir && vsp > 0)
		{
			if (!keyDown_held && canStand)
			{
				state.change(PLAYER_NORMAL)
				movespeed = 0
				landAnim = true
			}
			
			crouchAnim = true
			jumpStop = false
			image_index = 0
		}
		
		if (vsp > 0)
		{
			if (crouchAnim && move == 0)
			{
				sprite_index = spr_player_crouchStart
				if LAST_FRAME
					crouchAnim = false
			}
			else
				sprite_index = (move != 0 ? spr_player_crawl : spr_player_crouch)
		}
	}
	else
	{
		if (jumpAnim && !jumpStop)
		{
			if !keyJump_held
			{
				vsp /= 2
				jumpStop = true
			}
			else if scr_solid(x, y - 1)
			{
				vsp = grav
				jumpStop = true
			}
		}
		
		if jumpAnim
		{
			sprite_index = spr_player_crouchJump
			if LAST_FRAME
				jumpAnim = false
		}
		else
			sprite_index = spr_player_crouchFall
	}
		
	if (move != 0)
	{
		if (move != xscale)
			movespeed = 0
		
		crouchAnim = false
		xscale = move
	}
	image_speed = (!grounded ? 0.35 : 0.6)
}

function scr_playerState_crouch_enter()
{
	landAnim = false
	crouchAnim = true
	image_index = 0
}