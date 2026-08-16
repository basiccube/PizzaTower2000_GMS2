with (instance_create(x, y, obj_sausageman_dead))
	sprite_index = other.deadspr
	
global.combotime = 60
if !important
{
	global.combo++
	global.style += 10
	
	var num = 10 * global.multiplier
	global.collect += num
	with (instance_create(x, y, obj_smallnumber))
		number = num
	
	if (global.combo == 1)
		snd_play(sfx_combo1)
	else if (global.combo == 2)
		snd_play(sfx_combo2)
	else if (global.combo == 3)
		snd_play(sfx_combo3)
	else
		snd_play(sfx_combo4)
}

instance_create(x, y + 30, obj_bangeffect)
repeat (3)
	instance_create(x, y, obj_baddiegibs)
repeat (3)
	instance_create(x, y, obj_slapstar)

camera_shake(5, 20)
with (obj_tv)
	image_index = irandom(4)