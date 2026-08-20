global.bscotch_audio_map = ds_map_create()

function snd_play(snd)
{
	if (global.butterscotch && global.bscotch_audio)
		ds_map_set(global.bscotch_audio_map, snd, true)
	return audio_play_sound(snd, 10, false);
}

function snd_loop(snd)
{
	if (global.butterscotch && global.bscotch_audio)
		ds_map_set(global.bscotch_audio_map, snd, true)
	return audio_play_sound(snd, 10, true);
}

function snd_playing(snd)
{
	var playing = audio_is_playing(snd)
	if (global.butterscotch && global.bscotch_audio && !playing)
	{
		var val = ds_map_find_value(global.bscotch_audio_map, snd)
		if (val != undefined && val)
			return val;
	}
	
	return playing;
}

function snd_stop(snd)
{
	if (global.butterscotch && global.bscotch_audio)
		ds_map_set(global.bscotch_audio_map, snd, false)
	audio_stop_sound(snd);
}

function mus_play(mus)
{ snd_loop(mus); }

function snd_stop_all()
{
	if (global.butterscotch && global.bscotch_audio)
		ds_map_clear(global.bscotch_audio_map)
	audio_stop_all()
}