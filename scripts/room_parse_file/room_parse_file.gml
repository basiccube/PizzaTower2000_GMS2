///@param file
function file_text_read_all(_file)
{
    if is_string(_file)
    {
		if !file_exists(_file)
			return "";
		
        var buff = buffer_load(_file)
        var text = buffer_read(buff, buffer_text)		
        buffer_delete(buff)
		
        return text;
    }
	
    var filestring = ""
    while !file_text_eof(_file)
        filestring += file_text_readln(_file)
		
    return filestring;
}

function room_parse_file(file)
{
	var fstr = string_replace_all(file_text_read_all(file), "\r\n", "\n")
	var arr = string_split(fstr, "\n", true)
	
	show_debug_message("Parsing room file " + file)
	
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
				show_debug_message("> Adding room " + str)
				
				roomID = room_create(str)
				variable_instance_set(id, str, roomID)
			}
			else
			{
				show_debug_message("> Room NOT added!")
				break;
			}
		}
		
		var funcarr = [
			"room_set_view",
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
			
			var splitarr = string_split_arr(str, ["(", ", ", ")"], true)
			switch func
			{
				case "room_set_view":
					if is_struct(roomID)
						break
					
					//show_debug_message("> Setting up viewport")
					
					var cam = camera_create_view(0, 0, global.screenw, global.screenh)
					room_set_camera(roomID, 0, cam)
					
					room_set_viewport(roomID, 0, true, 0, 0, global.screenw, global.screenh)
					room_set_view_enabled(roomID, true)
					break
					
				case "room_set_width":
					//show_debug_message("> Setting room width")
					room_set_width(roomID, real(splitarr[2]))
					break
					
				case "room_set_height":
					//show_debug_message("> Setting room height")
					room_set_height(roomID, real(splitarr[2]))
					break
				
				case "room_set_code":
					//show_debug_message("> Setting room creation code")
					
					var code = ""
					for (i++; arr[i] != "')"; i++)
					{
						str = arr[i]
						code += str + "\n"
					}
					room_set_code(roomID, code)
					break
					
				case "room_tile_add":
					//show_debug_message("> Adding tile to room")
					var spr = ds_map_find_value(global.tilesets, string_replace_all(splitarr[4], "'", ""))
					room_tile_add(roomID, spr, real(splitarr[5]), real(splitarr[6]), real(splitarr[7]), real(splitarr[8]), real(splitarr[9]), real(splitarr[10]), real(splitarr[11]))
					break
			}
		}
		
		var funcpos = string_pos("room_instance_add", str)
		if (funcpos != 0)
		{
			var splitarr = string_split_arr(str, [" = ", "room_instance_add", "(", ", ", ")"], true)
			
			var varname = splitarr[0]
			var instx = real(splitarr[2])
			var insty = real(splitarr[3])
			var instobj = asset_get_index(splitarr[4])
			if (instobj == -1)
				continue;
			
			//show_debug_message("> Adding instance " + string(instobj) + " to room")
			variable_instance_set(id, varname, room_instance_add(roomID, instx, insty, instobj))
		}
	}
}