with (obj_player)
{
	if (place_meeting(x, y + 1, other) && !state.is(PLAYER_GAMEOVER))
	{
		with (other)
		{
			image_speed = 0.35
			image_index = 0
		}
		vsp = -11
	}
}