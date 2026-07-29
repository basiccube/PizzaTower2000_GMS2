function scr_player_backbreaker() {
	scr_getinput()
	hsp = 0
	mach2 = 0
	movespeed = 0
	landAnim = 0

	if (sprite_index == spr_player_taunt)
	{
	    if (!instance_exists(parry_inst) && taunttimer > parry_max)
	    {
	        parry_inst = instance_create(x, y, obj_parryhitbox)
	        with (parry_inst)
	            image_xscale = other.xscale
	    }

	    if (taunttimer < taunt_to_parry_max)
	    {
	        if (parry_inst != -4 && instance_exists(parry_inst))
	        {
	            with (parry_inst)
	                instance_destroy()
	            parry_inst = -4
	        }
	    }

	    taunttimer -= 1
	    vsp = 0
	    if (taunttimer <= 0)
	    {
	        movespeed = tauntstoredmovespeed
	        sprite_index = tauntstoredsprite
	        state = tauntstoredstate
	        if (parry_inst != -4 && instance_exists(parry_inst))
	        {
	            with (parry_inst)
	                instance_destroy()
	            parry_inst = -4
	        }
	    }
	}

	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_timesup && !place_meeting(x, y, obj_exitgate))
	{
	    global.panic = 1
	    sprite_index = spr_player_bossintro
	    image_index = 0
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_timesup && place_meeting(x, y, obj_exitgate))
	    state = 0
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_bossintro)
	    state = 0
	if (sprite_index == spr_player_bossintro)
	{
	    obj_tv.tvsprite = spr_tvexit
	    obj_tv.showtext = 1
	    obj_tv.message = "GET BACK TO THE START!!"
	    obj_tv.alarm[0] = 150
	}
	if (sprite_index == spr_player_taunt)
	    image_speed = 0
	else 
	    image_speed = 0.35



}
