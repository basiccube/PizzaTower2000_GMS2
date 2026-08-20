function scr_playerState_knight()
{
	var moveSprites = [spr_player_knightIdle, spr_player_knightMove, spr_player_knightJump, spr_player_knightFall]
	if in_array(sprite_index, moveSprites)
	{
		move = keyLeft_held + keyRight_held
		hsp = move * movespeed
	}
	else if grounded
	{
		move = 0
		hsp = 0
	}
	
	if (!keyJump_held && !jumpStop && vsp < 0.5)
	{
		vsp /= 2
		jumpStop = true
	}
	if (grounded && vsp > 0)
		jumpStop = false
		
	if (dir != xscale)
	{
		movespeed = 0
		dir = xscale
	}
	
	if grounded
	{
		if (move != 0 && sprite_index == spr_player_knightIdle)
			sprite_index = spr_player_knightMove
		else if (move == 0 && sprite_index == spr_player_knightMove)
			sprite_index = spr_player_knightIdle
		
		if (sprite_index == spr_player_knightIdle || sprite_index == spr_player_knightMove)
		{
			if (input_buffer_jump > 0 && vsp > 0)
			{
				snd_play(sfx_jump)
				sprite_index = spr_player_knightJumpStart
				image_index = 0
			}
			
			if keySlap_pressed
				state.change(PLAYER_KNIGHTATTACK)
		}
	}
	
	if (sprite_index == spr_player_knightJumpStart && LAST_FRAME)
	{
		sprite_index = spr_player_knightJump
		image_index = 0
		
		vsp = -11
		if keyRight_held
			hsp = 4
		else if -keyLeft_held
			hsp = -4
	}
	
	if ((sprite_index == spr_player_knightJump && LAST_FRAME) || (!grounded && sprite_index != spr_player_knightJump))
		sprite_index = spr_player_knightFall
	
	if (grounded && sprite_index == spr_player_knightFall)
		scr_player_knightLand()
	
	if (move != 0)
	{
		xscale = move
		if (movespeed < 6)
			movespeed += 0.5
		else if (movespeed > 6)
			movespeed = 6
			
		if (movespeed < 1)
			image_speed = 0.15
		else if (movespeed < 4)
			image_speed = 0.35
		else
			image_speed = 0.6
	}
	else
	{
		movespeed = 0
		image_speed = 0.35
	}
	
	if (place_meeting(x, y + 1, obj_slope) && sprite_index != spr_player_knightThunder && sprite_index != spr_player_knightIntro)
	{
		xscale = 1
		if place_meeting(x, y + 1, obj_sloperight)
			xscale = -1
			
		state.change(PLAYER_KNIGHTSLIDE)
		sprite_index = spr_player_knightSlideDown
	}
	
	if (sprite_index == spr_player_knightIntro)
	{
		if LAST_FRAME
			image_speed = 0
		else if (floor(image_index) == 4 && !instance_exists(obj_thunder))
			instance_create(x, y - 600, obj_thunder)
	}
	
	if (sprite_index == spr_player_knightThunder && LAST_FRAME)
		sprite_index = spr_player_knightIdle
	
	if (sprite_index == spr_player_knightLand && LAST_FRAME)
		sprite_index = spr_player_knightIdle

	if (move != 0)
	{
		var in_frame = (floor(image_index) == 3 || floor(image_index) == 8)
		if (in_frame && sprite_index == spr_player_knightMove && !steppy)
		{
			snd_play(sfx_step)
			instance_create(x, y + 43, obj_cloudeffect)
			steppy = true
		}
		else if !in_frame
			steppy = false
	}
}

function scr_player_knightLand()
{
	with (obj_baddie)
	{
		hsp = 0
		vsp = -7
	}
	
	snd_play(sfx_groundpound)
	camera_shake(10, 30)
	
	sprite_index = spr_player_knightLand
	image_index = 0
	instance_create(x, y, obj_landcloud)
}