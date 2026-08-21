function scr_player_updateMach2Effect()
{
	if (state.is(PLAYER_MACH2) && !instance_exists(obj_mach2effect))
	{
		mach2EffectTimer = mach2EffectTimerMax
		instance_create(x, y, obj_mach2effect)
	}
	
	if (mach2EffectTimer > 0)
	{
		mach2EffectTimer--
		if (mach2EffectTimer <= 0 && state.is(PLAYER_MACH2))
		{
			mach2EffectTimer = mach2EffectTimerMax
			instance_create(x, y, obj_mach2effect)
		}
	}
}

function scr_player_updateMach3Effect()
{
	var mach3EffectStates = [PLAYER_MACH3, PLAYER_MACHROLL, PLAYER_SUPLEXDASH, PLAYER_CHARGE]
	var mach3EffectMachSlide = (state.is(PLAYER_MACHSLIDE) && state.prev_is(PLAYER_MACH3))
	
	var inMach3EffectState = (state.is(mach3EffectStates) || mach3EffectMachSlide)
	if (inMach3EffectState && !instance_exists(obj_mach3effect))
	{
		mach3EffectTimer = mach3EffectTimerMax
		instance_create(x, y, obj_mach3effect)
	}
	
	if (mach3EffectTimer > 0)
	{
		mach3EffectTimer--
		if (mach3EffectTimer <= 0 && inMach3EffectState)
		{
			mach3EffectTimer = mach3EffectTimerMax
			instance_create(x, y, obj_mach3effect)
		}
	}
}