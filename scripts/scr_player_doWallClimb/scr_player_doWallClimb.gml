enum DoWallClimbResult
{
	None,
	WallClimb,
	Bump,
}

function scr_player_doWallClimb(checkMetalBlock = false)
{
	var airCheck = [obj_slope, obj_destructibles]
	var groundedCheck = [obj_destructibles]
	if checkMetalBlock
	{
		array_push(airCheck, obj_metalblock)
		array_push(groundedCheck, obj_metalblock)
	}
	
	var canClimbWallAir = (!grounded && scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, airCheck))
	var canClimbWallGround = (grounded && scr_solid(x + sign(hsp), y - 16) && !place_meeting(x + sign(hsp), y, groundedCheck) && place_meeting(x, y + 1, obj_slope))
	if (canClimbWallAir || canClimbWallGround)
	{
		state.change(PLAYER_WALLCLIMB)
		return DoWallClimbResult.WallClimb;
	}
	else if (scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_slope) && (grounded || place_meeting(x + sign(hsp), y, obj_railv)))
	{
		state.change(PLAYER_BUMP)
		return DoWallClimbResult.Bump;
	}
		
	return DoWallClimbResult.None;
}