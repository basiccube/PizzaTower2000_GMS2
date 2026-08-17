var states = [PLAYER_MACH3, PLAYER_KNIGHT, PLAYER_KNIGHTSLIDE]
if ((place_meeting(x + 1, y, obj_player) || place_meeting(x - 1, y, obj_player)) && obj_player.state.is(states))
	instance_destroy()
	
if place_meeting(x, y - 1, obj_player)
{
	if obj_player.state.is(PLAYER_KNIGHT)
		instance_destroy()
	else if (obj_player.state.is(PLAYER_FREEFALL) && obj_player.freefallSlam >= 10)
	{
		with (obj_player)
			scr_player_doFreefallLand()
		instance_destroy()
	}
}

if (place_meeting(x, y + 40, obj_player) && obj_player.state.is(PLAYER_SUPERJUMP))
	instance_destroy()