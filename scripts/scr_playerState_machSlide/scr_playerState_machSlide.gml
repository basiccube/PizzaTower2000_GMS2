function scr_playerState_machSlide()
{
	hsp = xscale * movespeed
	scr_player_railspeed()
	
	var machboost = (sprite_index == spr_player_machSlideBoost || sprite_index == spr_player_machSlideBoost3)
	if (movespeed > 0)
		movespeed -= 0.4
	
	landAnim = false
	if (sprite_index == spr_player_machSlideStart && LAST_FRAME)
		sprite_index = spr_player_machSlide
	
	if (!machboost && movespeed <= 0)
	{
		image_index = 0
		if (sprite_index == spr_player_machSlide)
			machslideAnim = true
		
		movespeed = 0
		state.change(PLAYER_NORMAL)
	}
	else if (machboost && LAST_FRAME)
	{
		image_index = 0
		xscale *= -1
		
		if (sprite_index == spr_player_machSlideBoost3)
		{
			sprite_index = spr_player_mach3
			movespeed = 12
			state.change(PLAYER_MACH3)
		}
		else
		{
			movespeed = 9
			state.change(PLAYER_MACH2)
		}
		
		instance_create(x, y, obj_jumpdust)
	}
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope) && !machboost)
		state.change(PLAYER_BUMP)

	image_speed = 0.35
	if (machboost && LAST_FRAME)
		image_speed = 0
	
	var cloud = obj_slidecloud
	if state.prev_is([PLAYER_MACH2, PLAYER_MACH3])
		cloud = obj_dashcloud
	
	if (grounded && !instance_exists(cloud))
		instance_create(x, y, cloud)
}