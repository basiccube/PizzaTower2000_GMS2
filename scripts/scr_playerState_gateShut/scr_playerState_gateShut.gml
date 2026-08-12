function scr_playerState_gateShut()
{
	hsp = 0
	movespeed = 0
	landAnim = false
	
	var meetingGate = place_meeting(x, y, obj_exitgate)
	if LAST_FRAME
	{
		if meetingGate
			state.change(PLAYER_NORMAL)
		else
		{
			global.panic = true
			sprite_index = spr_player_scream
			image_index = 0
			state.change(PLAYER_ANIMATION)
			
			with (obj_tv)
			{
				tvsprite = spr_tvexit
				showtext = true
				
				message = "GET BACK TO THE START!!"
				alarm[0] = 250
			}
		}
	}
	
	image_speed = 0.35
}

function scr_playerState_gateShut_enter()
{
	sprite_index = spr_player_timesUp
	image_index = 0
}