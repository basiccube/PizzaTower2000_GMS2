function scr_player_punch() {
	scr_getinput()
	movespeed = 0
	mach2 = 0
	jumpAnim = 1
	landAnim = 0
	crouchslideAnim = 1
	crouchAnim = 1
	if (floor(image_index) == 8)
	    state = 0
	sprite_index = spr_player_punch
	image_speed = 0.35



}
