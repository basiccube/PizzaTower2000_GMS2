function scr_playerState_machRoll()
{
	move = keyLeft_held + keyRight_held
	hsp = xscale * movespeed
	scr_player_railspeed()
	
	if (hsp != 0 && movespeed > 6 && movespeed < 22)
		scr_player_addslopemomentum(0.4)
		
	if (scr_solid(x + xscale, y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
		state.change(PLAYER_BUMP)
	
	if grounded
		sprite_index = spr_player_machRoll
	else if (sprite_index != spr_player_dive)
	{
		sprite_index = spr_player_dive
		vsp = 10
	}
	
	var canStand = (!scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
	if (!keyDown_held && grounded && canStand)
	{
		sprite_index = spr_player_machHit
		state.change(PLAYER_MACH2)
	}
	
	if (grounded && !instance_exists(obj_cloudeffect))
		instance_create(x, y + 43, obj_cloudeffect)
	
	image_speed = 0.8
}