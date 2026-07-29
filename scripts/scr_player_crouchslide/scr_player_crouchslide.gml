function scr_player_crouchslide() {
	scr_getinput()
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed)
	else if place_meeting(x, y + 1, obj_railh)
	    hsp = (xscale * movespeed) - 5
	else if place_meeting(x, y + 1, obj_railh2)
	    hsp = (xscale * movespeed) + 5

	if (place_meeting(x, y + 1, obj_slope) && hsp != 0 && movespeed > 4 && movespeed < 20)
	    scr_addslopemomentum(0.45)
 
	if (movespeed >= 0)
	    movespeed -= 0.2
	mask_index = spr_crouchmask

	if (crouchslipbuffer > 0)
	    crouchslipbuffer -= 1

	if (mach2 >= 35 && crouchslipbuffer <= 0 && !keyDown_held && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16) && keyAttack_held)
	{
	    movespeed = 10
	    sprite_index = spr_player_machhit
	    state = 61
	}
	if (((hsp == 0 || (scr_solid((x + 1), y) && xscale == 1) || (scr_solid((x - 1), y) && xscale == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope)))) || movespeed <= 0)
	{
	    state = 57
	    movespeed = 0
	    mach2 = 0
	    crouchslideAnim = 1
	    image_index = 0
	    crouchAnim = 1
	    start_running = 1
	    alarm[3] = 14
	}
	if (scr_solid(x + xscale, y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
	{
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

	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
	    instance_create(x, y, obj_slidecloud)
	image_speed = 0.35



}
