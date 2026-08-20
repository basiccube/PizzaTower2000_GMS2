global.room_code_map = ds_map_create()

function custom_room_set_code(rm, code)
{
	if is_struct(rm)
		rm = ds_list_find_index(global.rooms, rm)
	ds_map_set(global.room_code_map, rm, code)
}

function custom_room_run_code()
{
	if (global.current_room == undefined)
		exit;
	
	var rm = ds_list_find_index(global.rooms, global.current_room)
	if !ds_map_exists(global.room_code_map, rm)
		exit;
	
	var code = ds_map_find_value(global.room_code_map, rm)
	show_debug_message("Parsing code for room " + string(rm))
	code = string_replace_all(code, "\r\n", "\n")
	
	var arr = string_split(code, "\n", true)
	for (var i = 0, n = array_length(arr); i < n; i++)
	{
		var str = arr[i]
		
		var bgstr = "with (obj_parallax) bg = ds_map_find_value(global.bg, "
		if string_starts_with(str, bgstr)
		{
			str = string_delete(str, 1, string_length(bgstr))
			str = string_delete(str, string_length(str), 1)
			str = string_replace_all(str, "\"", "")
			
			var val = ds_map_find_value(global.bg, str)
			if (val == undefined)
			{
				var ind = asset_get_index(val)
				if (ind != -1)
					val = ind
			}
			
			if (val != undefined)
			{
				print("Setting room background to ", val, ", str: ", str)
				parallaxBackground.add(val, 0.25)
			}
		}
	}
}