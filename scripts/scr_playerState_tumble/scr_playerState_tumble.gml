function scr_playerState_tumble()
{
	hsp = xscale * movespeed
	scr_player_railspeed()
	
	if (hsp != 0 && movespeed > 8 && movespeed < 20)
		scr_player_addslopemomentum(0.4)
	
	sprite_index = spr_player_tumble
	image_speed = 0.35
	
	if (!keyJump_held && !jumpStop && vsp < 0.5)
	{
		vsp /= 5
		jumpStop = true
	}
	if (grounded && vsp > 0)
		jumpStop = false
	
	if (hsp != 0 && grounded && input_buffer_jump > 0)
		vsp = -9
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope))
	{
		camera_shake(20, 40)
		state.change(PLAYER_BUMP)
	}
}