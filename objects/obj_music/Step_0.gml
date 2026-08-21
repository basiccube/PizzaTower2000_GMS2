if (!jingle && !global.panic)
{
    // All music is handled by the room creation code.
    if (room == rm_main_menu || room == rm_tower_outside)
        currentlyplaying = ds_map_find_value(global.music, "mu_title")
}

with (obj_player)
{
	if (!state.is([PLAYER_TREASURE, PLAYER_VICTORY]) && room != rm_rank_room && room != rm_timesup_room)
		other.jingle = false
}

if (global.panic && alarm[0] <= 0)
{
    currentlyplaying = ds_map_find_value(global.music, global.escapesong)
    alarm[0] = 10
}

if (room == rm_timesup_room && !jingle)
{
	snd_stop_all()
    jingle = true
}