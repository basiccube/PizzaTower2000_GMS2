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
		show_debug_message("Butterscotch runner possibly detected")
		global.butterscotch = true
		break;
	}
}

function bscotch_check(scr)
{ return (global.butterscotch && asset_get_index(scr) == -1); }