if (global.current_room == undefined)
	exit;

custom_room_run_code()
with (obj_room)
{
	var prop = ds_map_find_value(properties_map, global.current_room.name)
	room_parse_properties("levels/" + prop)
}

printex("Setting room size")
room_width = global.current_room.width
room_height = global.current_room.height

printex("Creating room instances")
var instances = global.current_room.instances
for (var i = 0, n = array_length(instances); i < n; i++)
{
	var inst = instances[i]
	var variables = variable_struct_get_names(inst)
	
	var rminst = instance_create(inst.x, inst.y, inst.object)
	rminst.custom_instance_id = custom_room_get_instance_id(rminst)
	
	for (var j = 0, m = array_length(variables); j < m; j++)
	{
		var v = variables[j]
		if (v != "object")
			variable_instance_set(rminst, v, variable_struct_get(inst, v))
	}
}