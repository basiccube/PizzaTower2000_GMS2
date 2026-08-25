openroom = get_string("Enter room name to open", "")
if (file_exists(openroom + ".ini") && openroom != "objects" && openroom != "config")
{
    with (obj_object)
        instance_destroy()
	tile_delete_all()
    ini_open(openroom + ".ini")
    maxsections = 1
    maxtilesections = 1
	camera_set_view_pos(view_camera[0], 0, 0)
    with (obj_editor)
    {
        tilevisible = true
        roomname = ini_read_string("Room", "Name", roomname)
        roomw = ini_read_real("Room", "Width", roomw)
        roomh = ini_read_real("Room", "Height", roomh)
        roombgname = ini_read_string("Room", "BackgroundName", "bg_cavern")
        roombg = ds_list_find_value(global.backgrounds, ds_list_find_index(global.backgroundnames, ini_read_string("Room", "BackgroundName", "bg_cavern")))
        setmusic = ini_read_string("Room", "Music", "mu_hub")
        msg = "Opened room: " + roomname
        showmsg = true
        alarm[0] = 120
    }
    for (i = 0; i < maxsections; i += 1)
    {
        if (ini_section_exists(string(i)))
        {
            if (ini_key_exists(string(i), "Object"))
            {
                with (instance_create(ini_read_real(string(i), "X", 0), ini_read_real(string(i), "Y", 0), obj_object))
                {
                    object = ini_read_string(string(other.i), "Object", "obj_null")
                    if (ds_list_find_index(global.objects, ini_read_string(string(other.i), "Object", "obj_null")) != -1)
                        sprite_index = global.objspr[ds_list_find_index(global.objects, ini_read_string(string(other.i), "Object", "obj_wall"))]
                    else
                        sprite_index = spr_object
                    image_xscale = ini_read_real(string(other.i), "XScale", 1)
                    image_yscale = ini_read_real(string(other.i), "YScale", 1)
                    if (ini_read_string(string(other.i), "Variable", "") != "")
                    {
                        objvar = ini_read_string(string(other.i), "Variable", "")
                        varvalue = ini_read_string(string(other.i), "VariableValue", "")
                    }
                    if (ini_read_string(string(other.i), "Variable2", "") != "")
                    {
                        objvar2 = ini_read_string(string(other.i), "Variable2", "")
                        varvalue2 = ini_read_string(string(other.i), "VariableValue2", "")
                    }
                }
            }
        }
        if (ini_section_exists(string(i + 1)))
            maxsections += 1
    }
    for (i = 0; i < maxtilesections; i += 1)
    {
        if (ini_section_exists("Tile" + string(i)))
        {
            if (ini_key_exists("Tile" + string(i), "Tileset"))
            {
                //(ds_list_find_value(global.tilesets, ds_list_find_index(global.tilesetnames, ini_read_string("Tile" + string(i), "Tileset", "tile_tower"))), ini_read_real("Tile" + string(i), "Left", 0), ini_read_real("Tile" + string(i), "Top", 0), ini_read_real("Tile" + string(i), "Width", 32), ini_read_real("Tile" + string(i), "Height", 32), ini_read_real("Tile" + string(i), "X", 0), ini_read_real("Tile" + string(i), "Y", 0), -5)
            }
        }
        if (ini_section_exists("Tile" + string(i + 1)))
            maxtilesections += 1
    }

    ini_close()
}
else if (openroom == "objects" || openroom == "config")
    show_message("Cannot open specified file.")
else
    show_message("File does not exist.")
alarm[0] = 30
