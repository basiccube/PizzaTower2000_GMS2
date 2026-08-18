function scr_player_initSounds()
{
	snd_mach1 = false
	snd_mach2 = false
	snd_mach3 = false
}

function scr_player_updateSounds()
{
	var mach1 = (state.is(PLAYER_MACH1) && grounded && move != -xscale)
	if (mach1 && !snd_mach1)
	{
		snd_loop(sfx_mach1)
		snd_mach1 = true
	}
	else if (!mach1 && snd_mach1)
	{
		snd_stop(sfx_mach1)
		snd_mach1 = false
	}
	
	var mach2 = (in_array(sprite_index, [spr_player_mach, spr_player_machHit]) || state.is(PLAYER_WALLCLIMB))
	if (mach2 && !snd_mach2)
	{
		snd_loop(sfx_mach2)
		snd_mach2 = true
	}
	else if (!mach2 && snd_mach2)
	{
		snd_stop(sfx_mach2)
		snd_mach2 = false
	}
		
	var mach3 = (state.is(PLAYER_MACH3) || sprite_index == spr_player_machSlideBoost3)
	if (mach3 && !snd_mach3)
	{
		snd_loop(sfx_mach3)
		snd_mach3 = true
	}
	else if (!mach3 && snd_mach3)
	{
		snd_stop(sfx_mach3)
		snd_mach3 = false
	}
		
	if !state.is([PLAYER_SUPLEXDASH, PLAYER_CHARGE])
		snd_stop(sfx_dash)
		
	if !state.is(PLAYER_SUPERJUMPPREP)
		snd_stop(sfx_superjumphold)
}