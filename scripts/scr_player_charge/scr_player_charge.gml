function scr_player_charge() {
	scr_getinput()
	if (windingAnim < 2000)
	    windingAnim += 1

	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed)
	else if place_meeting(x, y + 1, obj_railh)
	    hsp = (xscale * movespeed) - 5
	else if place_meeting(x, y + 1, obj_railh2)
	    hsp = (xscale * movespeed) + 5
	movespeed = 10
	crouchslideAnim = true

	if (!keyJump_held && !jumpstop && vsp < 0.5)
	{
	    vsp /= 2
	    jumpstop = true
	}
	if (grounded && vsp > 0)
	    jumpstop = false
 
	if (input_buffer_jump < 8 && grounded)
	{
	    snd_play(sfx_jump)
	    vsp = -9
	}
	if keyJump_pressed
	    input_buffer_jump = 0
 
	if (scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_slope))
	{
	    snd_play(sfx_bump)
	    movespeed = 0
	    state = 63
	    hsp = -2.5 * xscale
	    vsp = -3
	    mach2 = 0
	    image_index = 0
	    instance_create(x + (10 * xscale), y + 10, obj_bumpeffect)
	}

	sprite_index = spr_player_charge
	image_speed = 0.65

	if keySlap_pressed
	{
	    snd_play(sfx_punch)
	    state = 48
	    image_index = 0
	    image_speed = 0.35
	    sprite_index = spr_player_punch
	    movespeed = -4
	}

	if (!instance_exists(obj_dashcloud) && grounded)
	    instance_create(x, y, obj_dashcloud)



}
