function scr_playerState_hurt()
{
	hsp = xscale * movespeed
	if (sprite_index == spr_player_hurt)
		hsp = -xscale * movespeed
		
	if (movespeed > 0)
		movespeed -= 0.1
	
	jumpStop = false
	jumpAnim = true
	landAnim = !grounded
	
	if grounded
		vsp = -4
	if scr_solid(x + sign(hsp), y)
		xscale *= -1
		
	image_speed = 0.35
}