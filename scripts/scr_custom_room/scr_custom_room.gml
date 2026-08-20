global.rooms = ds_list_create()

global.current_room = undefined
global.prev_room = undefined

function CustomRoom(rmname) constructor
{
	width = 640
	height = 480
	name = rmname
	instances = []
}

function CustomInstance(ix, iy, iobj) constructor
{
	x = ix
	y = iy
	object = iobj
}

function custom_room_get_instance_id(inst)
{ return object_get_name(inst.object_index) + "_" + string(inst.xstart) + "_" + string(inst.ystart); }

function custom_room_create(name)
{
	var struct = new CustomRoom(name)
	ds_list_add(global.rooms, struct)
	return struct;
}

function custom_room_set_width(rm, w)
{ variable_struct_set(rm, "width", w); }

function custom_room_set_height(rm, h)
{ variable_struct_set(rm, "height", h); }

function custom_room_add_instance(rm, ix, iy, iobj)
{
	// Putting the variable name here prevents the compiler from optimizing it,
	// and the hash functions aren't implemented in butterscotch yet
	var structname = "instances"
	var arr = variable_struct_get(rm, structname)
	
	var inst = new CustomInstance(ix, iy, iobj)
	array_push(arr, inst)
	
	return inst;
}

function custom_room_add_tile(rm, spr, left, top, width, height, x, y, depth)
{ printex("custom_room_add_tile not implemented"); }

#macro room_goto_original room_goto
#macro room_goto room_goto_hook

function room_goto_hook(rm)
{
	if is_struct(rm)
	{
		global.prev_room = global.current_room
		global.current_room = rm
		room_goto_original(rm_custom_room)
		exit;
	}
	
	room_goto_original(rm)
}

function room_name()
{
	if (room != rm_custom_room || global.current_room == undefined)
		return room_get_name(room);
	
	return global.current_room.name;
}