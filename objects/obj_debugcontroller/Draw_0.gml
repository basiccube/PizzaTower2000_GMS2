if (global.debug)
{
    draw_set_font(global.font)
    draw_set_color(c_white)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_text(__view_get( e__VW.XView, 0 ) + 24, (__view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )) - 48, string_hash_to_newline(instance_count))
    draw_text((__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )) - 64, (__view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )) - 48, string_hash_to_newline(fps))
}
