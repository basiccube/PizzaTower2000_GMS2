function scr_playerState_knightSlide()
{
	hsp = xscale * movespeed
	if (sprite_index == spr_player_knightSlideDown)
		movespeed += 0.5
	else if grounded
		movespeed -= 0.1
	
	if place_meeting(x, y + 1, obj_slope)
		sprite_index = spr_player_knightSlideDown
	else
		sprite_index = spr_player_knightSlide
	
	if scr_solid(x + sign(hsp), y)
	{
		sprite_index = spr_player_knightFall
		instance_create(x + (10 * xscale), y + 10, obj_bumpeffect)
		
		hsp = -xscale * 5
		vsp = -5
		state.change(PLAYER_KNIGHT)
	}
	
	if (movespeed <= 0 && sprite_index == spr_player_knightSlide)
	{
		sprite_index = spr_player_knightIdle
		state.change(PLAYER_KNIGHT)
	}

	image_speed = 0.4
}

function scr_playerState_knightSlide_enter()
{
	instance_create(x, y, obj_swordhitbox)
	sprite_index = spr_player_knightSlide
}