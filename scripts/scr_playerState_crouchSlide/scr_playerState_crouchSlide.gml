function scr_playerState_crouchSlide()
{
	hsp = xscale * movespeed
	scr_player_railspeed()
	
	if (hsp != 0 && movespeed > 4 && movespeed < 20)
		scr_player_addslopemomentum(0.45)
	
	if (movespeed > 0)
		movespeed -= 0.2
	
	if (crouchSlideBuffer > 0)
		crouchSlideBuffer--
	
	var canStand = (!scr_solid(x, y - 16) && !scr_solid(x, y - 32) && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32))
	if (crouchSlideBuffer <= 0 && canStand && !keyDown_held && keyAttack_held && state.prev_is([PLAYER_MACH2, PLAYER_MACH3, PLAYER_SUPLEXDASH, PLAYER_FREEFALL]))
	{
		machhitAnim = true
		movespeed = 10
		state.change(PLAYER_MACH2)
	}
	
	if (movespeed <= 0 || (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope)))
	{
		movespeed = 0
		state.change(PLAYER_CROUCH)
	}
	
	if (scr_solid(x + xscale,y ) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
		state.change(PLAYER_BUMP)
	
	sprite_index = spr_player_crouchSlide
	image_speed = 0.35
	
	if (grounded && movespeed > 5 && !instance_exists(obj_slidecloud))
		instance_create(x, y, obj_slidecloud)
}

function scr_playerState_crouchSlide_enter()
{ sprite_index = spr_player_crouchSlide; }

function scr_playerState_crouchSlide_leave()
{ crouchSlideBuffer = 0; }