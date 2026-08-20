draw_menu_background(25, 45, 65)

for (i = 0; i < ds_list_size(level_list); i += 1)
{
    draw_set_font(fnt_big)
    draw_set_color(c_white)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    
    alpha = 0.5
    if (selection == i)
        alpha = 1
    draw_set_alpha(alpha)
    
    draw_text(40, 40 + (i * 40), string_hash_to_newline(string_upper(ds_list_find_value(levelname_list, i))))
    draw_set_alpha(1)
}
