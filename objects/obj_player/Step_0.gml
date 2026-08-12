scr_getinput()
if keyJump_pressed
	input_buffer_jump = 10

state.update()
scr_player_destroyDestructibles()

if (hurtTimer > 0)
{
	hurtTimer--
	if (alarm[1] == -1 || alarm[2] == -1)
		alarm[1] = 3
}
else
{
	hurt = false
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

var cutsceneStates = [PLAYER_TREASURE, PLAYER_GETKEY, PLAYER_ENTERDOOR, PLAYER_VICTORY, PLAYER_GAMEOVER]
var cutsceneSprites = [spr_knightpep_start, spr_knightpep_thunder]
cutscene = (state.is(cutsceneStates) || array_contains_bscotch(cutsceneSprites, sprite_index))

mask_index = spr_player_mask
if array_contains_bscotch(crouchMaskStates, state.state)
	mask_index = spr_crouchmask

if !state.is([PLAYER_MENU, PLAYER_GAMEOVER])
	scr_collide()