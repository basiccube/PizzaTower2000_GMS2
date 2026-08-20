if (alpha <= 0)
	exit;

draw_set_color(c_white)
if pause
{
	draw_set_alpha(1)
	scr_draw_pause_image()
}

draw_menu_background(20, 20, 20, 1, alpha - 0.25)

draw_set_align(fa_center, fa_top)
draw_set_font(fnt_big)

draw_text_alt(pausedX, pausedY, "PAUSED")

for (var i = 0, n = array_length(menu); i < n; i++)
{
	var opt = menu[i]
	var str = ds_map_find_value(menu_string_map, opt)
	
	var col = c_gray
	if (selection == i)
		col = c_white
	
	draw_text_alt(menuX, menuY + (46 * i), str, col, alpha)
}