if keyboard_check_pressed(console_key)
	toggle_console()
	
if console_open
{
	var prev_input = console_input
	draw_set_font(fnt_debug)
	
	console_offset = approach(console_offset, 0, console_offset_speed)
	if (--console_cursor_timer <= 0)
	{
		console_show_cursor = !console_show_cursor
		console_cursor_timer = 30
	}
	
	if (keyboard_check(vk_control) && keyboard_check_pressed(ord("C")))
	{
		console_input = ""
		keyboard_lastchar = ""
		keyboard_lastkey = -1
	}
	
	if keyboard_check_pressed(vk_enter)
	{
		if (console_input != "")
			execute_command(console_input)
		
		console_input = ""
		keyboard_lastchar = ""
		keyboard_lastkey = -1
	}
	
	
	if (console_input != "" && keyboard_lastkey == vk_backspace)
	{
		console_input = string_delete(console_input, string_length(console_input), 1)
		keyboard_lastchar = ""
		keyboard_lastkey = -1
	}
	
	var disallowed_keys = [
		vk_enter,
		vk_escape,
		vk_backspace,
		vk_tab,
		vk_control,
		vk_shift,
		vk_alt
	]
	
	var disallowed_chars = [
		"",
		"`",
		"~"
	]
	
	var maxwidth = SCREEN_WIDTH - ((console_margin * 2) + 24)
	if (string_width(console_input) < maxwidth && !in_array(keyboard_lastchar, disallowed_chars) && !in_array(keyboard_lastkey, disallowed_keys))
	{
		console_input += keyboard_lastchar
		keyboard_lastchar = ""
		keyboard_lastkey = -1
	}
	
	// autocomplete
	var slen = array_length(console_suggestions)
	if (keyboard_check_pressed(vk_right) && slen > 0)
	{
		console_input = console_suggestions[console_suggestions_selection]
		keyboard_lastchar = ""
		keyboard_lastkey = -1
	}
	
	// select suggestion
	var smove = -keyboard_check_pressed(vk_up) + keyboard_check_pressed(vk_down)
	if (smove != 0)
	{
		console_suggestions_selection += smove
		if (console_suggestions_selection >= slen)
			console_suggestions_selection = 0
		else if (console_suggestions_selection < 0)
			console_suggestions_selection = slen - 1
	}
	
	// update suggestions
	if (prev_input != console_input)
		update_suggestions()
}
else
	console_offset = approach(console_offset, -console_size, console_offset_speed)