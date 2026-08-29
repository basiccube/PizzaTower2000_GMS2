scr_getinput()
if keyJump_pressed
	input_buffer_jump = 8

state.update()
scr_player_updateSounds()
scr_player_destroyDestructibles()

if (y > room_height + resetThreshold || y < -resetThreshold)
{
	x = roomStartX
	y = roomStartY
	scr_player_doFreefallLand()
}

if (state.is(PLAYER_HURT) || sprite_index == spr_player_bombEnd)
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

scr_player_updateMach3Effect()
scr_player_updateMach2Effect()

cutscene = (state.is(cutsceneStates) || in_array(sprite_index, cutsceneSprites))

mask_index = spr_player_mask
if in_array(state.state, crouchMaskStates)
	mask_index = spr_crouchmask

if !state.is(noCollideStates)
	scr_collide()