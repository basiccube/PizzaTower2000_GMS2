with (other)
{
	if grounded
	{
		hsp = 0
		vsp = 0
		movespeed = 0
		
		if (other.sprite_index == other.spr_idle)
		{
			snd_play(sfx_treasure)
			state.change(PLAYER_TREASURE)
			other.alarm[0] = 300
		}
		
		with (other)
		{
			x = other.x
			y = other.y - 35
			sprite_index = spr_got
		}
		
		with (obj_tv)
		{
			message = "YOU GOT THE TREASURE!!!"
			showtext = true
			alarm[0] = 150
		}
		
		global.combotime = 60
		global.treasure = true
	}
}