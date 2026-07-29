with (obj_editor)
{
    tileset = ds_list_find_index(global.tilesets, selectedtileset)
    if (tileset > 0)
        tileset -= 1
    else
        tileset = ds_list_size(global.tilesets) - 1
    selectedtileset = ds_list_find_value(global.tilesets, tileset)
    selectedtilesetname = ds_list_find_value(global.tilesetnames, tileset)
    msg = "Tileset set to " + string(selectedtilesetname)
    showmsg = true
    alarm[0] = 60
}
