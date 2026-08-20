rooms = ds_map_create()
visitedDoors = ds_list_create()

clearInstances = function()
{
	var key = ds_map_find_first(rooms)
	for (var i = 0, n = ds_map_size(rooms); i < n; i++)
	{
		var list = ds_map_find_value(rooms, key)
		ds_list_destroy(list)
		
		key = ds_map_find_next(rooms, key)
	}
	
	ds_map_clear(rooms)
	ds_list_clear(visitedDoors)
}

addDoor = function(door)
{
	var custom_room = false
	var rm = room
	if (room == rm_custom_room && global.current_room != undefined)
	{
		custom_room = true
		rm = global.current_room.name
	}
	
	var str = string(door.id)
	if (custom_room && variable_instance_exists(door, "custom_instance_id"))
		str = rm + door.custom_instance_id
	
	ds_list_add(visitedDoors, str)
}

doorVisited = function(door)
{
	var custom_room = false
	var rm = room
	if (room == rm_custom_room && global.current_room != undefined)
	{
		custom_room = true
		rm = global.current_room.name
	}
	
	var str = string(door.id)
	if (custom_room && variable_instance_exists(door, "custom_instance_id"))
		str = rm + door.custom_instance_id
	
	return (ds_list_find_index(visitedDoors, str) != -1);
}

if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}

globalvar instanceManager;
instanceManager = id