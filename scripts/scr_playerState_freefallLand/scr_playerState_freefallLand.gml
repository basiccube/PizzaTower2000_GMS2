function scr_playerState_freefallLand()
{
	hsp = 0
	vsp = 0
	movespeed = 0
	
	facehurt = true
	landAnim = false
	machslideAnim = false
	
	sprite_index = spr_player_freefallLand
	if LAST_FRAME
		state.change(PLAYER_NORMAL)
	
	image_speed = 0.35
}

function scr_playerState_freefallLand_enter()
{
	sprite_index = spr_player_freefallLand
	image_index = 0
}

function scr_player_doFreefallLand()
{
	if place_meeting(x, y + 1, obj_slope)
	{
		var inst = instance_place(x, y + 1, obj_slope)
		
		xscale = 1
		if (inst.object_index == obj_sloperight)
			xscale = -1
		
		movespeed = 8
		if (freefallSlam >= 20)
			movespeed = 12
		
		state.change(PLAYER_CROUCHSLIDE)
		sprite_index = spr_player_crouchSlide
		crouchSlideBuffer = 25
		
		instance_create(x, y, obj_jumpdust)
	}
	else
	{
		snd_play(sfx_groundpound)
		state.change(PLAYER_FREEFALLLAND)
		
		camera_shake(10, 30)
		with (instance_create(x, y + 35, obj_bangeffect))
			image_xscale = other.xscale
	}
}