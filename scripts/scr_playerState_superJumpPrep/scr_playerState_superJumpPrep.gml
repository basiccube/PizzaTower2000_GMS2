function scr_playerState_superJumpPrep()
{
	move = keyLeft_held + keyRight_held
	xscale = 1
	
	if (sprite_index == spr_player_superJumpPrepStart)
	{
		hsp = movespeed
		movespeed = approach(movespeed, 0, 0.8)
		
		if LAST_FRAME
			sprite_index = spr_player_superJumpPrep
	}
	else
	{
		hsp = move * 2
		movespeed = 0
		xscale = 1
		
		if (move == 1)
			sprite_index = spr_player_superJumpPrepRight
		else if (move == -1)
			sprite_index = spr_player_superJumpPrepLeft
		else
			sprite_index = spr_player_superJumpPrep
		
		if (!keyUp_held && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
		{
			instance_create(x, y, obj_explosioneffect)
			state.change(PLAYER_SUPERJUMP)
		}
	}
	scr_player_railspeed()
	
	jumpAnim = true
	landAnim = false

	image_speed = 0.35
}

function scr_playerState_superJumpPrep_enter()
{
	snd_play(sfx_superjumpprep)
	
	sprite_index = spr_player_superJumpPrepStart
	image_index = 0
	
	movespeed *= xscale
	xscale = 1
}