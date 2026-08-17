function scr_player_hurt()
{
	with (obj_player)
	{
		if cutscene
			exit;
			
		if state.is([PLAYER_KNIGHT, PLAYER_KNIGHTATTACK, PLAYER_KNIGHTSLIDE])
		{
			print("TODO: lose knight transfo")
			/*
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
	            obj_player.hsp = (sign((x - other.x)) * 5)
	        else
	            obj_player.hsp = 5
	        vsp = -3
	        image_index = 0
	        obj_player.image_index = 0
	        obj_player.flash = 1
	        state = 63
			*/
		}
		else if (state.is(PLAYER_BOMB) && sprite_index != spr_bombpep_end)
		{
			print("TODO: bomb explode")
			/*
			snd_play(sfx_explode)
	        hurted = 1
	        instance_create(x, y, obj_bombexplosion)
	        sprite_index = spr_bombpep_end
	        bombpeptimer = 0
			*/
		}
		else if (!state.is([PLAYER_HURT, PLAYER_BUMP, PLAYER_TAUNT]) && !hurt)
		{
			snd_play(sfx_pephurt)
			global.hurtcounter++
			instance_create(x, y, obj_spikehurteffect)
			
			alarm[3] = 60
			hurtTimer = 60
			hurt = true
			flash = true
			
			sprite_index = spr_player_hurt
			image_index = 0
			if (xscale == other.image_xscale)
				sprite_index = spr_player_hurtAir
				
			movespeed = 8
			vsp = -5
			state.change(PLAYER_HURT)
			
			global.style -= 5
			if (global.collect > 100)
			{
				global.collect -= 100
				repeat (12)
					instance_create(x, y, obj_pizzaloss)
			}
			else
				global.collect = 0
		}
	}
}