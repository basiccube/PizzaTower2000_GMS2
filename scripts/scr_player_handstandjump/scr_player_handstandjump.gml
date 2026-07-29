function scr_player_handstandjump() {
	scr_getinput()
	landAnim = 0
	mach2 = 35
	move = (keyLeft_held + keyRight_held)
	hsp = (xscale * movespeed)
	momemtum = 1
	dir = xscale

	if (movespeed < 10 && grounded)
	    movespeed += 0.5
	else if (!grounded && movespeed < 10)
	    movespeed = 10
    
	if (!grounded && sprite_index == spr_player_suplexdash)
	    sprite_index = spr_player_suplexdashjumpstart
    
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_suplexdashjumpstart)
	    sprite_index = spr_player_suplexdashjump

	if ((floor(image_index) == (image_number - 1) || sprite_index == spr_player_suplexdashjump || sprite_index == spr_player_suplexdashjumpstart) && grounded)
	{
	    image_speed = 0.35
	    if (keyAttack_held)
	        state = 61
	    else
	        state = 0
	}

	if (move == -xscale)
	{
	    if (keyAttack_held && grounded)
	    {
	        if (grabturnboost)
	        {
	            sprite_index = spr_player_machslideboost3
	            movespeed = 10
	        }
	        else
	        {
	            sprite_index = spr_player_machslideboost
	            movespeed = 8
	        }
        
	        flash = false
	        state = 62
	        image_index = (image_number - 8)
	        image_index = clamp(image_index, 0, image_number - 1)
	        mach2 = 35
	    }
	    else
	    {
	        state = 0
	        movespeed = 0
	    }
	}

	if (keyJump_pressed && grounded)
	{
	    sprite_index = spr_player_mach2jump
	    instance_create(x, y, obj_jumpdust)
	    if (movespeed < 8)
	        movespeed = 8
	    state = 61
	    vsp = -9
	}

	if (keyDown_held && grounded)
	{
	    if (movespeed < 10)
	        movespeed = 10
	    sprite_index = spr_player_crouchslip
	    crouchslipbuffer = 25
	    machhitAnim = 0
	    state = 59
	}

	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope))
	{
	    snd_play(sfx_bump)
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

	image_speed = 0.35
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
	    instance_create(x, y, obj_slidecloud)
    



}
