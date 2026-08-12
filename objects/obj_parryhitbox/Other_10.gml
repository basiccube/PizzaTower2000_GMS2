with (obj_player)
{
	sprite_index = choose(spr_player_parry1, spr_player_parry2)
	image_speed = 0
	image_speed = 0.35
	
	state.change(PLAYER_PARRY)
	tauntTimer = 20
	
	movespeed = 8
	parryInstance = noone
	parryCount = parryMax
	
	snd_play(sfx_parry)
	flash = true
}

alarm[0] = die_time
collisioned = true