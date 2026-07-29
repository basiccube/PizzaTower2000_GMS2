function scr_player_machfreefall() {
	scr_getinput()
	if (mach2 == 0)
	{
	    hsp = (move * movespeed)
	    movespeed = 4
	}
	else
	{
	    hsp = (xscale * movespeed)
	    movespeed = 10
	}
	machslideAnim = 1
	move = (keyRight_held + keyLeft_held)
	crouchslideAnim = 1
	sprite_index = spr_player_machfreefall
	if (scr_solid((x + 1), y) && image_xscale == 1)
	{
	    machhitAnim = 0
	    state = 63
	    hsp = -2.5
	    vsp = -2.5
	    mach2 = 0
	    image_index = 0
	    instance_create((x + 10), (y + 10), obj_bumpeffect)
	    snd_play(sfx_bump)
	}
	else if (scr_solid((x - 1), y) && image_xscale == -1)
	{
	    machhitAnim = 0
	    state = 63
	    hsp = 2.5
	    vsp = -2.5
	    mach2 = 0
	    image_index = 0
	    instance_create((x - 10), (y + 10), obj_bumpeffect)
	    snd_play(sfx_bump)
	}
	if (grounded && (!(input_buffer_jump < 8)))
	{
	    with (obj_camera)
	    {
	        shake_mag = 20
	        shake_mag_acc = (40 / room_speed)
	    }
	    bounce = 0
	    state = 68
	    jumpstop = 0
	    image_index = 0
	    with (instance_create(x, (y + 35), obj_bangeffect))
	        image_xscale = obj_player.image_xscale
	    instance_create(x, y, obj_landcloud)
	    freefallstart = 0
	    snd_play(sfx_groundpound)
	    with (obj_baddie)
	    {
	        image_index = 0
	        vsp = -7
	        hsp = 0
	    }
	}
	image_speed = 0.5



}
