draw_set_alpha(0.75)
draw_rectangle_color(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.XView, 0 ) + 416, __view_get( e__VW.YView, 0 ) + 416, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false)
draw_set_alpha(1)
draw_text_color(__view_get( e__VW.XView, 0 ) + 4, __view_get( e__VW.YView, 0 ) + 4, string_hash_to_newline("Use arrow keys to move selected tile."), c_white, c_white, c_white, c_white, 1)
