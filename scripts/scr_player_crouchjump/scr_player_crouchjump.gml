function scr_player_crouchjump() {
	scr_getinput()
	move = (keyLeft_held + keyRight_held)
	mask_index = spr_crouchmask
	hsp = (move * movespeed)
	movespeed = 4
	if ((!keyJump_held) && jumpstop == 0 && jumpAnim == 1)
	{
	    vsp /= 2
	    jumpstop = 1
	}
	if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
	{
	    vsp = grav
	    jumpstop = 1
	}
	if (grounded && keyDown_held)
	{
	    state = 57
	    jumpAnim = 1
	    crouchAnim = 1
	    image_index = 0
	    jumpstop = 0
	}
	if (grounded && (!keyDown_held) && !scr_solid(x, (y - 16)))
	{
	    movespeed = 0
	    state = 0
	    jumpAnim = 1
	    landAnim = 1
	    crouchAnim = 1
	    image_index = 0
	    jumpstop = 0
	    mask_index = spr_player_mask
	}
	if grounded
	{
	    state = 57
	    jumpAnim = 1
	    crouchAnim = 1
	    image_index = 0
	    jumpstop = 0
	}
	if (jumpAnim == 1)
	{
	    sprite_index = spr_player_crouchjump
	    if (floor(image_index) == (image_number - 1))
	        jumpAnim = 0
	}
	if (jumpAnim == 0)
	    sprite_index = spr_player_crouchfall
	if (move != 0)
	    xscale = move
	image_speed = 0.35



}
