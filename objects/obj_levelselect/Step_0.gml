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

if keyJump_pressed
{
    if (!instance_exists(obj_transition))
    {
        with (obj_room)
            other.targetRoom = variable_instance_get(id, ds_list_find_value(other.levelroom_list, other.selection))
            
        with (obj_player)
        {
            targetDoor = "A"
            targetRoom = other.targetRoom
            state.change(PLAYER_NORMAL)
        }
        global.leveltosave = filename_change_ext(ds_list_find_value(level_list, selection), "")
        
        // Read level S rank score from level info file
		var path = "levels/" + global.leveltosave + ".pli"
        if file_exists(path)
        {
            ini_open(path)
			level_set_srank(ini_read_real("Level", "SRank", 0))
            ini_close()
        }
        
        instance_create(x, y, obj_transition)
    }
}
