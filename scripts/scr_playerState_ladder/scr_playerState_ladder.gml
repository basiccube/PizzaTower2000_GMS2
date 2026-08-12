function scr_playerState_ladder()
{
	hsp = 0
	movespeed = 0
	
	landAnim = false
	machslideAnim = true
	jumpStop = false
	
	if keyUp_held
	{
		sprite_index = spr_player_ladderMoveUp
		vsp = -2
	}
	else if keyDown_held
	{
		sprite_index = spr_player_ladderMoveDown
		vsp = 6
	}
	else
	{
		sprite_index = spr_player_ladderIdle
		vsp = 0
	}
	
	if !place_meeting(x, y, obj_ladder)
	{
		state.change(PLAYER_NORMAL)
		vsp = 0
		image_index = 0
	}
	
	if keyJump_pressed
	{
		snd_play(sfx_jump)
		sprite_index = spr_player_jump
		image_index = 0
		
		ladderBuffer = 20
		jumpAnim = true
		machslideAnim = false
		
		state.change(PLAYER_JUMP)
		vsp = -9
	}
	
	if (keyDown_held && grounded && !place_meeting(x, y, obj_platform))
	{
		state.change(PLAYER_NORMAL)
		image_index = 0
	}
	
	image_speed = 0.35
}