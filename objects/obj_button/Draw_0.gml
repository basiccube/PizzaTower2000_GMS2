draw_sprite_ext(spr_button, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha)
draw_set_halign(fa_center)
draw_text_color(floor(x), y - 8, string_hash_to_newline(text), c_white, c_white, c_white, c_white, image_alpha)
draw_set_halign(fa_left)
