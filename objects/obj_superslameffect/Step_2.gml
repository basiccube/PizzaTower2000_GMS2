x = obj_player.x
y = obj_player.y

if !obj_player.state.is(PLAYER_FREEFALL)
	instance_destroy()