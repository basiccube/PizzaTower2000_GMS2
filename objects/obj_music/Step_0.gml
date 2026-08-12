if (!jingle && !global.panic)
{
    // All music is handled by the room creation code.
    if (room == Realtitlescreen || room == Titlescreen)
        currentlyplaying = ds_map_find_value(global.music, "mu_title")
}

if instance_exists(obj_playerOLD)
{
    if (obj_playerOLD.state != 55 && room != rank_room && room != timesuproom && obj_playerOLD.state != 14)
        jingle = false
}

if (global.panic && alarm[0] <= 0)
{
    currentlyplaying = ds_map_find_value(global.music, global.escapesong)
    alarm[0] = 10
}

if (room == timesuproom && !jingle)
{
	snd_stop_all()
    jingle = true
}