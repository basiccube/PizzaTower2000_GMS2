function scr_playersounds()
{
	if (state == 60 && grounded && move != -xscale && !snd_mach1playing)
	{
		snd_mach1playing = true
		snd_loop(sfx_mach1)
	}
	else if ((state != 60 || !grounded || move == -xscale) && snd_mach1playing)
	{
		snd_mach1playing = false
		snd_stop(sfx_mach1)
	}
	
	if ((sprite_index == spr_player_mach || sprite_index == spr_player_machhit || state == 8) && !snd_mach2playing)
	{
	    snd_mach2playing = true
	    snd_loop(sfx_mach2)
	}
	else if (sprite_index != spr_player_mach && sprite_index != spr_player_machhit && state != 8 && snd_mach2playing)
	{
	    snd_mach2playing = false
	    snd_stop(sfx_mach2)
	}
	
	if ((state == 81 || sprite_index == spr_player_machslideboost3) && !snd_mach3playing)
	{
		snd_mach3playing = true
		snd_loop(sfx_mach3)
	}
	else if (state != 81 && sprite_index != spr_player_machslideboost3 && snd_mach3playing)
	{
		snd_mach3playing = false
		snd_stop(sfx_mach3)
	}
	
	if (state != 13 && state != 85 && snd_playing(sfx_dash))
		snd_stop(sfx_dash)

	if (state != 56 && snd_playing(sfx_superjumphold))
		snd_stop(sfx_superjumphold)
}