function scr_player_machslide() {
	scr_getinput()
	if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
	    hsp = (xscale * movespeed)
	else if place_meeting(x, (y + 1), obj_railh)
	    hsp = ((xscale * movespeed) - 5)
	else if place_meeting(x, (y + 1), obj_railh2)
	    hsp = ((xscale * movespeed) + 5)
	move = (keyRight_held + keyLeft_held)
	if (sprite_index == spr_player_machslide || sprite_index == spr_player_machslideend || sprite_index == spr_player_machslidestart)
	    mach2 = 0
	if (movespeed >= 0)
	    movespeed -= 0.4
	if (sprite_index == spr_player_machslidestart && floor(image_index) == (image_number - 1))
	    sprite_index = spr_player_machslide
	landAnim = 0
	if (floor(hsp) == 0 && sprite_index != spr_player_machslideboost && sprite_index != spr_player_machslideboost3)
	{
	    image_index = 0
	    if (sprite_index == spr_player_machslide)
	        machslideAnim = 1
	    movespeed = 0
	    state = 0
	}
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_machslideboost || sprite_index == spr_player_machslideboost3))
	{ 
	    image_index = 0
	    xscale *= -1
	    if (sprite_index == spr_player_machslideboost3)
	    {
	        sprite_index = spr_player_mach3
	        movespeed = 12
	        state = 81
	    }
	    else if (sprite_index == spr_player_machslideboost)
	    {
	        movespeed = 9
	        state = 61
	    }
	    instance_create(x, y, obj_jumpdust)
	}
	if (scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_slope) && sprite_index != spr_player_machslideboost && sprite_index != spr_player_machslideboost3)
	{
	    movespeed = 0
	    state = 63
	    hsp = -2.5 * xscale
	    vsp = -3
	    mach2 = 0
	    image_index = 0
	    instance_create(x + (10 * xscale), y + 10, obj_bumpeffect)
	}

	if ((sprite_index == spr_player_machslideboost || sprite_index == spr_player_machslideboost3) && floor(image_index) == (image_number - 1))
	    image_speed = 0
	else
	    image_speed = 0.35
 
	if (mach2 == 0)
	{
	    if ((!instance_exists(obj_slidecloud)) && grounded)
	        instance_create(x, y, obj_slidecloud)
	}
	else if (mach2 >= 35)
	{
	    if ((!instance_exists(obj_dashcloud)) && grounded)
	        instance_create(x, y, obj_dashcloud)
	}



}
