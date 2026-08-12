function scr_playerState_bump()
{
	movespeed = 0
	if (grounded && vsp > 0)
		hsp = 0
		
	if LAST_FRAME
		state.change(PLAYER_NORMAL)
		
	sprite_index = spr_player_bump
	image_speed = 0.35
}

function scr_playerState_bump_enter()
{
	snd_play(sfx_bump)
	instance_create(x + (10 * xscale), y + 10, obj_bumpeffect)
	
	hsp = -2.5 * xscale
	vsp = -3
	movespeed = 0
	
	machslideAnim = true
	machhitAnim = false
	
	sprite_index = spr_player_bump
	image_index = 0
}