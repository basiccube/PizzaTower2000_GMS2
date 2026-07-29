function draw_menu_background(red, green, blue)
{
	draw_sprite_tiled(bg_menu, 0, x, y)
	hspeed = 1
	vspeed = 1
	
	var c = make_color_rgb(red, green, blue)
	draw_set_alpha(0.75)
	draw_rectangle_color(CAM_X, CAM_Y, CAM_X + SCREEN_WIDTH, CAM_Y + SCREEN_HEIGHT, c, c, c, c, false)
	draw_set_alpha(1)
}