function scr_player_hurt() {
	scr_getinput()
	if (sprite_index == spr_player_jumphurt)
	    hsp = (xscale * movespeed)
	if (sprite_index == spr_player_hurt)
	    hsp = ((-xscale) * movespeed)
	if (movespeed > 0)
	    movespeed -= 0.1
	mach2 = 0
	jumpAnim = 1
	if grounded
	    landAnim = 0
	else
	    landAnim = 1
	jumpstop = 0
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	hurted = 1
	alarm[4] = 2
	alarm[6] = 60

	if grounded
	    vsp = -4
	if scr_solid(x + hsp, y)
	    xscale *= -1
	image_speed = 0.35



}
