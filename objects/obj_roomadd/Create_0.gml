if (global.current_room == undefined)
	exit;
	
with (obj_room)
	event_user(0)

show_debug_message("Setting room size")
room_width = global.current_room.width
room_height = global.current_room.height

show_debug_message("Creating room instances")
var instances = global.current_room.instances
for (var i = 0, n = array_length(instances); i < n; i++)
{
	var inst = instances[i]
	var variables = variable_struct_get_names(inst)
	
	var rminst = instance_create(inst.x, inst.y, inst.object)
	rminst.roomadd_instance_id = room_get_instance_id(rminst)
	
	for (var j = 0, m = array_length(variables); j < m; j++)
	{
		var v = variables[j]
		if (v != "object")
			variable_instance_set(rminst, v, variable_struct_get(inst, v))
	}
}