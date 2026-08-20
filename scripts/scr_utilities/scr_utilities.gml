globalvar tempMeetingList;
tempMeetingList = ds_list_create()

#macro LAST_FRAME floor(image_index) == image_number - 1

///@param x
///@param y
///@param obj
function instance_create(ix, iy, iobj)
{ return instance_create_depth(ix, iy, 0, iobj); }

function func_empty() { }

function get_struct_value(struct, value, defaultvalue)
{
	if !variable_struct_exists(struct, value)
		return defaultvalue;
	
	var val = struct[$ value]
	if is_callable(val)
		return method(self, val);
	
	return val;
}

function file_text_read_all(file)
{
    if is_string(file)
    {
		if !file_exists(file)
			return "";
		
        var buff = buffer_load(file)
        var text = buffer_read(buff, buffer_text)		
        buffer_delete(buff)
		
        return text;
    }
	
    var filestring = ""
    while !file_text_eof(file)
        filestring += file_text_readln(file)
	
    return filestring;
}

function get_targetdoor(_x = x, _y = y)
{
	if place_meeting(_x, _y, obj_doorA)
		targetDoor = "A"
	else if place_meeting(_x, _y, obj_doorB)
		targetDoor = "B"
	else if place_meeting(_x, _y, obj_doorC)
		targetDoor = "C"
	else if place_meeting(_x, _y, obj_doorD)
		targetDoor = "D"
	else if place_meeting(_x, _y, obj_doorE)
		targetDoor = "E"
}

function get_targetdoor_object(door)
{
	switch door
	{
		case "A": return obj_doorA;
		case "B": return obj_doorB;
		case "C": return obj_doorC;
		case "D": return obj_doorD;
		case "E": return obj_doorE;
	}
	
	return obj_doorA;
}