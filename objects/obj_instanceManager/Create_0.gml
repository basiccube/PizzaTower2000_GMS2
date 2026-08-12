rooms = ds_map_create()

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
}

if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}

globalvar instanceManager;
instanceManager = id