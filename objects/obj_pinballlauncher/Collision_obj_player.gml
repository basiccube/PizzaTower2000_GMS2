with (other)
{
	var states = [PLAYER_TUMBLE, PLAYER_KNIGHT, PLAYER_KNIGHTSLIDE, PLAYER_KNIGHTATTACK]
	if (grounded && !state.is(states))
	{
		movespeed = 14
		xscale = sign(other.image_xscale)
		vsp = 0
		
		state.change(PLAYER_TUMBLE)
		with (other)
		{
			sprite_index = spr_goblinbot_kick
			image_index = 0
		}
	}
	else if state.is(PLAYER_TUMBLE)
	{
		movespeed = 14
		xscale = sign(other.image_xscale)
	}
}