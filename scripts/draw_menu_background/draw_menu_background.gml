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