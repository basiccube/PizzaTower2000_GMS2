if (active)
{
    draw_rectangle_color(startx, starty, endx, endy, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false)
    draw_set_halign(fa_right)
	draw_set_valign(fa_top)
	
    draw_text_color(endx - 28, starty, "Object count: " + string(instance_number(obj_object)), c_white, c_white, c_white, c_white, 1)
    draw_set_halign(fa_left)
}
