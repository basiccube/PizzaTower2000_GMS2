if (sprite_index == spr_got && !obj_player.state.is(PLAYER_TREASURE))
	instance_destroy()

if (sprite_index != spr_got)
	sprite_index = spr_idle