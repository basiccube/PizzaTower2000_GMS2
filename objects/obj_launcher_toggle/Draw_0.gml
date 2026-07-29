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

var sprw = sprite_get_width(sprite_index)
var sprh = sprite_get_height(sprite_index)
var tx = x
var ty = y + (sprite_height / 2) - (sprh / 2)
draw_sprite_ext(sprite_index, image_index, tx, ty, 1, 1, image_angle, col, image_alpha)
if toggled
	draw_sprite_ext(sprite_index, 1, tx, ty, 1, 1, image_angle, col, image_alpha)

draw_text(x + sprw + 4, y + (sprite_height / 2), text)

draw_set_halign(fa_left)
draw_set_valign(fa_top)