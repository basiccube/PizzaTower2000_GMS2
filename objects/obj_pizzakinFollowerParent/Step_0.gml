if !instance_exists(obj_player)
	exit;

sprite_index = spr_idle
if (obj_player.hsp != 0)
	sprite_index = spr_run

if (room == rank_room || room == timesuproom)
	visible = false
if (obj_player.state.is(PLAYER_GAMEOVER))
	visible = false