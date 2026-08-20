draw_menu_background(10, 20, 20)
draw_set_font(fnt_big)
draw_set_halign(fa_center)
draw_set_color(c_white)

if (optionselected == 0)
{
    if (optionsaved_highperformance == 0)
        draw_text_color(global.screenw / 2, (global.screenh / 2) - 100, string_hash_to_newline("HIGH PERFORMANCE MODE: OFF"), c_white, c_white, c_white, c_white, 1)
    else
        draw_text_color(global.screenw / 2, (global.screenh / 2) - 100, string_hash_to_newline("HIGH PERFORMANCE MODE: ON"), c_white, c_white, c_white, c_white, 1)
}
else
    draw_text_color(global.screenw / 2, (global.screenh / 2) - 100, string_hash_to_newline("HIGH PERFORMANCE MODE"), c_white, c_white, c_white, c_white, 0.5)
if (optionselected == 1)
{
    if (optionsaved_debug == 0)
        draw_text_color(global.screenw / 2, (global.screenh / 2) - 50, string_hash_to_newline("DEBUG INFO: OFF"), c_white, c_white, c_white, c_white, 1)
    else
        draw_text_color(global.screenw / 2, (global.screenh / 2) - 50, string_hash_to_newline("DEBUG INFO: ON"), c_white, c_white, c_white, c_white, 1)
}
else
    draw_text_color(global.screenw / 2, (global.screenh / 2) - 50, string_hash_to_newline("DEBUG INFO"), c_white, c_white, c_white, c_white, 0.5)
if (optionselected == 2)
{
    if (optionsaved_showcollisions == 0)
        draw_text_color(global.screenw / 2, (global.screenh / 2), string_hash_to_newline("COLLISION VISIBILITY: OFF"), c_white, c_white, c_white, c_white, 1)
    else
        draw_text_color(global.screenw / 2, (global.screenh / 2), string_hash_to_newline("COLLISION VISIBILITY: ON"), c_white, c_white, c_white, c_white, 1)
}
else
    draw_text_color(global.screenw / 2, (global.screenh / 2), string_hash_to_newline("COLLISION VISIBILITY"), c_white, c_white, c_white, c_white, 0.5)
