var num = 25 * global.multiplier
global.collect += num
with (instance_create(x, y, obj_smallnumber))
	number = num
	
global.combotime += 30
create_debris(x, y, spr_healthpickupeaten)

snd_play(sfx_collect)
instance_destroy()