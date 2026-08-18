function scr_playerState_jump()
{
	move = keyLeft_held + keyRight_held
	hsp = move * movespeed
	if momentum
		hsp = xscale * movespeed
	
	landAnim = true
	if (ladderBuffer > 0)
		ladderBuffer--
	
	if (dir != xscale)
	{
		movespeed = 0
		dir = xscale
	}
	
	if (move == -xscale)
	{
		movespeed = 0
		momentum = false
	}
	
	if momentum
	{
		if (move != xscale && movespeed > 0)
			movespeed -= 0.05
		if (movespeed <= 0)
			momentum = false
	}
	
	if ((move == 0 && !momentum) || scr_solid(x + hsp, y))
		movespeed = 0
		
	var maxspd = 6
	if (move != 0 && movespeed < maxspd)
		movespeed += 0.25
	if (movespeed > maxspd)
		movespeed -= 0.05
		
	if (move != 0 && scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope))
		movespeed = 0
	
	if !jumpStop
	{
		if (!keyJump_held && vsp < 0.5 && !stompAnim)
		{
			vsp /= 5
			jumpStop = true
		}
		else if (scr_solid(x, y - 1) && jumpAnim)
		{
			vsp = grav
			jumpStop = true
		}
	}
	
	if keyDown_pressed
		state.change(PLAYER_FREEFALLPREP)
		
	var in_freefall = (sprite_index == spr_player_freefall || sprite_index == spr_player_facestomp)
	if (grounded && in_freefall)
	{
		snd_play(sfx_bump)
		camera_shake(10, 30)
		
		state.change(PLAYER_FREEFALLLAND)
		image_index = 0
	}
	
	if (vsp > 5)
		freefallAnimTimer++
	else
		freefallAnimTimer = 0
	
	if (freefallAnimTimer >= 80)
		sprite_index = spr_player_freefall
	else if (freefallAnimTimer >= 40)
		sprite_index = spr_player_facestomp
	
	if (grounded && vsp > 0 && !keyAttack_held)
	{
		if (input_buffer_jump > 0 && !keyDown_held && !in_freefall)
			scr_player_jump()
		else
		{
			state.change(PLAYER_NORMAL)
			image_index = 0
		}
	}
	
	if stompAnim
	{
		if (sprite_index == spr_player_stompPrep && LAST_FRAME)
			sprite_index = spr_player_stomp
	}
	else
	{
		if (jumpAnim && LAST_FRAME)
			jumpAnim = false
		else if !jumpAnim
		{
			switch sprite_index
			{
				case spr_player_jump:
					sprite_index = spr_player_fall
					break
				case spr_player_jump2:
					sprite_index = spr_player_fall2
					break
				case spr_player_airDash1:
					sprite_index = spr_player_airDash2
					break
			}
		}
	}
	
	if (keyAttack_held && !in_freefall)
	{
		if grounded
		{
			sprite_index = spr_player_running
			image_index = 0
			
			jumpAnim = true
			state.change(PLAYER_MACH1)
			if (movespeed < 6)
				movespeed = 6
		}
		else if (sprite_index != spr_player_airDash1 && sprite_index != spr_player_airDash2)
		{
			stompAnim = false
			jumpAnim = true
			
			sprite_index = spr_player_airDash1
			image_index = 0
		}
	}
	
	if (keySlap_pressed && !suplexDash)
		state.change(PLAYER_SUPLEXDASH)
	
	image_speed = 0.35
	if (move != 0)
		xscale = move
	
	scr_player_taunt()
}

function scr_playerState_jump_leave()
{
	ladderBuffer = 0
	freefallAnimTimer = 0
	stompAnim = false
}

function scr_player_jump()
{
	sprite_index = (move != 0 ? spr_player_jump2 : spr_player_jump)
	image_index = 0
	
	stompAnim = false
	jumpAnim = true
	jumpStop = false
	
	input_buffer_jump = 0
	vsp = -11
	state.change(PLAYER_JUMP)
	
	snd_play(sfx_jump)
	instance_create(x, y, obj_highjumpcloud)
}