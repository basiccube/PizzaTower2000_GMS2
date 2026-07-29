function scr_player_throw() {
	scr_getinput()
	movespeed = 0
	mach2 = 0
	if grounded
	    hsp = 0
	jumpAnim = 1
	landAnim = 0
	crouchslideAnim = 1
	crouchAnim = 1

	if (floor(image_index) == (image_number - 1))
	    state = 0
	image_speed = 0.35



}
