with (obj_player)
{
	sprite_index = spr_player_idle
	image_index = 0
	state.change(PLAYER_NORMAL)
}

global.style += 25
global.collect += 1000
with (instance_create(x, y, obj_smallnumber))
	number = 1000