draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_font(fnt_launcher)

draw_set_alpha(1)
draw_set_color(c_white)

var col = c_ltgray
if hover
{
	col = c_white
	if mouse_check_button(mb_left)
		col = c_dkgray
}
else if (parentID != noone && parentID.selected == pos)
	col = c_dkgray

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, col, image_alpha)
draw_text(x + 4, y + (sprite_height / 2), text)

draw_set_halign(fa_left)
draw_set_valign(fa_top)