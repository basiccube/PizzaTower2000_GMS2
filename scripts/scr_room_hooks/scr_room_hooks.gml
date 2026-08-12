global.rooms = ds_list_create()
global.rooms_force_hook = true

global.current_room = undefined
global.prev_room = undefined

function CustomRoom() constructor
{
	width = 640
	height = 480
	name = ""
	instances = []
}

function CustomInstance(ix, iy, iobj) constructor
{
	x = ix
	y = iy
	object = iobj
}

function room_get_instance_id(inst)
{ return object_get_name(inst.object_index) + "_" + string(inst.xstart) + "_" + string(inst.ystart); }

function room_create(name = undefined)
{
	if (bscotch_check("room_add") || global.rooms_force_hook)
	{
		var struct = new CustomRoom()
		ds_list_add(global.rooms, struct)
		
		struct.name = name
		show_debug_message("Created CustomRoom")
		return struct;
	}
	
	return room_add();
}

#macro room_set_width_original room_set_width
#macro room_set_width room_set_width_hook

function room_set_width_hook(rm, w)
{
	if is_struct(rm)
	{
		variable_struct_set(rm, "width", w)
		exit;
	}
	
	room_set_width_original(rm, w)
}

#macro room_set_height_original room_set_height
#macro room_set_height room_set_height_hook

function room_set_height_hook(rm, h)
{
	if is_struct(rm)
	{
		variable_struct_set(rm, "height", h)
		exit;
	}
	
	room_set_height_original(rm, h)
}

#macro room_instance_add_original room_instance_add
#macro room_instance_add room_instance_add_hook

function room_instance_add_hook(rm, ix, iy, iobj)
{
	if is_struct(rm)
	{
		// Putting the variable name here prevents the compiler from optimizing it,
		// and the hash functions aren't implemented in butterscotch yet
		var structname = "instances"
		var arr = variable_struct_get(rm, structname)
		
		var inst = new CustomInstance(ix, iy, iobj)
		array_push(arr, inst)
		
		return inst;
	}
	
	return room_instance_add_original(rm, ix, iy, iobj);
}

#macro room_goto_original room_goto
#macro room_goto room_goto_hook

function room_goto_hook(rm)
{
	if is_struct(rm)
	{
		global.prev_room = global.current_room
		global.current_room = rm
		room_goto_original(rm_roomadd)
		exit;
	}
	
	room_goto_original(rm)
}

function room_name()
{
	if (room != rm_roomadd || global.current_room == undefined)
		return room_get_name(room);
	
	return global.current_room.name;
}