room_run_code(room)
if (room == rm_roomadd && global.current_room != undefined)
{
	var prop = ds_map_find_value(properties_map, global.current_room.name)
	room_parse_properties("levels/" + prop)
}

// This code exists because GameMaker 6 and 7 have a cool bug with room_tile_add
// that doesn't set the tiles' blending color.
// Does room_tile_add_ext have the ability to change the blending color?
// No, of course it doesn't!
for (i = 0; i < room_width; i += 32)
{
    for (ii = 0; ii < room_height; ii += 32)
    {
        tile = tile_layer_find(5, i, ii)
        if (tile_exists(tile))
            tile_set_blend(tile, c_white)
    }
}