if (room == rank_room)
{
    currentlyplaying = ds_map_find_value(global.music, "mu_title")
    jingle = true
    
    rankmusic = "mu_rankd"
    if (global.rank == "s")
        rankmusic = "mu_ranks"
    else if (global.rank == "a")
        rankmusic = "mu_ranka"
    else if (global.rank == "b" || global.rank == "c")
        rankmusic = "mu_rankb"
    
	var path = "music/" + rankmusic + ".ogg"
    if (is_string(ds_map_find_value(global.music, rankmusic)) && file_exists(path))
    {
		var stream = audio_create_stream(path)
		ds_map_set(global.music, rankmusic, stream)
    }
    
    snd_play(ds_map_find_value(global.music, rankmusic))
}

alarm[0] = 10
