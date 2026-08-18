function scr_playerState_mach1()
{
	move = keyLeft_held + keyRight_held
	hsp = xscale * movespeed
	scr_player_railspeed()
	
	dir = xscale
	machhitAnim = false
	landAnim = false
	
	if (scr_solid(x + xscale, y) && (!place_meeting(x + xscale, y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
	{
		movespeed = 0
		state.change(PLAYER_NORMAL)
	}
	
	if (move == -xscale)
	{
		movespeed = 6
		image_index = 0
		xscale = move
	}
	
	sprite_index = spr_player_running
	image_speed = 0.45
	
	if grounded
	{
		if (hsp != 0 && movespeed > 6)
			scr_player_addslopemomentum(0.1)
			
		if (movespeed < 8)
			movespeed += 0.05
		else
		{
			sprite_index = spr_player_mach
			state.change(PLAYER_MACH2)
			instance_create(x, y, obj_jumpdust)
		}
		
		if !keyAttack_held
		{
			image_index = 0
			state.change(PLAYER_NORMAL)
		}
	}
	else
	{
		sprite_index = spr_player_airDash1
		image_index = 0
		
		momentum = true
		jumpAnim = false
		
		state.change(PLAYER_JUMP)
	}
	
	if keyDown_held
		state.change(PLAYER_CROUCHSLIDE)
		
	if (grounded && keyJump_pressed && keyAttack_held)
	{
		sprite_index = spr_player_airDash1
		image_index = 0
		
		momentum = true
		jumpAnim = true
		dir = xscale
		
		movespeed += 2
		vsp = -11
		
		input_buffer_jump = 0
		state.change(PLAYER_JUMP)
	}
	
	if (grounded && !instance_exists(obj_dashcloud))
		instance_create(x, y, obj_dashcloud)

	if (keySlap_pressed && !suplexDash)
		state.change(PLAYER_SUPLEXDASH)

	scr_player_taunt()
}

function scr_playerState_mach1_enter()
{
	sprite_index = spr_player_running
	image_index = 0
	jumpAnim = true
	
	if (movespeed < 6)
		movespeed = 6
}