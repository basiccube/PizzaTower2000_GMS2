with (other)
{
	if (grounded && state.is(PLAYER_SUPLEXDASH) && other.image_index == 0)
	{
		hsp = 0
		vsp = 0
		movespeed = 0
		
		sprite_index = spr_player_knightIntro
		image_index = 0
		state.change(PLAYER_KNIGHT)
		
		other.image_index = 1
	}
}