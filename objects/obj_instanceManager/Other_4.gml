var custom_room = false
var rm = room
if (room == rm_custom_room && global.current_room != undefined)
{
	custom_room = true
	rm = global.current_room.name
}

if !ds_map_exists(rooms, rm)
{
	var roomlist = ds_list_create()
	with (all)
	{
		if persistent
			continue;
		if (custom_room && !variable_instance_exists(id, "custom_instance_id"))
			continue;
		
		ds_list_add(roomlist, custom_room ? id.custom_instance_id : id)
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
		if (custom_room && !variable_instance_exists(id, "custom_instance_id"))
			continue;
		
		if (ds_list_find_index(roomlist, custom_room ? id.custom_instance_id : id) == -1)
			instance_destroy(id, false)
	}
}