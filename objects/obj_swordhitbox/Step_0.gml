x = obj_player.x
y = obj_player.y
image_xscale = obj_player.xscale

if !obj_player.state.is([PLAYER_KNIGHTATTACK, PLAYER_KNIGHTSLIDE])
	instance_destroy()