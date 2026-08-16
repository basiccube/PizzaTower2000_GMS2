function scr_playerState_suplexDash()
{
	move = keyLeft_held + keyRight_held
	hsp = xscale * movespeed
	
	landAnim = false
	momentum = true
	dir = xscale
	
	if (grounded && movespeed < 10)
		movespeed += 0.5
	else if (!grounded && movespeed < 10)
		movespeed = 10
	
	if (!grounded && sprite_index == spr_player_suplexDash)
		sprite_index = spr_player_suplexJumpStart
		
	if (sprite_index == spr_player_suplexJumpStart && LAST_FRAME)
		sprite_index = spr_player_suplexJump
		
	if ((LAST_FRAME || sprite_index == spr_player_suplexJump || sprite_index == spr_player_suplexJumpStart) && grounded)
		state.change(keyAttack_held ? PLAYER_MACH2 : PLAYER_NORMAL)
	
	if (move == -xscale)
	{
		if (grounded && keyAttack_held)
		{
			if grabTurnBoost
			{
				sprite_index = spr_player_machSlideBoost3
				movespeed = 10
			}
			else
			{
				sprite_index = spr_player_machSlideBoost
				movespeed = 8
			}
			
			image_index = clamp(image_number - 8, 0, image_number - 1)
			flash = false
			state.change(PLAYER_MACHSLIDE)
		}
		else
		{
			state.change(PLAYER_NORMAL)
			movespeed = 0
		}
	}
	
	if grounded
	{
		if keyJump_pressed
		{
			sprite_index = spr_player_machJump
			instance_create(x, y, obj_jumpdust)
			
			state.change(PLAYER_MACH2)
			vsp = -9
			if (movespeed < 8)
				movespeed = 8
		}
		else if keyDown_held
		{
			sprite_index = spr_player_crouchSlide
			crouchSlideBuffer = 25
			machhitAnim = false
			
			state.change(PLAYER_CROUCHSLIDE)
			if (movespeed < 10)
				movespeed = 10
		}
	}
	
	if (scr_solid(x + xscale,y ) && !place_meeting(x + sign(hsp), y, [obj_destructibles, obj_slope]))
		state.change(PLAYER_BUMP)
	
	image_speed = 0.35
	if (grounded && movespeed > 5 && !instance_exists(obj_slidecloud))
		instance_create(x, y, obj_slidecloud)
}

function scr_playerState_suplexDash_enter()
{
	snd_play(sfx_dash)
	flash = true
	
	sprite_index = spr_player_suplexDash
	image_index = 0
	instance_create(x, y, obj_jumpdust)
	
	var machState = state.prev_is([PLAYER_MACH2, PLAYER_MACH3])
	if ((machState && movespeed < 6) || !machState)
		movespeed = 6
	
	if !grounded
		vsp = -4
	
	instance_create(x, y, obj_slaphitbox)
	suplexDash = true
}