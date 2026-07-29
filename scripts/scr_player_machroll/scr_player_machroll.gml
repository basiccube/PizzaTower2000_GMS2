function scr_player_machroll() {
	scr_getinput()

	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed)
	else if place_meeting(x, y + 1, obj_railh)
	    hsp = (xscale * movespeed) - 5
	else if place_meeting(x, y + 1, obj_railh2)
	    hsp = (xscale * movespeed) + 5
 
	machslideAnim = 1
	move = (keyRight_held + keyLeft_held)

	if (place_meeting(x, y + 1, obj_slope) && hsp != 0 && movespeed > 6 && movespeed < 22)
	    scr_addslopemomentum(0.4)

	if (scr_solid(x + xscale, y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
	{
	    snd_play(sfx_bump)
	    image_speed = 0.35
    
	    movespeed = 0
	    state = 63
	    hsp = -2.5 * xscale
	    vsp = -3 
	    mach2 = 0
    
	    image_index = 0
	    machslideAnim = 1
	    machhitAnim = 0
	    instance_create(x + (10 * xscale), y + 10, obj_bumpeffect)
	}

	if (!instance_exists(obj_cloudeffect) && grounded)
	    instance_create(x, (y + 43), obj_cloudeffect)
 
	if grounded
	    sprite_index = spr_player_machroll
	else if (sprite_index != spr_player_dive)
	{
	    sprite_index = spr_player_dive
	    vsp = 10
	} 
	image_speed = 0.8

	if (!keyDown_held && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16) && grounded)
	{
	    sprite_index = spr_player_machhit
	    state = 61
	}



}
