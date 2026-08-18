function scr_playerState_piledriver()
{
	move = keyLeft_held + keyRight_held
	hsp = move * movespeed
	if (sprite_index == spr_player_piledriverLand)
	{
		move = 0
		hsp = 0
	}
	
	landAnim = false
	machslideAnim = false
	
	if (move != 0 && movespeed < 6)
		movespeed += 0.25
	else if (move == 0)
		movespeed = 0
	
	if (movespeed > 6)
		movespeed -= 0.1
	
	if (grounded && vsp > 0 && !place_meeting(x, y + 1, obj_destructibles) && sprite_index == spr_player_piledriver)
	{
		sprite_index = spr_player_piledriverLand
		image_index = 0
		
		hsp = 0
		jumpStop = true
		camera_shake(20, 40)
		
		instance_create(x, y, obj_landcloud)
		with (instance_create(x, y + 32, obj_bangeffect))
			image_xscale = other.xscale
		
		with (obj_baddie)
		{
			hsp = 0
			vsp = -7
			image_index = 0
		}
	}
	
	if (sprite_index == spr_player_piledriverLand && LAST_FRAME)
	{
		sprite_index = spr_player_fall
		if useMachFreefallAnim
			sprite_index = spr_player_machFreefall
		
		vsp = -8
		state.change(PLAYER_JUMP)
	}
	
	image_speed = 0.35
}

function scr_playerState_piledriver_enter()
{
	snd_play(sfx_jump)
	sprite_index = spr_player_piledriver
	image_index = 0
	vsp = -7
}