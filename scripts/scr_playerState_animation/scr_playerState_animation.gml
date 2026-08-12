function scr_playerState_animation()
{
	if animSlowDown
		movespeed = approach(movespeed, 0, 0.25)
	else
		movespeed = 0
	
	hsp = xscale * movespeed
	if (animStopOnGround && grounded)
		hsp = 0
	
	jumpAnim = false
	landAnim = false
	
	image_speed = 0.35
	if LAST_FRAME
		state.change(PLAYER_NORMAL)
}

function scr_playerState_animation_leave()
{
	animStopOnGround = false
	animSlowDown = false
}