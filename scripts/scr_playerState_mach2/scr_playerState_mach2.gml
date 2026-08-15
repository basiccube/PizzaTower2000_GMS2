function scr_playerState_mach2()
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
		
	if (grounded && input_buffer_jump > 0 && move != -xscale && keyAttack_held)
	{
		snd_play(sfx_jump)
		sprite_index = spr_player_mach2Jump1
		image_index = 0
		vsp = -9
	}
	
	if grounded
	{
		if machhitAnim
		{
			sprite_index = spr_player_machHit
			machhitAnim = false
		}
		else if (sprite_index != spr_player_mach && sprite_index != spr_player_machHit)
			sprite_index = spr_player_mach
		
		if (hsp != 0 && movespeed > 8)
			scr_player_addslopemomentum(0.1)
			
		if (movespeed < 12)
			movespeed += 0.075
		else
		{
			flash = true
			state.change(PLAYER_MACH3)
			instance_create(x, y, obj_jumpdust)
		}
		
		if !keyAttack_held
		{
			snd_play(sfx_machslide)
			sprite_index = spr_player_machSlideStart
			image_index = 0
			state.change(PLAYER_MACHSLIDE)
		}
		
		if (move == -xscale)
		{
			snd_play(sfx_machslideboost)
			sprite_index = spr_player_machSlideBoost
			image_index = 0
			state.change(PLAYER_MACHSLIDE)
		}
	}
	else if (move == -xscale)
		movespeed = approach(movespeed, 8, 0.05)
		
	if (keyDown_held && !place_meeting(x, y, obj_dashpad))
	{
		flash = false
		vsp = 10
		state.change(PLAYER_MACHROLL)
		instance_create(x, y, obj_jumpdust)
	}
	
	var canClimbWallAir = (!grounded && scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, [obj_slope, obj_destructibles]))
	var canClimbWallGround = (grounded && scr_solid(x + sign(hsp), y - 16) && !place_meeting(x + sign(hsp), y, obj_destructibles) && place_meeting(x, y + 1, obj_slope))
	if (canClimbWallAir || canClimbWallGround)
		state.change(PLAYER_CLIMBWALL)
	else if (scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_slope) && (grounded || place_meeting(x + sign(hsp), y, obj_railv)))
		state.change(PLAYER_BUMP)
	
	if (!grounded && sprite_index != spr_player_mach2Jump2 && sprite_index != spr_player_machJump)
		sprite_index = spr_player_mach2Jump1
	
	if (sprite_index == spr_player_mach2Jump1 && LAST_FRAME)
		sprite_index = spr_player_mach2Jump2

	if (keySlap_pressed && !suplexDash)
		state.change(PLAYER_SUPLEXDASH)
	
	image_speed = 0.65
	scr_player_taunt()
}