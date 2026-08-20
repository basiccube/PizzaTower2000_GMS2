var custom_room = false
var rm = room
if (room == rm_custom_room && global.prev_room != undefined)
{
	custom_room = true
	rm = global.prev_room.name
}

if ds_map_exists(rooms, rm)
{
	var roomlist = ds_map_find_value(rooms, rm)
	for (var i = 0, n = ds_list_size(roomlist); i < n; i++)
	{
		var inst = ds_list_find_value(roomlist, i)
		var found = false
		
		if custom_room
		{
			with (all)
			{
				if persistent
					continue;
				if !variable_instance_exists(id, "custom_instance_id")	
					continue;
			
				if (custom_instance_id == inst)
				{
					found = true
					break;
				}
			}
		}
		else
			found = instance_exists(inst)
		
		if !found
		{
			ds_list_delete(roomlist, i)
			n--
			i--
		}
	}
}