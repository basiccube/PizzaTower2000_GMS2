draw_set_alpha(0.5)
draw_rectangle_color(0, 0, global.screenw, global.screenh, c_black, c_black, c_black, c_black, 0)
draw_set_alpha(1)

draw_set_font(global.font)
draw_set_halign(fa_center)
draw_set_color(c_white)

draw_text(global.screenw / 2, (global.screenh / 2) - 50, string_hash_to_newline("QUIT GAME"))
if (selected == 0)
    draw_text_color((global.screenw / 2) - 120, (global.screenh / 2) - 10, string_hash_to_newline("YES"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_color((global.screenw / 2) - 120, (global.screenh / 2) - 10, string_hash_to_newline("YES"), c_white, c_white, c_white, c_white, 0.5)
if (selected == 1)
    draw_text_color((global.screenw / 2) + 120, (global.screenh / 2) - 10, string_hash_to_newline("NO"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_color((global.screenw / 2) + 120, (global.screenh / 2) - 10, string_hash_to_newline("NO"), c_white, c_white, c_white, c_white, 0.5)
