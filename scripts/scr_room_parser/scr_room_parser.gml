function room_parse_file(file)
{
	var fstr = string_replace_all(file_text_read_all(file), "\r\n", "\n")
	var arr = string_split(fstr, "\n", true)
	
	print("Parsing room file " + file)
	
	var roomID = undefined
	for (var i = 0, n = array_length(arr); i < n; i++)
	{
		var str = arr[i]
		if (roomID == undefined)
		{
			var roomaddstr = " = room_add()"
			if string_ends_with(str, roomaddstr)
			{
				str = string_replace_all(str, roomaddstr, "")
				print("> Adding room " + str)
				
				roomID = custom_room_create(str)
				variable_instance_set(id, str, roomID)
			}
			else
			{
				print("> Room NOT added!")
				break;
			}
		}
		
		var funcarr = [
			"room_set_width",
			"room_set_height",
			"room_set_code",
			"room_tile_add"
		]
		
		for (var j = 0, m = array_length(funcarr); j < m; j++)
		{
			var func = funcarr[j]
			if !string_starts_with(str, func)
				continue;
			
			var splitarr = string_split_ext(str, ["(", ", ", ")"], true)
			switch func
			{
				case "room_set_width":
					printex("> Setting room width")
					custom_room_set_width(roomID, real(splitarr[2]))
					break
					
				case "room_set_height":
					printex("> Setting room height")
					custom_room_set_height(roomID, real(splitarr[2]))
					break
				
				case "room_set_code":
					printex("> Setting room creation code")
					
					var code = ""
					for (i++; arr[i] != "')"; i++)
					{
						str = arr[i]
						code += str + "\n"
					}
					
					custom_room_set_code(roomID, code)
					break
					
				case "room_tile_add":
					printex("> Adding tile to room")
					
					var spr = ds_map_find_value(global.tileset_map, string_replace_all(splitarr[4], "'", ""))
					custom_room_add_tile(roomID, spr, real(splitarr[5]), real(splitarr[6]), real(splitarr[7]), real(splitarr[8]), real(splitarr[9]), real(splitarr[10]), real(splitarr[11]))
					break
			}
		}
		
		var funcpos = string_pos("room_instance_add", str)
		if (funcpos != 0)
		{
			var splitarr = string_split_ext(str, [" = ", "room_instance_add", "(", ", ", ")"], true)
			
			var varname = splitarr[0]
			var instx = real(splitarr[2])
			var insty = real(splitarr[3])
			var instobj = asset_get_index(splitarr[4])
			if (instobj == -1)
				continue;
			
			printex("> Adding instance " + string(instobj) + " to room")
			variable_instance_set(id, varname, custom_room_add_instance(roomID, instx, insty, instobj))
		}
	}
}

function room_parse_properties(file)
{
	var fstr = string_replace_all(file_text_read_all(file), "\r\n", "\n")
	var arr = string_split(fstr, "\n", true)
	
	print("Parsing room properties file " + file)
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
			
			if (global.current_room != variable_instance_get(obj_room.id, str))
				break;
			
			printex("> Current room is " + str)
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
			var setarr = string_split_ext(str, [".", " = "], true)
			var setlen = array_length(setarr)
			
			if (setlen <= 2)
			{
				print("Warning: " + str + " only split into two substrings")
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
				
				printex("Set music to " + musstr)
				with (obj_music)
					currentlyplaying = ds_map_find_value(global.music, musstr)
				
				continue;
			}
			else if (string_letters(instval) == "")
				instval = real(instval)
			else if (string_starts_with(setarr[2], "'") && string_ends_with(setarr[2], "'"))
			{
				instval = string_delete(setarr[2], 1, 1)
				instval = string_delete(instval, string_length(instval), 1)
			}
			else
			{
				var sinst = asset_get_index(setarr[2])
				if (sinst != -1)
					instval = variable_instance_get(sinst.id, setarr[3])
				else
					print("Unknown object: ", setarr[2])
			}
			
			variable_instance_set(inst, instvar, instval)
		}
	}
}