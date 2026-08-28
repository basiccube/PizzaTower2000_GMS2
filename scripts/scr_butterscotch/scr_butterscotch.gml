global.butterscotch = false
var arr = [
	"texturegroup_load",
	"room_get_viewport",
	"room_get_camera",
	"room_set_width",
	"room_set_height",
	"room_add",
	"room_instance_add",
	"string_split_ext",
	"asset_get_tags"
]

for (var i = 0, n = array_length(arr); i < n; i++)
{
	if (asset_get_index(arr[i]) == -1)
	{
		print("Butterscotch runner possibly detected")
		global.butterscotch = true
		break;
	}
}

// fixes/workarounds
global.bscotch_string_split_ext = true
global.bscotch_place_meeting = true
global.bscotch_array_contains = true
global.bscotch_state_override = true
global.bscotch_state_use_map = true
global.bscotch_audio = true
global.bscotch_player_drawoverride = true

#macro place_meeting_original place_meeting
#macro place_meeting place_meeting_hook

function place_meeting_hook(x, y, obj)
{
	if !(global.butterscotch && global.bscotch_place_meeting)
		return place_meeting_original(x, y, obj);
	
	if is_array(obj)
	{
		for (var i = 0, n = array_length(obj); i < n; i++)
		{
			if place_meeting_original(x, y, obj[i])
				return true;
		}
		
		return false;
	}
	else
		return place_meeting_original(x, y, obj);
}

#macro string_split_ext_original string_split_ext
#macro string_split_ext string_split_ext_hook

function string_split_ext_hook(str, delim_arr, remove_empty = false)
{
	if !(global.butterscotch && global.bscotch_string_split_ext)
		return string_split_ext_original(str, delim_arr, remove_empty);
	
	// This function is slow
	var arr = []
	
	var splitstr = ""
	for (var i = 1, n = string_length(str); i <= n; i++)
	{
		var char = string_char_at(str, i)
		splitstr += char
		
		var pos = 0
		var found_delim = ""
		for (var j = 0, m = array_length(delim_arr); j < m; j++)
		{
			var delim = delim_arr[j]
			pos = string_pos(delim, splitstr)
			
			if (pos != 0)
			{
				found_delim = delim
				break;
			}
		}
		
		if (pos != 0)
		{
			var s = string_delete(splitstr, pos, string_length(found_delim))
			if (s != "" || !remove_empty)
				array_push(arr, s)
			
			splitstr = ""
		}
	}
	
	if (splitstr != "" || !remove_empty)
		array_push(arr, splitstr)
	
	return arr;
}