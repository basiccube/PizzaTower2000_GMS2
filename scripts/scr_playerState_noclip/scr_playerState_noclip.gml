function scr_playerState_noclip()
{
	move = keyLeft_held + keyRight_held
	var vmove = -keyUp_held + keyDown_held
	
	hsp = 0
	vsp = 0
	
	var spd = 5
	if keyAttack_held
		spd = 10
	
	if (move != 0)
		hsp = move * spd
	if (vmove != 0)
		vsp = vmove * spd
		
	x += hsp
	y += vsp
	
	sprite_index = spr_player_idle
	image_speed = 0.35
	
	if (keyJump_pressed || keySlap_pressed)
		state.change(PLAYER_NORMAL)
}