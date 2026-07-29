function scr_dotaunt()
{
	if keyTaunt_pressed
	{
		taunttimer = 20
		tauntstoredmovespeed = movespeed
		tauntstoredsprite = sprite_index
		tauntstoredstate = state
		state = 42
		
		sprite_index = spr_player_taunt
		image_index = random(11)
		snd_play(sfx_taunt)
		instance_create(x, y, obj_taunteffect)
	}
}