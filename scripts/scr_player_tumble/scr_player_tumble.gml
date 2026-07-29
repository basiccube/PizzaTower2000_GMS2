function scr_player_tumble() {
	scr_getinput()
	if (!place_meeting(x, y + 1, obj_railh))
	    hsp = (xscale * movespeed)
	else if place_meeting(x, y + 1, obj_railh)
	    hsp = (xscale * movespeed) - 5
	else if place_meeting(x, y + 1, obj_railh2)
	    hsp = (xscale * movespeed) + 5

	if (place_meeting(x, y + 1, obj_slope) && hsp != 0 && movespeed > 8 && movespeed < 20)
	    scr_addslopemomentum(0.4)

	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope))
	{
	    snd_play(sfx_bump)
	    with (obj_camera)
	    {
	        shake_mag = 20
	        shake_mag_acc = (40 / room_speed)
	    }
	    image_speed = 0.35
	    flash = false
	    state = 63
	    hsp = -2.5 * xscale
	    vsp = -3
	    mach2 = 0
	    image_index = 0
	    instance_create(x + (10 * xscale), y + 10, obj_bumpeffect)
	}

	if (!keyJump_held && !jumpstop && vsp < 0.5)
	{
	    vsp /= 5
	    jumpstop = true
	}
	if (grounded && vsp > 0)
	    jumpstop = false

	if keyJump_pressed
	    input_buffer_jump = 0
	if (hsp != 0 && input_buffer_jump < 8 && grounded)
	    vsp = -9
 
	sprite_index = spr_player_tumble
	image_speed = 0.35



}
