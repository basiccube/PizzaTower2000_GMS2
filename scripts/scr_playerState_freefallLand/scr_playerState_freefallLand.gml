function scr_playerState_freefallLand()
{
	hsp = 0
	vsp = 0
	movespeed = 0
	
	facehurt = true
	landAnim = false
	machslideAnim = false
	
	sprite_index = spr_player_freefallLand
	if LAST_FRAME
		state.change(PLAYER_NORMAL)
	
	image_speed = 0.35
}

function scr_playerState_freefallLand_enter()
{
	sprite_index = spr_player_freefallLand
	image_index = 0
}