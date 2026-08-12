with (other)
{
	var states = [PLAYER_NORMAL, PLAYER_JUMP, PLAYER_MACH1, PLAYER_MACH2, PLAYER_MACH3]
	if (ladderBuffer <= 0 && keyUp_held && state.is(states))
	{
		x = other.x + (other.sprite_width / 2)
		y = floor(y)
		
		if ((y % 2) == 1)
			y--
		
		state.change(PLAYER_LADDER)
	}
}