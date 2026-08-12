function scr_playerState_victory()
{
	hsp = 0
	movespeed = 0
	
	if place_meeting(x, y, obj_keydoor)
		sprite_index = spr_player_victory
	else if place_meeting(x, y, obj_startgate)
		sprite_index = spr_player_enterGate
	image_speed = (LAST_FRAME ? 0 : 0.35)
}