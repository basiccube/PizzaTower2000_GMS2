if (pause)
{
    draw_menu_background(20, 20, 20)
    draw_set_font(global.font)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    
    draw_text(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2), __view_get( e__VW.YView, 0 ) + 150, string_hash_to_newline("PAUSED"))
    if (selection == 0)
        draw_text_color(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2), __view_get( e__VW.YView, 0 ) + 220, string_hash_to_newline("RESUME"), c_white, c_white, c_white, c_white, 1)
    else
        draw_text_color(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2), __view_get( e__VW.YView, 0 ) + 220, string_hash_to_newline("RESUME"), c_white, c_white, c_white, c_white, 0.5)
    if (selection == 1)
        draw_text_color(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2), __view_get( e__VW.YView, 0 ) + 260, string_hash_to_newline("EXIT LEVEL"), c_white, c_white, c_white, c_white, 1)
    else
        draw_text_color(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2), __view_get( e__VW.YView, 0 ) + 260, string_hash_to_newline("EXIT LEVEL"), c_white, c_white, c_white, c_white, 0.5)
    if (selection == 2)
        draw_text_color(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2), __view_get( e__VW.YView, 0 ) + 300, string_hash_to_newline("EXIT TO MAIN MENU"), c_white, c_white, c_white, c_white, 1)
    else
        draw_text_color(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 2), __view_get( e__VW.YView, 0 ) + 300, string_hash_to_newline("EXIT TO MAIN MENU"), c_white, c_white, c_white, c_white, 0.5) 
}
if (!pause && image_alpha > 0)
    draw_sprite_stretched_ext(spr_black, 0, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ), c_white, image_alpha)
