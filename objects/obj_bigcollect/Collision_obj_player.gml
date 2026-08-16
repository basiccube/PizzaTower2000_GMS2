var num = 100 * global.multiplier
global.collect += num
with (instance_create(x, y, obj_smallnumber))
	number = num
	
global.combotime = 60
global.style += 10

snd_play(sfx_collecttoppin)
instance_destroy()