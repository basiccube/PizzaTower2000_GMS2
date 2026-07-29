function scr_player_gameover() {
	scr_getinput()
	image_speed = 0.35
	cutscene = 1
	flash = false
	alarm[0] = -1
	alarm[1] = -1
	alarm[2] = -1
	alarm[3] = -1
	alarm[4] = -1
	alarm[5] = -1
	alarm[6] = -1
	alarm[7] = -1
	sprite_index = spr_player_deathend
	hurted = 0
	inv_frames = 0

	x += hsp
	y += floor(vsp)
	if (vsp < 30)
	    vsp += grav



}
