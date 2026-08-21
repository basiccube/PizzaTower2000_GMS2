var sy = wave(-2, 2, 1, 0)
if (sprite_index == spr_got)
	sy = 0
draw_sprite_ext(sprite_index, image_index, x, y + sy, image_xscale, image_yscale, image_angle, image_blend, image_alpha)