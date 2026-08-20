#macro array_contains_original array_contains
#macro array_contains array_contains_hook

function array_contains_hook(arr, val)
{
	if !(global.butterscotch && global.bscotch_array_contains)
		return array_contains_original(arr, val);
	
	for (var i = 0, n = array_length(arr); i < n; i++)
	{
		if (arr[i] == val)
			return true;
	}
	
	return false;
}

function in_array(val, arr)
{ return array_contains(arr, val); }