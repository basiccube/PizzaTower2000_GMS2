function scr_playerState_taunt()
{
	hsp = 0
	vsp = 0
	movespeed = 0
	
	if (!instance_exists(parryInstance) && tauntTimer > parryMax)
	{
		parryInstance = instance_create(x, y, obj_parryhitbox)
		with (parryInstance)
			image_xscale = other.xscale
	}
	
	if (tauntTimer < tauntToParryMax && parryInstance != noone)
	{
		instance_destroy(parryInstance)
		parryInstance = noone
	}
	
	if (--tauntTimer <= 0)
	{
		movespeed = tauntStoredMovespeed
		sprite_index = tauntStoredSprite
		state.change(tauntStoredState)
		
		if (parryInstance != noone)
		{
			instance_destroy(parryInstance)
			parryInstance = noone
		}
	}
	
	image_speed = (sprite_index == spr_player_taunt ? 0 : 0.35)
}