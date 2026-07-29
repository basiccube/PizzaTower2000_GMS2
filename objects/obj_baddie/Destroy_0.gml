if (ds_list_find_index(global.saveroom, id) == -1 && !important)
{
    ds_list_add(global.saveroom, id)
    obj_tv.image_index = random(4)
    if (!global.highperformance)
    {
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
    }
    instance_create(x, y, obj_baddiegibs)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    instance_create(x, (y + 30), obj_bangeffect)
    with (obj_camera)
    {
        shake_mag = 5
        shake_mag_acc = (20 / room_speed)
    }
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.deadspr
    hsp = 0
    vsp = 0
    global.combo += 1
    global.collect += 10 * global.multiplier
    with (instance_create(x, y, obj_smallnumber))
        number = 10 * global.multiplier
    if (global.combo == 1)
        snd_play(sfx_combo1)
    if (global.combo == 2)
        snd_play(sfx_combo2)
    if (global.combo == 3)
        snd_play(sfx_combo3)
    if (global.combo >= 4)
        snd_play(sfx_combo4)
    global.combotime = 60
    global.style += 10
}
if (ds_list_find_index(global.saveroom, id) == -1 && important)
{
    ds_list_add(global.saveroom, id)
    obj_tv.image_index = random(4)
    if (!global.highperformance)
    {
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
    }
    instance_create(x, y, obj_baddiegibs)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    instance_create(x, (y + 30), obj_bangeffect)
    with (obj_camera)
    {
        shake_mag = 5
        shake_mag_acc = (20 / room_speed)
    }
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.deadspr
    hsp = 0
    vsp = 0
    global.combotime = 60
    global.style += 10
}


