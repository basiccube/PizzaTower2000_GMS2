if drop
	scr_collide()

var target = (SCREEN_WIDTH / 2) - 16
if (move && x < target && !drop)
	x += 2
if (x >= target)
	obj_rockcutscene.hspeed = -15

if (x > SCREEN_WIDTH && !instance_exists(obj_transition))
{
	with (obj_player)
		targetRoom = other.targetRoom
	instance_create(x, y, obj_transition)
}

if (!global.highperformance && sprite_index == spr_pepcooter && !instance_exists(obj_superdashcloud))
    instance_create(x - 100, y, obj_superdashcloud)