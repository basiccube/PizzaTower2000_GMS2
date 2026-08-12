function scr_playerState_ceilingHit()
{
	hsp = 0
	vsp = 0
	movespeed = 0
	
	sprite_index = spr_player_ceilingHit
	image_speed = 0.5
	
	if LAST_FRAME
	{
		sprite_index = spr_player_fall
		if useMachFreefallAnim
			sprite_index = spr_player_machFreefall
		state.change(PLAYER_JUMP)
	}
}