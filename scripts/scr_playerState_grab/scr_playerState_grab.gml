function scr_playerState_grab()
{
	if !instance_exists(grabbedID)
	{
		state.change(PLAYER_NORMAL)
		exit;
	}
	
	move = keyLeft_held + keyRight_held
	hsp = move * movespeed
	scr_player_railspeed()
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope))
		movespeed = 0
		
	if (move == -xscale)
		movespeed = 0
		
	if (!keyJump_held && !jumpStop && vsp < 0.5)
	{
		vsp /= 5
		jumpStop = true
	}
	if (grounded && vsp > 0)
		jumpStop = false
		
	if (move != 0)
	{
		if (movespeed < 6)
			movespeed += 0.5
		else if (movespeed > 6)
			movespeed = 6
		
		xscale = move
		if grounded
			sprite_index = spr_player_grabMove
	}
	else
	{
		movespeed = 0
		if grounded
			sprite_index = spr_player_grabIdle
	}
	
	if (!grounded && vsp > 0)
		sprite_index = spr_player_grabFall
	
	if (grounded && input_buffer_jump > 0)
	{
		snd_play(sfx_jump)
		sprite_index = spr_player_grabJump
		image_index = 0
		vsp = -11
	}
	
	if keySlap_pressed
	{
		snd_play(sfx_punch)
		sprite_index = spr_player_punch
		image_index = 0
		
		movespeed = -4
		animSlowDown = true
		state.change(PLAYER_ANIMATION)
	}
	else if keyUp_pressed
	{
		snd_play(sfx_punch)
		sprite_index = spr_player_punchUp
		image_index = 0
		
		hsp = 0
		movespeed = 0
		state.change(PLAYER_ANIMATION)
	}
	else if keyAttack_pressed
	{
		snd_play(sfx_dash)
		state.change(PLAYER_CHARGE)
		instance_create(x, y, obj_jumpdust)
	}
	
	if (!grounded && keyDown_held)
	{
		snd_play(sfx_jump)
		sprite_index = spr_player_piledriver
		image_index = 0
		
		vsp = -7
		state.change(PLAYER_PILEDRIVER)
	}

	if (sprite_index == spr_player_grabJump && LAST_FRAME)
		sprite_index = spr_player_grabFall

	if (grounded && vsp > 0 && (sprite_index == spr_player_grabJump || sprite_index == spr_player_grabFall))
		movespeed = 2

	if (move != 0 && grounded)
	{
		if (movespeed < 3)
			image_speed = 0.35
		else if (movespeed < 6)
			image_speed = 0.45
		else
			image_speed = 0.6
	}
	else
		image_speed = 0.35
}

function scr_playerState_grab_enter()
{
	hsp = 0
	movespeed = 0
	sprite_index = spr_player_grabIdle
}