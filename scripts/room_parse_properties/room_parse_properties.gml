function room_parse_properties(file)
{
	var fstr = string_replace_all(file_text_read_all(file), "\r\n", "\n")
	var arr = string_split(fstr, "\n", true)
	
	show_debug_message("Parsing room properties file " + file)
	for (var i = 0, n = array_length(arr); i < n; i++)
	{
		var str = arr[i]
		if (str == "{" || str == "}")
			continue;
		
		var rmcheck = "if (room == obj_room."
		if string_starts_with(str, rmcheck)
		{
			str = string_delete(str, 1, string_length(rmcheck))
			str = string_delete(str, string_length(str), 1)
			
			var rm = room
			if (rm == rm_roomadd)
				rm = global.current_room
			
			if (rm != variable_instance_get(obj_room.id, str))
				break;
			
			show_debug_message("> Current room is " + str)
			continue;
		}
		
		if (str == "if (!global.panic)")
		{
			if global.panic
				break;
			continue;
		}
		
		if (string_pos(".", str) != 0)
		{
			var setarr = string_split_arr(str, [".", " = "], true)
			var setlen = array_length(setarr)
			
			if (setlen <= 2)
			{
				show_debug_message("Warning: " + str + " only split into two substrings")
				continue;
			}
			
			var inst = variable_instance_get(id, setarr[0])
			var instvar = setarr[1]
			var instval = setarr[2]
			if (setlen >= 4)
				instval += "." + setarr[3]
			
			if (setarr[2] == "ds_map_find_value(global")
			{
				var musstr = string_delete(setarr[3], 1, string_length("music, "))
				musstr = string_delete(musstr, string_length(musstr), 1)
				musstr = string_replace_all(musstr, "'", "")
				
				show_debug_message("Set music to " + musstr)
				with (obj_music)
					currentlyplaying = ds_map_find_value(global.music, musstr)
				
				continue;
			}
			else if (string_letters(instval) == "")
				instval = real(instval)
			else
			{
				var sinst = asset_get_index(setarr[2])
				if (sinst != -1)
					instval = variable_instance_get(sinst.id, setarr[3])
			}
			
			variable_instance_set(inst, instvar, instval)
		}
	}
}