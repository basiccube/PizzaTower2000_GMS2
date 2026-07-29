function scr_player_freefallland() {
	scr_getinput()
	mach2 = 0
	jumpAnim = 1
	landAnim = 0
	machslideAnim = 0
	crouchAnim = 0
	machhitAnim = 0
	movespeed = 0
	facehurt = 1
	vsp = 0
	hsp = 0
	sprite_index = spr_player_freefallland
	if (floor(image_index) == (image_number - 1))
	    state = 0
	image_speed = 0.35



}
