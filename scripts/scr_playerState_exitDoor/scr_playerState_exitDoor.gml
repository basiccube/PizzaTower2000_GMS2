function scr_playerState_exitDoor()
{
	hsp = 0
	movespeed = 0
	
	sprite_index = spr_player_exitDoor
	image_speed = 0.35
	
	if (LAST_FRAME || !place_meeting(x, y, [obj_door, obj_keydoor, obj_exitgate]))
		state.change(PLAYER_NORMAL)
}

function scr_playerState_exitDoor_enter()
{
	sprite_index = spr_player_exitDoor
	image_index = 0
}