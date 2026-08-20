if (obj_player.state.is(PLAYER_SUPLEXDASH) && !obj_player.hurt && !obj_player.cutscene)
{
	instance_create(x, y, obj_bumpeffect)
	instance_destroy(other.id)
	instance_destroy()
	
	with (obj_player)
		state.change(PLAYER_BOMB)
}