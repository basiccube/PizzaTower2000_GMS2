function scr_player_freefall() {
	scr_getinput()
	landAnim = 1
	sprite_index = spr_player_freefallslam

	move = (keyLeft_held + keyRight_held)
	if (!grounded)
	{
	    hsp = move * movespeed
	    if (move != xscale && momemtum == 1 && movespeed != 0)
	        movespeed -= 0.05
	    if (movespeed == 0)
	        momemtum = 0
    
	    if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
	    {
	        movespeed = 0
	        mach2 = 0
	    }
    
	    if (move != 0 && movespeed < 7)
	        movespeed += 0.25
	    if (movespeed > 7)
	        movespeed -= 0.05
    
	    if (dir != xscale)
	    {
	        mach2 = 0
	        dir = xscale
	        movespeed = 0
	    }
	    if (move == -xscale)
	    {
	        mach2 = 0
	        movespeed = 0
	        momemtum = 0
	    }
    
	    if (move != 0)
	        xscale = move
	}

	superslam += 1
	if (superslam > 10 && !instance_exists(obj_superslameffect))
	    instance_create(x, y, obj_superslameffect)
    
	if (grounded && !place_meeting(x, y + 5, obj_destructibles))
	{
	    if (place_meeting(x, y + 1, obj_slope))
	    {
	        with (instance_place(x, y + 1, obj_slope))
	        {
	            if (object_index == obj_slopeleft)
	                other.xscale = 1
	            if (object_index == obj_sloperight)
	                other.xscale = -1
            
	            other.crouchslipbuffer = 25
	            other.mach2 = 35
	            other.sprite_index = spr_player_crouchslip
	            other.state = 59
            
	            if (other.superslam >= 20)
	                other.movespeed = 12
	            else
	                other.movespeed = 8
	            instance_create(other.x, other.y, obj_jumpdust)
	        }
	    }
	    else
	    {
	        snd_play(sfx_groundpound)
	        superslam = 0
	        image_index = 0
	        state = 68
	        jumpAnim = 1
	        jumpstop = 0
	        with (obj_camera)
	        {
	            shake_mag = 10
	            shake_mag_acc = (30 / room_speed)
	        }
	        with (instance_create(x, (y + 35), obj_bangeffect))
	            image_xscale = obj_player.xscale
	        freefallstart = 0
	    }
	}
	image_speed = 0.35



}
