draw_set_alpha(1)
draw_set_font(fnt_big)
draw_set_halign(fa_center)
draw_set_color(c_white)
if (optionselect == 0)
    draw_text_color(global.screenw / 2, (global.screenh / 2) - 30, string_hash_to_newline("START"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_color(global.screenw / 2, (global.screenh / 2) - 30, string_hash_to_newline("START"), c_white, c_white, c_white, c_white, 0.5)
if (optionselect == 1)
    draw_text_color(global.screenw / 2, (global.screenh / 2) + 10, string_hash_to_newline("LEVEL SELECT"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_color(global.screenw / 2, (global.screenh / 2) + 10, string_hash_to_newline("LEVEL SELECT"), c_white, c_white, c_white, c_white, 0.5)
if (optionselect == 2)
    draw_text_color(global.screenw / 2, (global.screenh / 2) + 50, string_hash_to_newline("OPTIONS"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_color(global.screenw / 2, (global.screenh / 2) + 50, string_hash_to_newline("OPTIONS"), c_white, c_white, c_white, c_white, 0.5)
if (optionselect == 3)
    draw_text_color(global.screenw / 2, (global.screenh / 2) + 90, string_hash_to_newline("QUIT"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_color(global.screenw / 2, (global.screenh / 2) + 90, string_hash_to_newline("QUIT"), c_white, c_white, c_white, c_white, 0.5)

cursorx = (global.screenw / 2) - 114
if (optionselect == 1)
    cursorx = (global.screenw / 2) - 190
draw_sprite_ext(spr_cursor, image_index, cursorx, cursory, 1, 1, 0, c_white, 1)
