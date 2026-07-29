if flash
	gpu_set_fog(true, c_white, 0, 0)

draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)

if flash
    gpu_set_fog(false, c_white, 0, 0)