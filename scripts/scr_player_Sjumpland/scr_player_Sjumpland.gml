function scr_player_Sjumpland() {
	scr_getinput()
	mach2 = 0
	jumpAnim = 1
	landAnim = 0
	machslideAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	movespeed = 0
	vsp = 0
	hsp = 0
	if (floor(image_index) == (image_number - 1))
	{
	    if (machfreefallanim)
	        sprite_index = spr_player_machfreefall
	    else
	        sprite_index = spr_player_fall 
	    state = 49
	    jumpAnim = 0
	}



}
