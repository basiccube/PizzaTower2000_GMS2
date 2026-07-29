function scr_player_climbwall() {
	scr_getinput()
	move = (keyLeft_held + keyRight_held)
	if (windingAnim < 200)
	    windingAnim += 1
	vsp = (-movespeed)
	if (movespeed > 0 && movespeed < 24 && move == xscale)
	    movespeed += 0.1
	crouchslideAnim = 1
	sprite_index = spr_player_climbwall
	if (!keyAttack_held)
	{
	    state = 49
	    sprite_index = spr_player_fall
	}
	if (!scr_solid((x + xscale), y))
	{
	    instance_create(x, y, obj_jumpdust)
	    vsp = 0
	    if (mach2 >= 100)
	    {
	        sprite_index = spr_player_mach3
	        if (movespeed < 12)
	            movespeed = 12
	        mach2 = 100
	        state = 81
	    }
	    else
	    {
	        movespeed = 10
	        state = 61
	    }
	}
	if ((grounded && movespeed <= 0) || movespeed <= 0)
	{
	    state = 49
	    sprite_index = spr_player_fall
	}

	if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x - sign(hsp), y, obj_slope))
	{
	    snd_play(sfx_groundpound)
	    sprite_index = spr_player_superjumpland
	    with (obj_camera)
	    {
	        shake_mag = 10
	        shake_mag_acc = (30 / room_speed)
	    }
	    image_index = 0
	    state = 83
	    machhitAnim = 0
	}

	image_speed = 0.6
	if (!instance_exists(obj_cloudeffect) && (!global.highperformance))
	    instance_create(x, (y + 43), obj_cloudeffect)
	if (keyJump_pressed && keyAttack_held)
	{
	    instance_create(x, y, obj_jumpdust)
	    vsp = -9
	    xscale *= -1
	    sprite_index = spr_player_mach2jump
	    mach2 = 35
	    movespeed = 10
	    state = 61
	}



}
