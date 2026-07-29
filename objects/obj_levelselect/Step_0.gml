scr_getinput()
if (keyUp_pressed && selection > 0)
{
    selection -= 1
    snd_play(sfx_step)
}
else if (keyDown_pressed && selection < ds_list_size(level_list) - 1)
{
    selection += 1
    snd_play(sfx_step)
}

if (keyJump_pressed && global.startRoom == "")
{
    if (!instance_exists(obj_transition))
    {
        with (obj_room)
            other.targetRoom = variable_instance_get(id, ds_list_find_value(other.levelroom_list, other.selection))
            
        with (obj_player)
        {
            targetDoor = "A"
            targetRoom = other.targetRoom
            state = 0
        }
        global.leveltosave = filename_change_ext(ds_list_find_value(level_list, selection), "")
        
        // Read level S rank score from level info file
        if (file_exists("levels\\" + global.leveltosave + ".pli"))
        {
            tempini_open("levels\\" + global.leveltosave + ".pli")
            global.srank = ini_read_real("Level", "SRank", 0)
            global.arank = global.srank - (global.srank / 4)
            global.brank = global.srank - ((global.srank / 4) * 2)
            global.crank = global.srank - ((global.srank / 4) * 3)
            tempini_close()
        }
        
        instance_create(x, y, obj_transition)
    }
}
