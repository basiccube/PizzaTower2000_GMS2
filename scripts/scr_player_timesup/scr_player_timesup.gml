function scr_player_timesup() {
	scr_getinput()
	xscale = 1
	sprite_index = spr_player_timesup
	if place_meeting(x, y, obj_timesup)
	{
	    snd_play(sfx_bump)
	    state = 46
	    sprite_index = spr_player_deathend
	    vsp = -8
	    hsp = -4
	}
	if (room == timesuproom)
	{
	    obj_player.x = global.screenw / 2
	    obj_player.y = global.screenh / 2
	}
	if (floor(image_index) == 9)
	    image_speed = 0



}
