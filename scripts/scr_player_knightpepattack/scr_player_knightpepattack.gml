function scr_player_knightpepattack() {
	scr_getinput()
	alarm[4] = 2
	alarm[6] = 60
	hurted = 1
	if instance_exists(obj_swordhitbox)
	    hsp = xscale * movespeed

	if (knightattacktype == 1)
	{
	    if (scr_solid(x + sign(hsp), y))
	    {
	        instance_create(x + (xscale * 10), y + 10, obj_bumpeffect)
	        xscale *= -1
	        if (!bounce)
	        {
	            vsp = -9
	            bounce = 1
	        }
	    }
	    if (grounded && vsp > 0)
	    {
	        with (obj_baddie)
	        {
	            vsp = -7
	            hsp = 0
	        }
	        with (obj_camera)
	        {
	            shake_mag = 10
	            shake_mag_acc = (30 / room_speed)
	        }
	        bounce = 0
	        image_index = 0
	        freefallstart = 0
	        momemtum = 0
	        snd_play(sfx_groundpound)
	        instance_create(x, y, obj_landcloud)
	        sprite_index = spr_knightpep_land
	        state = 15
	    }
	}
	else
	{
	    if (movespeed >= 0)
	        movespeed -= 0.2
	    if (floor(image_index) == (image_number - 1))
	    {
	        image_index = 0
	        sprite_index = spr_knightpep_idle
	        state = 15
	    }
	}
	image_speed = 0.35



}
