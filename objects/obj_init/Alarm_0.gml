var len = array_length(load_list)
if (len > 0)
{
	load_list[0]()
	array_delete(load_list, 0, 1)
}
else
{
	print("Loading finished")
	room_goto(rm_initializer)
}

alarm[0] = 1