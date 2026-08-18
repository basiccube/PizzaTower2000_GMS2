scr_getinput()
if keyJump_pressed
	input_buffer_jump = 8

state.update()
scr_player_updateSounds()
scr_player_destroyDestructibles()

if state.is(PLAYER_HURT)
{
	flickerTimer = 0
	image_alpha = 1
}
else if (hurtTimer > 0)
{
	hurtTimer--
	if (--flickerTimer <= 0)
	{
		image_alpha = (image_alpha <= 0 ? 1 : 0)
		flickerTimer = 3
	}
}
else
{
	hurt = false
	flickerTimer = 0
	image_alpha = 1
}

if (input_buffer_jump > 0)
	input_buffer_jump--

if (suplexDash && grounded)
	suplexDash = false

if (flash && alarm[0] <= 0)
	alarm[0] = 0.15 * room_speed

// mach3 effect
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

// mach2 effect
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

cutscene = (state.is(cutsceneStates) || in_array(sprite_index, cutsceneSprites))

mask_index = spr_player_mask
if in_array(state.state, crouchMaskStates)
	mask_index = spr_crouchmask

if !state.is([PLAYER_MENU, PLAYER_GAMEOVER, PLAYER_GETKEY, PLAYER_TREASURE])
	scr_collide()