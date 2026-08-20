function scr_playerState_knightAttack()
{
	hsp = xscale * movespeed
	
	if knightAttackType
	{
		if scr_solid(x + sign(hsp), y)
		{
			instance_create(x + (xscale * 10), y + 10, obj_bumpeffect)
			xscale *= -1
			
			if !knightBounce
			{
				vsp = -9
				knightBounce = true
			}
		}
		
		if (grounded && vsp > 0)
		{
			scr_player_knightLand()
			state.change(PLAYER_KNIGHT)
		}
	}
	else
	{
		if (movespeed > 0)
			movespeed -= 0.2
			
		if LAST_FRAME
		{
			sprite_index = spr_player_knightIdle
			image_index = 0
			state.change(PLAYER_KNIGHT)
		}
	}

	image_speed = 0.35
}

function scr_playerState_knightAttack_enter()
{
	var hitbox = instance_create(x, y, obj_swordhitbox)
	instance_create(x + (-xscale * 10), y, obj_slidecloud)
	
	sprite_index = spr_player_knightAttack
	image_index = 0
	
	if knightAttackType
	{
		hitbox.sprite_index = spr_parryhitbox
		movespeed = 8
		vsp = -9
	}
}

function scr_playerState_knightAttack_leave()
{ knightBounce = false; }