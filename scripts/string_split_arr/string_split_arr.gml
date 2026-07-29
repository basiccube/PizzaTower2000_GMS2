function string_split_arr(str, delim_arr, remove_empty = false)
{
	//if !bscotch_check("string_split_ext")
		//return string_split_ext(str, delim_arr, remove_empty);
	
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