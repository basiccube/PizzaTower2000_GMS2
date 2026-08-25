with (obj_editor)
{
    if (!directory_exists(working_directory + "\\editor\\exports"))
        directory_create(working_directory + "\\editor\\exports")
    
    // Write the main room file and the room properties file
    saveroom = file_text_open_write("editor\\exports\\" + roomname + ".prm")
    propertiesfile = file_text_open_write("editor\\exports\\" + roomname + "_properties.prm")
    file_text_write_string(saveroom, roomname + " = room_add()")
    file_text_writeln(saveroom)
    file_text_write_string(saveroom, "room_set_view(" + roomname + ", 0, true, 0, 0, global.screenw, global.screenh, 0, 0, global.screenw, global.screenh, 32, 32, -1, -1, -1)")
    file_text_writeln(saveroom)
    file_text_write_string(saveroom, "room_set_view_enabled(" + roomname + ", true)")
    file_text_writeln(saveroom)
    file_text_write_string(saveroom, "room_set_width(" + roomname + ", " + string(roomw) + ")")
    file_text_writeln(saveroom)
    file_text_write_string(saveroom, "room_set_height(" + roomname + ", " + string(roomh) + ")")
    file_text_writeln(saveroom)
    file_text_write_string(saveroom, "room_set_caption(" + roomname + ", 'Pizza Tower')")
    file_text_writeln(saveroom)
    file_text_write_string(saveroom, "room_set_code(" + roomname + ", '")
    file_text_writeln(saveroom)
    file_text_write_string(saveroom, "with (obj_parallax) bg = ds_map_find_value(global.bg, " + chr(34) + roombgname + chr(34) + ")")
    file_text_writeln(saveroom)
    file_text_write_string(saveroom, "room_speed = 60")
    file_text_writeln(saveroom)
    file_text_write_string(saveroom, "')")
    file_text_writeln(saveroom)
    file_text_write_string(propertiesfile, "if (room == obj_room." + roomname + ")")
    file_text_writeln(propertiesfile)
    file_text_write_string(propertiesfile, "{")
    file_text_writeln(propertiesfile)
    for (i = 0; i < instance_count; i += 1)
    {
        objid = instance_id_get( i )
        if (instance_exists(objid))
        {
            if (objid.object_index == obj_object)
            {
                file_text_write_string(saveroom, roomname + "_" + objid.object + string(instance_id_get( i )) + " = room_instance_add(" + roomname + ", " + string(objid.x) + ", " + string(objid.y) + ", " + objid.object + ")")
                file_text_writeln(saveroom)
                file_text_write_string(propertiesfile, roomname + "_" + objid.object + string(instance_id_get( i )) + ".image_xscale = " + string(objid.image_xscale))
                file_text_writeln(propertiesfile)
                file_text_write_string(propertiesfile, roomname + "_" + objid.object + string(instance_id_get( i )) + ".image_yscale = " + string(objid.image_yscale))
                file_text_writeln(propertiesfile)
                if (objid.objvar != "")
                {
                    if (objid.objvar == "targetRoom")
                        file_text_write_string(propertiesfile, roomname + "_" + objid.object + string(instance_id_get( i )) + "." + objid.objvar + " = obj_room." + objid.varvalue)
                    else
                        file_text_write_string(propertiesfile, roomname + "_" + objid.object + string(instance_id_get( i )) + "." + objid.objvar + " = " + objid.varvalue)
                    file_text_writeln(propertiesfile)
                }
                if (objid.objvar2 != "")
                {
                    if (objid.objvar2 == "level")
                        file_text_write_string(propertiesfile, roomname + "_" + objid.object + string(instance_id_get( i )) + "." + objid.objvar2 + " = " + "'" + objid.varvalue2 + "'")
                    else
                        file_text_write_string(propertiesfile, roomname + "_" + objid.object + string(instance_id_get( i )) + "." + objid.objvar2 + " = " + objid.varvalue2)
                    file_text_writeln(propertiesfile)
                }
            }
        }
    }
    for (i = 0; i < roomw; i += 32)
    {
        for (ii = 0; ii < roomh; ii += 32)
        {
            tile = tile_get_at(i, ii)
            if (tile_exists_at(i, ii))
            {
                file_text_write_string(saveroom, "room_tile_add(" + roomname + ", ds_map_find_value(global.tilesets, '" + ds_list_find_value(global.tilesetnames, tile_get_background(tile) - ds_list_size(global.backgrounds)) + "'), " + string(tile_get_left(tile)) + ", " + string(tile_get_top(tile)) + ", " + string(tile_get_width(tile)) + ", " + string(tile_get_height(tile)) + ", " + string(tile_get_x(tile)) + ", " + string(tile_get_y(tile)) + ", 5)")
                file_text_writeln(saveroom)
            }
        }
    }
    file_text_close(saveroom)
    file_text_write_string(propertiesfile, "if (!global.panic)")
    file_text_writeln(propertiesfile)
    file_text_write_string(propertiesfile, "{")
    file_text_writeln(propertiesfile)
    file_text_write_string(propertiesfile, "obj_music.currentlyplaying = ds_map_find_value(global.music, '" + setmusic + "')")
    file_text_writeln(propertiesfile)
    file_text_write_string(propertiesfile, "}")
    file_text_writeln(propertiesfile)
    // Finish writing the room properties file
    file_text_write_string(propertiesfile, "}")
    file_text_close(propertiesfile)
    msg = "Room " + roomname + " exported."
    showmsg = true
    alarm[0] = 120
    
    // Play the level if the play button was pressed.
    if (global.playexport)
    {
        msg = "Launching " + roomname + "..."
        file_copy("editor\\exports\\" + roomname + ".prm", gamepath + "levels\\" + roomname + ".prm")
        file_copy("editor\\exports\\" + roomname + "_properties.prm", gamepath + "levels\\" + roomname + "_properties.prm")
        targetDoor = get_string("Set targetDoor value to:", "A")
        //execute_shell("start_game.bat", chr(34) + gamepath + chr(34) + " " + roomname + " " + targetDoor)
    }
}
alarm[0] = 30
