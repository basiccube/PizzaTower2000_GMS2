function scr_playerState_enterDoor()
{
	hsp = 0
	movespeed = 0
	
	sprite_index = spr_player_enterDoor
	image_speed = 0.35
	
	if LAST_FRAME
		image_speed = 0
}

function scr_playerState_enterDoor_enter()
{ image_index = 0; }