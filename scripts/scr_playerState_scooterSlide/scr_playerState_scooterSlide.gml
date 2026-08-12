function scr_playerState_scooterSlide()
{
	hsp = xscale * movespeed
	if (movespeed > 0)
		movespeed -= 0.4
		
	if (movespeed <= 0)
	{
		state.change(PLAYER_NORMAL)
		movespeed = 0
	}
	
	if (grounded && sprite_index == spr_player_machFreefall)
		sprite_index = spr_player_groundSlide
	
	image_speed = 0.35
	if (grounded && !instance_exists(obj_slidecloud))
		instance_create(x, y, obj_slidecloud)
}