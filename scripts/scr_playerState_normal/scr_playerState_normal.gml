function scr_playerState_normal()
{
	move = keyLeft_held + keyRight_held
	hsp = move * movespeed
	scr_player_railspeed()
	
	momentum = false
	jumpStop = false
	
	if (dir != xscale)
	{
		movespeed = 2
		facehurt = false
		dir = xscale
	}
	
	if landAnim
	{
		if (move != 0)
			sprite_index = spr_player_land2
		else
		{
			sprite_index = spr_player_land
			movespeed = 0
		}
			
		if LAST_FRAME
		{
			landAnim = false
			if (move != 0)
			{
				sprite_index = spr_player_move
				image_index = 0
			}
		}
	}
	else if machslideAnim
	{
		sprite_index = spr_player_machSlideEnd
		if LAST_FRAME
			machslideAnim = false
	}
	else
	{
		if (move != 0)
		{
			xscale = move
			sprite_index = spr_player_move
			
			idleTimer = 0
			facehurt = false
			
			if (move == xscale && scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_slope))
				movespeed = 0
		}
		else
		{
			if (idleTimer < 400)
				idleTimer++
				
			if (idleTimer >= 300 && LAST_FRAME)
			{
				idleTimer = 0
				facehurt = false
			}
			else if (idleTimer < 300)
			{
				if facehurt
				{
					windingAnim = 0
					if (sprite_index != spr_player_facehurt && sprite_index != spr_player_facehurtGetUp)
					{
						sprite_index = spr_player_facehurtGetUp
						image_index = 0
					}
					
					if (sprite_index == spr_player_facehurtGetUp && LAST_FRAME)
						sprite_index = spr_player_facehurt
				}
				else
				{
					movespeed = 0
					sprite_index = spr_player_idle
				}
			}
		}
	}
	
	var maxspd = 6
	if (move != 0)
	{
		if (movespeed < maxspd)
			movespeed += 0.5
		else if (floor(movespeed) == maxspd)
			movespeed = maxspd
		
		xscale = move
		if (movespeed < 3)
			image_speed = 0.35
		else if (movespeed < 6)
			image_speed = 0.45
		else
			image_speed = 0.6
	}
	else
	{
		movespeed = 0
		image_speed = 0.35
	}
	
	if (movespeed > maxspd)
		movespeed -= 0.1
		
	if (!grounded && !keyJump_pressed)
	{
		sprite_index = (move != 0 ? spr_player_fall2 : spr_player_fall)
		image_index = 0
		
		jumpAnim = false
		state.change(PLAYER_JUMP)
	}
	
	if (grounded && vsp > 0 && input_buffer_jump > 0 && !keyDown_held && !keyAttack_held)
		scr_player_jump()
	
	if grounded
	{
		if (keyDown_held || scr_solid(x, y - 3))
			state.change(PLAYER_CROUCH)
		
		if (keyAttack_held && !scr_solid(x + xscale, y))
			state.change(PLAYER_MACH1)
	}
	
	if (keySlap_pressed && !suplexDash)
		state.change(PLAYER_SUPLEXDASH)
	
	if (move != 0)
	{
		var in_frame = (floor(image_index) == 3 || floor(image_index) == 8)
		if (in_frame && !steppy)
		{
			if !snd_playing(sfx_step)
				snd_play(sfx_step)
			instance_create(x, y + 43, obj_cloudeffect)
			steppy = true
		}
		else if !in_frame
			steppy = false
	}
	
	scr_player_taunt()
	if (!instance_exists(obj_uparrow) && place_meeting(x, y, obj_uparrow_hitbox) && grounded)
		instance_create(x, y, obj_uparrow)
}

function scr_playerState_normal_leave()
{
	idleTimer = 0
	facehurt = false
	machslideAnim = false
}