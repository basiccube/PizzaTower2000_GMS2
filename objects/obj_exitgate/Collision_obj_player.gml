if !global.panic
	exit;
	
with (obj_player)
{
	var states = [PLAYER_NORMAL, PLAYER_MACH1, PLAYER_MACH2, PLAYER_MACH3]
	if (grounded && keyUp_held && state.is(states))
	{
		state.change(PLAYER_ENTERDOOR)
		if !is_string(global.leveltosave)
		{
			global.leveltosave = "level"
			level_set_srank(10000)
		}
		
		scr_savescore(global.leveltosave)
		if !instance_exists(obj_endlevelfade)
			instance_create(x, y, obj_endlevelfade)
	}
}