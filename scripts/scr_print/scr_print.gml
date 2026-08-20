function print()
{
	var _string = ""
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i])
	
	show_debug_message(_string)
}

global.print_extra = false

#macro printex if global.print_extra print

function concat()
{
	var _string = ""
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i])
	
	return _string;
}