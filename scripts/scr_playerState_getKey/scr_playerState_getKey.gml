function scr_playerState_getKey()
{
	hsp = 0
	vsp = 0
	movespeed = 0
	
	sprite_index = spr_player_getKey
	image_speed = 0.35
	
	if LAST_FRAME
		state.change(PLAYER_NORMAL)
}

function scr_playerState_getKey_enter()
{
	sprite_index = spr_player_getKey
	image_index = 0
}