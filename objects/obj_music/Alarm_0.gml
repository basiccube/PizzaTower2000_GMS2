if (currentlyplaying == undefined)
	exit;

if is_string(currentlyplaying)
{
	var path = "music/" + currentlyplaying + ".ogg"
	if file_exists(path)
	{
		var stream = audio_create_stream(path)
		ds_map_set(global.music, currentlyplaying, stream)
		currentlyplaying = stream
	}
}

if (!jingle && !is_string(currentlyplaying) && !snd_playing(currentlyplaying))
{
	snd_stop_all()
	mus_play(currentlyplaying)
}