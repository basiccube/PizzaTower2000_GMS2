if (file_exists(roomfile))
    file_delete(roomfile)
ini_open(roomfile)
with (obj_editor)
{
    ini_write_string("Room", "Name", roomname)
    ini_write_real("Room", "Width", roomw)
    ini_write_real("Room", "Height", roomh)
    ini_write_string("Room", "BackgroundName", roombgname)
    ini_write_string("Room", "Music", setmusic)
    msg = "Saved room: " + roomname
    showmsg = true
    alarm[0] = 120
}
for (i = 0; i < instance_count; i += 1)
{
    objid = instance_id_get( i )
    if (objid.object_index == obj_object)
    {
        ini_write_string(string(i), "Object", objid.object)
        ini_write_real(string(i), "X", objid.x)
        ini_write_real(string(i), "Y", objid.y)
        ini_write_real(string(i), "XScale", objid.image_xscale)
        ini_write_real(string(i), "YScale", objid.image_yscale)
        if (objid.objvar != "")
        {
            ini_write_string(string(i), "Variable", objid.objvar)
            ini_write_string(string(i), "VariableValue", objid.varvalue)
        }
        if (objid.objvar2 != "")
        {
            ini_write_string(string(i), "Variable2", objid.objvar2)
            ini_write_string(string(i), "VariableValue2", objid.varvalue2)
        }
    }
}
tilefile = 0
for (i = 0; i < obj_editor.roomw; i += 32)
{
    for (ii = 0; ii < obj_editor.roomh; ii += 32)
    {
        tile = tile_layer_find(-5, i, ii)
        if (tile_exists(tile))
        {
            ini_write_string("Tile" + string(tilefile), "Tileset", ds_list_find_value(global.tilesetnames, tile_get_background(tile) - ds_list_size(global.backgrounds)))
            ini_write_real("Tile" + string(tilefile), "Left", tile_get_left(tile))
            ini_write_real("Tile" + string(tilefile), "Top", tile_get_top(tile))
            ini_write_real("Tile" + string(tilefile), "Width", tile_get_width(tile))
            ini_write_real("Tile" + string(tilefile), "Height", tile_get_height(tile))
            ini_write_real("Tile" + string(tilefile), "X", tile_get_x(tile))
            ini_write_real("Tile" + string(tilefile), "Y", tile_get_y(tile))
            tilefile += 1
        }
    }
}
ini_close()
alarm[0] = 30
