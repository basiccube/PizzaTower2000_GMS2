global.print_extra = false
global.print_logfile = false

#macro PRINT_LOGPATH "game.log"

function print()
{
	var _string = ""
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i])
	
	show_debug_message(_string)
	if global.print_logfile
	{
		var file = file_text_open_append(PRINT_LOGPATH)
		file_text_write_string(file, _string)
		file_text_close(file)
	}
}

#macro printex if global.print_extra print

function concat()
{
	var _string = ""
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i])
	
	return _string;
}