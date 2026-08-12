function scr_hurtplayer()
{
	with (obj_playerOLD)
	{
	    if ((state == 15 || state == 16 || state == 9) && cutscene == 0)
	    {
	        snd_play(sfx_losetransformation)
	        with (instance_create(x, y, obj_knightdebris))
	            image_index = 0
	        with (instance_create(x, y, obj_knightdebris))
	            image_index = 1
	        with (instance_create(x, y, obj_knightdebris))
	            image_index = 2
	        with (instance_create(x, y, obj_knightdebris))
	            image_index = 3
	        with (instance_create(x, y, obj_knightdebris))
	            image_index = 4
	        with (instance_create(x, y, obj_knightdebris))
	            image_index = 5
	        if (x != other.x)
	            obj_playerOLD.hsp = (sign((x - other.x)) * 5)
	        else
	            obj_playerOLD.hsp = 5
	        vsp = -3
	        image_index = 0
	        obj_playerOLD.image_index = 0
	        obj_playerOLD.flash = 1
	        state = 63
	    }
	    else if (state == 18 && hurted == 0 && sprite_index != spr_bombpep_end)
	    {
	        snd_play(sfx_explode)
	        hurted = 1
	        instance_create(x, y, obj_bombexplosion)
	        sprite_index = spr_bombpep_end
	        bombpeptimer = 0
	    }
	    else if (state == 6)
	    {
	        snd_play(sfx_losetransformation)
	        with (instance_create(x, y, obj_boxxeddebris))
	            image_index = 0
	        with (instance_create(x, y, obj_boxxeddebris))
	            image_index = 1
	        with (instance_create(x, y, obj_boxxeddebris))
	            image_index = 2
	        with (instance_create(x, y, obj_boxxeddebris))
	            image_index = 3
	        with (instance_create(x, y, obj_boxxeddebris))
	            image_index = 4
	        if (x != other.x)
	            obj_playerOLD.hsp = (sign((x - other.x)) * 5)
	        else
	            obj_playerOLD.hsp = 5
	        vsp = -3
	        image_index = 0
	        obj_playerOLD.image_index = 0
	        obj_playerOLD.flash = 1
	        state = 63
	    }
	    else if (state == 4 || state == 5)
	    {
	        snd_play(sfx_losetransformation)
	        obj_playerOLD.grav = 0.5
	        instance_create(x, y, obj_slimedebris)
	        instance_create(x, y, obj_slimedebris)
	        instance_create(x, y, obj_slimedebris)
	        instance_create(x, y, obj_slimedebris)
	        instance_create(x, y, obj_slimedebris)
	        instance_create(x, y, obj_slimedebris)
	        instance_create(x, y, obj_slimedebris)
	        instance_create(x, y, obj_slimedebris)
	        if (x != other.x)
	            obj_playerOLD.hsp = (sign((x - other.x)) * 5)
	        else
	            obj_playerOLD.hsp = 5
	        vsp = -3
	        image_index = 0
	        obj_playerOLD.image_index = 0
	        obj_playerOLD.flash = 1
	        state = 63
	    }
	    else if (state != 64 && state != 43 && state != 42 && hurted == 0 && cutscene == 0 && state != 63)
	    {
	        snd_play(sfx_pephurt)
	        global.hurtcounter += 1
	        alarm[7] = 60
	        alarm[6] = 120
	        hurted = 1
	        if (xscale == other.image_xscale)
	            sprite_index = spr_player_jumphurt
	        else
	            sprite_index = spr_player_hurt
	        movespeed = 8
	        vsp = -5
	        timeuntilhpback = 300
	        global.style -= 5
	        if (global.collect > 100)
	            global.collect -= 100
	        else
	            global.collect = 0
			
	        if (global.collect != 0)
	        {
				repeat (12)
					instance_create(x, y, obj_pizzaloss)
	        }
			
	        instance_create(x, y, obj_spikehurteffect)
	        state = 64
	        image_index = 0
	        flash = 1
	    }
	}
}