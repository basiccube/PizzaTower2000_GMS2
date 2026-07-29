function scr_player_tackle() {
	scr_getinput()
	mach2 = 0
	hsp = -xscale * movespeed
	if (movespeed > 0)
	    movespeed -= 0.25
	if (movespeed < 0)
	    movespeed += 0.25
 
	jumpAnim = 1
	landAnim = 0
	crouchslideAnim = 1
	crouchAnim = 1

	image_speed = 0.35
	if (floor(image_index) == (image_number - 1))
	    state = 0



}
