function scr_player_parry() {
	if (image_index > (image_number - 1))
	{
	    taunttimer = 0
	    parry = 0
	    state = tauntstoredstate
	    movespeed = tauntstoredmovespeed
	    sprite_index = tauntstoredsprite
	}

	if (grounded)
	    movespeed -= 0.5
	if (movespeed < 0)
	    movespeed = 0
	hsp = movespeed * -xscale

	if (parry_count > 0)
	{
	    parry_count -= 1
	    var parry_threshold;
	    parry_threshold = 80
    
	    with (obj_baddie)
	    {
	        if (distance_to_object(other) < parry_threshold && state != 98 && !(state == 95 && thrown))
	        {
	            hp = 0
	            state = 98
	        }
	    }
	}



}
