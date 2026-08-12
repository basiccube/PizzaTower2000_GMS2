if place_meeting(x, y - 1, obj_player)
{
	with (obj_player)
	{
		if (keyDown_held && state.is(PLAYER_CROUCH) && place_meeting(x, y + 1, other) && place_meeting(x, y + 1, obj_platform))
		{
			x = other.x + (other.sprite_width / 2)
			y = floor(y + 5)
			
			if ((y % 2) == 1)
				y--
			
			state.change(PLAYER_LADDER)
		}
	}
}