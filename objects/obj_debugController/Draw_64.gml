draw_set_font(fnt_debug)
draw_set_align(fa_left, fa_top)

if debugInfo
{
	var inststr = "instances: " + string(instance_count)
	draw_text_alt(8, SCREEN_HEIGHT - 24, inststr)

	if instance_exists(obj_player)
	{
		draw_text_alt(8, SCREEN_HEIGHT - 64, "state: " + obj_player.state.state)
		draw_text_alt(8, SCREEN_HEIGHT - 48, "previous state: " + obj_player.state.prevstate)
	}
	
	draw_set_halign(fa_right)
	
	var fpsstr = "fps: " + string(fps)
	draw_text_alt(SCREEN_WIDTH - 8, SCREEN_HEIGHT - 24, fpsstr)
}

draw_set_halign(fa_left)
if (console_open || console_offset > -console_size)
{
	var cx = 0
	var cy = console_offset
	var cw = SCREEN_WIDTH
	var ch = console_offset + console_size
	
	draw_rectangle_ext(cx, cy, cw, ch, c_black)
	draw_rectangle_ext(cx + 1, cy + 1, cw - 1, ch - 1, c_dkgray, 1, true)
	
	var promptw = string_width(console_prompt)
	var prompth = string_height(console_prompt)
	
	var px = cx + console_margin
	var py = ch - promptw - console_margin
	draw_text_alt(px, py, console_prompt)
	
	var inputx = px + promptw + 6
	var inputy = py
	
	// output
	var olen = array_length(console_output)
	var ox = cx + console_margin
	var oy = py - console_margin
	
	draw_set_valign(fa_bottom)
	for (var i = olen - 1; i >= 0; i--)
	{
		draw_text_alt(ox, oy, console_output[i])
		oy -= string_height(console_output[i])
		
		if (oy < 0)
			break;
	}
	draw_set_valign(fa_top)
	
	// autocomplete
	var slen = array_length(console_suggestions)
	if (slen > 0)
		draw_text_alt(inputx, inputy, console_suggestions[0], c_yellow, 0.45)
	draw_text_alt(inputx, inputy, console_input, c_yellow)
	
	var inputw = string_width(console_input)
	if console_show_cursor
		draw_text_alt(inputx + inputw + 2, inputy, console_cursor)
		
	// suggestion list
	if (slen > 0 && console_open)
	{
		var sx = inputx
		var sy = ch
		var sw = sx + console_suggestions_width + (console_suggestions_margin * 2)
		var sh = sy + console_suggestions_height + (console_suggestions_margin * 2)
		
		draw_rectangle_ext(sx, sy, sw, sh, c_black)
		draw_rectangle_ext(sx + 1, sy + 1, sw - 1, sh - 1, c_dkgray, 1, true)
		
		var tx = sx + console_suggestions_margin
		var ty = sy + console_suggestions_margin
		for (var i = 0; i < slen; i++)
		{
			var c = c_gray
			if (console_suggestions_selection == i)
				c = c_white
			
			draw_text_alt(tx, ty, console_suggestions[i], c)
			ty += console_suggestions_spacing
		}
	}
	
	draw_set_halign(fa_right)
	draw_text_alt(cw - 6, cy + 6, "version " + GM_version, c_yellow)
}