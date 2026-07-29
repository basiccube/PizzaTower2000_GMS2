if (room != rm_roomadd)
	exit;
	
var rm = room
if (global.current_room != undefined)
	rm = global.current_room.name

if !ds_map_exists(rooms, rm)
{
	var roomlist = ds_list_create()
	with (all)
	{
		if persistent
			continue;
		if !variable_instance_exists(id, "roomadd_instance_id")	
			continue;
		
		ds_list_add(roomlist, id.roomadd_instance_id)
	}
	ds_map_set(rooms, rm, roomlist)
}
else
{
	var roomlist = ds_map_find_value(rooms, rm)
	with (all)
	{
		if persistent
			continue;
		if !variable_instance_exists(id, "roomadd_instance_id")	
			continue;
		
		if (ds_list_find_index(roomlist, id.roomadd_instance_id) == -1)
			instance_destroy(id, false)
	}
}