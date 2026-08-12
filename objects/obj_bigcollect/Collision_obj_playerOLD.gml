global.collect += 100 * global.multiplier
with (instance_create(x, y, obj_smallnumber))
    number = 100 * global.multiplier

global.combotime = 60
global.style += 10

snd_play(sfx_collecttoppin)
instance_destroy()