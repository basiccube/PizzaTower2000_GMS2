if (room != rm_roomadd)
	exit;

var rm = room
if (global.prev_room != undefined)
	rm = global.prev_room.name

if ds_map_exists(rooms, rm)
{
	var roomlist = ds_map_find_value(rooms, rm)
	var listsize = ds_list_size(roomlist)
	for (var i = 0; i < listsize; i++)
	{
		var inst = ds_list_find_value(roomlist, i)
		var found = false
		
		with (all)
		{
			if persistent
				continue;
			if !variable_instance_exists(id, "roomadd_instance_id")	
				continue;
			
			if (roomadd_instance_id == inst)
			{
				found = true
				break;
			}
		}
		
		if !found
		{
			ds_list_delete(roomlist, i)
			listsize--
			i--
		}
	}
}