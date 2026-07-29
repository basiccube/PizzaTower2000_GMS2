function scr_player_ladder() {
	scr_getinput()
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	turning = 0
	jumpstop = 0
	movespeed = 0
	hsp = 0
	if keyUp_held
	{
	    vsp = -2
	    image_speed = 0.35
	}
	else if keyDown_held
	{
	    vsp = 6
	    image_speed = -0.35
	}
	else
	    vsp = 0
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	machhitAnim = 0
	if ((!keyUp_held) && (!keyDown_held))
	    sprite_index = spr_player_ladder
	else if (keyDown_held && (!keyUp_held))
	    sprite_index = spr_player_ladderdown
	else if ((!keyDown_held) && keyUp_held)
	    sprite_index = spr_player_laddermove
	if (!(place_meeting(x, y, obj_ladder)))
	{
	    landAnim = 0
	    jumpAnim = 0
	    state = 0
	    machslideAnim = 1
	    image_index = 0
	    vsp = 0
	}
	if keyJump_pressed
	{
	    snd_play(sfx_jump)
	    sprite_index = spr_player_jump
	    ladderbuffer = 20
	    jumpAnim = 1
	    state = 49
	    machslideAnim = 1
	    vsp = -9
	    image_index = 0
	}
	if (keyDown_held && grounded && (!(place_meeting(x, y, obj_platform))))
	{
	    state = 0
	    image_index = 0
	}



}
