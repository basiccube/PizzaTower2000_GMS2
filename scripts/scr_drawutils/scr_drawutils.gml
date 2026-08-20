function draw_set_align(halign = draw_get_halign(), valign = draw_get_valign())
{
	draw_set_halign(halign)
	draw_set_valign(valign)
}

function draw_rectangle_ext(x1, y1, x2, y2, col = c_white, alpha = 1, outline = false)
{
	var a = draw_get_alpha()
	draw_set_alpha(alpha)
	
	draw_rectangle_color(x1, y1, x2, y2, col, col, col, col, outline)
	
	draw_set_alpha(a)
}

function draw_text_alt(x, y, str, col = c_white, alpha = 1)
{ draw_text_color(x, y, str, col, col, col, col, alpha); }

function draw_menu_background(red, green, blue, spd = 1, alpha = 1)
{
	static menuX = 0
	static menuY = 0
	
	draw_sprite_tiled_ext(bg_menu, 0, menuX, menuY, 1, 1, c_white, alpha)
	if (spd != 0)
	{
		menuX += spd
		menuY += spd
	}
	
	var c = make_color_rgb(red, green, blue)
	draw_rectangle_ext(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c, 0.75 - (1 - alpha))
}