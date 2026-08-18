function scr_playerState_parry()
{
	if (image_index > image_number - 1)
	{
		movespeed = tauntStoredMovespeed
		sprite_index = tauntStoredSprite
		state.change(tauntStoredState)
		tauntTimer = 0
	}
	
	hsp = movespeed * -xscale
	if (grounded && movespeed > 0)
		movespeed -= 0.5
	if (movespeed < 0)
		movespeed = 0
		
	if (parryCount > 0)
	{
		parryCount--
		
		var threshold = 80
		with (obj_baddie)
		{
			if (distance_to_object(other) < threshold && !(state == ENEMY_STUN && thrown))
			{
				hp = 0
				stunned = 200
				scr_enemy_doThrow(other)
			}
		}
	}
}