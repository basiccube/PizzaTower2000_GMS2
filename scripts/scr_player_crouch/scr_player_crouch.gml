function scr_player_crouch() {
	scr_getinput()
	move = (keyLeft_held + keyRight_held)
	if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
	    hsp = (move * movespeed)
	else if place_meeting(x, (y + 1), obj_railh)
	    hsp = ((move * movespeed) - 5)
	else if place_meeting(x, (y + 1), obj_railh2)
	    hsp = ((move * movespeed) + 5)
	mask_index = spr_crouchmask
	turning = 0
	movespeed = 4
	if ((!grounded) && (!keyJump_pressed))
	{
	    jumpAnim = 0
	    state = 58
	    movespeed = 4
	    crouchAnim = 1
	    image_index = 0
	}
	if (keyJump_pressed && grounded && !scr_solid(x, (y - 16)) && !scr_solid(x, (y - 32)))
	{
	    snd_play(sfx_jump)
	    vsp = -8
	    state = 58
	    movespeed = 4
	    image_index = 0
	    crouchAnim = 1
	    jumpAnim = 1
	}
	if (grounded && (!keyDown_held) && !scr_solid(x, (y - 16)) && !scr_solid(x, (y - 32)) && (!keyJump_pressed))
	{
	    state = 0
	    movespeed = 0
	    crouchAnim = 1
	    jumpAnim = 1
	    image_index = 0
	    mask_index = spr_player_mask
	}
	if (crouchAnim == 0)
	{
	    if (move == 0)
	        sprite_index = spr_player_crouch
	    if (move != 0)
	        sprite_index = spr_player_crawl
	}
	if (crouchAnim == 1)
	{
	    if (move == 0)
	    {
	        sprite_index = spr_player_crouchstart 
	        if (floor(image_index) == image_number - 1)
	            crouchAnim = false
	    }
	}
	if (move != 0)
	{
	    xscale = move
	    crouchAnim = 0
	}
	image_speed = 0.6



}
