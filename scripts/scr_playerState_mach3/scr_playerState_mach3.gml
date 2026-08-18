function scr_playerState_mach3()
{
	move = keyLeft_held + keyRight_held
	hsp = xscale * movespeed
	scr_player_railspeed()
	
	if (windingAnim < 2000)
		windingAnim++
	
	if (!keyJump_held && !jumpStop && vsp < 0.5)
	{
		vsp /= 2
		jumpStop = true
	}
	if (grounded && vsp > 0)
		jumpStop = false
		
	if (grounded || LAST_FRAME)
		sprite_index = spr_player_mach3
	
	if grounded
	{
		if (hsp != 0 && movespeed > 12 && movespeed < 18)
			scr_player_addslopemomentum(0.15)
		
		if (move == xscale && movespeed < 18)
			movespeed += 0.05
		else if (move != xscale && movespeed > 12)
			movespeed -= 0.05
		
		if (input_buffer_jump > 0 && move != -xscale && keyAttack_held)
		{
			snd_play(sfx_jump)
			sprite_index = spr_player_mach3Jump
			image_index = 0
			
			input_buffer_jump = 0
			vsp = -9
		}
		
		if keyUp_held
			state.change(PLAYER_SUPERJUMPPREP)
		else if !keyAttack_held
		{
			snd_play(sfx_machslide)
			sprite_index = spr_player_machSlideStart
			image_index = 0
			state.change(PLAYER_MACHSLIDE)
		}
		else if (move == -xscale)
		{
			snd_play(sfx_machslideboost)
			sprite_index = spr_player_machSlideBoost3
			image_index = 0
			
			flash = false
			state.change(PLAYER_MACHSLIDE)
		}
	}
	
	if (keyDown_held && !place_meeting(x, y, obj_dashpad))
	{
		flash = false
		vsp = 10
		state.change(PLAYER_MACHROLL)
		instance_create(x, y, obj_jumpdust)
	}
	
	var wallClimb = scr_player_doWallClimb(true)
	if (wallClimb == DoWallClimbResult.Bump)
	{
		flash = false
		camera_shake(20, 40)
	}
	
	if (keySlap_pressed && !suplexDash)
		state.change(PLAYER_SUPLEXDASH)
	
	if !instance_exists(obj_chargeeffect)
		instance_create(x, y, obj_chargeeffect)
	if (grounded && !instance_exists(obj_superdashcloud))
		instance_create(x, y, obj_superdashcloud)
	
	image_speed = 0.4
	scr_player_taunt()
}

function scr_playerState_mach3_enter()
{ sprite_index = spr_player_mach3; }