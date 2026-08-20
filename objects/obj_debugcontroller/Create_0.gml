depth = -1000

console_key = vk_tab
console_open = false

console_size = SCREEN_HEIGHT / 2
console_offset = -console_size
console_offset_speed = 50
console_margin = 8

console_commands = []
console_prompt = "►"
console_input = ""

console_cursor = "◄"
console_show_cursor = false
console_cursor_timer = 0

console_output = []

console_suggestions = []
console_max_suggestions = 4
console_suggestions_selection = 0

console_suggestions_margin = 6
console_suggestions_spacing = 18
console_suggestions_width = 0
console_suggestions_height = 0

open_console = function()
{
	if console_open
		exit;
	
	keyboard_lastchar = ""
	keyboard_lastkey = -1
	console_open = true
}

close_console = function()
{
	if !console_open
		exit;
	
	keyboard_lastchar = ""
	keyboard_lastkey = -1
	console_open = false
}

toggle_console = function()
{
	if console_open
		close_console()
	else
		open_console()
}

execute_command = function(str)
{
	var args = string_split(str, " ", true)
	var command = args[0]
	
	var exists = false
	for (var i = 0, n = array_length(console_commands); i < n; i++)
	{
		if (console_commands[i] == command)
		{
			exists = true
			break;
		}
	}
	
	if !exists
	{
		print_output("Invalid command")
		exit;
	}
	
	var func = variable_global_get(CONSOLE_COMMAND_PREFIX + command)
	if (func == undefined || !is_callable(func))
	{
		print_output("Invalid command")
		exit;
	}
	
	var result = script_execute(func, args)
	if (result != undefined)
		print_output(string(result))
}

print_output = function()
{
	var _string = ""
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i])
	
	print(_string)
	array_push(console_output, _string)
}

clear_output = function()
{ console_output = []; }

clear_suggestions = function()
{
	console_suggestions = []
	console_suggestions_selection = 0
	console_suggestions_width = 0
	console_suggestions_height = 0
}

update_suggestions = function()
{
	clear_suggestions()
	if (console_input == "")
		exit;
	
	for (var i = 0, n = array_length(console_commands); i < n; i++)
	{
		if string_starts_with(console_commands[i], console_input)
		{
			array_push(console_suggestions, console_commands[i])
					
			var w = string_width(console_commands[i])
			if (console_suggestions_width < w)
				console_suggestions_width = w
			console_suggestions_height += console_suggestions_spacing
		}
					
		if (array_length(console_suggestions) >= console_max_suggestions)
			break;
	}
}

update_collision_visibility = function()
{
	with (obj_wall)
	{
		if (object_index == obj_wall)
			visible = other.showCollisions
	}
	with (obj_platform)
		visible = other.showCollisions
	with (obj_slope)
		visible = other.showCollisions
}

config_path = "config/debug.ini"

read_config = function()
{
	ini_open(config_path)
	debugInfo = ini_read_real("Debug", "ShowInfo", false)
	showCollisions = ini_read_real("Debug", "ShowCollisions", true)
	ini_close()
}

save_config = function()
{
	ini_open(config_path)
	ini_write_real("Debug", "ShowInfo", debugInfo)
	ini_write_real("Debug", "ShowCollisions", showCollisions)
	ini_close()
}

read_config()

#macro CONSOLE_COMMAND_PREFIX "con_"

// get all console commands
var names = variable_instance_get_names(global)
for (var i = 0, n = array_length(names); i < n; i++)
{
	if (string_starts_with(names[i], CONSOLE_COMMAND_PREFIX) && is_callable(variable_global_get(names[i])))
	{
		var name = string_delete(names[i], 1, string_length(CONSOLE_COMMAND_PREFIX))
		array_push(console_commands, name)
	}
}