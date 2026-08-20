function scr_player_hurt()
{
	with (obj_player)
	{
		if cutscene
			exit;
		
		if state.is([PLAYER_KNIGHT, PLAYER_KNIGHTATTACK, PLAYER_KNIGHTSLIDE])
		{
			snd_play(sfx_losetransformation)
			for (var i = 0; i <= 5; i++)
			{
				with (instance_create(x, y, obj_knightdebris))
					image_index = i
			}
			
			state.change(PLAYER_BUMP)
			flash = true
			
			hsp = 5
			vsp = -3
			
			if (x != other.x)
				hsp = sign(x - other.x) * 5
		}
		else if (state.is(PLAYER_BOMB) && sprite_index != spr_player_bombEnd)
			scr_player_bombExplode()
		else if (!state.is([PLAYER_HURT, PLAYER_BUMP, PLAYER_TAUNT]) && !hurt)
		{
			snd_play(sfx_pephurt)
			global.hurtcounter++
			instance_create(x, y, obj_spikehurteffect)
			
			hurtTimer = 60
			hurt = true
			flash = true
			
			hurtCallbackHandle = call_later(60, time_source_units_frames, function()
			{
				state.change(PLAYER_NORMAL)
				movespeed = 0
				hurtCallbackHandle = undefined
			})
			
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