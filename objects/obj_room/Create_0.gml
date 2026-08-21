properties_map = ds_map_create()
resize_list = [
	rm_main_menu,
	rm_level_select,
	rm_rank_room,
	rm_timesup_room
]

if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}

var file = file_find_first("levels/*.prm", fa_none)
while (file != "")
{
	var name = filename_change_ext(file, "")
	var proppos = string_pos("_properties", name)
	
	if (proppos != 0)
	{
		name = string_delete(name, proppos, string_length(name) - proppos + 1)
		ds_map_set(properties_map, name, file)
	}
	else
		room_parse_file("levels/" + file)
	
	file = file_find_next()
}
file_find_close()