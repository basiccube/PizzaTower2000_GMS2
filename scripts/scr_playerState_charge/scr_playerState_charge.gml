function scr_playerState_charge()
{
	if !instance_exists(grabbedID)
	{
		state.change(PLAYER_NORMAL)
		exit;
	}
	
	hsp = xscale * movespeed
	movespeed = 10
	scr_player_railspeed()
	
	if (windingAnim < 2000)
		windingAnim++
	
	sprite_index = spr_player_charge
	image_speed = 0.65
	
	if (!keyJump_held && !jumpStop && vsp < 0.5)
	{
		vsp /= 2
		jumpStop = true
	}
	if (grounded && vsp > 0)
		jumpStop = true
	
	if (input_buffer_jump > 0 && grounded)
	{
		snd_play(sfx_jump)
		input_buffer_jump = 0
		vsp = -9
	}
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_slope))
		state.change(PLAYER_BUMP)
	
	if keySlap_pressed
	{
		snd_play(sfx_punch)
		sprite_index = spr_player_punch
		image_index = 0
		
		movespeed = -4
		animSlowDown = true
		state.change(PLAYER_ANIMATION)
	}
	
	if (grounded && !instance_exists(obj_dashcloud))
		instance_create(x, y, obj_dashcloud)
}