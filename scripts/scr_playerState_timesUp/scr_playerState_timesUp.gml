function scr_playerState_timesUp()
{
	sprite_index = spr_player_timesUp
	xscale = 1
	
	if (room == timesuproom)
	{
		x = SCREEN_WIDTH / 2
		y = SCREEN_HEIGHT / 2
	}
	
	if place_meeting(x, y, obj_timesup)
	{
		snd_play(sfx_bump)
		sprite_index = spr_player_dead
		
		hsp = -4
		vsp = -8
		state.change(PLAYER_GAMEOVER)
	}
	
	image_speed = 0.35
	if LAST_FRAME
		image_speed = 0
}