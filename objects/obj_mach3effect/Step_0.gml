var states = [PLAYER_MACH3, PLAYER_MACHROLL, PLAYER_SUPLEXDASH, PLAYER_CHARGE]
var machslide = (obj_player.state.is(PLAYER_MACHSLIDE) && obj_player.state.prev_is(PLAYER_MACH3))

if (!obj_player.state.is(states) && !machslide)
	instance_destroy()