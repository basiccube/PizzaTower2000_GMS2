scr_getinput()
if (drop)
    scr_collide()
if (move && x < (global.screenw / 2) - 16 && !drop)
    x += 2
if (x >= (global.screenw / 2) - 16)
    obj_rockcutscene.hspeed = -15
if (x > global.screenw && (!instance_exists(obj_transition)))
{
    with (instance_create(x, y, obj_transition))
        gotonoplayer = other.gotoroom
}
if (sprite_index == spr_pepcooter && (!instance_exists(obj_superdashcloud)) && (!global.highperformance))
    instance_create(x - 100, y, obj_superdashcloud)
