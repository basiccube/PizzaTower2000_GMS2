room_run_code(room)
if (room == rm_roomadd && global.current_room != undefined)
{
	var prop = ds_map_find_value(properties_map, global.current_room.name)
	room_parse_properties("levels/" + prop)
}