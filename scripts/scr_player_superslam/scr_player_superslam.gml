function scr_player_superslam() {
	scr_getinput()
	mach2 = 0
	if (sprite_index == spr_player_piledriver)
	{
	    move = (keyLeft_held + keyRight_held)
	    hsp = (move * movespeed)
	}
	else
	{
	    move = 0
	    hsp = 0
	}
	if (grounded && (!(place_meeting(x, (y + 1), obj_destructibles))) && sprite_index == spr_player_piledriver && vsp > 0)
	{
	    sprite_index = spr_player_piledriverland
	    jumpAnim = 1
	    jumpstop = 0
	    image_index = 0
	    with (obj_camera)
	    {
	        shake_mag = 20
	        shake_mag_acc = (40 / room_speed)
	    }
	    hsp = 0
	    with (instance_create(x, (y + 35), obj_bangeffect))
	        xscale = other.xscale
	    instance_create(x, y, obj_landcloud)
	    freefallstart = 0
	    with (obj_baddie)
	    {
	        image_index = 0
	        vsp = -7
	        hsp = 0
	    }
	}
	jumpAnim = 1
	landAnim = 0
	machslideAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	if (sprite_index == spr_player_piledriverland && floor(image_index) == (image_number - 1))
	{
	    vsp = -8
	    state = 49
	    if (machfreefallanim)
	        sprite_index = spr_player_machFreefall
	    else
	        sprite_index = spr_player_fall
	}
	if (move != 0)
	{
	    if (movespeed < 6)
	        movespeed += 0.25
	    else if (floor(movespeed) == 5)
	        movespeed = 6
	}
	else
	    movespeed = 0
	if (movespeed > 6)
	    movespeed -= 0.1
	image_speed = 0.35



}
