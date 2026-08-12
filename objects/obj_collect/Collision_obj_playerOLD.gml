if !cantcollect
{
	if !snd_playing(sfx_collect)
	{
		snd_stop(sfx_collect)
		snd_play(sfx_collect)
	}
	
	global.collect += 10 * global.multiplier
	with (instance_create(x, y, obj_smallnumber))
		number = 10 * global.multiplier
	
	global.combotime += 10
	global.style += 5
	
	instance_destroy()
}