if (alpha >= 1 && !fadein)
{
	fadein = true
	if (instance_exists(obj_player) && room != obj_player.targetRoom)
		room_goto(obj_player.targetRoom)
}
alpha += (!fadein ? 0.1 : -0.1)

with (obj_player)
{
	if (other.fadein && state.is([PLAYER_ENTERDOOR, PLAYER_VICTORY]) && place_meeting(x, y, [obj_door, obj_startgate]))
	{
		print("exit door")
		state.change(PLAYER_EXITDOOR)
	}
}

if (fadein && alpha <= 0)
	instance_destroy()