with (obj_player)
{
	if state.is(PLAYER_MENU)
	{
		sprite_index = spr_player_machFreefall
		image_index = 0
		state.change(PLAYER_SCOOTERSLIDE)
		
		movespeed = 10
		vsp = -4
		facehurt = true
	}
}