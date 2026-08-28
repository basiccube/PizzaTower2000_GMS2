global.bscotch_audio_map = ds_map_create()

// This should be redone
function snd_get_from_sound_map(snd)
{
	if ds_map_exists(global.sound_map, snd)
		return ds_map_find_value(global.sound_map, snd);
	
	var name = audio_get_name(snd)
	if ds_map_exists(global.sound_map, name)
	{
		var val = ds_map_find_value(global.sound_map, name)
		ds_map_set(global.sound_map, snd, val)
		return val;
	}
	
	return snd;
}

#macro SND_GET_FROM_SOUND_MAP snd = snd_get_from_sound_map(snd)

function snd_play(snd)
{
	SND_GET_FROM_SOUND_MAP
	
	if (global.butterscotch && global.bscotch_audio)
		ds_map_set(global.bscotch_audio_map, snd, true)
	return audio_play_sound(snd, 10, false);
}

function snd_loop(snd)
{
	SND_GET_FROM_SOUND_MAP
	
	if (global.butterscotch && global.bscotch_audio)
		ds_map_set(global.bscotch_audio_map, snd, true)
	return audio_play_sound(snd, 10, true);
}

function snd_playing(snd)
{
	SND_GET_FROM_SOUND_MAP
	
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
	SND_GET_FROM_SOUND_MAP
	
	if (global.butterscotch && global.bscotch_audio)
		ds_map_set(global.bscotch_audio_map, snd, false)
	audio_stop_sound(snd);
}

function snd_stop_play(snd)
{
	snd_stop(snd)
	snd_play(snd)
}

function mus_play(mus)
{ snd_loop(mus); }

function snd_stop_all()
{
	if (global.butterscotch && global.bscotch_audio)
		ds_map_clear(global.bscotch_audio_map)
	audio_stop_all()
}