if cantcollect
	exit;

snd_stop_play(sfx_collect)

var num = 10 * global.multiplier
global.collect += num
with (instance_create(x, y, obj_smallnumber))
	number = num
	
global.combotime += 10
global.style += 5

instance_destroy()