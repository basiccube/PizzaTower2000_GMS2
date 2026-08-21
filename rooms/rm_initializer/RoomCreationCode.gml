if (global.startRoom != "")
{
	var rm = undefined
	with (obj_room)
		rm = variable_instance_get(id, global.startRoom)
		
	if (rm == undefined)
	{
		room_goto(Realtitlescreen)
		exit;
	}
	
	with (obj_player)
	{
		targetDoor = global.startDoor
		targetRoom = rm
		state.change(PLAYER_NORMAL)
	}
	
	room_goto(rm)
}
else
	room_goto(Realtitlescreen)