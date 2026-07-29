with (obj_tv)
{
    message = other.name
    showtext = 1
    alarm[0] = 2
}

with (obj_player)
{
    if (keyUp_held && grounded && (state == 0 || state == 60 || state == 61 || state == 81) && (!instance_exists(obj_transition)) && state != 55 && state != 52)
    {
        mach2 = 0
        obj_camera.chargecamera = 0
        image_index = 0
        state = 55
    }
}
if (floor(obj_player.image_index) == (obj_player.image_number - 1) && obj_player.state == 55)
{
    with (obj_player)
    {
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        global.leveltosave = other.level
        if (!instance_exists(obj_transition))
            instance_create(x, y, obj_transition)
    }
    // Read level S rank score from level info file
    if (file_exists("levels\\" + level + ".pli"))
    {
        tempini_open("levels\\" + level + ".pli")
        global.srank = ini_read_real("Level", "SRank", 0)
        global.arank = global.srank - (global.srank / 4)
        global.brank = global.srank - ((global.srank / 4) * 2)
        global.crank = global.srank - ((global.srank / 4) * 3)
        tempini_close()
    }
}
